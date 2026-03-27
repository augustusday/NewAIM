import { createClient, SupabaseClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";

export type AiConfig = {
  clinicId: string;
  clinicName: string;
  clinicAddress: string | null;
  timezone: string;
  agentName: string;
  model: string;
  openaiKey: string;
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
        "ai_enabled, ai_system_prompt, ai_agent_name, ai_model, ai_openai_key, uazapi_server_url, uazapi_instance_token"
      )
      .eq("clinic_id", clinicId)
      .maybeSingle(),
    admin.from("clinics").select("name, timezone, address").eq("id", clinicId).maybeSingle(),
  ]);

  const settings = settingsRes.data;
  const clinic = clinicRes.data;
  const openrouterKey = settings?.ai_openai_key ?? "";

  if (!settings || !clinic) return null;
  if (!openrouterKey) return null;

  return {
    clinicId,
    clinicName: clinic.name,
    clinicAddress: clinic.address ?? null,
    timezone: clinic.timezone ?? "America/Sao_Paulo",
    agentName: settings.ai_agent_name ?? "Assistente",
    model: settings.ai_model ?? "google/gemini-2.0-flash-001",
    openaiKey: openrouterKey,
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

/** Lists upcoming (future or today) non-cancelled appointments for a patient by phone */
export async function getUpcomingAppointmentsByPhone(
  clinicId: string,
  phone: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<
  {
    id: string;
    scheduled_date: string;
    start_time: string;
    end_time: string;
    status: string;
    patient_name: string;
    patient_phone: string | null;
    notes: string | null;
    type_name_snapshot: string | null;
    doctor: { id: string; name: string; specialty: string } | null;
  }[]
> {
  const admin = supabaseAdmin ?? getAdmin();
  const normalized = phone.replace(/\D/g, "");
  const today = new Date().toISOString().split("T")[0];

  const { data: contact } = await admin
    .from("contacts")
    .select("id")
    .eq("clinic_id", clinicId)
    .or(`phone.ilike.%${normalized.slice(-10)},wa_chat_id.ilike.%${normalized}%`)
    .maybeSingle();

  const baseQuery = admin
    .from("appointments")
    .select(
      "id, scheduled_date, start_time, end_time, status, patient_name, patient_phone, notes, type_name_snapshot, doctor:doctors(id, name, specialty)"
    )
    .eq("clinic_id", clinicId)
    .gte("scheduled_date", today)
    .not("status", "eq", "cancelled")
    .order("scheduled_date", { ascending: true })
    .order("start_time", { ascending: true })
    .limit(5);

  const { data } = contact?.id
    ? await baseQuery.eq("contact_id", contact.id)
    : await baseQuery.ilike("patient_phone", `%${normalized.slice(-10)}%`);

  type Row = {
    id: string;
    scheduled_date: string;
    start_time: string;
    end_time: string;
    status: string;
    patient_name: string;
    patient_phone: string | null;
    notes: string | null;
    type_name_snapshot: string | null;
    doctor: { id: string; name: string; specialty: string } | null;
  };

  return (data ?? []) as unknown as Row[];
}

/** Cancels an appointment by ID, ensuring it belongs to the clinic */
export async function cancelAppointmentAdmin(
  clinicId: string,
  appointmentId: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<{ id: string; patient_name: string; scheduled_date: string; start_time: string }> {
  const admin = supabaseAdmin ?? getAdmin();

  const { data: appt, error: fetchError } = await admin
    .from("appointments")
    .select("id, patient_name, scheduled_date, start_time, status")
    .eq("id", appointmentId)
    .eq("clinic_id", clinicId)
    .maybeSingle();

  if (fetchError || !appt) throw new Error("Consulta não encontrada.");
  if (appt.status === "cancelled") throw new Error("Esta consulta já está cancelada.");
  if (appt.status === "completed") throw new Error("Não é possível cancelar uma consulta já concluída.");

  const { data: updated, error } = await admin
    .from("appointments")
    .update({ status: "cancelled", updated_at: new Date().toISOString() })
    .eq("id", appointmentId)
    .eq("clinic_id", clinicId)
    .select("id, patient_name, scheduled_date, start_time")
    .single();

  if (error || !updated) throw new Error(error?.message ?? "Erro ao cancelar consulta.");
  return updated;
}

/** Reschedules an appointment to a new date/time, validating slot availability */
export async function rescheduleAppointmentAdmin(
  clinicId: string,
  appointmentId: string,
  newDate: string,
  newStartTime: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<{ id: string; patient_name: string; scheduled_date: string; start_time: string; end_time: string }> {
  const admin = supabaseAdmin ?? getAdmin();

  const { data: appt, error: fetchError } = await admin
    .from("appointments")
    .select("id, clinic_id, doctor_id, patient_name, start_time, end_time, status")
    .eq("id", appointmentId)
    .eq("clinic_id", clinicId)
    .maybeSingle();

  if (fetchError || !appt) throw new Error("Consulta não encontrada.");
  if (appt.status === "cancelled") throw new Error("Não é possível remarcar uma consulta cancelada.");
  if (appt.status === "completed") throw new Error("Não é possível remarcar uma consulta já concluída.");

  const [origStartH, origStartM] = appt.start_time.split(":").map(Number);
  const [origEndH, origEndM] = appt.end_time.split(":").map(Number);
  const durationMins = origEndH * 60 + origEndM - (origStartH * 60 + origStartM);

  const [newH, newM] = newStartTime.split(":").map(Number);
  const newEndMins = newH * 60 + newM + durationMins;
  const newEndTime = `${String(Math.floor(newEndMins / 60)).padStart(2, "0")}:${String(newEndMins % 60).padStart(2, "0")}`;

  const { data: conflicts } = await admin
    .from("appointments")
    .select("id")
    .eq("clinic_id", clinicId)
    .eq("doctor_id", appt.doctor_id)
    .eq("scheduled_date", newDate)
    .neq("id", appointmentId)
    .not("status", "eq", "cancelled")
    .lt("start_time", newEndTime)
    .gt("end_time", newStartTime);

  if (conflicts && conflicts.length > 0) {
    throw new Error(`Horário ${newStartTime} em ${newDate} já está ocupado para este médico.`);
  }

  const { data: updated, error } = await admin
    .from("appointments")
    .update({
      scheduled_date: newDate,
      start_time: newStartTime,
      end_time: newEndTime,
      status: "scheduled",
      updated_at: new Date().toISOString(),
    })
    .eq("id", appointmentId)
    .eq("clinic_id", clinicId)
    .select("id, patient_name, scheduled_date, start_time, end_time")
    .single();

  if (error || !updated) throw new Error(error?.message ?? "Erro ao remarcar consulta.");
  return updated;
}

/** Updates contact fields from the AI agent (server-side admin client path) */
export async function updateContactFromAgent(
  clinicId: string,
  contactId: string,
  data: Partial<{
    full_name: string;
    phone: string;
    email: string;
    status: string;
    notes: string;
    birth_date: string;
    gender: string;
    document: string;
  }>,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<{ id: string; full_name: string } | null> {
  const admin = supabaseAdmin ?? getAdmin();
  const { data: updated, error } = await admin
    .from("contacts")
    .update({ ...data, updated_at: new Date().toISOString() })
    .eq("id", contactId)
    .eq("clinic_id", clinicId)
    .select("id, full_name")
    .single();
  if (error || !updated) return null;
  return updated;
}

/** Adds a note to a contact from the AI agent (server-side admin client path) */
export async function addNoteFromAgent(
  clinicId: string,
  contactId: string,
  body: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<{ id: string } | null> {
  const admin = supabaseAdmin ?? getAdmin();
  const { data, error } = await admin
    .from("contact_notes")
    .insert({ clinic_id: clinicId, contact_id: contactId, body, author_id: null })
    .select("id")
    .single();
  if (error || !data) return null;
  return data;
}

/** Moves a contact's pipeline card to a stage by name (case-insensitive) */
export async function movePipelineStageByName(
  clinicId: string,
  contactId: string,
  stageName: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<{ moved: true; stage_id: string; stage_name: string } | { moved: false; reason: string }> {
  const admin = supabaseAdmin ?? getAdmin();

  const { data: pipeline } = await admin
    .from("pipelines")
    .select("id")
    .eq("clinic_id", clinicId)
    .eq("is_default", true)
    .maybeSingle();
  if (!pipeline) return { moved: false, reason: "Nenhum pipeline padrão encontrado para a clínica." };

  const { data: stage } = await admin
    .from("pipeline_stages")
    .select("id, name")
    .eq("clinic_id", clinicId)
    .eq("pipeline_id", pipeline.id)
    .ilike("name", stageName)
    .maybeSingle();
  if (!stage) return { moved: false, reason: `Estágio "${stageName}" não encontrado.` };

  const { data: card } = await admin
    .from("pipeline_cards")
    .select("id")
    .eq("clinic_id", clinicId)
    .eq("contact_id", contactId)
    .eq("pipeline_id", pipeline.id)
    .maybeSingle();
  if (!card) return { moved: false, reason: "Contato não possui card no pipeline." };

  await admin
    .from("pipeline_cards")
    .update({ stage_id: stage.id, updated_at: new Date().toISOString() })
    .eq("id", card.id)
    .eq("clinic_id", clinicId);

  return { moved: true, stage_id: stage.id, stage_name: stage.name };
}

/** Creates a pipeline card for a contact if one doesn't already exist (idempotent, never throws) */
export async function createPipelineCardIfAbsent(
  clinicId: string,
  contactId: string,
  contactName: string,
  supabaseAdmin?: SupabaseClient<Database>
): Promise<void> {
  try {
    const admin = supabaseAdmin ?? getAdmin();

    // Idempotency guard
    const { data: existing } = await admin
      .from("pipeline_cards")
      .select("id")
      .eq("clinic_id", clinicId)
      .eq("contact_id", contactId)
      .maybeSingle();
    if (existing) return;

    const { data: pipeline } = await admin
      .from("pipelines")
      .select("id")
      .eq("clinic_id", clinicId)
      .eq("is_default", true)
      .maybeSingle();
    if (!pipeline) return;

    const { data: firstStage } = await admin
      .from("pipeline_stages")
      .select("id")
      .eq("clinic_id", clinicId)
      .eq("pipeline_id", pipeline.id)
      .order("position", { ascending: true })
      .limit(1)
      .maybeSingle();
    if (!firstStage) return;

    const { data: maxPos } = await admin
      .from("pipeline_cards")
      .select("position")
      .eq("clinic_id", clinicId)
      .eq("stage_id", firstStage.id)
      .order("position", { ascending: false })
      .limit(1)
      .maybeSingle();
    const nextPosition = (maxPos?.position ?? 0) + 1;

    await admin.from("pipeline_cards").insert({
      clinic_id: clinicId,
      pipeline_id: pipeline.id,
      stage_id: firstStage.id,
      contact_id: contactId,
      title: contactName,
      position: nextPosition,
    });
  } catch (err) {
    console.error("[createPipelineCardIfAbsent]", err instanceof Error ? err.message : err);
  }
}

/** Find existing contact by phone, or create a new one and ensure pipeline card exists */
export async function findOrCreateContactForAgent(
  clinicId: string,
  phone: string,
  patientName: string,
  supabaseAdmin: SupabaseClient<Database>
): Promise<{ id: string; full_name: string; created: boolean }> {
  const existing = await getContactForPhone(clinicId, phone);
  if (existing) return { id: existing.id, full_name: existing.full_name, created: false };

  const { data: created, error } = await supabaseAdmin
    .from("contacts")
    .insert({
      clinic_id: clinicId,
      full_name: patientName,
      phone: phone.replace(/\D/g, ""),
      status: "lead",
    })
    .select("id, full_name")
    .single();

  if (error || !created) throw new Error(error?.message ?? "Erro ao criar contato.");

  await createPipelineCardIfAbsent(clinicId, created.id, created.full_name, supabaseAdmin);

  return { id: created.id, full_name: created.full_name, created: true };
}

/** After booking, automatically move contact to the best "agendado" pipeline stage */
export async function autoMovePipelineAfterBooking(
  clinicId: string,
  contactId: string,
  supabaseAdmin: SupabaseClient<Database>
): Promise<void> {
  try {
    const { data: pipeline } = await supabaseAdmin
      .from("pipelines")
      .select("id")
      .eq("clinic_id", clinicId)
      .eq("is_default", true)
      .maybeSingle();
    if (!pipeline) return;

    const { data: stages } = await supabaseAdmin
      .from("pipeline_stages")
      .select("id, name")
      .eq("clinic_id", clinicId)
      .eq("pipeline_id", pipeline.id)
      .order("position", { ascending: true });
    if (!stages?.length) return;

    // Find best stage by keyword matching
    const keywords = ["agendad", "marcad", "consulta marc", "consulta agend", "scheduled", "booked"];
    let targetStage = stages.find((s) =>
      keywords.some((kw) => s.name.toLowerCase().includes(kw))
    );
    // Fallback to second stage if no keyword match and pipeline has more than one stage
    if (!targetStage && stages.length > 1) targetStage = stages[1];
    if (!targetStage) return;

    const { data: card } = await supabaseAdmin
      .from("pipeline_cards")
      .select("id")
      .eq("clinic_id", clinicId)
      .eq("contact_id", contactId)
      .eq("pipeline_id", pipeline.id)
      .maybeSingle();
    if (!card) return;

    await supabaseAdmin
      .from("pipeline_cards")
      .update({ stage_id: targetStage.id, updated_at: new Date().toISOString() })
      .eq("id", card.id)
      .eq("clinic_id", clinicId);
  } catch (err) {
    console.error("[autoMovePipelineAfterBooking]", err instanceof Error ? err.message : err);
  }
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
