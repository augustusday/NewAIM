"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Bot, Save, ChevronDown, ChevronUp, Loader2, Check,
  ToggleLeft, ToggleRight, Sparkles, MessageSquare, AlertCircle,
  ClipboardList, RefreshCw, ChevronRight, Phone,
  Wrench, Zap, CheckCircle2, XCircle, Clock, ChevronLeft,
  Eye, EyeOff, Maximize2, Info, X,
} from "lucide-react";
import { supabase } from "@/lib/supabase";
import { getAllClinics, type ClinicWithStats } from "@/lib/db/admin";
import type { OpenRouterModel } from "@/app/api/admin/openrouter-models/route";

async function fetchOpenRouterModels(apiKey: string): Promise<OpenRouterModel[]> {
  const res = await fetch(`/api/admin/openrouter-models?key=${encodeURIComponent(apiKey)}`);
  if (!res.ok) throw new Error("Falha ao buscar modelos");
  const json = await res.json() as { models: OpenRouterModel[] };
  return json.models ?? [];
}

// ── System Prompt Modal ────────────────────────────────────────────────────────
function SystemPromptModal({
  value,
  onChange,
  onClose,
}: {
  value: string;
  onChange: (v: string) => void;
  onClose: () => void;
}) {
  const [local, setLocal] = useState(value);
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div
        initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        className="absolute inset-0 bg-black/60 backdrop-blur-sm"
        onClick={onClose}
      />
      <motion.div
        initial={{ opacity: 0, scale: 0.96, y: 16 }} animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.96, y: 16 }} transition={{ duration: 0.18 }}
        className="relative w-full max-w-3xl rounded-2xl z-10 shadow-2xl flex flex-col"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)", maxHeight: "90vh" }}
        onClick={(e) => e.stopPropagation()}
      >
        <div className="flex items-center justify-between px-5 py-4 border-b" style={{ borderColor: "var(--border)" }}>
          <h2 className="text-sm font-medium text-z-text">System Prompt</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-colors">
            <X size={14} />
          </button>
        </div>
        <div className="flex-1 overflow-hidden p-5">
          <textarea
            value={local}
            onChange={(e) => setLocal(e.target.value)}
            className="w-full h-full min-h-[50vh] px-3 py-2.5 rounded-xl text-sm text-z-text outline-none resize-none font-mono"
            style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
            autoFocus
          />
        </div>
        <div className="px-5 pb-5 flex justify-end gap-2">
          <button onClick={onClose} className="px-4 py-2 rounded-xl text-sm text-z-dim"
            style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}>
            Cancelar
          </button>
          <button
            onClick={() => { onChange(local); onClose(); }}
            className="flex items-center gap-1.5 px-4 py-2 rounded-xl text-sm font-medium text-white"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
          >
            <Check size={13} /> Aplicar
          </button>
        </div>
      </motion.div>
    </div>
  );
}

// ── Prompt info tooltip content ────────────────────────────────────────────────
const PROMPT_INFO = {
  include: [
    "Nome e personalidade do agente (tom, pronomes)",
    "Instruções específicas para tipos de consulta da clínica",
    "Como lidar com situações especiais (urgências, plano de saúde)",
    "Informações sobre serviços ou diferenciais da clínica",
  ],
  skip: [
    "Nome ou endereço da clínica (já enviado automaticamente)",
    "Lista de médicos ou horários (o agente consulta em tempo real)",
    "Instruções de agendamento, cancelamento ou remarcação (já embutidas)",
    "Dados do paciente (o agente recebe o histórico do CRM automaticamente)",
  ],
};

type ClinicAiSettings = {
  ai_enabled: boolean;
  ai_openai_key: string | null;
  ai_agent_name: string | null;
  ai_model: string | null;
  ai_system_prompt: string | null;
};

type ClinicAiState = ClinicWithStats & { aiSettings?: ClinicAiSettings; conversationCount?: number }

// ── Execution log types ────────────────────────────────────────────────────────
type Execution = {
  id: string;
  session_id: string;
  phone: string | null;
  contact_name: string | null;
  status: "running" | "success" | "error";
  input_preview: string | null;
  final_response: string | null;
  iterations: number;
  started_at: string;
  finished_at: string | null;
  duration_ms: number | null;
  error_message: string | null;
};

