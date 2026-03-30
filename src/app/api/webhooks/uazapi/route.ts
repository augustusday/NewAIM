import { NextRequest, NextResponse, after } from "next/server";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";
import { Redis } from "@upstash/redis";
import { runAgent, splitResponse } from "@/lib/ai/agent";
import { createPipelineCardIfAbsent } from "@/lib/db/ai-agent";

/**
 * UAZAPI Webhook receiver.
 *
 * Configure the webhook URL in UAZAPI as:
 *   https://yourdomain.com/api/webhooks/uazapi?token=INSTANCE_TOKEN
 *
 * Actual UAZAPI payload structure (confirmed via logs):
 * {
 *   EventType: "messages" | "connection" | ...,
 *   message: { chatid, content, text, fromMe, isGroup, senderName, messageTimestamp, type, messageid, ... },
 *   chat:    { wa_chatid, wa_contactName, wa_isGroup, phone, image, ... },
 *   BaseUrl, instanceName, owner, token
 * }
 */

type SupabaseAdmin = ReturnType<typeof createClient<Database>>;

function getAdmin(): SupabaseAdmin {
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
  supabaseAdmin: SupabaseAdmin
) {
  const chatid = (message.chatid ?? chat.wa_chatid) as string | undefined;
  if (!chatid) return;

  const fromMe = Boolean(message.fromMe);
  const isGroup = Boolean(message.isGroup ?? chat.wa_isGroup);
  if (isGroup) return;

  // UAZAPI sends messageType (PascalCase), not type. AudioMessage is the audio value.
  const rawMsgType = String(message.messageType ?? message.type ?? "text");
  const msgType = rawMsgType.toLowerCase();
  const isAudio = msgType === "audiomessage" || msgType === "audio" || msgType === "ptt" || msgType === "myaudio";
  const isImage = msgType === "imagemessage" || msgType === "image" || msgType === "imagemsg";
  const msgId = (message.messageid ?? message.id) as string | undefined;
  // Log ALL non-text message types to help diagnose media detection issues
  if (msgType !== "text" && msgType !== "extendedtextmessage" && msgType !== "conversation") {
    console.log(`[webhook] media message chatid=${chatid} rawMessageType="${rawMsgType}" msgId=${msgId} isAudio=${isAudio} isImage=${isImage}`);
  }

  // Text is in `content` field in the actual payload.
  // Guard: for audio/media messages, content may be an object — ensure we only use strings.
  const rawBody = message.content ?? message.text ?? message.caption ?? message.body;
  let body: string | undefined = typeof rawBody === "string" && rawBody.trim() ? rawBody : undefined;
  // For images without caption, use a placeholder so the flow continues to AI
  if (isImage && !body) body = "[Imagem]";

  const senderName = (
    chat.wa_contactName ?? chat.lead_fullName ?? chat.lead_name ?? chat.name ?? message.senderName
  ) as string | undefined;

  const phone = (chat.phone ?? extractPhone(chatid)) as string | null;
  const profilePic = (chat.image || chat.imagePreview) as string | undefined;

  // ── Upsert chat session ──────────────────────────────────────────────────────
  const lastMsgText = isAudio ? "🎵 Áudio" : isImage ? "📷 Imagem" : (body || undefined);

  await supabaseAdmin.rpc("upsert_chat_session", {
    p_clinic_id: clinicId,
    p_wa_chat_id: chatid,
    p_wa_contact_name: senderName || undefined,
    p_wa_phone: phone || undefined,
    p_last_message_text: lastMsgText,
    p_last_message_from_me: fromMe,
    p_increment_unread: !fromMe,
  });

  if (profilePic) {
    await supabaseAdmin
      .from("chat_sessions")
      .update({ wa_profile_pic: profilePic })
      .eq("clinic_id", clinicId)
      .eq("wa_chat_id", chatid);
  }

  // ── Auto-register contact in CRM (only for incoming messages) ───────────────
  if (!fromMe) {
    await upsertContact(clinicId, chatid, phone, senderName, supabaseAdmin);
  }

  // ── Skip AI for outgoing messages ────────────────────────────────────────────
  if (fromMe) return;

  // ── Load AI settings + platform OpenAI key early ─────────────────────────────
  const [aiSettingsRes, platformKeyRes] = await Promise.all([
    supabaseAdmin
      .from("clinic_settings")
      .select("ai_enabled, uazapi_server_url, uazapi_instance_token")
      .eq("clinic_id", clinicId)
      .maybeSingle(),
    supabaseAdmin
      .from("platform_settings")
      .select("value")
      .eq("key", "openai_api_key")
      .maybeSingle(),
  ]);
  const aiSettings = aiSettingsRes.data;
  const platformOpenaiKey = (platformKeyRes.data as { value: string } | null)?.value ?? undefined;

  // ── Transcribe audio messages ─────────────────────────────────────────────────
  if (isAudio && msgId && platformOpenaiKey && aiSettings?.uazapi_server_url && aiSettings.uazapi_instance_token) {
    const transcription = await transcribeAudio(
      msgId,
      aiSettings.uazapi_server_url,
      aiSettings.uazapi_instance_token,
      platformOpenaiKey
    );
    if (typeof transcription === "string" && transcription.trim()) {
      body = `[Áudio transcrito]: ${transcription.trim()}`;
      console.log(`[audio-transcription] chatid=${chatid} transcribed: ${transcription.slice(0, 80)}`);
    }
  }

  // ── Skip AI if no message body (non-transcribable audio, sticker, etc.) ──────
  if (!body || !body.trim()) return;

  if (!aiSettings?.ai_enabled || !platformOpenaiKey) return;

  // ── Check ai_paused on session ───────────────────────────────────────────────
  const { data: chatSession } = await supabaseAdmin
    .from("chat_sessions")
    .select("ai_paused")
    .eq("clinic_id", clinicId)
    .eq("wa_chat_id", chatid)
    .maybeSingle();

  if (chatSession?.ai_paused) return;

  // ── Debounce: accumulate messages in Redis for 8 seconds ─────────────────────
  const redis = getRedis();
  const sessionKey = `ai_msgs:${clinicId}:${chatid}`;
  const imageKey = `ai_imgs:${clinicId}:${chatid}`;
  const lockKey = `ai_lock:${clinicId}:${chatid}`;

  await redis.rpush(sessionKey, body);
  await redis.expire(sessionKey, 60);

  // ── Download image URL and store in Redis for the agent ──────────────────────
  if (isImage && msgId && aiSettings?.uazapi_server_url && aiSettings.uazapi_instance_token) {
    const imageUrl = await downloadImageAsBase64(
      msgId,
      aiSettings.uazapi_server_url,
      aiSettings.uazapi_instance_token
    );
    if (imageUrl) {
      await redis.rpush(imageKey, imageUrl);
      await redis.expire(imageKey, 60);
      console.log(`[image-download] chatid=${chatid} url=${imageUrl.slice(0, 80)}`);
    }
  }

  const locked = await redis.set(lockKey, "1", { nx: true, ex: 15 });
  if (!locked) return;

  const serverUrl = aiSettings.uazapi_server_url;
  const instanceToken = aiSettings.uazapi_instance_token;
  const chatPhone = (phone ?? chatid.replace(/@.*$/, "")) as string;

  after(async () => {
    try {
      await new Promise((r) => setTimeout(r, 8000));

      const [msgs, imageUrls] = await Promise.all([
        redis.lrange<string>(sessionKey, 0, -1),
        redis.lrange<string>(imageKey, 0, -1),
      ]);
      await redis.del(sessionKey, imageKey, lockKey);

      if (!msgs || msgs.length === 0) return;

      const admin = getAdmin();

      const response = await runAgent({
        clinicId,
        sessionId: chatid,
        phone: chatPhone,
        newMessages: msgs,
        imageUrls: imageUrls ?? [],
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

/**
 * Transcribes an audio message using the n8n Bonfanti approach:
 * 1. Ask UAZAPI to generate an MP3 and return its hosted URL
 * 2. Download the MP3 binary
 * 3. Send to OpenAI Whisper directly using our platform key
 */
async function transcribeAudio(
  msgId: string,
  serverUrl: string,
  instanceToken: string,
  openaiApiKey: string
): Promise<string | undefined> {
  try {
    // Step 1: Get the hosted MP3 URL from UAZAPI (mirrors n8n HTTP Request2)
    const dlUrl = `${serverUrl.replace(/\/$/, "")}/message/download`;
    const dlRes = await fetch(dlUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json", Accept: "application/json", token: instanceToken },
      body: JSON.stringify({ id: msgId, generate_mp3: true, return_base64: false, return_link: false, transcribe: false, download_quoted: false }),
    });
    if (!dlRes.ok) {
      console.error("[transcribeAudio] UAZAPI download failed:", dlRes.status);
      return undefined;
    }
    const dlJson = await dlRes.json() as { fileURL?: string; fileUrl?: string };
    const fileUrl = dlJson.fileURL ?? dlJson.fileUrl;
    if (!fileUrl) {
      console.error("[transcribeAudio] No fileURL in response:", JSON.stringify(dlJson).slice(0, 200));
      return undefined;
    }

    // Step 2: Download the MP3 binary (mirrors n8n HTTP Request3)
    const audioRes = await fetch(fileUrl);
    if (!audioRes.ok) {
      console.error("[transcribeAudio] Failed to fetch audio file:", audioRes.status);
      return undefined;
    }
    const audioBuffer = await audioRes.arrayBuffer();

    // Step 3: Transcribe via OpenAI Whisper (mirrors n8n "Transcribe a recording" node)
    const { default: OpenAI } = await import("openai");
    const client = new OpenAI({ apiKey: openaiApiKey });
    const audioFile = new File([audioBuffer], "audio.mp3", { type: "audio/mpeg" });
    const result = await client.audio.transcriptions.create({
      model: "whisper-1",
      file: audioFile,
      language: "pt",
    });
    return result.text?.trim() || undefined;
  } catch (err) {
    console.error("[transcribeAudio] error:", err instanceof Error ? err.message : err);
    return undefined;
  }
}

/**
 * Downloads an image from UAZAPI and returns a base64 data URL.
 * We use base64 (not a hosted URL) because UAZAPI URLs require authentication
 * headers that OpenAI Vision cannot send when fetching the image.
 */
async function downloadImageAsBase64(
  msgId: string,
  serverUrl: string,
  instanceToken: string
): Promise<string | undefined> {
  try {
    const dlUrl = `${serverUrl.replace(/\/$/, "")}/message/download`;

    // Step 1: ask UAZAPI for the hosted URL (same pattern as audio)
    const dlRes = await fetch(dlUrl, {
      method: "POST",
      headers: { "Content-Type": "application/json", Accept: "application/json", token: instanceToken },
      body: JSON.stringify({ id: msgId, return_link: true, return_base64: false, download_quoted: false }),
    });
    if (!dlRes.ok) {
      console.error("[downloadImage] UAZAPI download failed:", dlRes.status);
      return undefined;
    }
    const dlJson = await dlRes.json() as { fileURL?: string; fileUrl?: string; base64?: string; mimetype?: string };

    // If UAZAPI returned base64 directly, use it
    if (dlJson.base64) {
      const mime = dlJson.mimetype ?? "image/jpeg";
      return `data:${mime};base64,${dlJson.base64}`;
    }

    const fileUrl = dlJson.fileURL ?? dlJson.fileUrl;
    if (!fileUrl) {
      console.error("[downloadImage] No fileURL in response:", JSON.stringify(dlJson).slice(0, 200));
      return undefined;
    }

    // Step 2: download the binary ourselves and convert to base64 data URL
    const imgRes = await fetch(fileUrl);
    if (!imgRes.ok) {
      console.error("[downloadImage] Failed to fetch image binary:", imgRes.status);
      return undefined;
    }
    const contentType = imgRes.headers.get("content-type") ?? "image/jpeg";
    const arrayBuffer = await imgRes.arrayBuffer();
    const base64 = Buffer.from(arrayBuffer).toString("base64");
    console.log(`[downloadImage] downloaded ${arrayBuffer.byteLength} bytes mime=${contentType}`);
    return `data:${contentType};base64,${base64}`;
  } catch (err) {
    console.error("[downloadImage] error:", err instanceof Error ? err.message : err);
    return undefined;
  }
}

/**
 * Upserts a contact in the CRM from an incoming WhatsApp message.
 * Deduplication: look up by wa_chat_id first, then by phone.
 * Links the contact to the chat session via contact_id.
 */
async function upsertContact(
  clinicId: string,
  waChatId: string,
  phone: string | null,
  senderName: string | undefined,
  supabaseAdmin: SupabaseAdmin
): Promise<void> {
  try {
    let contactId: string | null = null;

    // 1. Try to find by wa_chat_id (most specific)
    const { data: byChat } = await supabaseAdmin
      .from("contacts")
      .select("id, full_name, wa_chat_id, phone")
      .eq("clinic_id", clinicId)
      .eq("wa_chat_id", waChatId)
      .maybeSingle();

    if (byChat) {
      contactId = byChat.id;
      // Update name if we now know it
      const updates: Record<string, unknown> = { wa_last_msg_at: new Date().toISOString() };
      if (!byChat.full_name && senderName) updates.full_name = senderName;
      if (!byChat.phone && phone) updates.phone = phone;
      await supabaseAdmin.from("contacts").update(updates).eq("id", byChat.id);
    } else if (phone) {
      // 2. Try to find by phone number
      const { data: byPhone } = await supabaseAdmin
        .from("contacts")
        .select("id, full_name, wa_chat_id")
        .eq("clinic_id", clinicId)
        .eq("phone", phone)
        .maybeSingle();

      if (byPhone) {
        contactId = byPhone.id;
        const updates: Record<string, unknown> = { wa_last_msg_at: new Date().toISOString() };
        if (!byPhone.wa_chat_id) updates.wa_chat_id = waChatId;
        if (!byPhone.full_name && senderName) updates.full_name = senderName;
        await supabaseAdmin.from("contacts").update(updates).eq("id", byPhone.id);
      }
    }

    // 3. Create new contact if not found
    if (!contactId) {
      const { data: newContact } = await supabaseAdmin
        .from("contacts")
        .insert({
          clinic_id: clinicId,
          full_name: senderName ?? phone ?? waChatId,
          phone: phone ?? null,
          wa_chat_id: waChatId,
          wa_last_msg_at: new Date().toISOString(),
          status: "lead",
        })
        .select("id")
        .single();
      contactId = newContact?.id ?? null;

      // Auto-create pipeline card for new contacts (fire-and-forget)
      if (contactId) {
        createPipelineCardIfAbsent(
          clinicId,
          contactId,
          senderName ?? phone ?? waChatId,
          supabaseAdmin
        ).catch((err) => {
          console.error("[upsert-contact] pipeline card:", err instanceof Error ? err.message : err);
        });
      }
    }

    // 4. Link contact to chat session
    if (contactId) {
      await supabaseAdmin
        .from("chat_sessions")
        .update({ contact_id: contactId })
        .eq("clinic_id", clinicId)
        .eq("wa_chat_id", waChatId)
        .is("contact_id", null); // only update if not already linked
    }
  } catch (err) {
    console.error("[upsert-contact]", err instanceof Error ? err.message : err);
  }
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
  supabaseAdmin: SupabaseAdmin
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
