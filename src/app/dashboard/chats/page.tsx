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

  const accent = fromMe ? "rgba(255,255,255,0.9)" : "#1DB6A0";
  const trackBg = fromMe ? "rgba(255,255,255,0.2)" : "rgba(29,182,160,0.18)";
  const fillBg  = fromMe ? "rgba(255,255,255,0.85)" : "#1DB6A0";
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
        style={{ background: fromMe ? "rgba(255,255,255,0.2)" : "rgba(29,182,160,0.12)", color: accent }}
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
import { supabase } from "@/lib/supabase";

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
  imageUrl?: string;   // loaded from /message/download
  imageLoading?: boolean;
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
  const [refreshing, setRefreshing] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const filters = [
    { key: "all",     label: "Todos" },
    { key: "open",    label: "Abertos" },
    { key: "pending", label: "Pendentes" },
    { key: "closed",  label: "Fechados" },
  ];

  const [synced, setSynced] = useState(false);
  const pollRef = useRef<ReturnType<typeof setInterval> | null>(null);
  const selectedSessionRef = useRef<ChatSessionWithContact | null>(null);
  const refreshInFlightRef = useRef(false);
  const messageRequestRef = useRef(0);

  useEffect(() => {
    selectedSessionRef.current = selectedSession;
  }, [selectedSession]);

  const loadMessages = useCallback(async (
    session: ChatSessionWithContact,
    options?: { markRead?: boolean; showLoading?: boolean }
  ) => {
    const showLoading = options?.showLoading ?? true;
    const markReadOnOpen = options?.markRead ?? false;
    const requestId = ++messageRequestRef.current;

    if (showLoading) {
      setMessages([]);
      setLoadingMessages(true);
    }

    if (markReadOnOpen && session.unread_count > 0) {
      await Promise.allSettled([
        markChatRead(session.id),
        fetch("/api/uazapi", {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            path: "/chat/read",
            method: "POST",
            body: { number: session.wa_chat_id, read: true },
          }),
        }),
      ]);

      setSessions((prev) =>
        prev.map((entry) => entry.id === session.id ? { ...entry, unread_count: 0 } : entry)
      );
      setSelectedSession((prev) =>
        prev?.id === session.id ? { ...prev, unread_count: 0 } : prev
      );
    }

    if (!isConfigured) {
      if (showLoading && requestId === messageRequestRef.current) {
        setLoadingMessages(false);
      }
      return;
    }

    try {
      const res = await fetch("/api/uazapi", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({
          path: "/message/find",
          method: "POST",
          body: { chatid: session.wa_chat_id, limit: 50, offset: 0 },
        }),
      });

      if (!res.ok) return;

      const data = await res.json();
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      const raw: any[] = data?.messages ?? [];

      if (!session.wa_contact_name) {
        const firstReceived = raw.find((message) => !message.fromMe && message.senderName);
        if (firstReceived?.senderName) {
          await upsertChatSession(clinicId, session.wa_chat_id, {
            wa_contact_name: firstReceived.senderName,
          });

          const withName = { ...session, wa_contact_name: firstReceived.senderName ?? null };
          setSessions((prev) =>
            prev.map((entry) => entry.id === session.id ? withName : entry)
          );
          if (selectedSessionRef.current?.id === session.id) {
            setSelectedSession(withName);
            selectedSessionRef.current = withName;
          }
        }
      }

      const parsedMessages: Message[] = raw
        .map((message) => {
          const msgType = (
            message.type ?? message.messageType ?? message.msgType ?? message.mediaType ?? ""
          ).toString().toLowerCase();

          const isAudio = msgType === "audio" || msgType === "ptt"
            || msgType === "myaudio" || msgType === "audiomessage"
            || msgType.includes("audio") || msgType.includes("ptt");

          const isImage = msgType === "image" || msgType === "imagemessage" || msgType === "imagemsg"
            || msgType.includes("image");

          const rawText = message.text ?? message.content ?? message.caption ?? message.body ?? message.message ?? "";
          const text = typeof rawText === "string" ? rawText : "";

          const rawId = message.messageid ?? message.id ?? message.message_id ?? message.messageId;
          const rawMsgId = typeof rawId === "string"
            ? (rawId.includes(":") ? rawId.split(":").pop()! : rawId)
            : undefined;

          const rawTs: number = message.messageTimestamp ?? message.timestamp ?? message.time ?? 0;
          const ts = rawTs > 1e12 ? rawTs : rawTs * 1000;

          const msgTypeResolved: Message["type"] = isAudio ? "audio" : isImage ? "image" : "text";

          return {
            id: message.id ?? message.messageid ?? Math.random().toString(),
            rawMsgId,
            text: isAudio ? "🎵 Áudio" : isImage ? (text || "📷 Imagem") : text,
            time: ts
              ? new Date(ts).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" })
              : "",
            fromMe: Boolean(message.fromMe ?? message.from_me),
            status: "read" as const,
            type: msgTypeResolved,
            audioLoading: isAudio,
            imageLoading: isImage,
            timestamp: ts,
          };
        })
        .filter((message) => message.type === "audio" || message.type === "image" || message.text.trim())
        .sort((a, b) => (a.timestamp ?? 0) - (b.timestamp ?? 0));

      if (requestId !== messageRequestRef.current || selectedSessionRef.current?.wa_chat_id !== session.wa_chat_id) {
        return;
      }

      setMessages(parsedMessages);

      const audioMessages = parsedMessages.filter((message) => message.type === "audio" && message.rawMsgId);
      if (audioMessages.length > 0) {
        const results = await Promise.allSettled(
          audioMessages.map(async (message) => {
            const makeReq = (body: Record<string, unknown>) => fetch("/api/uazapi", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({
                path: "/message/download",
                method: "POST",
                body,
              }),
            });

            const downloadRes = await makeReq({ id: message.rawMsgId, return_base64: false, return_link: true, generate_mp3: true });
            const downloadJson = await downloadRes.json() as { fileURL?: string; fileUrl?: string; base64Data?: string };

            const url = downloadJson.fileURL ?? downloadJson.fileUrl ?? null;
            if (url) return { id: message.id, url };

            const fallbackRes = await makeReq({ id: message.rawMsgId, return_base64: true, return_link: false, generate_mp3: true });
            const fallbackJson = await fallbackRes.json() as { base64Data?: string; mimetype?: string };
            if (fallbackJson.base64Data) {
              const mime = fallbackJson.mimetype ?? "audio/mpeg";
              return { id: message.id, url: `data:${mime};base64,${fallbackJson.base64Data}` };
            }

            return { id: message.id, url: null };
          })
        );

        if (requestId !== messageRequestRef.current || selectedSessionRef.current?.wa_chat_id !== session.wa_chat_id) {
          return;
        }

        const urlMap = new Map<string, string>();
        results.forEach((result) => {
          if (result.status === "fulfilled" && result.value.url) {
            urlMap.set(result.value.id, result.value.url);
          }
        });

        setMessages((prev) =>
          prev.map((message) =>
            message.type === "audio"
              ? { ...message, audioUrl: urlMap.get(message.id) ?? undefined, audioLoading: false }
              : message
          )
        );
      } else if (parsedMessages.some((message) => message.type === "audio")) {
        setMessages((prev) =>
          prev.map((message) => message.type === "audio" ? { ...message, audioLoading: false } : message)
        );
      }

      // ── Load image URLs ─────────────────────────────────────────────────────────
      const imageMessages = parsedMessages.filter((message) => message.type === "image" && message.rawMsgId);
      if (imageMessages.length > 0) {
        const results = await Promise.allSettled(
          imageMessages.map(async (message) => {
            const res = await fetch("/api/uazapi", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({
                path: "/message/download",
                method: "POST",
                body: { id: message.rawMsgId, return_link: true, return_base64: false },
              }),
            });
            const json = await res.json() as { fileURL?: string; fileUrl?: string };
            const url = json.fileURL ?? json.fileUrl ?? null;
            if (url) return { id: message.id, url };

            // fallback: base64
            const res2 = await fetch("/api/uazapi", {
              method: "POST",
              headers: { "Content-Type": "application/json" },
              body: JSON.stringify({
                path: "/message/download",
                method: "POST",
                body: { id: message.rawMsgId, return_base64: true, return_link: false },
              }),
            });
            const json2 = await res2.json() as { base64Data?: string; mimetype?: string };
            if (json2.base64Data) {
              const mime = json2.mimetype ?? "image/jpeg";
              return { id: message.id, url: `data:${mime};base64,${json2.base64Data}` };
            }
            return { id: message.id, url: null };
          })
        );

        if (requestId !== messageRequestRef.current || selectedSessionRef.current?.wa_chat_id !== session.wa_chat_id) {
          return;
        }

        const urlMap = new Map<string, string>();
        results.forEach((result) => {
          if (result.status === "fulfilled" && result.value.url) {
            urlMap.set(result.value.id, result.value.url);
          }
        });

        setMessages((prev) =>
          prev.map((message) =>
            message.type === "image"
              ? { ...message, imageUrl: urlMap.get(message.id) ?? undefined, imageLoading: false }
              : message
          )
        );
      } else if (parsedMessages.some((message) => message.type === "image")) {
        setMessages((prev) =>
          prev.map((message) => message.type === "image" ? { ...message, imageLoading: false } : message)
        );
      }
    } catch {
      // UAZAPI not reachable — keep current message state
    } finally {
      if (showLoading && requestId === messageRequestRef.current) {
        setLoadingMessages(false);
        setTimeout(() => messagesEndRef.current?.scrollIntoView({ behavior: "smooth" }), 100);
      } else if (requestId === messageRequestRef.current) {
        setTimeout(() => messagesEndRef.current?.scrollIntoView({ behavior: "smooth" }), 50);
      }
    }
  }, [clinicId, isConfigured]);

  const handleSelectSession = useCallback(async (session: ChatSessionWithContact) => {
    setSelectedSession(session);
    selectedSessionRef.current = session;
    await loadMessages(session, { markRead: true, showLoading: true });
  }, [loadMessages]);

  const refreshSessions = useCallback(async (options?: {
    syncWithRemote?: boolean;
    showLoading?: boolean;
    showRefreshing?: boolean;
    forceReloadSelectedMessages?: boolean;
  }) => {
    if (!clinicId) {
      setSessions([]);
      setSelectedSession(null);
      selectedSessionRef.current = null;
      setLoading(false);
      setRefreshing(false);
      return;
    }

    if (refreshInFlightRef.current) return;
    refreshInFlightRef.current = true;

    const syncWithRemote = options?.syncWithRemote ?? false;
    const showLoading = options?.showLoading ?? false;
    const showRefreshing = options?.showRefreshing ?? false;
    const forceReloadSelectedMessages = options?.forceReloadSelectedMessages ?? false;

    if (showLoading) setLoading(true);
    if (showRefreshing) setRefreshing(true);

    try {
      if (syncWithRemote && isConfigured) {
        await syncChatsFromUazapi(clinicId);
      }

      const data = await getChatSessions(clinicId, {
        status: activeFilter !== "all" ? activeFilter : undefined,
      });
      setSessions(data);

      if (autoOpenRef.current) {
        const target = data.find((entry) => entry.wa_chat_id === autoOpenRef.current);
        if (target) {
          autoOpenRef.current = null;
          await handleSelectSession(target);
        }
      }

      const currentSelected = selectedSessionRef.current;
      if (currentSelected) {
        const latestSelected = data.find((entry) => entry.id === currentSelected.id) ?? null;
        if (latestSelected) {
          setSelectedSession(latestSelected);
          selectedSessionRef.current = latestSelected;

          const shouldReloadMessages = forceReloadSelectedMessages
            || latestSelected.last_message_at !== currentSelected.last_message_at
            || latestSelected.unread_count !== currentSelected.unread_count
            || latestSelected.wa_contact_name !== currentSelected.wa_contact_name
            || latestSelected.wa_profile_pic !== currentSelected.wa_profile_pic
            || latestSelected.ai_paused !== currentSelected.ai_paused;

          if (shouldReloadMessages) {
            await loadMessages(latestSelected, {
              markRead: latestSelected.unread_count > 0,
              showLoading: false,
            });
          }
        }
      }
    } finally {
      if (showLoading) setLoading(false);
      if (showRefreshing) setRefreshing(false);
      refreshInFlightRef.current = false;
    }
  }, [activeFilter, clinicId, handleSelectSession, isConfigured, loadMessages]);

  useEffect(() => {
    setSynced(false);
  }, [clinicId]);

  useEffect(() => {
    if (!clinicLoaded || !clinicId) {
      if (clinicLoaded) {
        setSessions([]);
        setSelectedSession(null);
        selectedSessionRef.current = null;
        setLoading(false);
      }
      return;
    }

    refreshSessions({ syncWithRemote: !synced, showLoading: true }).then(() => {
      if (!synced) setSynced(true);
    });
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [clinicId, clinicLoaded, activeFilter]);

  useEffect(() => {
    if (!clinicLoaded || !clinicId || !synced) return;
    pollRef.current = setInterval(() => {
      void refreshSessions({ syncWithRemote: true });
    }, 8000);
    return () => { if (pollRef.current) clearInterval(pollRef.current); };
  }, [clinicId, clinicLoaded, refreshSessions, synced]);

  useEffect(() => {
    if (!clinicLoaded || !clinicId) return;

    const channel = supabase
      .channel(`chat-sessions:${clinicId}:${activeFilter}`)
      .on(
        "postgres_changes",
        {
          event: "*",
          schema: "public",
          table: "chat_sessions",
          filter: `clinic_id=eq.${clinicId}`,
        },
        () => {
          void refreshSessions();
        }
      )
      .subscribe();

    return () => {
      void supabase.removeChannel(channel);
    };
  }, [activeFilter, clinicId, clinicLoaded, refreshSessions]);

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
  const unreadSessions = filteredSessions.filter((session) => session.unread_count > 0).length;
  const aiPausedSessions = filteredSessions.filter((session) => session.ai_paused).length;
  const activeSessions = filteredSessions.length - aiPausedSessions;

  return (
    <div className="flex h-full gap-4 bg-mesh p-4">
      <div
        className="w-[22rem] shrink-0 overflow-hidden rounded-[30px] border flex flex-col"
        style={{
          background: "linear-gradient(180deg, rgba(255,255,255,0.94) 0%, var(--surface-1) 100%)",
          borderColor: "rgba(29,182,160,0.12)",
          boxShadow: "var(--z-shadow-md)",
        }}
      >
        <div
          className="p-4 border-b"
          style={{
            borderColor: "rgba(29,182,160,0.1)",
            background: "linear-gradient(180deg, rgba(29,182,160,0.08) 0%, rgba(29,182,160,0.02) 100%)",
          }}
        >
          <div className="flex items-start justify-between mb-4 gap-3">
            <div>
              <p className="text-[10px] font-semibold uppercase tracking-[0.22em]" style={{ color: "#1DB6A0" }}>
                Central de mensagens
              </p>
              <h2 className="text-[20px] leading-none mt-2" style={{ color: "var(--z-text)", fontFamily: "var(--font-display)", fontWeight: 600 }}>
                Conversas
              </h2>
              <p className="text-xs mt-2 max-w-[16rem]" style={{ color: "var(--z-text-dim)" }}>
                Fila de atendimento com outra leitura visual, sem mexer na operação do chat.
              </p>
            </div>
            <div className="flex items-center gap-1">
              <button
                onClick={() => void refreshSessions({ syncWithRemote: true, showRefreshing: true, forceReloadSelectedMessages: true })}
                className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all"
                title="Atualizar"
              >
                <RefreshCw size={13} className={refreshing ? "animate-spin" : undefined} />
              </button>
              <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all">
                <Filter size={13} />
              </button>
              <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all">
                <Plus size={13} />
              </button>
            </div>
          </div>

          <div className="grid grid-cols-3 gap-2 mb-4">
            {[
              { label: "Na fila", value: filteredSessions.length, tone: "rgba(29,182,160,0.12)" },
              { label: "Não lidas", value: unreadSessions, tone: "rgba(245,158,11,0.14)" },
              { label: "IA ativa", value: activeSessions, tone: "rgba(34,211,192,0.16)" },
            ].map((item) => (
              <div
                key={item.label}
                className="rounded-2xl px-3 py-2.5"
                style={{ background: item.tone, border: "1px solid rgba(255,255,255,0.45)" }}
              >
                <p className="text-[10px] uppercase tracking-[0.16em]" style={{ color: "var(--z-text-faint)" }}>
                  {item.label}
                </p>
                <p className="text-base mt-1" style={{ color: "var(--z-text)", fontWeight: 600 }}>
                  {item.value}
                </p>
              </div>
            ))}
          </div>

          <div
            className="flex items-center gap-2 px-3 py-2.5 rounded-2xl"
            style={{ background: "rgba(255,255,255,0.82)", border: "1px solid rgba(29,182,160,0.1)" }}
          >
            <Search size={13} className="text-z-dim shrink-0" />
            <input
              type="text"
              placeholder="Buscar conversa..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="flex-1 bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none"
            />
          </div>

          <div className="flex gap-1.5 mt-3 overflow-x-auto pb-0.5">
            {filters.map((f) => (
              <button
                key={f.key}
                onClick={() => setActiveFilter(f.key)}
                className={cn(
                  "text-xs px-3 py-1.5 rounded-full whitespace-nowrap transition-all duration-200 shrink-0",
                  activeFilter === f.key ? "text-[#22d3c0]" : "text-z-dim hover:text-z-dim"
                )}
                style={activeFilter === f.key
                  ? { background: "rgba(29,182,160,0.15)", border: "1px solid rgba(29,182,160,0.25)" }
                  : { background: "rgba(255,255,255,0.72)", border: "1px solid rgba(29,182,160,0.08)" }}
              >
                {f.label}
              </button>
            ))}
          </div>
        </div>

        <div className="flex-1 overflow-y-auto p-3">
          {loading ? (
            Array.from({ length: 5 }).map((_, i) => (
              <div
                key={i}
                className="flex items-center gap-3 px-4 py-3.5 rounded-[24px] mb-2"
                style={{ background: "rgba(29,182,160,0.04)", border: "1px solid rgba(29,182,160,0.08)" }}
              >
                <div className="w-11 h-11 rounded-[18px] animate-pulse shrink-0" style={{ background: "rgba(29,182,160,0.08)" }} />
                <div className="flex-1 space-y-2">
                  <div className="h-3 w-28 rounded animate-pulse" style={{ background: "rgba(29,182,160,0.06)" }} />
                  <div className="h-2.5 w-40 rounded animate-pulse" style={{ background: "rgba(29,182,160,0.04)" }} />
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
                  <a href="/dashboard/settings" className="text-xs text-[#1DB6A0] hover:text-[#22d3c0] transition-colors">
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
                      "flex items-center gap-3 px-4 py-3.5 cursor-pointer transition-all duration-150 rounded-[24px] mb-2 border",
                      isSelected ? "bg-[rgba(29,182,160,0.08)]" : "hover:bg-[rgba(29,182,160,0.04)]"
                    )}
                    style={{ borderColor: isSelected ? "rgba(29,182,160,0.22)" : "rgba(29,182,160,0.08)" }}
                  >
                    <div className="relative shrink-0">
                      {session.wa_profile_pic ? (
                        // eslint-disable-next-line @next/next/no-img-element
                        <img src={session.wa_profile_pic} alt={name} className="w-11 h-11 rounded-[18px] object-cover" />
                      ) : (
                        <div
                          className="w-11 h-11 rounded-[18px] flex items-center justify-center text-sm font-medium text-white"
                          style={{ background: session.ai_paused
                            ? "linear-gradient(135deg, rgba(245,158,11,0.5), rgba(245,158,11,0.8))"
                            : "linear-gradient(135deg, rgba(29,182,160,0.6), rgba(29,182,160,0.9))" }}
                        >
                          {chatInitials(name)}
                        </div>
                      )}
                      {session.ai_paused && (
                        <div
                          className="absolute -bottom-0.5 -right-0.5 w-4 h-4 rounded-full flex items-center justify-center"
                          style={{ background: "#f59e0b", border: "2px solid var(--surface-1)" }}
                        >
                          <BotOff size={8} className="text-white" />
                        </div>
                      )}
                    </div>

                    <div className="flex-1 min-w-0">
                      <div className="flex items-center justify-between mb-1">
                        <span className={cn("text-sm font-medium truncate", session.ai_paused ? "text-z-dim" : "text-z-text")}>{name}</span>
                        <span className="text-[10px] text-z-faint shrink-0 ml-2">{relativeTime(session.last_message_at)}</span>
                      </div>
                      <div className="flex items-center justify-between gap-3">
                        <p className="text-xs text-z-dim truncate flex-1">
                          {session.ai_paused
                            ? <span className="flex items-center gap-1" style={{ color: "#f59e0b" }}><BotOff size={9} />IA bloqueada</span>
                            : <>{session.last_message_from_me && <span className="text-[#1DB6A0] mr-1">Você:</span>}{session.last_message_text ?? "Sem mensagens"}</>
                          }
                        </p>
                        {session.unread_count > 0 && (
                          <span className="min-w-5 h-5 px-1 rounded-full flex items-center justify-center text-[9px] font-semibold text-white shrink-0" style={{ background: "#1DB6A0" }}>
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

      <div
        className="min-w-0 flex-1 flex flex-col overflow-hidden rounded-[30px] border"
        style={{
          background: "linear-gradient(180deg, rgba(255,255,255,0.96) 0%, var(--surface-1) 100%)",
          borderColor: "rgba(29,182,160,0.12)",
          boxShadow: "var(--z-shadow-md)",
        }}
      >
        {selectedSession ? (
          <>
            <div
              className="flex items-center justify-between px-5 py-4 border-b"
              style={{
                background: "linear-gradient(180deg, rgba(29,182,160,0.06) 0%, rgba(29,182,160,0.01) 100%)",
                borderColor: "rgba(29,182,160,0.1)",
              }}
            >
              <div className="flex items-center gap-3 min-w-0">
                <div className="relative">
                  {selectedSession.wa_profile_pic ? (
                    // eslint-disable-next-line @next/next/no-img-element
                    <img src={selectedSession.wa_profile_pic} alt={selectedName} className="w-11 h-11 rounded-[18px] object-cover" />
                  ) : (
                    <div className="w-11 h-11 rounded-[18px] flex items-center justify-center text-sm font-medium text-white" style={{ background: "linear-gradient(135deg, rgba(29,182,160,0.6), rgba(29,182,160,0.9))" }}>
                      {chatInitials(selectedName)}
                    </div>
                  )}
                </div>
                <div className="min-w-0">
                  <p className="text-[19px] leading-none truncate" style={{ color: "var(--z-text)", fontFamily: "var(--font-display)", fontWeight: 600 }}>
                    {selectedName}
                  </p>
                  <div className="flex flex-wrap items-center gap-1.5 mt-2">
                    {selectedSession.wa_phone && (
                      <span className="px-2.5 py-1 rounded-full text-[10px]" style={{ background: "rgba(255,255,255,0.78)", color: "var(--z-text-dim)", border: "1px solid rgba(29,182,160,0.08)" }}>
                        {selectedSession.wa_phone}
                      </span>
                    )}
                    <span className="px-2.5 py-1 rounded-full text-[10px]" style={{ background: selectedSession.ai_paused ? "rgba(245,158,11,0.12)" : "rgba(29,182,160,0.12)", color: selectedSession.ai_paused ? "#f59e0b" : "#1DB6A0" }}>
                      {selectedSession.ai_paused ? "IA em pausa" : "IA em acompanhamento"}
                    </span>
                    {selectedSession.status !== "open" && (
                      <span className="px-2.5 py-1 rounded-full text-[10px]" style={{ background: "rgba(255,255,255,0.78)", color: "#1DB6A0", border: "1px solid rgba(29,182,160,0.08)" }}>
                        {STATUS_LABELS[selectedSession.status] ?? selectedSession.status}
                      </span>
                    )}
                  </div>
                </div>
              </div>

              <div className="flex items-center gap-1">
                <button
                  onClick={toggleAiPaused}
                  title={selectedSession.ai_paused ? "IA bloqueada — clique para reativar" : "Bloquear IA para esta conversa"}
                  className="flex items-center gap-1.5 h-8 px-2.5 rounded-xl transition-all text-xs font-medium"
                  style={selectedSession.ai_paused
                    ? { background: "rgba(245,158,11,0.12)", border: "1px solid rgba(245,158,11,0.3)", color: "#f59e0b" }
                    : { background: "rgba(255,255,255,0.72)", border: "1px solid rgba(29,182,160,0.08)", color: "var(--z-text-dim)" }}
                >
                  {selectedSession.ai_paused ? <BotOff size={14} /> : <Bot size={14} />}
                  <span className="hidden sm:inline">{selectedSession.ai_paused ? "IA bloqueada" : "IA ativa"}</span>
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all">
                  <Phone size={15} />
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all">
                  <Video size={15} />
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all">
                  <Search size={15} />
                </button>
                <button className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-[#1DB6A0] hover:bg-[rgba(29,182,160,0.1)] transition-all">
                  <MoreVertical size={15} />
                </button>
              </div>
            </div>

            <div
              className="flex-1 overflow-y-auto px-5 py-5 space-y-3"
              style={{
                background: `
                  radial-gradient(circle at top left, rgba(29,182,160,0.08), transparent 28%),
                  radial-gradient(circle at bottom right, rgba(34,211,192,0.06), transparent 30%),
                  linear-gradient(180deg, rgba(255,255,255,0.7) 0%, rgba(245,247,250,0.95) 100%)
                `,
              }}
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
                      <a href="/dashboard/settings" className="text-xs text-[#1DB6A0] hover:text-[#22d3c0] transition-colors">
                        Conectar WhatsApp →
                      </a>
                    </>
                  )}
                </div>
              ) : (
                <>
                  <div className="flex items-center gap-3 py-2">
                    <div className="flex-1 h-px" style={{ background: "rgba(29,182,160,0.1)" }} />
                    <span
                      className="text-[10px] px-2.5 py-1 rounded-full"
                      style={{ color: "var(--z-text-faint)", background: "rgba(255,255,255,0.72)", border: "1px solid rgba(29,182,160,0.08)" }}
                    >
                      Linha do tempo
                    </span>
                    <div className="flex-1 h-px" style={{ background: "rgba(29,182,160,0.1)" }} />
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
                            ? { background: "linear-gradient(135deg, #1DB6A0, #19a896)", color: "white", borderBottomRightRadius: "4px", boxShadow: "0 2px 12px rgba(29,182,160,0.25)" }
                            : { background: "rgba(255,255,255,0.82)", border: "1px solid rgba(29,182,160,0.12)", color: "var(--z-text)", borderBottomLeftRadius: "4px" }
                          }
                        >
                          {msg.type === "audio" ? (
                            msg.audioLoading ? (
                              <div className="flex items-center gap-2 py-1" style={{ minWidth: "180px" }}>
                                <RefreshCw size={12} className="animate-spin shrink-0" style={{ color: msg.fromMe ? "rgba(255,255,255,0.7)" : "#1DB6A0" }} />
                                <span className="text-xs opacity-70">Carregando áudio...</span>
                              </div>
                            ) : msg.audioUrl ? (
                              <VoicePlayer src={msg.audioUrl} fromMe={msg.fromMe} />
                            ) : (
                              <p className="leading-relaxed opacity-70 italic text-xs">🎵 Áudio (expirado ou indisponível)</p>
                            )
                          ) : msg.type === "image" ? (
                            msg.imageLoading ? (
                              <div className="flex items-center gap-2 py-1" style={{ minWidth: "160px" }}>
                                <RefreshCw size={12} className="animate-spin shrink-0" style={{ color: msg.fromMe ? "rgba(255,255,255,0.7)" : "#1DB6A0" }} />
                                <span className="text-xs opacity-70">Carregando imagem...</span>
                              </div>
                            ) : msg.imageUrl ? (
                              <div>
                                <img
                                  src={msg.imageUrl}
                                  alt="Imagem"
                                  className="rounded-xl max-w-full"
                                  style={{ maxHeight: "260px", objectFit: "contain", display: "block" }}
                                />
                                {msg.text && msg.text !== "📷 Imagem" && (
                                  <p className="leading-relaxed mt-1 text-xs opacity-90">{msg.text}</p>
                                )}
                              </div>
                            ) : (
                              <p className="leading-relaxed opacity-70 italic text-xs">📷 Imagem (expirada ou indisponível)</p>
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

            <div
              className="px-4 py-4 border-t"
              style={{ background: "rgba(255,255,255,0.86)", borderColor: "rgba(29,182,160,0.1)" }}
            >
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
                  <a href="/dashboard/settings" className="text-[#1DB6A0]">Configurações</a>{" "}
                  para enviar mensagens.
                </div>
              )}
              <div
                className="flex items-center gap-2 px-3 py-2.5 rounded-[24px]"
                style={{
                  background: "linear-gradient(180deg, rgba(255,255,255,0.94) 0%, rgba(234,246,244,0.9) 100%)",
                  border: "1px solid rgba(29,182,160,0.14)",
                }}
              >
                <button className="text-z-dim hover:text-[#1DB6A0] transition-colors p-1">
                  <Smile size={18} />
                </button>
                <button className="text-z-dim hover:text-[#1DB6A0] transition-colors p-1">
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
                  className="w-9 h-9 rounded-2xl flex items-center justify-center shrink-0 transition-all disabled:opacity-40"
                  style={{
                    background: inputValue.trim() && isConfigured ? "linear-gradient(135deg, #1DB6A0, #22d3c0)" : "rgba(29,182,160,0.15)",
                    color: inputValue.trim() && isConfigured ? "white" : "#6b8f78",
                    boxShadow: inputValue.trim() && isConfigured ? "0 0 12px rgba(29,182,160,0.3)" : "none",
                  }}
                >
                  {sending ? <RefreshCw size={13} className="animate-spin" /> : <Send size={14} />}
                </motion.button>
              </div>
            </div>
          </>
        ) : (
          <div className="flex-1 flex items-center justify-center p-8">
            <div
              className="text-center space-y-4 rounded-[32px] px-8 py-10"
              style={{ background: "rgba(29,182,160,0.05)", border: "1px solid rgba(29,182,160,0.12)" }}
            >
              <MessageCircle size={40} className="text-z-faint mx-auto" />
              <div>
                <p className="text-lg" style={{ color: "var(--z-text)", fontFamily: "var(--font-display)", fontWeight: 600 }}>
                  Escolha uma conversa
                </p>
                <p className="text-sm text-z-dim mt-2">A área de leitura fica isolada para dar mais foco ao atendimento.</p>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
}
