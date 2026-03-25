import type { SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";
import {
  getAvailableSlotsAdmin,
  createAppointmentAdmin,
  getContactForPhone,
  getDoctorsForClinic,
  getAppointmentTypesForClinic,
} from "@/lib/db/ai-agent";
import { addDays, format } from "date-fns";

export type Tool = {
  type: "function";
  function: {
    name: string;
    description: string;
    parameters: Record<string, unknown>;
  };
};

export type ToolResult = {
  tool_call_id: string;
  content: string;
};

export type ToolExecutor = {
  [name: string]: (args: Record<string, unknown>) => Promise<string>;
};

function toJson(data: unknown): string {
  return JSON.stringify(data, null, 2);
}

export function buildTools(
  clinicId: string,
  supabaseAdmin: SupabaseClient<Database>,
  timezone: string
): { tools: Tool[]; executors: ToolExecutor } {
  const tools: Tool[] = [
    {
      type: "function",
      function: {
        name: "listar_medicos",
        description:
          "Lista os médicos/profissionais ativos da clínica com nome, especialidade e ID. Use isso para saber quais profissionais estão disponíveis antes de buscar horários.",
        parameters: {
          type: "object",
          properties: {},
          required: [],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "listar_tipos_consulta",
        description:
          "Lista os tipos de consulta/serviço disponíveis na clínica com nome e duração em minutos.",
        parameters: {
          type: "object",
          properties: {},
          required: [],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "buscar_horarios_disponiveis",
        description:
          "Busca horários disponíveis para um médico em uma ou mais datas. Retorna lista de slots no formato HH:MM. Pesquise nos próximos dias até encontrar disponibilidade.",
        parameters: {
          type: "object",
          properties: {
            doctor_id: {
              type: "string",
              description: "ID do médico (obtido com listar_medicos)",
            },
            date: {
              type: "string",
              description: "Data no formato YYYY-MM-DD",
            },
          },
          required: ["doctor_id", "date"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "criar_agendamento",
        description:
          "Cria um agendamento na agenda da clínica. Só chame após confirmar data e horário com o paciente.",
        parameters: {
          type: "object",
          properties: {
            patient_name: {
              type: "string",
              description: "Nome completo do paciente",
            },
            patient_phone: {
              type: "string",
              description: "Telefone do paciente",
            },
            doctor_id: {
              type: "string",
              description: "ID do médico",
            },
            type_id: {
              type: "string",
              description: "ID do tipo de consulta (opcional)",
            },
            type_name: {
              type: "string",
              description: "Nome do tipo de consulta (usado se type_id não for informado)",
            },
            scheduled_date: {
              type: "string",
              description: "Data no formato YYYY-MM-DD",
            },
            start_time: {
              type: "string",
              description: "Horário de início no formato HH:MM",
            },
            duration_minutes: {
              type: "number",
              description: "Duração em minutos (padrão: 30)",
            },
            notes: {
              type: "string",
              description: "Observações sobre a consulta (opcional)",
            },
          },
          required: ["patient_name", "doctor_id", "scheduled_date", "start_time"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "buscar_info_contato",
        description:
          "Busca informações do contato no CRM: dados cadastrais, estágio no pipeline, notas e histórico de agendamentos.",
        parameters: {
          type: "object",
          properties: {
            phone: {
              type: "string",
              description: "Telefone do contato (somente números)",
            },
          },
          required: ["phone"],
        },
      },
    },
  ];

  const executors: ToolExecutor = {
    async listar_medicos() {
      const doctors = await getDoctorsForClinic(clinicId, supabaseAdmin);
      if (doctors.length === 0) return "Nenhum médico encontrado.";
      return toJson(doctors);
    },

    async listar_tipos_consulta() {
      const types = await getAppointmentTypesForClinic(clinicId, supabaseAdmin);
      if (types.length === 0) return "Nenhum tipo de consulta cadastrado.";
      return toJson(types);
    },

    async buscar_horarios_disponiveis(args) {
      const doctorId = String(args.doctor_id ?? "");
      const date = String(args.date ?? "");
      if (!doctorId || !date) return "doctor_id e date são obrigatórios.";

      const slots = await getAvailableSlotsAdmin(clinicId, doctorId, date, supabaseAdmin);
      if (slots.length === 0) return `Nenhum horário disponível em ${date}.`;
      return toJson({ date, slots });
    },

    async criar_agendamento(args) {
      const patientName = String(args.patient_name ?? "");
      const doctorId = String(args.doctor_id ?? "");
      const scheduledDate = String(args.scheduled_date ?? "");
      const startTime = String(args.start_time ?? "");
      const durationMinutes = Number(args.duration_minutes ?? 30);

      if (!patientName || !doctorId || !scheduledDate || !startTime) {
        return "Campos obrigatórios ausentes: patient_name, doctor_id, scheduled_date, start_time";
      }

      // calculate end_time
      const [h, m] = startTime.split(":").map(Number);
      const endMins = h * 60 + m + durationMinutes;
      const endTime = `${String(Math.floor(endMins / 60)).padStart(2, "0")}:${String(endMins % 60).padStart(2, "0")}`;

      try {
        const appt = await createAppointmentAdmin(
          clinicId,
          {
            doctor_id: doctorId,
            patient_name: patientName,
            patient_phone: args.patient_phone ? String(args.patient_phone) : undefined,
            type_id: args.type_id ? String(args.type_id) : undefined,
            type_name_snapshot: args.type_name ? String(args.type_name) : undefined,
            scheduled_date: scheduledDate,
            start_time: startTime,
            end_time: endTime,
            notes: args.notes ? String(args.notes) : undefined,
          },
          supabaseAdmin
        );

        return toJson({
          success: true,
          appointment_id: appt.id,
          patient: appt.patient_name,
          date: appt.scheduled_date,
          time: appt.start_time,
          message: "Agendamento criado com sucesso!",
        });
      } catch (err) {
        return `Erro ao criar agendamento: ${err instanceof Error ? err.message : String(err)}`;
      }
    },

    async buscar_info_contato(args) {
      const phone = String(args.phone ?? "");
      if (!phone) return "phone é obrigatório.";

      const contact = await getContactForPhone(clinicId, phone);
      if (!contact) return "Contato não encontrado no sistema.";
      return toJson(contact);
    },
  };

  return { tools, executors };
}

/** Returns the next N dates (including today) in YYYY-MM-DD format */
export function getNextDates(n: number, timezone: string): string[] {
  const dates: string[] = [];
  const now = new Date();
  for (let i = 0; i < n; i++) {
    dates.push(format(addDays(now, i), "yyyy-MM-dd"));
  }
  return dates;
}
