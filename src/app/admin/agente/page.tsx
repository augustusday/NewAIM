"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Bot, Save, ChevronDown, ChevronUp, Loader2, Check, Eye, EyeOff,
  ToggleLeft, ToggleRight, Sparkles, MessageSquare, AlertCircle,
  ClipboardList, RefreshCw, ChevronRight, User, Phone,
} from "lucide-react";
import { supabase } from "@/lib/supabase";
import { getAllClinics, type ClinicWithStats } from "@/lib/db/admin";
import type { OpenRouterModel } from "@/app/api/admin/openrouter-models/route";

async function fetchOpenRouterModels(apiKey: string): Promise<OpenRouterModel[]> {
  const res = await fetch(`/api/admin/openrouter-models?key=${encodeURIComponent(apiKey)}`);
  if (!res.ok) return [];
  const json = await res.json() as { models?: OpenRouterModel[] };
  return json.models ?? [];
}

type ClinicAiSettings = {
  ai_enabled: boolean;
  ai_openai_key: string | null;
  ai_agent_name: string | null;
  ai_model: string | null;
  ai_system_prompt: string | null;
};

type ClinicAiState = ClinicWithStats & { aiSettings?: ClinicAiSettings; conversationCount?: number }

// ── Log types ─────────────────────────────────────────────────────────────────
type ExecutionLog = {
  session_id: string;
  wa_contact_name: string | null;
  wa_phone: string | null;
  started_at: string;
  last_message_at: string;
  total_messages: number;
  user_messages: number;
  agent_responses: number;
  first_user_message: string | null;
};

type SessionMessage = {
  role: string;
  content: string;
  created_at: string;
};