type ExecutionStep = {
  id: string;
  step_index: number;
  type: "llm_call" | "tool_call" | "tool_result";
  tool_name: string | null;
  tool_args: Record<string, unknown> | null;
  tool_result: string | null;
  duration_ms: number | null;
  error: string | null;
  created_at: string;
};

// ── Step node component (n8n style) ───────────────────────────────────────────
function StepNode({ step, index }: { step: ExecutionStep; index: number }) {
  const [open, setOpen] = useState(false);

  const isLlm = step.type === "llm_call";
  const isToolCall = step.type === "tool_call";
  const isToolResult = step.type === "tool_result";
  const hasError = !!step.error;

  const nodeColor = hasError
    ? "#e05555"
    : isLlm
    ? "#6366f1"
    : isToolCall
    ? "#f59e0b"
    : "#019A67";

  const nodeLabel = isLlm
    ? "LLM"
    : isToolCall
    ? `↳ ${step.tool_name}`
    : `✓ ${step.tool_name}`;

  const nodeIcon = isLlm ? (
    <Zap size={11} />
  ) : isToolCall ? (
    <Wrench size={11} />
  ) : hasError ? (
    <XCircle size={11} />
  ) : (
    <CheckCircle2 size={11} />
  );

  const preview = isLlm
    ? step.tool_result?.slice(0, 80)
    : isToolCall
    ? step.tool_args
      ? JSON.stringify(step.tool_args).slice(0, 80)
      : null
    : step.tool_result?.slice(0, 80);

  return (
    <motion.div
      initial={{ opacity: 0, x: -8 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ delay: index * 0.04 }}
      className="relative"
    >
      {/* Connector line */}
      {index > 0 && (
        <div
          className="absolute left-[15px] -top-3 w-px h-3"
          style={{ background: "var(--border)" }}
        />
      )}

      <div
        className="rounded-xl overflow-hidden"
        style={{ border: `1px solid ${nodeColor}25`, background: `${nodeColor}08` }}
      >
        {/* Node header */}
        <button
          onClick={() => setOpen((p) => !p)}
          className="w-full flex items-center gap-2.5 px-3 py-2 text-left hover:opacity-80 transition-opacity"
        >
          {/* Icon bubble */}
          <div
            className="w-[30px] h-[30px] rounded-lg flex items-center justify-center shrink-0 text-white"
            style={{ background: nodeColor }}
          >
            {nodeIcon}
          </div>

          <div className="flex-1 min-w-0">
            <p className="text-xs font-medium truncate" style={{ color: nodeColor }}>
              {nodeLabel}
            </p>
            {preview && (
              <p className="text-[10px] text-z-faint truncate mt-0.5">{preview}…</p>
            )}
          </div>

          <div className="flex items-center gap-2 shrink-0">
            {step.duration_ms != null && (
              <span className="text-[10px] text-z-faint flex items-center gap-0.5">
                <Clock size={9} /> {step.duration_ms}ms
              </span>
            )}
            {hasError && <XCircle size={13} style={{ color: "#e05555" }} />}
            <motion.div animate={{ rotate: open ? 90 : 0 }} transition={{ duration: 0.15 }}>
              <ChevronRight size={12} className="text-z-faint" />
            </motion.div>
          </div>
        </button>

        {/* Expanded content */}
        <AnimatePresence>
          {open && (
            <motion.div
              initial={{ height: 0, opacity: 0 }}
              animate={{ height: "auto", opacity: 1 }}
              exit={{ height: 0, opacity: 0 }}
              transition={{ duration: 0.15 }}
              className="overflow-hidden"
            >
              <div
                className="px-3 pb-3 space-y-2 border-t"
                style={{ borderColor: `${nodeColor}20` }}
              >
                {/* Tool args */}
                {isToolCall && step.tool_args && (
                  <div className="mt-2">
                    <p className="text-[10px] font-medium text-z-dim mb-1">Argumentos</p>
                    <pre
                      className="text-[10px] text-z-text rounded-lg p-2 overflow-x-auto leading-relaxed"
                      style={{ background: "var(--surface-1)", border: "1px solid var(--border)" }}
                    >
                      {JSON.stringify(step.tool_args, null, 2)}
                    </pre>
                  </div>
                )}

                {/* Result / response */}
                {(isLlm || isToolResult) && step.tool_result && (
                  <div className="mt-2">
                    <p className="text-[10px] font-medium text-z-dim mb-1">
                      {isLlm ? "Resposta do modelo" : "Resultado"}
                    </p>
                    <pre
                      className="text-[10px] text-z-text rounded-lg p-2 overflow-x-auto leading-relaxed whitespace-pre-wrap"
                      style={{ background: "var(--surface-1)", border: "1px solid var(--border)" }}
                    >
                      {step.tool_result}
                    </pre>
                  </div>
                )}

                {/* Error */}
                {step.error && (
                  <div className="mt-2">
                    <p className="text-[10px] font-medium mb-1" style={{ color: "#e05555" }}>Erro</p>
                    <pre
                      className="text-[10px] rounded-lg p-2 overflow-x-auto"
                      style={{ background: "rgba(224,85,85,0.06)", border: "1px solid rgba(224,85,85,0.2)", color: "#e05555" }}
                    >
                      {step.error}
                    </pre>
                  </div>
                )}
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </motion.div>
  );
}

// ── Execution detail view ──────────────────────────────────────────────────────
function ExecutionDetail({
  execution,
  clinicId,
  onBack,
}: {
  execution: Execution;
  clinicId: string;
  onBack: () => void;
}) {
  const [steps, setSteps] = useState<ExecutionStep[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    supabase
      .from("ai_execution_steps")
      .select("*")
      .eq("execution_id", execution.id)
      .order("step_index")
      .then(({ data }) => {
        setSteps((data ?? []) as ExecutionStep[]);
        setLoading(false);
      });
  }, [execution.id, clinicId]);

  const statusColor =
    execution.status === "success" ? "#019A67" :
    execution.status === "error"   ? "#e05555" : "#f59e0b";

  const statusLabel =
    execution.status === "success" ? "Concluído" :
    execution.status === "error"   ? "Erro"      : "Em execução";

  const displayName = execution.contact_name || execution.phone || "Desconhecido";

  return (
    <div>
      {/* Back + header */}
      <div className="flex items-center gap-3 mb-4">
        <button
          onClick={onBack}
          className="flex items-center gap-1.5 text-xs text-z-dim hover:text-z-text transition-colors"
        >
          <ChevronLeft size={14} /> Voltar
        </button>
        <div className="flex-1 min-w-0">
          <div className="flex items-center gap-2">
            <p className="text-sm font-medium text-z-text truncate">{displayName}</p>
            <span
              className="text-[10px] px-2 py-0.5 rounded-full font-medium"
              style={{ background: `${statusColor}15`, color: statusColor }}
            >
              {statusLabel}
            </span>
          </div>
          <div className="flex items-center gap-3 mt-0.5">
            {execution.phone && (
              <span className="text-[10px] text-z-faint flex items-center gap-0.5">
                <Phone size={9} /> {execution.phone}
              </span>
            )}
            {execution.duration_ms != null && (
              <span className="text-[10px] text-z-faint flex items-center gap-0.5">
                <Clock size={9} /> {(execution.duration_ms / 1000).toFixed(1)}s
              </span>
            )}
            <span className="text-[10px] text-z-faint">
              {execution.iterations} iteraç{execution.iterations === 1 ? "ão" : "ões"}
            </span>
          </div>
        </div>
      </div>

      {/* Input preview */}
      {execution.input_preview && (
        <div
          className="mb-4 px-3 py-2.5 rounded-xl text-xs text-z-dim"
          style={{ background: "var(--surface-1)", border: "1px solid var(--border)" }}
        >
          <p className="text-[10px] font-medium text-z-faint mb-1">Mensagem recebida</p>
          <p className="text-z-text">{execution.input_preview}</p>
        </div>
      )}

      {/* Steps timeline */}
      {loading ? (
        <div className="flex items-center justify-center py-8 gap-2 text-z-faint">
          <Loader2 size={14} className="animate-spin" />
          <span className="text-xs">Carregando steps...</span>
        </div>
      ) : steps.length === 0 ? (
        <p className="text-xs text-z-faint text-center py-6">Nenhum step registrado.</p>
      ) : (
        <div className="space-y-1.5">
          {steps.map((step, i) => (
            <StepNode key={step.id} step={step} index={i} />
          ))}
        </div>
      )}

      {/* Final response */}
      {execution.final_response && (
        <div
          className="mt-4 px-3 py-2.5 rounded-xl"
          style={{ background: "rgba(1,154,103,0.06)", border: "1px solid rgba(1,154,103,0.2)" }}
        >
          <p className="text-[10px] font-medium mb-1" style={{ color: "#019A67" }}>Resposta final enviada</p>
          <p className="text-xs text-z-text whitespace-pre-wrap">{execution.final_response}</p>
        </div>
      )}

      {/* Error */}
      {execution.error_message && (
        <div
          className="mt-4 px-3 py-2.5 rounded-xl"
          style={{ background: "rgba(224,85,85,0.06)", border: "1px solid rgba(224,85,85,0.2)" }}
        >
          <p className="text-[10px] font-medium mb-1" style={{ color: "#e05555" }}>Erro na execução</p>
          <p className="text-xs" style={{ color: "#e05555" }}>{execution.error_message}</p>
        </div>
      )}
    </div>
  );
}

// ── Logs section ──────────────────────────────────────────────────────────────
function AiLogsSection({ clinicId }: { clinicId: string }) {
  const [executions, setExecutions] = useState<Execution[]>([]);
  const [loading, setLoading]       = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [hasMore, setHasMore]       = useState(false);
  const [selected, setSelected]     = useState<Execution | null>(null);
  const PAGE = 20;

  const load = useCallback(async (offset = 0, replace = true) => {
    if (offset === 0) setLoading(true); else setLoadingMore(true);

    const { data } = await supabase
      .from("ai_executions")
      .select("*")
      .eq("clinic_id", clinicId)
      .order("started_at", { ascending: false })
      .range(offset, offset + PAGE);

    const rows = (data ?? []) as Execution[];
    setHasMore(rows.length > PAGE);
    const page = rows.slice(0, PAGE);

    setExecutions((prev) => replace ? page : [...prev, ...page]);
    setLoading(false);
    setLoadingMore(false);
  }, [clinicId]);

  useEffect(() => { load(); }, [load]);

  const formatTime = (iso: string) =>
    new Date(iso).toLocaleString("pt-BR", { day: "2-digit", month: "2-digit", hour: "2-digit", minute: "2-digit" });

  if (selected) {
    return (
      <ExecutionDetail
        execution={selected}
        clinicId={clinicId}
        onBack={() => setSelected(null)}
      />
    );
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center py-8 gap-2 text-z-faint">
        <Loader2 size={14} className="animate-spin" />
        <span className="text-xs">Carregando execuções...</span>
      </div>
    );
  }

  if (executions.length === 0) {
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
        <p className="text-xs text-z-dim">{executions.length}{hasMore ? "+" : ""} execuç{executions.length !== 1 ? "ões" : "ão"}</p>
        <button onClick={() => load()} className="text-z-faint hover:text-z-dim transition-colors">
          <RefreshCw size={12} />
        </button>
      </div>

      {executions.map((exec, i) => {
        const statusColor =
          exec.status === "success" ? "#019A67" :
          exec.status === "error"   ? "#e05555" : "#f59e0b";
        const displayName = exec.contact_name || exec.phone || "Desconhecido";

        return (
          <motion.button
            key={exec.id}
            initial={{ opacity: 0, y: 4 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: i * 0.03 }}
            onClick={() => setSelected(exec)}
            className="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl hover:opacity-80 transition-opacity text-left"
            style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.08)" }}
          >
            {/* Status dot */}
            <div
              className="w-2 h-2 rounded-full shrink-0"
              style={{
                background: statusColor,
                boxShadow: exec.status === "running" ? `0 0 6px ${statusColor}` : "none",
              }}
            />

            {/* Info */}
            <div className="flex-1 min-w-0">
              <p className="text-xs font-medium text-z-text truncate">{displayName}</p>
              {exec.input_preview && (
                <p className="text-[10px] text-z-faint truncate mt-0.5">{exec.input_preview}</p>
              )}
            </div>

            {/* Meta */}
            <div className="flex items-center gap-2 shrink-0">
              {exec.duration_ms != null && (
                <span className="text-[10px] text-z-faint hidden sm:flex items-center gap-0.5">
                  <Clock size={9} /> {(exec.duration_ms / 1000).toFixed(1)}s
                </span>
              )}
              <span className="text-[10px] text-z-faint hidden sm:block">
                {exec.iterations} iter.
              </span>
              <span className="text-[10px] text-z-faint">{formatTime(exec.started_at)}</span>
              <ChevronRight size={12} className="text-z-faint" />
            </div>
          </motion.button>
        );
      })}

      {hasMore && (
        <button
          onClick={() => load(executions.length, false)}
          disabled={loadingMore}
          className="w-full py-2 text-xs text-z-dim hover:text-z-text transition-colors disabled:opacity-50 flex items-center justify-center gap-1.5"
        >
          {loadingMore ? <Loader2 size={11} className="animate-spin" /> : null}
          {loadingMore ? "Carregando..." : "Carregar mais"}
        </button>
      )}
    </div>
  );
}

