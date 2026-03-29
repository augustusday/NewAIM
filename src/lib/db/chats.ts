import { supabase } from "../supabase";
import type { ChatSession, Contact } from "../database.types";

export type ChatSessionWithContact = ChatSession & {
  contact: Pick<Contact, "id" | "full_name" | "phone" | "email"> | null;
};

export async function getChatSessions(
  clinicId: string,
  filter?: { status?: string; search?: string }
): Promise<ChatSessionWithContact[]> {
  let query = supabase
    .from("chat_sessions")
    .select("*, contact:contacts(id, full_name, phone, email)")
    .eq("clinic_id", clinicId)
    .order("last_message_at", { ascending: false });

  if (filter?.status && filter.status !== "all") {
    query = query.eq("status", filter.status);
  }

  // Exclude ghost rows (no name, no phone, no messages — created by UAZAPI sync for empty chats)
  query = query.or("wa_contact_name.not.is.null,wa_phone.not.is.null,last_message_text.not.is.null");

  const { data, error } = await query;
  if (error) console.error("[getChatSessions]", error.message);
  return (data as unknown as ChatSessionWithContact[]) ?? [];
}

export async function upsertChatSession(
  clinicId: string,
  waChatId: string,
  params: {
    wa_contact_name?: string;
    wa_phone?: string;
    last_message_text?: string;
    last_message_from_me?: boolean;
    increment_unread?: boolean;
  }
): Promise<ChatSession | null> {
  const { data } = await supabase.rpc("upsert_chat_session", {
    p_clinic_id: clinicId,
    p_wa_chat_id: waChatId,
    p_wa_contact_name: params.wa_contact_name,
    p_wa_phone: params.wa_phone,
    p_last_message_text: params.last_message_text,
    p_last_message_from_me: params.last_message_from_me ?? false,
    p_increment_unread: params.increment_unread ?? false,
  });
  return data as unknown as ChatSession | null;
}

export async function markChatRead(sessionId: string): Promise<void> {
  await supabase
    .from("chat_sessions")
    .update({ unread_count: 0 })
    .eq("id", sessionId);
}

export async function setAiPaused(sessionId: string, paused: boolean): Promise<void> {
  await supabase.from("chat_sessions").update({ ai_paused: paused }).eq("id", sessionId);
}

export async function updateChatStatus(
  sessionId: string,
  status: string
): Promise<void> {
  await supabase.from("chat_sessions").update({ status }).eq("id", sessionId);
}

/**
 * Syncs chats from UAZAPI into chat_sessions.
 * Called when the Chats page loads with a configured UAZAPI instance.
 * Uses the /api/uazapi proxy to avoid CORS.
 */
export async function syncChatsFromUazapi(
  clinicId: string
): Promise<void> {
  try {
    const res = await fetch("/api/uazapi", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        method: "POST",
        path: "/chat/find",
        body: { limit: 50, offset: 0, sort: "-wa_lastMsgTimestamp", wa_isGroup: false },
      }),
    });

    if (!res.ok) return;

    const json = await res.json();
    const chats: Array<{
      wa_chatid: string;
      wa_contactName?: string;
      wa_name?: string;
      name?: string;
      phone?: string;
      image?: string;
      wa_lastMsgTimestamp?: number;
    }> = json?.chats ?? [];

    // Upsert each chat as a session (fire-and-forget individual; batch would require edge function)
    await Promise.all(
      chats.map((chat) =>
        supabase.rpc("upsert_chat_session", {
          p_clinic_id: clinicId,
          p_wa_chat_id: chat.wa_chatid,
          p_wa_contact_name: chat.wa_contactName ?? chat.wa_name ?? chat.name ?? undefined,
          p_wa_phone: chat.phone ?? undefined,
          p_last_message_text: undefined,
          p_last_message_from_me: false,
          p_increment_unread: false,
        })
      )
    );
  } catch (err) {
    console.error("[syncChatsFromUazapi]", err instanceof Error ? err.message : err);
  }
}
