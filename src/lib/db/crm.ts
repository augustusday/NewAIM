import { supabase } from "../supabase";
import type { Contact, Pipeline, PipelineStage, PipelineCard, ContactNote, Appointment } from "../database.types";

export async function getContacts(clinicId: string): Promise<Contact[]> {
  const { data } = await supabase
    .from("contacts")
    .select("*")
    .eq("clinic_id", clinicId)
    .order("full_name");
  return data ?? [];
}

export async function getContact(id: string): Promise<Contact | null> {
  const { data } = await supabase.from("contacts").select("*").eq("id", id).single();
  return data;
}

export async function updateContact(
  id: string,
  data: Partial<Pick<Contact, "full_name" | "phone" | "email" | "status" | "notes" | "tags" | "birth_date" | "gender" | "document">>
): Promise<Contact | null> {
  const { data: updated } = await supabase
    .from("contacts")
    .update({ ...data, updated_at: new Date().toISOString() })
    .eq("id", id)
    .select()
    .single();
  return updated;
}

export async function createContact(
  clinicId: string,
  data: { full_name: string; phone?: string; email?: string; status?: string; notes?: string }
): Promise<Contact | null> {
  const { data: contact } = await supabase
    .from("contacts")
    .insert({ clinic_id: clinicId, ...data })
    .select()
    .single();
  return contact;
}

export async function getContactNotes(contactId: string): Promise<ContactNote[]> {
  const { data } = await supabase
    .from("contact_notes")
    .select("*")
    .eq("contact_id", contactId)
    .order("created_at", { ascending: false });
  return data ?? [];
}

export async function addContactNote(
  clinicId: string,
  contactId: string,
  body: string
): Promise<ContactNote | null> {
  const { data } = await supabase
    .from("contact_notes")
    .insert({ clinic_id: clinicId, contact_id: contactId, body })
    .select()
    .single();
  return data;
}

export async function getContactAppointments(
  clinicId: string,
  contactId: string
): Promise<Appointment[]> {
  const { data } = await supabase
    .from("appointments")
    .select("*")
    .eq("clinic_id", clinicId)
    .eq("contact_id", contactId)
    .order("scheduled_date", { ascending: false })
    .order("start_time", { ascending: false });
  return data ?? [];
}

export type PipelineWithStagesAndCards = Pipeline & {
  stages: (PipelineStage & {
    cards: (PipelineCard & { contact: Contact })[];
  })[];
};

export async function getPipelineWithCards(clinicId: string): Promise<PipelineWithStagesAndCards | null> {
  const { data: pipeline } = await supabase
    .from("pipelines")
    .select("*")
    .eq("clinic_id", clinicId)
    .eq("is_default", true)
    .single();

  if (!pipeline) return null;

  const { data: stages } = await supabase
    .from("pipeline_stages")
    .select("*")
    .eq("pipeline_id", pipeline.id)
    .order("position");

  if (!stages) return { ...pipeline, stages: [] };

  const { data: cards } = await supabase
    .from("pipeline_cards")
    .select("*, contact:contacts(*)")
    .eq("pipeline_id", pipeline.id)
    .order("position");

  const typedCards = (cards as unknown as (PipelineCard & { contact: Contact })[]) ?? [];

  const stagesWithCards = stages.map((stage) => ({
    ...stage,
    cards: typedCards.filter((c) => c.stage_id === stage.id),
  }));

  return { ...pipeline, stages: stagesWithCards };
}

export async function moveCard(cardId: string, stageId: string, position: number): Promise<void> {
  await supabase
    .from("pipeline_cards")
    .update({ stage_id: stageId, position })
    .eq("id", cardId);
}
