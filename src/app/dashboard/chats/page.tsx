"use client";

import { useState, useEffect, useRef, useCallback } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Search,
  MoreVertical,
  Paperclip,
  Smile,
  Send,
  Phone,
  Video,
  Check,
  CheckCheck,
  Plus,
  Filter,
  MessageCircle,
  Wifi,
  WifiOff,
  RefreshCw,
  Play,
  Pause,
  BotOff,
  Bot,
} from "lucide-react";

// ── Custom audio player ───────────────────────────────────────────────────────
function VoicePlayer({ src, fromMe }: { src: string; fromMe: boolean }) {
  const audioRef = useRef<HTMLAudioElement>(null);
  const [playing, setPlaying] = useState(false);
  const [progress, setProgress] = useState(0);
  const [duration, setDuration] = useState(0);
  const [currentTime, setCurrent] = useState(0);

  const toggle = () => {
    const el = audioRef.current;
    if (!el) return;
    if (playing) { el.pause(); } else { el.play(); }
  };

  const handleTimeUpdate = () => {
    const el = audioRef.current;
    if (!el || !el.duration) return;
    setCurrent(el.currentTime);
    setProgress(el.currentTime / el.duration);
  };

  const handleLoaded = () => {
    if (audioRef.current) setDuration(audioRef.current.duration);
  };

  const handleEnded = () => {
    setPlaying(false);
    setProgress(0);
    setCurrent(0);
    if (audioRef.current) audioRef.current.currentTime = 0;
  };

  const handleSeek = (e: React.MouseEvent<HTMLDivElement>) => {
    const el = audioRef.current;
    if (!el || !el.duration) return;
    const rect = e.currentTarget.getBoundingClientRect();
    const ratio = (e.clientX - rect.left) / rect.width;
    el.currentTime = ratio * el.duration;
  };

  const fmt = (s: number) => {
    if (!isFinite(s)) return "0:00";
    const m = Math.floor(s / 60);
    const sec = Math.floor(s % 60);
    return `${m}:${sec.toString().padStart(2, "0")}`;
  };

  const accent = fromMe ? "rgba(255,255,255,0.9)" : "#019A67";
  const trackBg = fromMe ? "rgba(255,255,255,0.2)" : "rgba(1,154,103,0.18)";
  const fillBg  = fromMe ? "rgba(255,255,255,0.85)" : "#019A67";
  const timeFg  = fromMe ? "rgba(255,255,255,0.65)" : "#4a6a58";

  return (
    <div className="flex items-center gap-2.5" style={{ minWidth: "200px", maxWidth: "280px" }}>
      {/* Hidden audio element */}
      <audio
        ref={audioRef}
        src={src}
        onPlay={() => setPlaying(true)}
        onPause={() => setPlaying(false)}
        onTimeUpdate={handleTimeUpdate}
        onLoadedMetadata={handleLoaded}
        onEnded={handleEnded}
        preload="metadata"
      />

      {/* Play / Pause button */}
      <button
        onClick={toggle}
        className="shrink-0 w-8 h-8 rounded-full flex items-center justify-center transition-transform active:scale-90"
        style={{ background: fromMe ? "rgba(255,255,255,0.2)" : "rgba(1,154,103,0.12)", color: accent }}
      >
        {playing ? <Pause size={14} fill="currentColor" /> : <Play size={14} fill="currentColor" style={{ marginLeft: "1px" }} />}
      </button>

      {/* Waveform bars + progress track */}
      <div className="flex-1 flex flex-col gap-1">
        {/* Bars */}
        <div className="flex items-end gap-[2px] h-5">
          {[3, 6, 10, 7, 13, 8, 12, 6, 9, 5, 11, 7, 4, 9, 6].map((h, i) => {
            const barProgress = (i + 1) / 15;
            const filled = progress >= barProgress;
            return (
              <div
                key={i}
                className="flex-1 rounded-sm transition-colors duration-150"
                style={{
                  height: `${h}px`,
                  background: filled ? fillBg : trackBg,
                  opacity: playing && filled ? 1 : 0.85,
                }}
              />
            );
          })}
        </div>
        {/* Seek track */}
        <div
          className="h-[3px] rounded-full cursor-pointer"
          style={{ background: trackBg }}
          onClick={handleSeek}
        >
          <div
            className="h-full rounded-full transition-all duration-100"
            style={{ width: `${progress * 100}%`, background: fillBg }}
          />
        </div>
      </div>

      {/* Time */}
      <span className="text-[10px] shrink-0 tabular-nums" style={{ color: timeFg }}>
        {playing || currentTime > 0 ? fmt(currentTime) : fmt(duration)}
      </span>
    </div>
  );
}
import { cn } from "@/lib/utils";
import { useClinic } from "@/hooks/use-clinic";
import { useUazapiConfig } from "@/hooks/use-uazapi-config";
import { getChatSessions, markChatRead, syncChatsFromUazapi, upsertChatSession, setAiPaused, type ChatSessionWithContact } from "@/lib/db/chats";

