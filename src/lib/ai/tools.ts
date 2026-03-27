import type { SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";
import { syncAppointmentCreate } from "@/lib/google-calendar";
import {
  getAvailableSlotsAdmin,
  createAppointmentAdmin,
  getContactForPhone,
  getDoctorsForClinic,
  getAppointmentTypesForClinic,
  getUpcomingAppointmentsByPhone,
  cancelAppointmentAdmin,
  rescheduleAppointmentAdmin,
  updateContactFromAgent,
  addNoteFromAgent,
  movePipelineStageByName,
  findOrCreateContactForAgent,
  autoMovePipelineAfterBooking,
} from "@/lib/db/ai-agent";
import type { ContactContext } from "@/lib/db/ai-agent";
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
  timezone: string,
  sessionId?: string
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
    {
      type: "function",
      function: {
        name: "listar_consultas_paciente",
        description:
          "Lista as próximas consultas agendadas do paciente pelo telefone. Use antes de cancelar ou remarcar para obter o ID da consulta. Retorna consultas futuras não canceladas.",
        parameters: {
          type: "object",
          properties: {
            phone: {
              type: "string",
              description: "Telefone do paciente (somente números)",
            },
          },
          required: ["phone"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "cancelar_consulta",
        description:
          "Cancela uma consulta existente pelo ID. Sempre liste as consultas primeiro com listar_consultas_paciente para obter o ID correto, e confirme com o paciente qual deseja cancelar antes de executar.",
        parameters: {
          type: "object",
          properties: {
            appointment_id: {
              type: "string",
              description: "ID da consulta (UUID obtido com listar_consultas_paciente)",
            },
          },
          required: ["appointment_id"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "remarcar_consulta",
        description:
          "Remarca uma consulta existente para uma nova data e horário, mantendo o mesmo médico e duração. Sempre liste as consultas com listar_consultas_paciente, busque horários disponíveis com buscar_horarios_disponiveis e confirme os dados com o paciente antes de executar.",
        parameters: {
          type: "object",
          properties: {
            appointment_id: {
              type: "string",
              description: "ID da consulta a ser remarcada (UUID obtido com listar_consultas_paciente)",
            },
            new_date: {
              type: "string",
              description: "Nova data no formato YYYY-MM-DD",
            },
            new_start_time: {
              type: "string",
              description: "Novo horário de início no formato HH:MM",
            },
          },
          required: ["appointment_id", "new_date", "new_start_time"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "atualizar_contato",
        description:
          "Atualiza os dados cadastrais de um contato no CRM quando o paciente fornece informações pessoais (email, data de nascimento, CPF, gênero, nome completo). Use sempre que o paciente informar ou corrigir dados cadastrais.",
        parameters: {
          type: "object",
          properties: {
            phone: {
              type: "string",
              description: "Telefone do paciente para localizar o contato (somente números)",
            },
            full_name: { type: "string", description: "Nome completo do paciente" },
            email: { type: "string", description: "Endereço de email" },
            birth_date: { type: "string", description: "Data de nascimento no formato YYYY-MM-DD" },
            gender: {
              type: "string",
              enum: ["masculino", "feminino", "outro"],
              description: "Gênero do paciente",
            },
            document: { type: "string", description: "CPF ou outro documento de identificação (somente números)" },
          },
          required: ["phone"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "adicionar_nota_contato",
        description:
          "Adiciona uma nota clínica ao histórico do contato no CRM. Use para registrar informações importantes mencionadas pelo paciente: queixas, solicitações especiais, dados de saúde relevantes, ou para salvar um resumo da conversa.",
        parameters: {
          type: "object",
          properties: {
            phone: {
              type: "string",
              description: "Telefone do paciente para localizar o contato (somente números)",
            },
            body: {
              type: "string",
              description: "Texto da nota clínica. Seja objetivo e claro para a equipe da clínica.",
            },
          },
          required: ["phone", "body"],
        },
      },
    },
    {
      type: "function",
      function: {
        name: "mover_estagio_pipeline",
        description:
          "Move o card do contato no pipeline CRM para um estágio específico pelo nome. Use após agendar uma consulta para avançar o lead no funil de vendas.",
        parameters: {
          type: "object",
          properties: {
            phone: {
              type: "string",
              description: "Telefone do paciente para localizar o contato (somente números)",
            },
            stage_name: {
              type: "string",
              description: "Nome do estágio de destino no pipeline (ex: 'Agendado', 'Consulta Marcada')",
            },
          },
          required: ["phone", "stage_name"],
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
      const rawPhone = args.patient_phone ? String(args.patient_phone) : "";

      if (!patientName || !doctorId || !scheduledDate || !startTime) {
        return "Campos obrigatórios ausentes: patient_name, doctor_id, scheduled_date, start_time";
      }

      // calculate end_time
      const [h, m] = startTime.split(":").map(Number);
      const endMins = h * 60 + m + durationMinutes;
      const endTime = `${String(Math.floor(endMins / 60)).padStart(2, "0")}:${String(endMins % 60).padStart(2, "0")}`;

      // Find or create contact to link appointment
      let contact: ContactContext | null = null;
      let contactId: string | undefined;
      if (rawPhone) {
        try {
          const result = await findOrCreateContactForAgent(clinicId, rawPhone, patientName, supabaseAdmin);
          contactId = result.id;
          contact = await getContactForPhone(clinicId, rawPhone);
        } catch { /* ignore */ }
      }

      try {
        const appt = await createAppointmentAdmin(
          clinicId,
          {
            doctor_id: doctorId,
            patient_name: patientName,
            patient_phone: rawPhone || undefined,
            contact_id: contactId ?? undefined,
            type_id: args.type_id ? String(args.type_id) : undefined,
            type_name_snapshot: args.type_name ? String(args.type_name) : undefined,
            scheduled_date: scheduledDate,
            start_time: startTime,
            end_time: endTime,
            notes: args.notes ? String(args.notes) : undefined,
          },
          supabaseAdmin
        );

        // Google Calendar sync (fire-and-forget)
        ;(async () => {
          try {
            const { data: clinic } = await supabaseAdmin.from("clinics").select("timezone").eq("id", clinicId).maybeSingle();
            const timezone = clinic?.timezone ?? "America/Sao_Paulo";
            const googleEventId = await syncAppointmentCreate(
              {
                id: appt.id,
                patient_name: appt.patient_name,
                scheduled_date: appt.scheduled_date,
                start_time: appt.start_time.slice(0, 5),
                end_time: appt.end_time.slice(0, 5),
                notes: appt.notes,
                type_name_snapshot: appt.type_name_snapshot,
              },
              doctorId,
              timezone
            );
            if (googleEventId) {
              await supabaseAdmin.from("appointments").update({ google_event_id: googleEventId }).eq("id", appt.id);
            }
          } catch { /* non-critical */ }
        })();

        // Post-booking enrichment (fire-and-forget — never breaks the return)
        if (contactId) {
          const enrichId = contactId;
          ;(async () => {
            try {
              const tasks: Promise<unknown>[] = [];
              if (contact && contact.status !== "patient") {
                tasks.push(updateContactFromAgent(clinicId, enrichId, { status: "patient" }, supabaseAdmin));
              }
              const noteBody = `Consulta agendada via WhatsApp: ${scheduledDate} às ${startTime}` +
                (args.type_name ? ` — ${String(args.type_name)}` : "") + ".";
              tasks.push(addNoteFromAgent(clinicId, enrichId, noteBody, supabaseAdmin));
              tasks.push(autoMovePipelineAfterBooking(clinicId, enrichId, supabaseAdmin));
              await Promise.all(tasks);
            } catch { /* non-critical */ }
          })();
        }

        return toJson({
          success: true,
          appointment_id: appt.id,
          patient: appt.patient_name,
          date: appt.scheduled_date,
          time: appt.start_time,
          contact_linked: !!contactId,
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

    async listar_consultas_paciente(args) {
      const phone = String(args.phone ?? "");
      if (!phone) return "phone é obrigatório.";

      const appointments = await getUpcomingAppointmentsByPhone(clinicId, phone, supabaseAdmin);
      if (appointments.length === 0) return "Nenhuma consulta futura encontrada para este paciente.";
      return toJson(
        appointments.map((a) => ({
          id: a.id,
          data: a.scheduled_date,
          horario: a.start_time.slice(0, 5),
          medico: a.doctor?.name ?? "—",
          tipo: a.type_name_snapshot ?? "—",
          status: a.status,
          observacoes: a.notes ?? null,
        }))
      );
    },

    async cancelar_consulta(args) {
      const appointmentId = String(args.appointment_id ?? "");
      if (!appointmentId) return "appointment_id é obrigatório.";

      try {
        const result = await cancelAppointmentAdmin(clinicId, appointmentId, supabaseAdmin);
        return toJson({
          success: true,
          message: `Consulta cancelada com sucesso.`,
          paciente: result.patient_name,
          data: result.scheduled_date,
          horario: result.start_time.slice(0, 5),
        });
      } catch (err) {
        return `Erro ao cancelar consulta: ${err instanceof Error ? err.message : String(err)}`;
      }
    },

    async remarcar_consulta(args) {
      const appointmentId = String(args.appointment_id ?? "");
      const newDate = String(args.new_date ?? "");
      const newStartTime = String(args.new_start_time ?? "");

      if (!appointmentId || !newDate || !newStartTime) {
        return "appointment_id, new_date e new_start_time são obrigatórios.";
      }

      try {
        const result = await rescheduleAppointmentAdmin(
          clinicId,
          appointmentId,
          newDate,
          newStartTime,
          supabaseAdmin
        );
        return toJson({
          success: true,
          message: "Consulta remarcada com sucesso.",
          paciente: result.patient_name,
          nova_data: result.scheduled_date,
          novo_horario: result.start_time.slice(0, 5),
          novo_termino: result.end_time.slice(0, 5),
        });
      } catch (err) {
        return `Erro ao remarcar consulta: ${err instanceof Error ? err.message : String(err)}`;
      }
    },

    async atualizar_contato(args) {
      const phone = String(args.phone ?? "");
      if (!phone) return "phone é obrigatório.";

      const contact = await getContactForPhone(clinicId, phone);
      if (!contact) return "Contato não encontrado no sistema.";

      const updateData: Record<string, string> = {};
      if (args.full_name) updateData.full_name = String(args.full_name);
      if (args.email) updateData.email = String(args.email);
      if (args.birth_date) updateData.birth_date = String(args.birth_date);
      if (args.gender) updateData.gender = String(args.gender);
      if (args.document) updateData.document = String(args.document);

      if (Object.keys(updateData).length === 0) return "Nenhum dado para atualizar foi fornecido.";

      const result = await updateContactFromAgent(clinicId, contact.id, updateData, supabaseAdmin);
      if (!result) return "Erro ao atualizar contato.";
      return toJson({ success: true, message: "Dados do contato atualizados com sucesso.", updated_fields: Object.keys(updateData) });
    },

    async adicionar_nota_contato(args) {
      const phone = String(args.phone ?? "");
      const body = String(args.body ?? "").trim();
      if (!phone) return "phone é obrigatório.";
      if (!body) return "body é obrigatório.";

      const contact = await getContactForPhone(clinicId, phone);
      if (!contact) return "Contato não encontrado no sistema.";

      const result = await addNoteFromAgent(clinicId, contact.id, body, supabaseAdmin);
      if (!result) return "Erro ao adicionar nota.";
      return toJson({ success: true, message: "Nota adicionada ao contato com sucesso." });
    },

    async mover_estagio_pipeline(args) {
      const phone = String(args.phone ?? "");
      const stageName = String(args.stage_name ?? "").trim();
      if (!phone) return "phone é obrigatório.";
      if (!stageName) return "stage_name é obrigatório.";

      const contact = await getContactForPhone(clinicId, phone);
      if (!contact) return "Contato não encontrado no sistema.";

      const result = await movePipelineStageByName(clinicId, contact.id, stageName, supabaseAdmin);
      return toJson(result);
    },

    async bloquear_agente(_args) {
      if (!sessionId) return toJson({ success: false, reason: "sessionId não disponível." });
      await supabaseAdmin.from("chat_sessions").update({ ai_paused: true }).eq("id", sessionId);
      return toJson({ success: true, message: "Agente bloqueado. Um atendente humano dará continuidade." });
    },
  };

  // Only expose bloquear_agente tool if sessionId is provided
  const allTools: Tool[] = sessionId
    ? [
        ...tools,
        {
          type: "function",
          function: {
            name: "bloquear_agente",
            description:
              "Bloqueia as respostas automáticas do agente para esta conversa. Use quando o paciente pedir para falar com um atendente humano, quiser parar de receber respostas do bot, ou expressar frustração com o atendimento automático.",
            parameters: { type: "object", properties: {}, required: [] },
          },
        },
      ]
    : tools;

  return { tools: allTools, executors };
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
