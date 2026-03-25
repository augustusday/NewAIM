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
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useClinic } from "@/hooks/use-clinic";
import { useUazapiConfig } from "@/hooks/use-uazapi-config";
import { getChatSessions, markChatRead, syncChatsFromUazapi, type ChatSessionWithContact } from "@/lib/db/chats";

interface Message {
  id: string;
  text: string;
  time: string;
  fromMe: boolean;
  status: "sent" | "delivered" | "read";
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
  const { config: uazapiConfig, isConfigured } = useUazapiConfig();
  const [sessions, setSessions] = useState<ChatSessionWithContact[]>([]);
  const [selectedSession, setSelectedSession] = useState<ChatSessionWithContact | null>(null);
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
      await syncChatsFromUazapi(clinicId, uazapiConfig.serverUrl, uazapiConfig.instanceToken);
    }
    const data = await getChatSessions(clinicId, {
      status: activeFilter !== "all" ? activeFilter : undefined,
    });
    setSessions(data);
    setLoading(false);
  // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [clinicId, activeFilter, isConfigured, uazapiConfig.serverUrl, uazapiConfig.instanceToken]);

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

  const filteredSessions = sessions.filter((s) => {
    const name = s.wa_contact_name ?? s.contact?.full_name ?? "";
    return name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      (s.wa_phone ?? "").includes(searchQuery);
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
            serverUrl: uazapiConfig.serverUrl,
            instanceToken: uazapiConfig.instanceToken,
            path: `/message/find`,
            method: "POST",
            body: { chatid: session.wa_chat_id, limit: 50, offset: 0 },
          }),
        });
        if (res.ok) {
          const data = await res.json();
          const msgs: Message[] = (data?.messages ?? []).map((m: {
            id?: string;
            messageid?: string;
            text?: string;
            messageTimestamp?: number;
            fromMe?: boolean;
            status?: string;
          }) => ({
            id: m.id ?? m.messageid ?? Math.random().toString(),
            text: m.text ?? "",
            time: m.messageTimestamp
              ? new Date(m.messageTimestamp).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" })
              : "",
            fromMe: m.fromMe ?? false,
            status: "read" as const,
          })).filter((m: Message) => m.text);
          setMessages(msgs);
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
          serverUrl: uazapiConfig.serverUrl,
          instanceToken: uazapiConfig.instanceToken,
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
                          style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.6), rgba(1,154,103,0.9))" }}
                        >
                          {chatInitials(name)}
                        </div>
                      )}
                    </div>

                    {/* Content */}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center justify-between mb-0.5">
                        <span className="text-sm font-medium text-z-text truncate">{name}</span>
                        <span className="text-[10px] text-z-faint shrink-0 ml-2">{relativeTime(session.last_message_at)}</span>
                      </div>
                      <div className="flex items-center justify-between">
                        <p className="text-xs text-z-dim truncate flex-1">
                          {session.last_message_from_me && <span className="text-[#019A67] mr-1">Você:</span>}
                          {session.last_message_text ?? "Sem mensagens"}
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
                          <p className="leading-relaxed">{msg.text}</p>
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