interface Message {
  id: string;
  rawMsgId?: string; // UAZAPI messageid for download endpoint
  text: string;
  time: string;
  fromMe: boolean;
  status: "sent" | "delivered" | "read";
  type?: "text" | "audio" | "image" | "document" | "video";
  audioUrl?: string;   // loaded from /message/download
  audioLoading?: boolean;
  timestamp?: number;
}

const STATUS_LABELS: Record<string, string> = {
  open:    "Aberto",
  pending: "Pendente",
  closed:  "Fechado",
};

function relativeTime(iso: string | null): string {
  if (!iso) return "";
  const d = new Date(iso);
  const now = new Date();
  const diffMs = now.getTime() - d.getTime();
  const diffMin = Math.floor(diffMs / 60000);
  const diffH = Math.floor(diffMs / 3600000);
  const diffD = Math.floor(diffMs / 86400000);
  if (diffMin < 1) return "agora";
  if (diffMin < 60) return `${diffMin}m`;
  if (diffH < 24) return d.toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" });
  if (diffD === 1) return "Ontem";
  return d.toLocaleDateString("pt-BR", { day: "2-digit", month: "2-digit" });
}

function chatInitials(name: string | null): string {
  if (!name) return "?";
  const parts = name.trim().split(" ").filter(Boolean);
  if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
  return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
}

