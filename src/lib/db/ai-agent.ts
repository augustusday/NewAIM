import { createClient, SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";

export type AiConfig = {
  clinicId: string;
  clinicName: string;
  timezone: string;
  agentName: string;
  model: string;
  openrouterKey: string;
  systemPrompt: string;
  aiEnabled: boolean;
  uazapiServerUrl: string | null;
  uazapiInstanceToken: string | null;
};

export type ConversationMessage = {
  role: "user" | "assistant";
  content: string;
};

export type ContactContext = {
  id: string;
  full_name: string;
  phone: string | null;
  email: string | null;
  status: string;
  notes: string | null;
  pipeline_stage: string | null;
  last_appointments: { date: string; doctor: string; type: string; status: string }[];
  contact_notes: { body: string; created_at: string }[];
};

function getAdmin(): SupabaseClient<Database> {
  return createClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

export async function getAiConfig(clinicId: string): Promise<AiConfig | null> {
  const admin = getAdmin();

  const [settingsRes, clinicRes] = await Promise.all([
    admin
      .from("clinic_settings")
      .select(
        "ai_enabled, ai_openai_key, ai_system_prompt, ai_agent_name, ai_model, uazapi_server_url, uazapi_instance_token"
      )
      .eq("clinic_id", clinicId)
      .maybeSingle(),
    admin.from("clinics").select("name, timezone").eq("id", clinicId).maybeSingle(),
  ]);

  const settings = settingsRes.data;
  const clinic = clinicRes.data;

  if (!settings || !clinic) return null;
  if (!settings.ai_openai_key) return null;

  return {
    clinicId,
    clinicName: clinic.name,
    timezone: clinic.timezone ?? "America/Sao_Paulo",
    agentName: settings.ai_agent_name ?? "Assistente",
    model: settings.ai_model ?? "google/gemini-2.0-flash-001",
    openrouterKey: settings.ai_openai_key,
    systemPrompt: settings.ai_system_prompt ?? "",
    aiEnabled: settings.ai_enabled,
    uazapiServerUrl: settings.uazapi_server_url,
    uazapiInstanceToken: settings.uazapi_instance_token,
  };
}

export async function getConversationHistory(
  clinicId: string,
  sessionId: string,
  limit = 20
): Promise<ConversationMessage[]> {
  const admin = getAdmin();
  const { data } = await admin
    .from("ai_conversation_messages")
    .select("role, content")
    .eq("clinic_id", clinicId)
    .eq("session_id", sessionId)
    .order("created_at", { ascending: false })
    .limit(limit);

  if (!data) return [];
  // reverse to get chronological order
  return data
    .reverse()
    .map((m) => ({ role: m.role as "user" | "assistant", content: m.content }));
}

export async function saveMessages(
  clinicId: string,
  sessionId: string,
  messages: ConversationMessage[]
): Promise<void> {
  if (messages.length === 0) return;
  const admin = getAdmin();
  await admin.from("ai_conversation_messages").insert(
    messages.map((m) => ({
      clinic_id: clinicId,
      session_id: sessionId,
      role: m.role,
      content: m.content,
    }))
  );
}

export async function getContactForPhone(
  clinicId: string,
  phone: string
): Promise<ContactContext | null> {
  const admin = getAdmin();

  // normalize phone: strip non-digits, may have country code
  const normalized = phone.replace(/\D/g, "");

  const { data: contact } = await admin
    .from("contacts")
    .select("id, full_name, phone, email, status, notes")
    .eq("clinic_id", clinicId)
    .or(`phone.ilike.%${normalized.slice(-10)},wa_chat_id.ilike.%${normalized}%`)
    .maybeSingle();

  if (!contact) return null;

  const [notesRes, appointmentsRes, pipelineRes] = await Promise.all([
    admin
      .from("contact_notes")
      .select("body, created_at")
      .eq("contact_id", contact.id)
      .order("created_at", { ascending: false })
      .limit(5),
    admin
      .from("appointments")
      .select(
        "scheduled_date, start_time, status, doctor:doctors(name), appointment_type:appointment_types(name)"
      )
      .eq("clinic_id", clinicId)
      .eq("contact_id", contact.id)
      .order("scheduled_date", { ascending: false })
      .limit(3),
    admin
      .from("pipeline_cards")
      .select("stage:pipeline_stages(name)")
      .eq("clinic_id", clinicId)
      .eq("contact_id", contact.id)
      .maybeSingle(),
  ]);

  type AppointmentRow = {
    scheduled_date: string;
    start_time: string;
    status: string;
    doctor: { name: string } | null;
    appointment_type: { name: string } | null;
  };

  const last_appointments = ((appointmentsRes.data ?? []) as unknown as AppointmentRow[]).map(
    (a) => ({
      date: a.scheduled_date,
      doctor: a.doctor?.name ?? "—",
      type: a.appointment_type?.name ?? "—",
      status: a.status,
    })
  );

  const pipeline_stage =
    ((pipelineRes.data as unknown as { stage: { name: string } | null } | null)?.stage?.name) ??
    null;

  return {
    id: contact.id,
    full_name: contact.full_name,
    phone: contact.phone,
    email: contact.email,
    status: contact.status,
    notes: contact.notes,
    pipeline_stage,
    last_appointments,
    contact_notes: (notesRes.data ?? []).map((n) => ({ body: n.body, created_at: n.created_at })),
  };
}

export async function getDoctorsForClinic(
  clinicId: string,
  supabaseAdmin?: SupabaseClient<Database>
) {
  const admin = supabaseAdmin ?? getAdmin();
  const { data } = await admin
    .from("doctors")
    .select("id, name, specialty, crm_number")
    .eq("clinic_id", clinicId)
    .eq("active", true)
    .order("name");
  return data ?? [];
}

export async function getAppointmentTypesForClinic(
  clinicId: string,
  supabaseAdmin?: SupabaseClient<Database>
) {
  const admin = supabaseAdmin ?? getAdmin();
  const { data } = await admin
    .from("appointment_types")
    .select("id, name, duration_minutes")
    .eq("clinic_id", clinicId)
    .eq("active", true)
    .order("name");
  return data ?? [];
}

/** Server-side available slots — mirrors getAvailableSlots from agenda.ts but uses admin client */
export async function getAvailableSlotsAdmin(
  clinicId: string,
  doctorId: string,
  date: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<string[]> {
  const admin = supabaseAdmin ?? getAdmin();
  const dayOfWeek = new Date(date + "T12:00:00").getDay();

  const { data: template } = await admin
    .from("availability_templates")
    .select("start_time, end_time, slot_duration_min")
    .eq("clinic_id", clinicId)
    .eq("doctor_id", doctorId)
    .eq("day_of_week", dayOfWeek)
    .eq("active", true)
    .maybeSingle();

  if (!template) return [];

  const { data: booked } = await admin
    .from("appointments")
    .select("start_time")
    .eq("clinic_id", clinicId)
    .eq("doctor_id", doctorId)
    .eq("scheduled_date", date)
    .not("status", "eq", "cancelled");

  const bookedSet = new Set((booked ?? []).map((a) => a.start_time.slice(0, 5)));

  const slots: string[] = [];
  const [startH, startM] = template.start_time.split(":").map(Number);
  const [endH, endM] = template.end_time.split(":").map(Number);
  const startMins = startH * 60 + startM;
  const endMins = endH * 60 + endM;
  const step = template.slot_duration_min ?? 30;

  for (let m = startMins; m + step <= endMins; m += step) {
    const hh = String(Math.floor(m / 60)).padStart(2, "0");
    const mm = String(m % 60).padStart(2, "0");
    const slot = `${hh}:${mm}`;
    if (!bookedSet.has(slot)) slots.push(slot);
  }

  return slots;
}

/** Create appointment via admin client (server-side, no RLS) */
export async function createAppointmentAdmin(
  clinicId: string,
  data: {
    doctor_id: string;
    patient_name: string;
    patient_phone?: string;
    contact_id?: string;
    type_id?: string;
    type_name_snapshot?: string;
    scheduled_date: string;
    start_time: string;
    end_time: string;
    notes?: string;
    source?: string;
  },
  supabaseAdmin?: SupabaseClient<Database>
) {
  const admin = supabaseAdmin ?? getAdmin();
  const { data: appt, error } = await admin
    .from("appointments")
    .insert({ clinic_id: clinicId, source: "ai_agent", ...data })
    .select()
    .single();
  if (error) throw new Error(error.message);
  return appt;
}

/** Count AI conversations in the last 24h for a clinic */
export async function countRecentAiConversations(clinicId: string): Promise<number> {
  const admin = getAdmin();
  const since = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
  const { count } = await admin
    .from("ai_conversation_messages")
    .select("session_id", { count: "exact", head: true })
    .eq("clinic_id", clinicId)
    .gte("created_at", since);
  return count ?? 0;
}