// ── Clinic AI settings helpers ─────────────────────────────────────────────────
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
  const [expanded, setExpanded]         = useState(false);
  const [cardTab, setCardTab]           = useState<"config" | "logs">("config");
  const [saving, setSaving]             = useState(false);
  const [saved, setSaved]               = useState(false);
  const [models, setModels]             = useState<OpenRouterModel[]>([]);
  const [modelsLoading, setModelsLoading] = useState(false);
  const [modelsError, setModelsError]   = useState<string | null>(null);
  const [showKey, setShowKey]           = useState(false);
  const [promptExpanded, setPromptExpanded] = useState(false);
  const [showPromptInfo, setShowPromptInfo] = useState(false);
  const modelsFetchedForKey             = useRef<string | null>(null);

  const settings = clinic.aiSettings;
  const [formData, setFormData] = useState<ClinicAiSettings>({
    ai_enabled: settings?.ai_enabled ?? false,
    ai_openai_key: settings?.ai_openai_key ?? "",
    ai_agent_name: settings?.ai_agent_name ?? "Assistente",
    ai_model: settings?.ai_model ?? "google/gemini-2.0-flash-001",
    ai_system_prompt: settings?.ai_system_prompt ?? "",
  });

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

  // Fetch OpenRouter models when expanded and key is set
  useEffect(() => {
    if (!expanded || !formData.ai_openai_key) return;
    if (modelsFetchedForKey.current === formData.ai_openai_key) return;
    modelsFetchedForKey.current = formData.ai_openai_key;
    setModelsLoading(true);
    setModelsError(null);
    fetchOpenRouterModels(formData.ai_openai_key)
      .then((list) => setModels(list))
      .catch((err: unknown) => setModelsError(err instanceof Error ? err.message : "Erro ao buscar modelos"))
      .finally(() => setModelsLoading(false));
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
        <div
          className="w-2.5 h-2.5 rounded-full shrink-0"
          style={{ background: statusColor, boxShadow: formData.ai_enabled ? `0 0 8px ${statusColor}60` : "none" }}
        />

        <div className="flex-1 min-w-0">
          <p className="text-sm font-medium text-z-text">{clinic.name}</p>
          <p className="text-xs mt-0.5" style={{ color: statusColor }}>{statusLabel}</p>
        </div>

        {(clinic.conversationCount ?? 0) > 0 && (
          <div className="flex items-center gap-1.5 px-2.5 py-1 rounded-lg" style={{ background: "rgba(1,154,103,0.1)" }}>
            <MessageSquare size={12} style={{ color: "#019A67" }} />
            <span className="text-xs font-medium" style={{ color: "#019A67" }}>{clinic.conversationCount} hoje</span>
          </div>
        )}

        <button onClick={toggle} className="transition-colors">
          {formData.ai_enabled
            ? <ToggleRight size={24} style={{ color: "#019A67" }} />
            : <ToggleLeft size={24} className="text-z-faint" />}
        </button>

        <button onClick={() => setExpanded((p) => !p)} className="text-z-dim hover:text-z-text transition-colors">
          {expanded ? <ChevronUp size={16} /> : <ChevronDown size={16} />}
        </button>
      </div>

      <AnimatePresence>
        {expanded && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: "auto", opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.2 }}
            className="overflow-hidden"
          >
            {/* Tabs */}
            <div className="flex border-t" style={{ borderColor: "var(--border)" }}>
              {(["config", "logs"] as const).map((t) => (
                <button
                  key={t}
                  onClick={() => setCardTab(t)}
                  className="flex-1 py-2.5 text-xs font-medium transition-all flex items-center justify-center gap-1.5"
                  style={{
                    color: cardTab === t ? "#019A67" : "var(--z-dim)",
                    borderBottom: cardTab === t ? "2px solid #019A67" : "2px solid transparent",
                    background: cardTab === t ? "rgba(1,154,103,0.04)" : "transparent",
                  }}
                >
                  {t === "config"
                    ? <><Bot size={12} /> Configuração</>
                    : <><ClipboardList size={12} /> Logs de Execução</>}
                </button>
              ))}
            </div>

            {cardTab === "config" && (
              <div className="px-5 pb-5 space-y-4">
                <div className="pt-4 grid grid-cols-2 gap-4">
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

                  <div>
                    <label className="text-xs text-z-dim block mb-1.5">Modelo LLM (OpenRouter)</label>
                    <select
                      value={formData.ai_model ?? "google/gemini-2.0-flash-001"}
                      onChange={(e) => setFormData((p) => ({ ...p, ai_model: e.target.value }))}
                      disabled={modelsLoading}
                      className="w-full px-3 py-2 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67] disabled:opacity-60"
                      style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                    >
                      {models.length === 0 ? (
                        <option value={formData.ai_model ?? "google/gemini-2.0-flash-001"}>
                          {modelsLoading ? "Carregando modelos..." : (formData.ai_model ?? "google/gemini-2.0-flash-001")}
                        </option>
                      ) : (
                        (() => {
                          const grouped: Record<string, OpenRouterModel[]> = {};
                          for (const m of models) {
                            const provider = m.id.split("/")[0] ?? "outros";
                            (grouped[provider] = grouped[provider] ?? []).push(m);
                          }
                          return Object.entries(grouped).map(([provider, ms]) => (
                            <optgroup key={provider} label={provider}>
                              {ms.map((m) => (
                                <option key={m.id} value={m.id}>{m.name || m.id}</option>
                              ))}
                            </optgroup>
                          ));
                        })()
                      )}
                    </select>
                    {modelsError && <p className="text-[10px] mt-1" style={{ color: "#e05555" }}>{modelsError}</p>}
                    <p className="text-[10px] text-z-faint mt-1">
                      {models.length > 0 ? `${models.length} modelos disponíveis` : "Informe a chave abaixo para listar os modelos"}
                    </p>
                  </div>
                </div>

                <div>
                  <label className="block text-xs text-z-dim mb-1.5">Chave API OpenRouter</label>
                  <div className="relative">
                    <input
                      type={showKey ? "text" : "password"}
                      value={formData.ai_openai_key ?? ""}
                      onChange={(e) => {
                        const newKey = e.target.value;
                        setFormData((p) => ({ ...p, ai_openai_key: newKey }));
                        // Reset fetch cache so new key triggers re-fetch
                        if (newKey !== modelsFetchedForKey.current) {
                          modelsFetchedForKey.current = null;
                          setModels([]);
                        }
                      }}
                      placeholder="sk-or-..."
                      className="w-full px-3 py-2 pr-9 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67] font-mono"
                      style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                    />
                    <button
                      type="button"
                      onClick={() => setShowKey((p) => !p)}
                      className="absolute right-2.5 top-1/2 -translate-y-1/2 text-z-faint hover:text-z-dim transition-colors"
                    >
                      {showKey ? <EyeOff size={14} /> : <Eye size={14} />}
                    </button>
                  </div>
                  <p className="text-[10px] text-z-faint mt-1">
                    Obtenha em openrouter.ai — suporta Claude, GPT, Gemini e outros modelos
                  </p>
                </div>

                <div>
                  <div className="flex items-center justify-between mb-1.5">
                    <div className="flex items-center gap-1.5">
                      <label className="text-xs text-z-dim">System Prompt (Instruções do Agente)</label>
                      <div className="relative">
                        <button
                          type="button"
                          onClick={() => setShowPromptInfo((p) => !p)}
                          className="w-5 h-5 flex items-center justify-center rounded-full transition-colors"
                          style={{
                            background: showPromptInfo ? "rgba(1,154,103,0.12)" : "transparent",
                            color: showPromptInfo ? "#019A67" : "var(--z-faint)",
                          }}
                        >
                          <Info size={12} />
                        </button>
                        <AnimatePresence>
                          {showPromptInfo && (
                            <>
                              <div className="fixed inset-0 z-20" onClick={() => setShowPromptInfo(false)} />
                              <motion.div
                                initial={{ opacity: 0, y: 4 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: 4 }}
                                transition={{ duration: 0.12 }}
                                className="absolute left-0 top-full mt-1.5 z-30 w-72 rounded-xl p-3 shadow-2xl text-xs"
                                style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}
                              >
                                <p className="font-medium text-z-text mb-2">O que incluir no prompt:</p>
                                <ul className="space-y-1 mb-3">
                                  {PROMPT_INFO.include.map((t) => (
                                    <li key={t} className="flex items-start gap-1.5 text-z-dim">
                                      <CheckCircle2 size={10} className="shrink-0 mt-0.5" style={{ color: "#019A67" }} />
                                      {t}
                                    </li>
                                  ))}
                                </ul>
                                <p className="font-medium text-z-text mb-2">O que NÃO precisa incluir (já automático):</p>
                                <ul className="space-y-1">
                                  {PROMPT_INFO.skip.map((t) => (
                                    <li key={t} className="flex items-start gap-1.5 text-z-faint">
                                      <XCircle size={10} className="shrink-0 mt-0.5" style={{ color: "#e05555" }} />
                                      {t}
                                    </li>
                                  ))}
                                </ul>
                              </motion.div>
                            </>
                          )}
                        </AnimatePresence>
                      </div>
                    </div>
                    <button
                      type="button"
                      onClick={() => setPromptExpanded(true)}
                      className="flex items-center gap-1 text-[10px] text-z-faint hover:text-z-dim transition-colors"
                    >
                      <Maximize2 size={10} /> Expandir
                    </button>
                  </div>
                  <textarea
                    value={formData.ai_system_prompt ?? ""}
                    onChange={(e) => setFormData((p) => ({ ...p, ai_system_prompt: e.target.value }))}
                    placeholder={`Você é [Nome], assistente virtual da [Clínica]. Seu objetivo é agendar consultas e responder dúvidas dos pacientes de forma acolhedora e profissional.\n\nSeu tom é profissional mas próximo...`}
                    rows={8}
                    className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67] resize-none font-mono"
                    style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}
                  />
                </div>

                <div className="flex justify-end">
                  <button
                    onClick={save}
                    disabled={saving}
                    className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium text-white transition-all disabled:opacity-60"
                    style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
                  >
                    {saving ? <Loader2 size={14} className="animate-spin" /> : saved ? <Check size={14} /> : <Save size={14} />}
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

      <AnimatePresence>
        {promptExpanded && (
          <SystemPromptModal
            value={formData.ai_system_prompt ?? ""}
            onChange={(v) => setFormData((p) => ({ ...p, ai_system_prompt: v }))}
            onClose={() => setPromptExpanded(false)}
          />
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

      <motion.div
        initial={{ opacity: 0, y: 10 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.05 }}
        className="grid grid-cols-3 gap-4 mb-8"
      >
        {[
          { label: "Agentes ativos",     value: activeCount,  color: "#019A67" },
          { label: "Config. incompleta", value: partialCount, color: "#f59e0b" },
          { label: "Conversas (24h)",    value: totalConvs,   color: "#6366f1" },
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
          <p>Ferramentas disponíveis: buscar horários, criar, cancelar e remarcar agendamentos, consultar CRM, listar médicos e tipos de consulta.</p>
          <p>Para pausar o agente em uma conversa específica, use a opção &quot;Pausar IA&quot; no chat.</p>
        </div>
      </motion.div>

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