export default function ChatsPage() {
  const { clinicId, loaded: clinicLoaded } = useClinic();
  const { isConfigured } = useUazapiConfig();
  const [sessions, setSessions] = useState<ChatSessionWithContact[]>([]);
  const [selectedSession, setSelectedSession] = useState<ChatSessionWithContact | null>(null);
  // Read ?open= param on mount only (avoids Suspense requirement for useSearchParams)
  const autoOpenRef = useRef<string | null>(
    typeof window !== "undefined" ? new URLSearchParams(window.location.search).get("open") : null
  );
  const [messages, setMessages] = useState<Message[]>([]);
  const [loadingMessages, setLoadingMessages] = useState(false);
  const [inputValue, setInputValue] = useState("");
  const [sending, setSending] = useState(false);
  const [searchQuery, setSearchQuery] = useState("");
  const [activeFilter, setActiveFilter] = useState("all");
  const [loading, setLoading] = useState(true);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const filters = [
    { key: "all",     label: "Todos" },
    { key: "open",    label: "Abertos" },
    { key: "pending", label: "Pendentes" },
    { key: "closed",  label: "Fechados" },
  ];

  const [synced, setSynced] = useState(false);
  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);

  const loadSessions = useCallback(async (syncFirst = false) => {
    setLoading(true);
    if (syncFirst && isConfigured) {
      await syncChatsFromUazapi(clinicId);
    }
    const data = await getChatSessions(clinicId, {
      status: activeFilter !== "all" ? activeFilter : undefined,
    });
    setSessions(data);
    setLoading(false);
    // Auto-open session from ?open= query param (e.g. navigating from CRM "Abrir chat")
    if (autoOpenRef.current) {
      const target = data.find((s) => s.wa_chat_id === autoOpenRef.current);
      if (target) { autoOpenRef.current = null; handleSelectSession(target); }
    }
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [clinicId, activeFilter, isConfigured]);

  const refreshSilent = useCallback(async () => {
    const data = await getChatSessions(clinicId, {
      status: activeFilter !== "all" ? activeFilter : undefined,
    });
    setSessions((prev) => {
      // Only update if something actually changed (by last_message_at comparison)
      const prevMap = new Map(prev.map((s) => [s.id, s.last_message_at]));
      const hasChanges = data.some((s) => prevMap.get(s.id) !== s.last_message_at || !prevMap.has(s.id));
      return hasChanges ? data : prev;
    });
  }, [clinicId, activeFilter]);

  useEffect(() => {
    if (!clinicLoaded) return;
    // First load: sync from UAZAPI to populate sessions
    loadSessions(!synced).then(() => setSynced(true));
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [clinicId, clinicLoaded, activeFilter]);

  // Poll for new sessions every 8s (new messages arrive via webhook → DB → we pick them up)
  useEffect(() => {
    if (!clinicLoaded || !synced) return;
    pollRef.current = setInterval(refreshSilent, 8000);
    return () => { if (pollRef.current) clearInterval(pollRef.current); };
  }, [clinicLoaded, synced, refreshSilent]);

  const filteredSessions = sessions
    .filter((s) => {
      // Drop ghost sessions created by UAZAPI sync: no name, no phone, no messages
      const hasIdentity = !!(s.wa_contact_name || s.contact?.full_name || s.wa_phone);
      const hasActivity = !!(s.last_message_text || (s.unread_count ?? 0) > 0);
      if (!hasIdentity && !hasActivity) return false;

      const name = s.wa_contact_name ?? s.contact?.full_name ?? "";
      return name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (s.wa_phone ?? "").includes(searchQuery);
    })
    .sort((a, b) => {
      const ta = a.last_message_at ? new Date(a.last_message_at).getTime() : 0;
      const tb = b.last_message_at ? new Date(b.last_message_at).getTime() : 0;
      return tb - ta;
    });

  const handleSelectSession = async (session: ChatSessionWithContact) => {
    setSelectedSession(session);
    setMessages([]);
    setLoadingMessages(true);

    // Mark as read
    if (session.unread_count > 0) {
      await markChatRead(session.id);
      setSessions((prev) =>
        prev.map((s) => s.id === session.id ? { ...s, unread_count: 0 } : s)
      );
    }

    // Load messages via UAZAPI if configured — POST /message/find
    if (isConfigured) {
      try {
        const res = await fetch(`/api/uazapi`, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            path: `/message/find`,
            method: "POST",
            body: { chatid: session.wa_chat_id, limit: 50, offset: 0 },
          }),
        });
        if (res.ok) {
          const data = await res.json();
          // eslint-disable-next-line @typescript-eslint/no-explicit-any
          const raw: any[] = data?.messages ?? [];
          // Debug: raw.length messages found

          // If the session has no contact name, extract from the first received message
          if (!session.wa_contact_name) {
            const firstReceived = raw.find((m) => !m.fromMe && m.senderName);
            if (firstReceived?.senderName) {
              await upsertChatSession(clinicId, session.wa_chat_id, {
                wa_contact_name: firstReceived.senderName,
              });
              setSessions((prev) =>
                prev.map((s) => s.id === session.id
                  ? { ...s, wa_contact_name: firstReceived.senderName ?? null }
                  : s
                )
              );
              setSelectedSession((prev: ChatSessionWithContact | null) => prev
                ? { ...prev, wa_contact_name: firstReceived.senderName ?? null }
                : prev
              );
            }
          }

          const msgs: Message[] = raw
            .map((m) => {
              // Type detection — try every possible field name UAZAPI might use
              const msgType = (
                m.type ?? m.messageType ?? m.msgType ?? m.mediaType ?? ""
              ).toString().toLowerCase();

              const isAudio = msgType === "audio" || msgType === "ptt"
                || msgType === "myaudio" || msgType === "audiomessage"
                || msgType.includes("audio") || msgType.includes("ptt");

              // Text extraction — only use the value if it's actually a string
              const rawText = m.text ?? m.content ?? m.caption ?? m.body ?? m.message ?? "";
              const text = typeof rawText === "string" ? rawText : "";

              // ID: strip "owner:" prefix if present (UAZAPI format: "owner:hexid")
              const rawId = m.messageid ?? m.id ?? m.message_id ?? m.messageId;
              const rawMsgId = typeof rawId === "string"
                ? (rawId.includes(":") ? rawId.split(":").pop()! : rawId)
                : undefined;

              const rawTs: number = m.messageTimestamp ?? m.timestamp ?? m.time ?? 0;
              // UAZAPI returns seconds; JS Date needs milliseconds
              const ts = rawTs > 1e12 ? rawTs : rawTs * 1000;

              return {
                id: m.id ?? m.messageid ?? Math.random().toString(),
                rawMsgId,
                text: isAudio ? "🎵 Áudio" : text,
                time: ts
                  ? new Date(ts).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" })
                  : "",
                fromMe: Boolean(m.fromMe ?? m.from_me),
                status: "read" as const,
                type: isAudio ? "audio" : ("text" as Message["type"]),
                audioLoading: isAudio,
                timestamp: ts,
              };
            })
            .filter((m) => m.type === "audio" || m.text.trim())
            .sort((a, b) => (a.timestamp ?? 0) - (b.timestamp ?? 0));

          setMessages(msgs);

          // Fetch audio URLs in parallel for all audio messages
          const audioMsgs = msgs.filter((m) => m.type === "audio" && m.rawMsgId);
          if (audioMsgs.length > 0) {
            const results = await Promise.allSettled(
              audioMsgs.map(async (m) => {
                // Try with return_link first, fallback to base64
                const makeReq = (body: Record<string, unknown>) => fetch("/api/uazapi", {
                  method: "POST",
                  headers: { "Content-Type": "application/json" },
                  body: JSON.stringify({
                    path: "/message/download",
                    method: "POST",
                    body,
                  }),
                });

                const res = await makeReq({ id: m.rawMsgId, return_base64: false, return_link: true, generate_mp3: true });
                const dl = await res.json() as { fileURL?: string; fileUrl?: string; base64Data?: string; error?: string };

                const url = dl.fileURL ?? dl.fileUrl ?? null;
                if (url) return { id: m.id, url };

                // Fallback: try base64
                if (!url) {
                  const res2 = await makeReq({ id: m.rawMsgId, return_base64: true, return_link: false, generate_mp3: true });
                  const dl2 = await res2.json() as { base64Data?: string; mimetype?: string };
                  if (dl2.base64Data) {
                    const mime = dl2.mimetype ?? "audio/mpeg";
                    return { id: m.id, url: `data:${mime};base64,${dl2.base64Data}` };
                  }
                }
                return { id: m.id, url: null };
              })
            );
            const urlMap = new Map<string, string>();
            results.forEach((r) => {
              if (r.status === "fulfilled" && r.value.url) {
                urlMap.set(r.value.id, r.value.url);
              }
            });
            setMessages((prev) =>
              prev.map((m) =>
                m.type === "audio"
                  ? { ...m, audioUrl: urlMap.get(m.id) ?? undefined, audioLoading: false }
                  : m
              )
            );
          } else if (msgs.some((m) => m.type === "audio")) {
            // Audio messages exist but have no rawMsgId — mark as done loading
            setMessages((prev) =>
              prev.map((m) => m.type === "audio" ? { ...m, audioLoading: false } : m)
            );
          }
        }
      } catch {
        // UAZAPI not reachable — show empty state
      }
    }

    setLoadingMessages(false);
    setTimeout(() => messagesEndRef.current?.scrollIntoView({ behavior: "smooth" }), 100);
  };

  const handleSend = async () => {
    if (!inputValue.trim() || !selectedSession || !isConfigured) return;
    const text = inputValue.trim();
    setInputValue("");
    setSending(true);

    // Optimistic UI
    const optimistic: Message = {
      id: `tmp-${Date.now()}`,
      text,
      time: new Date().toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" }),
      fromMe: true,
      status: "sent",
    };
    setMessages((prev) => [...prev, optimistic]);
    setTimeout(() => messagesEndRef.current?.scrollIntoView({ behavior: "smooth" }), 50);

    try {
      await fetch(`/api/uazapi`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          path: `/send/text`,
          method: "POST",
          body: {
            number: selectedSession.wa_chat_id,
            text,
          },
        }),
      });
    } catch {
      // Keep optimistic message — will sync later
    }

    setSending(false);
  };

  const toggleAiPaused = async () => {
    if (!selectedSession) return;
    const next = !selectedSession.ai_paused;
    await setAiPaused(selectedSession.id, next);
    setSelectedSession((s) => s ? { ...s, ai_paused: next } : s);
    setSessions((prev) => prev.map((s) => s.id === selectedSession.id ? { ...s, ai_paused: next } : s));
  };

  const selectedName = selectedSession
    ? (selectedSession.wa_contact_name ?? selectedSession.contact?.full_name ?? selectedSession.wa_phone ?? "Chat")
    : "";

  return (
    <div className="flex h-full">
      {/* Sidebar */}
      <div className="w-80 flex flex-col border-r border-[rgba(1,154,103,0.12)] shrink-0" style={{ background: "var(--surface-2)" }}>
        {/* Header */}
        <div className="p-4 border-b border-border">
          <div className="flex items-center justify-between mb-3">
            <h2 className="text-sm font-medium text-z-text">Conversas</h2>
            <div className="flex items-center gap-1">
              <button
                onClick={() => loadSessions(true)}
                className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all"
                title="Atualizar"
              >
                <RefreshCw size={13} />
              </button>
              <button className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                <Filter size={13} />
              </button>
              <button className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                <Plus size={13} />
              </button>
            </div>
          </div>

          {/* Search */}
          <div className="flex items-center gap-2 px-3 py-2 rounded-xl" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
            <Search size={13} className="text-z-dim shrink-0" />
            <input
              type="text"
              placeholder="Buscar conversa..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="flex-1 bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none"
            />
          </div>

          {/* Filters */}
          <div className="flex gap-1.5 mt-3 overflow-x-auto pb-0.5">
            {filters.map((f) => (
              <button
                key={f.key}
                onClick={() => setActiveFilter(f.key)}
                className={cn("text-xs px-2.5 py-1 rounded-lg whitespace-nowrap transition-all duration-200 shrink-0",
                  activeFilter === f.key ? "text-[#01c47f]" : "text-z-dim hover:text-z-dim"
                )}
                style={activeFilter === f.key
                  ? { background: "rgba(1,154,103,0.15)", border: "1px solid rgba(1,154,103,0.25)" }
                  : { background: "var(--muted)", border: "1px solid rgba(255,255,255,0.06)" }
                }
              >
                {f.label}
              </button>
            ))}
          </div>
        </div>

        {/* List */}
        <div className="flex-1 overflow-y-auto">
          {loading ? (
            Array.from({ length: 5 }).map((_, i) => (
              <div key={i} className="flex items-center gap-3 px-4 py-3.5 border-b border-border">
                <div className="w-10 h-10 rounded-full animate-pulse shrink-0" style={{ background: "rgba(1,154,103,0.08)" }} />
                <div className="flex-1 space-y-2">
                  <div className="h-3 w-28 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
                  <div className="h-2.5 w-40 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.04)" }} />
                </div>
              </div>
            ))
          ) : filteredSessions.length === 0 ? (
            <div className="flex flex-col items-center justify-center py-16 px-6 text-center gap-3">
              {isConfigured ? (
                <>
                  <MessageCircle size={32} className="text-z-faint" />
                  <p className="text-sm text-z-dim">Nenhuma conversa ainda</p>
                  <p className="text-xs text-z-faint">Quando o WhatsApp estiver conectado, as mensagens aparecerão aqui.</p>
                </>
              ) : (
                <>
                  <WifiOff size={32} className="text-z-faint" />
                  <p className="text-sm text-z-dim">WhatsApp não configurado</p>
                  <a href="/dashboard/settings" className="text-xs text-[#019A67] hover:text-[#01c47f] transition-colors">
                    Configurar em Configurações →
                  </a>
                </>
              )}
            </div>
          ) : (
            <AnimatePresence>
              {filteredSessions.map((session, i) => {
                const name = session.wa_contact_name ?? session.contact?.full_name ?? session.wa_phone ?? "Contato";
                const isSelected = selectedSession?.id === session.id;
                return (
                  <motion.div
                    key={session.id}
                    initial={{ opacity: 0, x: -12 }}
                    animate={{ opacity: 1, x: 0 }}
                    transition={{ delay: i * 0.03 }}
                    onClick={() => handleSelectSession(session)}
                    className={cn(
                      "flex items-center gap-3 px-4 py-3.5 cursor-pointer transition-all duration-150 border-b border-border",
                      isSelected ? "bg-[rgba(1,154,103,0.08)]" : "hover:bg-[rgba(1,154,103,0.04)]"
                    )}
                  >
                    {/* Avatar */}
                    <div className="relative shrink-0">
                      {session.wa_profile_pic ? (
                        // eslint-disable-next-line @next/next/no-img-element
                        <img src={session.wa_profile_pic} alt={name} className="w-10 h-10 rounded-full object-cover" />
                      ) : (
                        <div
                          className="w-10 h-10 rounded-full flex items-center justify-center text-sm font-medium text-white"
                          style={{ background: session.ai_paused
                            ? "linear-gradient(135deg, rgba(245,158,11,0.5), rgba(245,158,11,0.8))"
                            : "linear-gradient(135deg, rgba(1,154,103,0.6), rgba(1,154,103,0.9))" }}
                        >
                          {chatInitials(name)}
                        </div>
                      )}
                      {session.ai_paused && (
                        <div className="absolute -bottom-0.5 -right-0.5 w-4 h-4 rounded-full flex items-center justify-center"
                          style={{ background: "#f59e0b", border: "2px solid var(--surface-2)" }}>
                          <BotOff size={8} className="text-white" />
                        </div>
                      )}
                    </div>

                    {/* Content */}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center justify-between mb-0.5">
                        <span className={cn("text-sm font-medium truncate", session.ai_paused ? "text-z-dim" : "text-z-text")}>{name}</span>
                        <span className="text-[10px] text-z-faint shrink-0 ml-2">{relativeTime(session.last_message_at)}</span>
                      </div>
                      <div className="flex items-center justify-between">
                        <p className="text-xs text-z-dim truncate flex-1">
                          {session.ai_paused
                            ? <span className="flex items-center gap-1" style={{ color: "#f59e0b" }}><BotOff size={9} />IA bloqueada</span>
                            : <>{session.last_message_from_me && <span className="text-[#019A67] mr-1">Você:</span>}{session.last_message_text ?? "Sem mensagens"}</>
                          }
                        </p>
                        {session.unread_count > 0 && (
                          <span className="w-4 h-4 rounded-full flex items-center justify-center text-[9px] font-semibold text-white ml-1.5 shrink-0" style={{ background: "#019A67" }}>
                            {session.unread_count > 9 ? "9+" : session.unread_count}
                          </span>
                        )}
                      </div>
                    </div>
                  </motion.div>
                );
              })}
            </AnimatePresence>
          )}
        </div>
      </div>

      {/* Chat view */}
      <div className="flex-1 flex flex-col">
        {selectedSession ? (
          <>
            {/* Header */}
            <div className="flex items-center justify-between px-5 py-3.5 border-b border-border" style={{ background: "var(--surface-1)" }}>
              <div className="flex items-center gap-3">
                <div className="relative">
                  {selectedSession.wa_profile_pic ? (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img src={selectedSession.wa_profile_pic} alt={selectedName} className="w-9 h-9 rounded-full object-cover" />
                  ) : (
                    <div className="w-9 h-9 rounded-full flex items-center justify-center text-sm font-medium text-white" style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.6), rgba(1,154,103,0.9))" }}>
                      {chatInitials(selectedName)}
                    </div>
                  )}
                </div>
                <div>
                  <p className="text-sm font-medium text-z-text">{selectedName}</p>
                  <p className="text-xs text-z-dim flex items-center gap-1">
                    {selectedSession.wa_phone && <span>{selectedSession.wa_phone}</span>}
                    {selectedSession.status !== "open" && (
                      <span className="px-1.5 py-0.5 rounded text-[9px]" style={{ background: "rgba(1,154,103,0.1)", color: "#019A67" }}>
                        {STATUS_LABELS[selectedSession.status] ?? selectedSession.status}
                      </span>
                    )}
                  </p>
                </div>
              </div>

              <div className="flex items-center gap-1">
                {/* AI pause toggle */}
                <button
                  onClick={toggleAiPaused}
                  title={selectedSession.ai_paused ? "IA bloqueada — clique para reativar" : "Bloquear IA para esta conversa"}
                  className="flex items-center gap-1.5 h-8 px-2.5 rounded-xl transition-all text-xs font-medium"
                  style={selectedSession.ai_paused
                    ? { background: "rgba(245,158,11,0.12)", border: "1px solid rgba(245,158,11,0.3)", color: "#f59e0b" }
                    : { background: "transparent", border: "1px solid transparent", color: "var(--z-dim)" }}
                >
                  {selectedSession.ai_paused ? <BotOff size={14} /> : <Bot size={14} />}
                  <span className="hidden sm:inline">{selectedSession.ai_paused ? "IA bloqueada" : "IA ativa"}</span>
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                  <Phone size={15} />
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                  <Video size={15} />
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                  <Search size={15} />
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                  <MoreVertical size={15} />
                </button>
              </div>
            </div>

            {/* Messages */}
            <div
              className="flex-1 overflow-y-auto px-5 py-4 space-y-3"
              style={{ background: "radial-gradient(ellipse 60% 40% at 50% 80%, rgba(1,154,103,0.03) 0%, transparent 70%)" }}
            >
              {loadingMessages ? (
                <div className="flex items-center justify-center h-full">
                  <RefreshCw size={20} className="text-z-faint animate-spin" />
                </div>
              ) : messages.length === 0 ? (
                <div className="flex flex-col items-center justify-center h-full gap-3 text-center">
                  {isConfigured ? (
                    <>
                      <MessageCircle size={32} className="text-z-faint" />
                      <p className="text-sm text-z-dim">Nenhuma mensagem carregada</p>
                      <p className="text-xs text-z-faint max-w-xs">As mensagens são carregadas em tempo real via UAZAPI quando o WhatsApp estiver conectado.</p>
                    </>
                  ) : (
                    <>
                      <Wifi size={32} className="text-z-faint" />
                      <p className="text-sm text-z-dim">WhatsApp não conectado</p>
                      <a href="/dashboard/settings" className="text-xs text-[#019A67] hover:text-[#01c47f] transition-colors">
                        Conectar WhatsApp →
                      </a>
                    </>
                  )}
                </div>
              ) : (
                <>
                  <div className="flex items-center gap-3 py-2">
                    <div className="flex-1 h-px" style={{ background: "rgba(1,154,103,0.1)" }} />
                    <span className="text-[10px] text-z-faint px-2">Mensagens</span>
                    <div className="flex-1 h-px" style={{ background: "rgba(1,154,103,0.1)" }} />
                  </div>
                  <AnimatePresence>
                    {messages.map((msg, i) => (
                      <motion.div
                        key={msg.id}
                        initial={{ opacity: 0, y: 10, scale: 0.96 }}
                        animate={{ opacity: 1, y: 0, scale: 1 }}
                        transition={{ delay: i * 0.03, duration: 0.25 }}
                        className={cn("flex", msg.fromMe ? "justify-end" : "justify-start")}
                      >
                        <div
                          className="max-w-[70%] px-4 py-2.5 rounded-2xl text-sm"
                          style={msg.fromMe
                            ? { background: "linear-gradient(135deg, #019A67, #01a870)", color: "white", borderBottomRightRadius: "4px", boxShadow: "0 2px 12px rgba(1,154,103,0.25)" }
                            : { background: "var(--secondary)", border: "1px solid rgba(1,154,103,0.12)", color: "var(--z-text)", borderBottomLeftRadius: "4px" }
                          }
                        >
                          {msg.type === "audio" ? (
                            msg.audioLoading ? (
                              <div className="flex items-center gap-2 py-1" style={{ minWidth: "180px" }}>
                                <RefreshCw size={12} className="animate-spin shrink-0" style={{ color: msg.fromMe ? "rgba(255,255,255,0.7)" : "#019A67" }} />
                                <span className="text-xs opacity-70">Carregando áudio...</span>
                              </div>
                            ) : msg.audioUrl ? (
                              <VoicePlayer src={msg.audioUrl} fromMe={msg.fromMe} />
                            ) : (
                              <p className="leading-relaxed opacity-70 italic text-xs">🎵 Áudio (expirado ou indisponível)</p>
                            )
                          ) : (
                            <p className="leading-relaxed">{msg.text}</p>
                          )}
                          <div className={cn("flex items-center gap-1 mt-1", msg.fromMe ? "justify-end" : "justify-start")}>
                            <span className="text-[10px]" style={{ color: msg.fromMe ? "rgba(255,255,255,0.6)" : "#4a6a58" }}>
                              {msg.time}
                            </span>
                            {msg.fromMe && (
                              <span style={{ color: "rgba(255,255,255,0.6)" }}>
                                {msg.status === "read" ? <CheckCheck size={12} /> : <Check size={12} />}
                              </span>
                            )}
                          </div>
                        </div>
                      </motion.div>
                    ))}
                  </AnimatePresence>
                  <div ref={messagesEndRef} />
                </>
              )}
            </div>

            {/* Input */}
            <div className="px-4 py-3 border-t border-border" style={{ background: "var(--surface-1)" }}>
              {selectedSession.ai_paused && (
                <div className="flex items-center gap-2 mb-2 px-3 py-2 rounded-xl text-xs"
                  style={{ background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.2)", color: "#f59e0b" }}>
                  <BotOff size={12} className="shrink-0" />
                  <span>IA bloqueada — você está respondendo como atendente humano.</span>
                  <button onClick={toggleAiPaused} className="ml-auto underline opacity-70 hover:opacity-100">Reativar</button>
                </div>
              )}
              {!isConfigured && (
                <div className="text-center text-xs text-z-faint mb-2">
                  Configure o WhatsApp em{" "}
                  <a href="/dashboard/settings" className="text-[#019A67]">Configurações</a>{" "}
                  para enviar mensagens.
                </div>
              )}
              <div className="flex items-center gap-2 px-3 py-2 rounded-2xl" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.14)" }}>
                <button className="text-z-dim hover:text-[#019A67] transition-colors p-1">
                  <Smile size={18} />
                </button>
                <button className="text-z-dim hover:text-[#019A67] transition-colors p-1">
                  <Paperclip size={18} />
                </button>
                <input
                  type="text"
                  placeholder={isConfigured ? "Escreva uma mensagem..." : "WhatsApp não configurado"}
                  value={inputValue}
                  onChange={(e) => setInputValue(e.target.value)}
                  onKeyDown={(e) => e.key === "Enter" && !e.shiftKey && handleSend()}
                  disabled={!isConfigured || sending}
                  className="flex-1 bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none disabled:opacity-50"
                />
                <motion.button
                  whileHover={{ scale: 1.05 }}
                  whileTap={{ scale: 0.95 }}
                  onClick={handleSend}
                  disabled={!inputValue.trim() || !isConfigured || sending}
                  className="w-8 h-8 rounded-xl flex items-center justify-center shrink-0 transition-all disabled:opacity-40"
                  style={{
                    background: inputValue.trim() && isConfigured ? "linear-gradient(135deg, #019A67, #01c47f)" : "rgba(1,154,103,0.15)",
                    color: inputValue.trim() && isConfigured ? "white" : "#6b8f78",
                    boxShadow: inputValue.trim() && isConfigured ? "0 0 12px rgba(1,154,103,0.3)" : "none",
                  }}
                >
                  {sending ? <RefreshCw size={13} className="animate-spin" /> : <Send size={14} />}
                </motion.button>
              </div>
            </div>
          </>
        ) : (
          <div className="flex-1 flex items-center justify-center">
            <div className="text-center space-y-3">
              <MessageCircle size={40} className="text-z-faint mx-auto" />
              <p className="text-sm text-z-dim">Selecione uma conversa</p>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