// ── Logs section ──────────────────────────────────────────────────────────────
function AiLogsSection({ clinicId }: { clinicId: string }) {
  const [logs, setLogs]               = useState<ExecutionLog[]>([]);
  const [loading, setLoading]         = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [hasMore, setHasMore]         = useState(false);
  const [expanded, setExpanded]       = useState<string | null>(null);
  const [messages, setMessages]       = useState<Record<string, SessionMessage[]>>({});
  const [loadingMsg, setLoadingMsg]   = useState<string | null>(null);
  const PAGE = 20;

  const load = useCallback(async (offset = 0, replace = true) => {
    if (offset === 0) setLoading(true); else setLoadingMore(true);

    const { data } = await supabase.rpc("get_ai_execution_logs", {
      p_clinic_id: clinicId,
      p_limit: PAGE + 1,
      p_offset: offset,
    });

    const rows = (data ?? []) as ExecutionLog[];
    setHasMore(rows.length > PAGE);
    const page = rows.slice(0, PAGE);

    setLogs((prev) => replace ? page : [...prev, ...page]);
    setLoading(false);
    setLoadingMore(false);
  }, [clinicId]);

  useEffect(() => { load(); }, [load]);

  const toggleSession = async (sessionId: string) => {
    if (expanded === sessionId) { setExpanded(null); return; }
    setExpanded(sessionId);
    if (messages[sessionId]) return;
    setLoadingMsg(sessionId);
    const { data } = await supabase.rpc("get_ai_session_messages", {
      p_session_id: sessionId,
      p_clinic_id: clinicId,
    });
    setMessages((prev) => ({ ...prev, [sessionId]: (data ?? []) as SessionMessage[] }));
    setLoadingMsg(null);
  };

  const formatTime = (iso: string) =>
    new Date(iso).toLocaleString("pt-BR", { day: "2-digit", month: "2-digit", hour: "2-digit", minute: "2-digit" });

  const formatDate = (iso: string) =>
    new Date(iso).toLocaleDateString("pt-BR", { day: "2-digit", month: "2-digit", year: "numeric" });

  if (loading) {
    return (
      <div className="flex items-center justify-center py-8 gap-2 text-z-faint">
        <Loader2 size={14} className="animate-spin" />
        <span className="text-xs">Carregando logs...</span>
      </div>
    );
  }

  if (logs.length === 0) {
    return (
      <div className="text-center py-8">
        <ClipboardList size={24} className="mx-auto mb-2 text-z-faint" />
        <p className="text-xs text-z-faint">Nenhuma execução registrada ainda.</p>
        <p className="text-[10px] text-z-faint mt-1">Os logs aparecerão aqui conforme o agente responder no WhatsApp.</p>
      </div>
    );
  }

  return (
    <div className="space-y-1.5">
      {/* Header */}
      <div className="flex items-center justify-between mb-2">
        <p className="text-xs text-z-dim">{logs.length}{hasMore ? "+" : ""} sessão{logs.length !== 1 ? "ões" : ""}</p>
        <button onClick={() => load()} className="text-z-faint hover:text-z-dim transition-colors">
          <RefreshCw size={12} />
        </button>
      </div>

      {/* Log rows */}
      {logs.map((log) => {
        const isExpanded = expanded === log.session_id;
        const sessionMsgs = messages[log.session_id];
        const isLoadingMsgs = loadingMsg === log.session_id;
        const displayName = log.wa_contact_name || log.wa_phone || "Desconhecido";

        return (
          <div key={log.session_id} className="rounded-xl overflow-hidden"
            style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.08)" }}>
            {/* Row header */}
            <button
              onClick={() => toggleSession(log.session_id)}
              className="w-full flex items-center gap-3 px-3 py-2.5 hover:bg-[rgba(1,154,103,0.04)] transition-colors text-left"
            >
              {/* Avatar */}
              <div className="w-7 h-7 rounded-full flex items-center justify-center shrink-0 text-[10px] font-medium text-white"
                style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" }}>
                {displayName.slice(0, 2).toUpperCase()}
              </div>

              {/* Info */}
              <div className="flex-1 min-w-0">
                <div className="flex items-center gap-2">
                  <span className="text-xs font-medium text-z-text truncate">{displayName}</span>
                  {log.wa_phone && log.wa_contact_name && (
                    <span className="text-[10px] text-z-faint flex items-center gap-0.5 shrink-0">
                      <Phone size={9} /> {log.wa_phone}
                    </span>
                  )}
                </div>
                {log.first_user_message && (
                  <p className="text-[10px] text-z-faint truncate mt-0.5">{log.first_user_message}</p>
                )}
              </div>

              {/* Stats */}
              <div className="flex items-center gap-3 shrink-0">
                <div className="text-right hidden sm:block">
                  <p className="text-[10px] text-z-dim">{formatDate(log.started_at)}</p>
                  <p className="text-[9px] text-z-faint">{formatTime(log.last_message_at)}</p>
                </div>
                <span className="text-[10px] px-1.5 py-0.5 rounded-md flex items-center gap-1"
                  style={{ background: "rgba(1,154,103,0.1)", color: "#019A67" }}>
                  <MessageSquare size={9} /> {log.agent_responses}
                </span>
                <motion.div animate={{ rotate: isExpanded ? 90 : 0 }} transition={{ duration: 0.15 }}>
                  <ChevronRight size={13} className="text-z-faint" />
                </motion.div>
              </div>
            </button>

            {/* Expanded messages */}
            <AnimatePresence>
              {isExpanded && (
                <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }}
                  exit={{ height: 0, opacity: 0 }} transition={{ duration: 0.2 }} className="overflow-hidden">
                  <div className="px-3 pb-3 pt-1 border-t max-h-80 overflow-y-auto space-y-2"
                    style={{ borderColor: "rgba(1,154,103,0.08)" }}>
                    {isLoadingMsgs ? (
                      <div className="flex items-center justify-center py-4 gap-2 text-z-faint">
                        <Loader2 size={12} className="animate-spin" />
                        <span className="text-xs">Carregando mensagens...</span>
                      </div>
                    ) : sessionMsgs?.length === 0 ? (
                      <p className="text-xs text-z-faint text-center py-3">Sem mensagens</p>
                    ) : (
                      sessionMsgs?.map((msg, i) => (
                        <div key={i} className={`flex gap-2 ${msg.role === "assistant" ? "flex-row-reverse" : ""}`}>
                          <div className={`w-5 h-5 rounded-full flex items-center justify-center shrink-0 mt-0.5 ${msg.role === "assistant" ? "text-white" : ""}`}
                            style={{ background: msg.role === "assistant" ? "#019A67" : "rgba(107,143,120,0.2)" }}>
                            {msg.role === "assistant" ? <Bot size={10} className="text-white" /> : <User size={10} style={{ color: "#6b8f78" }} />}
                          </div>
                          <div className={`max-w-[80%] rounded-xl px-2.5 py-1.5 ${msg.role === "assistant" ? "rounded-tr-sm" : "rounded-tl-sm"}`}
                            style={{
                              background: msg.role === "assistant" ? "rgba(1,154,103,0.12)" : "var(--input)",
                              border: `1px solid ${msg.role === "assistant" ? "rgba(1,154,103,0.2)" : "rgba(1,154,103,0.06)"}`,
                            }}>
                            <p className="text-xs text-z-text whitespace-pre-wrap leading-relaxed">{msg.content}</p>
                            <p className="text-[9px] text-z-faint mt-0.5 text-right">
                              {new Date(msg.created_at).toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" })}
                            </p>
                          </div>
                        </div>
                      ))
                    )}
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
          </div>
        );
      })}

      {/* Load more */}
      {hasMore && (
        <button onClick={() => load(logs.length, false)} disabled={loadingMore}
          className="w-full py-2 text-xs text-z-dim hover:text-z-text transition-colors disabled:opacity-50 flex items-center justify-center gap-1.5">
          {loadingMore ? <Loader2 size={11} className="animate-spin" /> : null}
          {loadingMore ? "Carregando..." : "Carregar mais"}
        </button>
      )}
    </div>
  );
};

