import { NextRequest, NextResponse, after } from "next/server";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";
import { Redis } from "@upstash/redis";
import { runAgent, splitResponse } from "@/lib/ai/agent";

/**
 * UAZAPI Webhook receiver.
 *
 * Configure the webhook URL in UAZAPI as:
 *   https://yourdomain.com/api/webhooks/uazapi?token=INSTANCE_TOKEN
 *
 * Actual UAZAPI payload structure (confirmed via logs):
 * {
 *   EventType: "messages" | "connection" | ...,
 *   message: { chatid, content, text, fromMe, isGroup, senderName, messageTimestamp, ... },
 *   chat:    { wa_chatid, wa_contactName, wa_isGroup, phone, image, ... },
 *   BaseUrl, instanceName, owner, token
 * }
 */

function getAdmin() {
  return createClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

function getRedis() {
  return new Redis({
    url: process.env.UPSTASH_REDIS_REST_URL!,
    token: process.env.UPSTASH_REDIS_REST_TOKEN!,
  });
}

interface UazapiWebhookPayload {
  EventType: string;
  message?: Record<string, unknown>;
  chat?: Record<string, unknown>;
  BaseUrl?: string;
  instanceName?: string;
  owner?: string;
  token?: string;
  // legacy / alternate structure
  event?: string;
  data?: Record<string, unknown>;
}

export async function POST(req: NextRequest) {
  try {
    const token = req.nextUrl.searchParams.get("token");
    if (!token) {
      return NextResponse.json({ error: "Missing token" }, { status: 400 });
    }

    const supabaseAdmin = getAdmin();

    // Find clinic by instance token
    const { data: settings } = await supabaseAdmin
      .from("clinic_settings")
      .select("clinic_id")
      .eq("uazapi_instance_token", token)
      .maybeSingle();

    if (!settings?.clinic_id) {
      return NextResponse.json({ error: "Unknown instance token" }, { status: 404 });
    }

    const clinicId = settings.clinic_id;
    const payload: UazapiWebhookPayload = await req.json();

    // Support both payload structures
    const eventType = payload.EventType ?? payload.event ?? "";

    switch (eventType) {
      case "messages":
      case "message": {
        const message = payload.message ?? payload.data ?? {};
        const chat = payload.chat ?? {};
        await handleMessage(clinicId, message, chat, supabaseAdmin);
        break;
      }

      case "connection":
        await handleConnection(clinicId, payload.data ?? payload.message ?? {}, supabaseAdmin);
        break;

      default:
        break;
    }

    return NextResponse.json({ ok: true });
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : "Internal error";
    console.error("[uazapi-webhook]", message);
    return NextResponse.json({ error: message }, { status: 500 });
  }
}

async function handleMessage(
  clinicId: string,
  message: Record<string, unknown>,
  chat: Record<string, unknown>,
  supabaseAdmin: ReturnType<typeof getAdmin>
) {
  const chatid = (message.chatid ?? chat.wa_chatid) as string | undefined;

  // Text is in `content` field in the actual payload (spec says `text` but practice differs)
  const body = (message.content ?? message.text ?? message.caption ?? message.body) as string | undefined;

  const fromMe = Boolean(message.fromMe);
  const isGroup = Boolean(message.isGroup ?? chat.wa_isGroup);

  const senderName = (
    chat.wa_contactName ?? chat.lead_fullName ?? chat.lead_name ?? chat.name ?? message.senderName
  ) as string | undefined;

  const phone = (chat.phone ?? extractPhone(chatid ?? "")) as string | null;
  const profilePic = (chat.image || chat.imagePreview) as string | undefined;

  if (!chatid || isGroup) return;

  await supabaseAdmin.rpc("upsert_chat_session", {
    p_clinic_id: clinicId,
    p_wa_chat_id: chatid,
    p_wa_contact_name: senderName || undefined,
    p_wa_phone: phone || undefined,
    p_last_message_text: body || undefined,
    p_last_message_from_me: fromMe,
    p_increment_unread: !fromMe,
  });

  // Update profile pic separately (not in the RPC)
  if (profilePic) {
    await supabaseAdmin
      .from("chat_sessions")
      .update({ wa_profile_pic: profilePic })
      .eq("clinic_id", clinicId)
      .eq("wa_chat_id", chatid);
  }

  // Skip AI for outgoing messages or empty body
  if (fromMe || !body?.trim()) return;

  // Check chat session for ai_paused
  const { data: chatSession } = await supabaseAdmin
    .from("chat_sessions")
    .select("ai_paused")
    .eq("clinic_id", clinicId)
    .eq("wa_chat_id", chatid)
    .maybeSingle();

  if (chatSession?.ai_paused) return;

  // Check if AI is enabled for this clinic
  const { data: aiSettings } = await supabaseAdmin
    .from("clinic_settings")
    .select("ai_enabled, ai_openai_key, uazapi_server_url, uazapi_instance_token")
    .eq("clinic_id", clinicId)
    .maybeSingle();

  if (!aiSettings?.ai_enabled || !aiSettings.ai_openai_key) return;

  // Debounce: accumulate messages in Redis for 8 seconds before processing
  const redis = getRedis();
  const sessionKey = `ai_msgs:${clinicId}:${chatid}`;
  const lockKey = `ai_lock:${clinicId}:${chatid}`;

  await redis.rpush(sessionKey, body);
  await redis.expire(sessionKey, 60);

  const locked = await redis.set(lockKey, "1", { nx: true, ex: 15 });
  if (!locked) return;

  const serverUrl = aiSettings.uazapi_server_url;
  const instanceToken = aiSettings.uazapi_instance_token;
  const chatPhone = (phone ?? chatid.replace(/@.*$/, "")) as string;

  after(async () => {
    try {
      await new Promise((r) => setTimeout(r, 8000));

      const msgs = await redis.lrange<string>(sessionKey, 0, -1);
      await redis.del(sessionKey, lockKey);

      if (!msgs || msgs.length === 0) return;

      const admin = getAdmin();

      const response = await runAgent({
        clinicId,
        sessionId: chatid,
        phone: chatPhone,
        newMessages: msgs,
        supabaseAdmin: admin,
      });

      if (!response || !serverUrl || !instanceToken) return;

      const parts = splitResponse(response);
      for (let i = 0; i < parts.length; i++) {
        if (i > 0) await new Promise((r) => setTimeout(r, 2000));
        await sendWhatsAppText(serverUrl, instanceToken, chatid, parts[i]);
      }
    } catch (err) {
      console.error("[ai-agent]", err instanceof Error ? err.message : err);
    }
  });
}

async function sendWhatsAppText(
  serverUrl: string,
  instanceToken: string,
  chatId: string,
  text: string
): Promise<void> {
  const url = `${serverUrl.replace(/\/$/, "")}/send/text`;
  await fetch(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      Accept: "application/json",
      token: instanceToken,
    },
    body: JSON.stringify({ number: chatId, text }),
  });
}

async function handleConnection(
  clinicId: string,
  data: Record<string, unknown>,
  supabaseAdmin: ReturnType<typeof getAdmin>
) {
  const state = (data.state ?? data.status ?? data.connectionStatus) as string | undefined;
  const uazapiStatus = state === "open" ? "connected" : "disconnected";

  await supabaseAdmin
    .from("clinic_settings")
    .update({
      uazapi_status: uazapiStatus,
      uazapi_last_synced_at: new Date().toISOString(),
    })
    .eq("clinic_id", clinicId);
}

function extractPhone(chatid: string): string | null {
  const match = chatid.match(/^(\d+)@/);
  return match ? match[1] : null;
}