async function fetchClinicAiSettings(clinicId: string): Promise<ClinicAiSettings | null> {
  const { data } = await supabase
    .from("clinic_settings")
    .select("ai_enabled, ai_openai_key, ai_agent_name, ai_model, ai_system_prompt")
    .eq("clinic_id", clinicId)
    .maybeSingle();
  return data;
}

async function saveClinicAiSettings(
  clinicId: string,
  settings: Partial<ClinicAiSettings>
): Promise<void> {
  await supabase
    .from("clinic_settings")
    .update({ ...settings, updated_at: new Date().toISOString() })
    .eq("clinic_id", clinicId);
}

async function fetchConversationCount(clinicId: string): Promise<number> {
  const since = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
  const { count } = await supabase
    .from("ai_conversation_messages")
    .select("session_id", { count: "exact", head: true })
    .eq("clinic_id", clinicId)
    .gte("created_at", since);
  return count ?? 0;
}

// ── Per-clinic AI config card ─────────────────────────────────────────────────
function ClinicAiCard({
  clinic,
  onUpdate,
}: {
  clinic: ClinicAiState;
  onUpdate: (clinicId: string, partial: Partial<ClinicAiSettings>) => void;
}) {
  const [expanded, setExpanded]     = useState(false);
  const [cardTab, setCardTab]       = useState<"config" | "logs">("config");
  const [saving, setSaving]         = useState(false);
  const [saved, setSaved]           = useState(false);
  const [showKey, setShowKey]       = useState(false);
  const [models, setModels]         = useState<OpenRouterModel[]>([]);
  const [modelsLoading, setModelsLoading] = useState(false);
  const [modelsError, setModelsError]     = useState<string | null>(null);
  const modelsFetchedForKey = useRef<string | null>(null);

  const settings = clinic.aiSettings;
  const [formData, setFormData] = useState<ClinicAiSettings>({
    ai_enabled: settings?.ai_enabled ?? false,
    ai_openai_key: settings?.ai_openai_key ?? "",
    ai_agent_name: settings?.ai_agent_name ?? "Assistente",
    ai_model: settings?.ai_model ?? "google/gemini-2.0-flash-001",
    ai_system_prompt: settings?.ai_system_prompt ?? "",
  });

  // Sync when settings load
  useEffect(() => {
    if (settings) {
      setFormData({
        ai_enabled: settings.ai_enabled,
        ai_openai_key: settings.ai_openai_key ?? "",
        ai_agent_name: settings.ai_agent_name ?? "Assistente",
        ai_model: settings.ai_model ?? "google/gemini-2.0-flash-001",
        ai_system_prompt: settings.ai_system_prompt ?? "",
      });
    }
  }, [settings]);

  // Auto-fetch models when expanded with a key present
  useEffect(() => {
    if (!expanded) return;
    const key = formData.ai_openai_key?.trim();
    if (!key || modelsFetchedForKey.current === key) return;
    modelsFetchedForKey.current = key;
    setModelsLoading(true);
    setModelsError(null);
    fetchOpenRouterModels(key).then((list) => {
      if (list.length === 0) setModelsError("Não foi possível carregar modelos. Verifique a chave.");
      setModels(list);
      setModelsLoading(false);
    });
  }, [expanded, formData.ai_openai_key]);

  const toggle = async () => {
    const newEnabled = !formData.ai_enabled;
    setFormData((p) => ({ ...p, ai_enabled: newEnabled }));
    onUpdate(clinic.id, { ai_enabled: newEnabled });
    await saveClinicAiSettings(clinic.id, { ai_enabled: newEnabled });
  };

  const save = async () => {
    setSaving(true);
    try {
      await saveClinicAiSettings(clinic.id, formData);
      onUpdate(clinic.id, formData);
      setSaved(true);
      setTimeout(() => setSaved(false), 2000);
    } finally {
      setSaving(false);
    }
  };

  const isConfigured = !!(formData.ai_openai_key && formData.ai_system_prompt);
  const statusColor = formData.ai_enabled && isConfigured ? "#019A67" : formData.ai_enabled ? "#f59e0b" : "#6b7280";
  const statusLabel = formData.ai_enabled && isConfigured ? "Ativo" : formData.ai_enabled ? "Parcialmente configurado" : "Inativo";

  return (
    <motion.div
      layout
      className="rounded-2xl border overflow-hidden"
      style={{ background: "var(--surface-1)", borderColor: "var(--border)" }}
    >
      {/* Header */}
      <div className="flex items-center gap-4 px-5 py-4">
        {/* Status dot */}
        <div
          className="w-2.5 h-2.5 rounded-full shrink-0"
          style={{ background: statusColor, boxShadow: formData.ai_enabled ? `0 0 8px ${statusColor}60` : "none" }}
        />

        <div className="flex-1 min-w-0">
          <p className="text-sm font-medium text-z-text">{clinic.name}</p>
          <p className="text-xs mt-0.5" style={{ color: statusColor }}>{statusLabel}</p>
        </div>

        {/* Conversation count */}
        {(clinic.conversationCount ?? 0) > 0 && (
          <div className="flex items-center gap-1.5 px-2.5 py-1 rounded-lg"
            style={{ background: "rgba(1,154,103,0.1)" }}>
            <MessageSquare size={12} style={{ color: "#019A67" }} />
            <span className="text-xs font-medium" style={{ color: "#019A67" }}>
              {clinic.conversationCount} hoje
            </span>
          </div>
        )}

        {/* Toggle */}
        <button onClick={toggle} className="transition-colors">
          {formData.ai_enabled
            ? <ToggleRight size={24} style={{ color: "#019A67" }} />
            : <ToggleLeft size={24} className="text-z-faint" />}
        </button>

        {/* Expand */}
        <button
          onClick={() => setExpanded((p) => !p)}
          className="text-z-dim hover:text-z-text transition-colors"
        >
          {expanded ? <ChevronUp size={16} /> : <ChevronDown size={16} />}
        </button>
      </div>

      {/* Config form */}
      <AnimatePresence>
        {expanded && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: "auto", opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.2 }}
            className="overflow-hidden"
          >
            {/* Tab switcher */}
            <div className="flex border-t" style={{ borderColor: "var(--border)" }}>
              {(["config", "logs"] as const).map((t) => (
                <button key={t} onClick={() => setCardTab(t)}
                  className="flex-1 py-2.5 text-xs font-medium transition-all flex items-center justify-center gap-1.5"
                  style={{
                    color: cardTab === t ? "#019A67" : "var(--z-dim)",
                    borderBottom: cardTab === t ? "2px solid #019A67" : "2px solid transparent",
                    background: cardTab === t ? "rgba(1,154,103,0.04)" : "transparent",
                  }}>
                  {t === "config" ? <><Bot size={12} /> Configuração</> : <><ClipboardList size={12} /> Logs de Execução</>}
                </button>
              ))}
            </div>

            {cardTab === "config" && (
            <div className="px-5 pb-5 space-y-4">
              <div className="pt-4 grid grid-cols-2 gap-4">
                {/* Agent name */}
                <div>
                  <label className="block text-xs text-z-dim mb-1.5">Nome do Agente</label>
                  <input
                    type="text"
                    value={formData.ai_agent_name ?? ""}
                    onChange={(e) => setFormData((p) => ({ ...p, ai_agent_name: e.target.value }))}
                    placeholder="Assistente"
                    className="w-full px-3 py-2 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67]"
                    style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                  />
                </div>

                {/* Model */}
                <div>
                  <div className="flex items-center justify-between mb-1.5">
                    <label className="text-xs text-z-dim">Modelo LLM (OpenRouter)</label>
                    {modelsLoading && <Loader2 size={11} className="animate-spin text-z-faint" />}
                    {modelsError && <span className="text-[10px] text-[#e05555]">Chave inválida</span>}
                    {models.length > 0 && !modelsLoading && (
                      <span className="text-[10px] text-z-faint">{models.length} modelos</span>
                    )}
                  </div>
                  <select
                    value={formData.ai_model ?? "google/gemini-2.5-flash-preview"}
                    onChange={(e) => setFormData((p) => ({ ...p, ai_model: e.target.value }))}
                    className="w-full px-3 py-2 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67]"
                    style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                    disabled={modelsLoading}
                  >
                    {models.length === 0 ? (
                      // Fallback enquanto modelos não foram carregados
                      <option value={formData.ai_model ?? "google/gemini-2.5-flash-preview"}>
                        {formData.ai_model ?? "google/gemini-2.5-flash-preview"}
                      </option>
                    ) : (
                      // Agrupado por provider
                      Object.entries(
                        models.reduce<Record<string, OpenRouterModel[]>>((acc, m) => {
                          const provider = m.id.split("/")[0] ?? "outro";
                          (acc[provider] ??= []).push(m);
                          return acc;
                        }, {})
                      ).map(([provider, list]) => (
                        <optgroup key={provider} label={provider}>
                          {list.map((m) => (
                            <option key={m.id} value={m.id}>
                              {m.name ?? m.id}
                            </option>
                          ))}
                        </optgroup>
                      ))
                    )}
                  </select>
                  {!formData.ai_openai_key?.trim() && (
                    <p className="text-[10px] text-z-faint mt-1">Informe a chave para carregar todos os modelos disponíveis.</p>
                  )}
                </div>
              </div>

              {/* OpenRouter Key */}
              <div>
                <label className="block text-xs text-z-dim mb-1.5">Chave OpenRouter API</label>
                <div className="relative">
                  <input
                    type={showKey ? "text" : "password"}
                    value={formData.ai_openai_key ?? ""}
                    onChange={(e) => setFormData((p) => ({ ...p, ai_openai_key: e.target.value }))}
                    placeholder="sk-or-..."
                    className="w-full px-3 py-2 pr-10 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67] font-mono"
                    style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                  />
                  <button
                    type="button"
                    onClick={() => setShowKey((p) => !p)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-z-faint hover:text-z-dim"
                  >
                    {showKey ? <EyeOff size={14} /> : <Eye size={14} />}
                  </button>
                </div>
                <p className="text-[10px] text-z-faint mt-1">
                  Obtenha em openrouter.ai — suporta Claude, GPT, Gemini e outros modelos
                </p>
              </div>

              {/* System Prompt */}
              <div>
                <label className="block text-xs text-z-dim mb-1.5">System Prompt (Instruções do Agente)</label>
                <textarea
                  value={formData.ai_system_prompt ?? ""}
                  onChange={(e) => setFormData((p) => ({ ...p, ai_system_prompt: e.target.value }))}
                  placeholder={`Você é [Nome], assistente virtual da [Clínica]. Seu objetivo é agendar consultas e responder dúvidas dos pacientes de forma acolhedora e profissional.\n\nSeu tom é profissional mas próximo...`}
                  rows={8}
                  className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67] resize-none font-mono"
                  style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                />
                <p className="text-[10px] text-z-faint mt-1">
                  O agente já tem acesso automático ao contexto da clínica (médicos, horários, CRM). Use este prompt para definir personalidade, nome e instruções específicas.
                </p>
              </div>

              {/* Save button */}
              <div className="flex justify-end">
                <button
                  onClick={save}
                  disabled={saving}
                  className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium text-white transition-all disabled:opacity-60"
                  style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
                >
                  {saving ? (
                    <Loader2 size={14} className="animate-spin" />
                  ) : saved ? (
                    <Check size={14} />
                  ) : (
                    <Save size={14} />
                  )}
                  {saved ? "Salvo!" : "Salvar configurações"}
                </button>
              </div>
            </div>
            )}

            {cardTab === "logs" && (
              <div className="px-5 py-4">
                <AiLogsSection clinicId={clinic.id} />
              </div>
            )}
          </motion.div>
        )}
      </AnimatePresence>
    </motion.div>
  );
}

// ── Main page ─────────────────────────────────────────────────────────────────
export default function AdminAgentePage() {
  const [clinics, setClinics] = useState<ClinicAiState[]>([]);
  const [loading, setLoading] = useState(true);

  const load = useCallback(async () => {
    setLoading(true);
    const allClinics = await getAllClinics();

    const withSettings = await Promise.all(
      allClinics.map(async (c) => {
        const [aiSettings, conversationCount] = await Promise.all([
          fetchClinicAiSettings(c.id),
          fetchConversationCount(c.id),
        ]);
        return { ...c, aiSettings: aiSettings ?? undefined, conversationCount };
      })
    );

    setClinics(withSettings);
    setLoading(false);
  }, []);

  useEffect(() => { load(); }, [load]);

  const handleUpdate = (clinicId: string, partial: Partial<ClinicAiSettings>) => {
    setClinics((prev) =>
      prev.map((c) =>
        c.id === clinicId
          ? { ...c, aiSettings: { ...(c.aiSettings as ClinicAiSettings), ...partial } }
          : c
      )
    );
  };

  const activeCount  = clinics.filter((c) => c.aiSettings?.ai_enabled && c.aiSettings.ai_openai_key).length;
  const partialCount = clinics.filter((c) => c.aiSettings?.ai_enabled && !c.aiSettings.ai_openai_key).length;
  const totalConvs   = clinics.reduce((sum, c) => sum + (c.conversationCount ?? 0), 0);

  return (
    <div className="p-8 max-w-5xl mx-auto">
      {/* Header */}
      <motion.div initial={{ opacity: 0, y: -10 }} animate={{ opacity: 1, y: 0 }} className="mb-8">
        <div className="flex items-center gap-3 mb-1">
          <div
            className="w-9 h-9 rounded-xl flex items-center justify-center"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.3)" }}
          >
            <Bot size={18} className="text-white" />
          </div>
          <h1 className="text-xl font-semibold text-z-text">Agente de IA</h1>
        </div>
        <p className="text-sm text-z-dim ml-12">Configure o agente de IA por clínica — ele responde no WhatsApp 24/7</p>
      </motion.div>

      {/* Stats */}
      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.05 }}
        className="grid grid-cols-3 gap-4 mb-8"
      >
        {[
          { label: "Agentes ativos",      value: activeCount,  color: "#019A67" },
          { label: "Config. incompleta",  value: partialCount, color: "#f59e0b" },
          { label: "Conversas (24h)",     value: totalConvs,   color: "#6366f1" },
        ].map((s) => (
          <div
            key={s.label}
            className="rounded-2xl border px-5 py-4"
            style={{ background: "var(--surface-1)", borderColor: "var(--border)" }}
          >
            <p className="text-2xl font-bold" style={{ color: s.color }}>{s.value}</p>
            <p className="text-xs text-z-dim mt-1">{s.label}</p>
          </div>
        ))}
      </motion.div>

      {/* Info banner */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.1 }}
        className="flex items-start gap-3 p-4 rounded-2xl mb-6"
        style={{ background: "rgba(1,154,103,0.06)", border: "1px solid rgba(1,154,103,0.2)" }}
      >
        <Sparkles size={16} style={{ color: "#019A67", flexShrink: 0, marginTop: 2 }} />
        <div className="text-sm text-z-dim space-y-1">
          <p>O agente responde automaticamente no WhatsApp quando habilitado, com debounce de 8 segundos para agrupar mensagens.</p>
          <p>Ferramentas disponíveis: buscar horários, criar agendamento, consultar CRM, listar médicos e tipos de consulta.</p>
          <p>Para pausar o agente em uma conversa específica, use a opção &quot;Pausar IA&quot; no chat.</p>
        </div>
      </motion.div>

      {/* Clinic cards */}
      {loading ? (
        <div className="flex items-center justify-center h-40">
          <Loader2 size={24} className="animate-spin text-z-faint" />
        </div>
      ) : clinics.length === 0 ? (
        <div className="text-center py-16 text-z-faint">
          <AlertCircle size={32} className="mx-auto mb-3" />
          <p>Nenhuma clínica encontrada</p>
        </div>
      ) : (
        <div className="space-y-3">
          {clinics.map((clinic, i) => (
            <motion.div
              key={clinic.id}
              initial={{ opacity: 0, y: 10 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.05 * i }}
            >
              <ClinicAiCard clinic={clinic} onUpdate={handleUpdate} />
            </motion.div>
          ))}
        </div>
      )}
    </div>
  );
}
