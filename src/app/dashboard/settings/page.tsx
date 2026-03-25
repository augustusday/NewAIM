"use client";

import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Wifi,
  WifiOff,
  RefreshCw,
  Save,
  Trash2,
  CheckCircle2,
  AlertCircle,
  ExternalLink,
  QrCode,
  Phone,
  Copy,
  Check,
  Building2,
  Clock,
  Bot,
  ToggleLeft,
  ToggleRight,
  MessageSquare,
  Sparkles,
} from "lucide-react";
import { useUazapiConfig } from "@/hooks/use-uazapi-config";
import { useClinic } from "@/hooks/use-clinic";
import { uazapi, type UazapiInstance } from "@/lib/uazapi";
import { supabase } from "@/lib/supabase";

type ConnectionStatus = "idle" | "loading" | "connected" | "connecting" | "disconnected" | "error";

const TIMEZONES = [
  "America/Sao_Paulo",
  "America/Manaus",
  "America/Belem",
  "America/Fortaleza",
  "America/Recife",
  "America/Bahia",
  "America/Cuiaba",
  "America/Porto_Velho",
  "America/Boa_Vista",
  "America/Rio_Branco",
  "America/Noronha",
];

export default function SettingsPage() {
  const { clinicId, loaded: clinicLoaded } = useClinic();
  const { config, save, clear, loaded: uazapiLoaded, isConfigured } = useUazapiConfig();

  // Clinic profile state
  const [clinicName, setClinicName] = useState("");
  const [clinicTimezone, setClinicTimezone] = useState("America/Sao_Paulo");
  const [savingClinic, setSavingClinic] = useState(false);
  const [clinicSaved, setClinicSaved] = useState(false);

  // AI Agent state
  const [aiEnabled, setAiEnabled] = useState(false);
  const [aiAgentName, setAiAgentName] = useState("");
  const [aiModel, setAiModel] = useState("");
  const [aiConvCount, setAiConvCount] = useState(0);
  const [aiLoaded, setAiLoaded] = useState(false);
  const [aiToggling, setAiToggling] = useState(false);

  // UAZAPI state
  const [form, setForm] = useState({ serverUrl: "", instanceToken: "" });
  const [status, setStatus] = useState<ConnectionStatus>("idle");
  const [instance, setInstance] = useState<UazapiInstance | null>(null);
  const [error, setError] = useState("");
  const [qrCode, setQrCode] = useState("");
  const [pairCode, setPairCode] = useState("");
  const [phoneInput, setPhoneInput] = useState("");
  const [connectMode, setConnectMode] = useState<"qr" | "phone">("qr");
  const [copied, setCopied] = useState(false);
  const [pollInterval, setPollInterval] = useState<NodeJS.Timeout | null>(null);

  // Load clinic data
  useEffect(() => {
    if (!clinicLoaded) return;
    supabase
      .from("clinics")
      .select("name, timezone")
      .eq("id", clinicId)
      .single()
      .then(({ data }) => {
        if (data) {
          setClinicName(data.name);
          setClinicTimezone(data.timezone ?? "America/Sao_Paulo");
        }
      });

    // Load AI settings
    supabase
      .from("clinic_settings")
      .select("ai_enabled, ai_agent_name, ai_model")
      .eq("clinic_id", clinicId)
      .maybeSingle()
      .then(({ data }) => {
        if (data) {
          setAiEnabled(data.ai_enabled);
          setAiAgentName(data.ai_agent_name ?? "Assistente");
          setAiModel(data.ai_model ?? "");
        }
        setAiLoaded(true);
      });

    // Load conversation count (last 24h)
    const since = new Date(Date.now() - 24 * 60 * 60 * 1000).toISOString();
    supabase
      .from("ai_conversation_messages")
      .select("session_id", { count: "exact", head: true })
      .eq("clinic_id", clinicId)
      .gte("created_at", since)
      .then(({ count }) => setAiConvCount(count ?? 0));
  }, [clinicId, clinicLoaded]);

  const handleToggleAi = async () => {
    setAiToggling(true);
    const newEnabled = !aiEnabled;
    setAiEnabled(newEnabled);
    await supabase
      .from("clinic_settings")
      .update({ ai_enabled: newEnabled, updated_at: new Date().toISOString() })
      .eq("clinic_id", clinicId);
    setAiToggling(false);
  };

  // Load UAZAPI form when config is loaded
  useEffect(() => {
    if (uazapiLoaded) {
      setForm({ serverUrl: config.serverUrl, instanceToken: config.instanceToken });
    }
  }, [uazapiLoaded, config]);

  // Auto-check status when config is loaded
  useEffect(() => {
    if (isConfigured) checkStatus();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [uazapiLoaded]);

  // Cleanup polling
  useEffect(() => {
    return () => { if (pollInterval) clearInterval(pollInterval); };
  }, [pollInterval]);

  const handleSaveClinic = async () => {
    if (!clinicName.trim()) return;
    setSavingClinic(true);
    await supabase.from("clinics").update({
      name: clinicName.trim(),
      timezone: clinicTimezone,
      updated_at: new Date().toISOString(),
    }).eq("id", clinicId);
    setSavingClinic(false);
    setClinicSaved(true);
    setTimeout(() => setClinicSaved(false), 2500);
  };

  const checkStatus = async (cfg = config) => {
    if (!cfg.serverUrl || !cfg.instanceToken) return;
    setStatus("loading");
    setError("");
    try {
      const res = await uazapi.getStatus(cfg);
      setInstance(res.instance);
      if (res.status.connected) {
        setStatus("connected");
        setQrCode("");
        setPairCode("");
        stopPolling();
      } else if (res.instance?.status === "connecting") {
        setStatus("connecting");
        setQrCode(res.instance.qrcode || "");
        setPairCode(res.instance.paircode || "");
      } else {
        setStatus("disconnected");
      }
    } catch (e: unknown) {
      setStatus("error");
      setError(e instanceof Error ? e.message : "Erro ao verificar status");
    }
  };

  const handleSaveUazapi = async () => {
    const trimmed = {
      serverUrl: form.serverUrl.trim().replace(/\/$/, ""),
      instanceToken: form.instanceToken.trim(),
    };
    await save(trimmed);
    await checkStatus(trimmed);
  };

  const handleConnect = async () => {
    setStatus("connecting");
    setError("");
    setQrCode("");
    setPairCode("");
    try {
      const res = await uazapi.connect(
        config,
        connectMode === "phone" && phoneInput ? phoneInput : undefined
      );
      setInstance(res.instance);
      if (res.connected) {
        setStatus("connected");
      } else {
        setStatus("connecting");
        setQrCode(res.instance?.qrcode || "");
        setPairCode(res.instance?.paircode || "");
        startPolling();
      }
    } catch (e: unknown) {
      setStatus("error");
      setError(e instanceof Error ? e.message : "Erro ao conectar");
    }
  };

  const handleDisconnect = async () => {
    try {
      await uazapi.disconnect(config);
      setStatus("disconnected");
      setInstance(null);
      setQrCode("");
      setPairCode("");
      stopPolling();
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : "Erro ao desconectar");
    }
  };

  const startPolling = () => {
    if (pollInterval) clearInterval(pollInterval);
    const id = setInterval(async () => { await checkStatus(); }, 4000);
    setPollInterval(id);
  };

  const stopPolling = () => {
    if (pollInterval) { clearInterval(pollInterval); setPollInterval(null); }
  };

  const copyToken = () => {
    navigator.clipboard.writeText(instance?.token || "");
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  const statusConfig: Record<ConnectionStatus, { label: string; color: string; bg: string; icon: React.ReactNode }> = {
    idle:         { label: "Não verificado",          color: "var(--z-text-dim)", bg: "var(--muted)", icon: <Wifi size={14} /> },
    loading:      { label: "Verificando...",           color: "#f59e0b", bg: "rgba(245,158,11,0.1)", icon: <RefreshCw size={14} className="animate-spin" /> },
    connected:    { label: "Conectado",                color: "#019A67", bg: "rgba(1,154,103,0.1)", icon: <CheckCircle2 size={14} /> },
    connecting:   { label: "Aguardando escaneamento", color: "#f59e0b", bg: "rgba(245,158,11,0.1)", icon: <RefreshCw size={14} className="animate-spin" /> },
    disconnected: { label: "Desconectado",             color: "var(--z-text-dim)", bg: "var(--muted)", icon: <WifiOff size={14} /> },
    error:        { label: "Erro de conexão",          color: "var(--destructive)", bg: "rgba(220,38,38,0.08)", icon: <AlertCircle size={14} /> },
  };

  const sc = statusConfig[status];

  return (
    <div className="p-6 max-w-2xl space-y-6">
      {/* Header */}
      <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}>
        <h1 className="text-xl" style={{ color: "var(--z-text)", fontWeight: 500 }}>Configurações</h1>
        <p className="text-sm mt-0.5" style={{ color: "var(--z-text-dim)" }}>
          Gerencie as configurações da sua clínica
        </p>
      </motion.div>

      {/* Clinic profile card */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.05 }}
        className="rounded-2xl p-6 space-y-5"
        style={{ background: "var(--surface-1)", border: "1px solid var(--border)", boxShadow: "var(--z-shadow)" }}
      >
        <div className="flex items-center gap-3 mb-1">
          <div className="w-8 h-8 rounded-xl flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)", border: "1px solid rgba(1,154,103,0.2)" }}>
            <Building2 size={15} style={{ color: "#019A67" }} />
          </div>
          <div>
            <h2 className="text-sm font-medium" style={{ color: "var(--z-text)" }}>Perfil da Clínica</h2>
            <p className="text-xs mt-0.5" style={{ color: "var(--z-text-dim)" }}>Nome e configurações da sua clínica</p>
          </div>
        </div>

        <div className="space-y-3">
          <div>
            <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>Nome da clínica</label>
            <input
              type="text"
              placeholder="Nome da clínica"
              value={clinicName}
              onChange={(e) => setClinicName(e.target.value)}
              className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
              style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
              onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(1,154,103,0.5)")}
              onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
            />
          </div>

          <div>
            <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>
              <span className="flex items-center gap-1.5"><Clock size={11} /> Fuso horário</span>
            </label>
            <select
              value={clinicTimezone}
              onChange={(e) => setClinicTimezone(e.target.value)}
              className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
              style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
            >
              {TIMEZONES.map((tz) => (
                <option key={tz} value={tz}>{tz.replace("America/", "").replace(/_/g, " ")}</option>
              ))}
            </select>
          </div>
        </div>

        <div className="flex items-center gap-2 pt-1">
          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.97 }}
            onClick={handleSaveClinic}
            disabled={savingClinic}
            className="flex items-center gap-2 px-4 py-2.5 rounded-xl text-sm font-medium text-white disabled:opacity-60"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.25)" }}
          >
            {savingClinic ? <RefreshCw size={14} className="animate-spin" /> : clinicSaved ? <Check size={14} /> : <Save size={14} />}
            {clinicSaved ? "Salvo!" : "Salvar"}
          </motion.button>
        </div>
      </motion.div>

      {/* UAZAPI Connection card */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.1 }}
        className="rounded-2xl p-6 space-y-5"
        style={{ background: "var(--surface-1)", border: "1px solid var(--border)", boxShadow: "var(--z-shadow)" }}
      >
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-sm font-medium" style={{ color: "var(--z-text)" }}>Conexão WhatsApp</h2>
            <p className="text-xs mt-0.5" style={{ color: "var(--z-text-dim)" }}>
              Informe o token da sua instância UAZAPI
            </p>
          </div>
          <div className="flex items-center gap-2 px-3 py-1.5 rounded-xl text-xs font-medium" style={{ background: sc.bg, color: sc.color }}>
            {sc.icon}
            {sc.label}
          </div>
        </div>

        {/* Form fields */}
        <div className="space-y-3">
          <div>
            <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>URL do servidor</label>
            <input
              type="url"
              placeholder="https://api.seuservidor.com"
              value={form.serverUrl}
              onChange={(e) => setForm((f) => ({ ...f, serverUrl: e.target.value }))}
              className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
              style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
              onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(1,154,103,0.5)")}
              onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
            />
          </div>

          <div>
            <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>Token da instância</label>
            <input
              type="password"
              placeholder="Seu token da instância UAZAPI"
              value={form.instanceToken}
              onChange={(e) => setForm((f) => ({ ...f, instanceToken: e.target.value }))}
              className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all font-mono"
              style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
              onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(1,154,103,0.5)")}
              onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
            />
            <p className="text-[10px] mt-1" style={{ color: "var(--z-text-faint)" }}>
              Encontre o token na sua instância no painel UAZAPI.{" "}
              <a href="https://uazapi.com" target="_blank" rel="noopener noreferrer" className="inline-flex items-center gap-0.5" style={{ color: "#019A67" }}>
                Saiba mais <ExternalLink size={10} />
              </a>
            </p>
          </div>
        </div>

        {/* Error */}
        <AnimatePresence>
          {error && (
            <motion.div
              initial={{ opacity: 0, y: -4 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0 }}
              className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-sm"
              style={{ background: "rgba(220,38,38,0.06)", color: "var(--destructive)", border: "1px solid rgba(220,38,38,0.15)" }}
            >
              <AlertCircle size={14} className="shrink-0" />
              {error}
            </motion.div>
          )}
        </AnimatePresence>

        {/* Actions */}
        <div className="flex items-center gap-2 pt-1">
          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.97 }}
            onClick={handleSaveUazapi}
            className="flex items-center gap-2 px-4 py-2.5 rounded-xl text-sm font-medium text-white"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.25)" }}
          >
            <Save size={14} />
            Salvar e verificar
          </motion.button>

          <button
            onClick={() => checkStatus()}
            disabled={!isConfigured}
            className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-sm transition-all disabled:opacity-40"
            style={{ background: "var(--secondary)", color: "var(--z-text-dim)", border: "1px solid var(--border)" }}
          >
            <RefreshCw size={14} />
            Verificar status
          </button>

          {isConfigured && (
            <button
              onClick={() => { clear(); setStatus("idle"); setInstance(null); }}
              className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-sm transition-all ml-auto"
              style={{ color: "var(--destructive)" }}
            >
              <Trash2 size={14} />
              Limpar
            </button>
          )}
        </div>
      </motion.div>

      {/* Connected info */}
      {status === "connected" && instance && (
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          className="rounded-2xl p-5"
          style={{ background: "rgba(1,154,103,0.05)", border: "1px solid rgba(1,154,103,0.2)" }}
        >
          <div className="flex items-start gap-4">
            {instance.profilePicUrl ? (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={instance.profilePicUrl} alt="Profile" className="w-12 h-12 rounded-full shrink-0 object-cover" />
            ) : (
              <div className="w-12 h-12 rounded-full flex items-center justify-center text-white font-semibold shrink-0" style={{ background: "linear-gradient(135deg, #019A67, #01c47f)" }}>
                WA
              </div>
            )}

            <div className="flex-1 min-w-0">
              <p className="font-medium" style={{ color: "var(--z-text)" }}>{instance.profileName || instance.name}</p>
              <p className="text-xs mt-0.5" style={{ color: "var(--z-text-dim)" }}>
                {instance.isBusiness ? "WhatsApp Business" : "WhatsApp"} · {instance.owner}
              </p>
              <div className="flex items-center gap-2 mt-2">
                <code className="text-[11px] px-2 py-1 rounded-lg font-mono truncate max-w-[200px]" style={{ background: "var(--muted)", color: "var(--z-text-dim)" }}>
                  {instance.token?.slice(0, 20)}…
                </code>
                <button onClick={copyToken} className="w-6 h-6 rounded-md flex items-center justify-center transition-all" style={{ color: copied ? "#019A67" : "var(--z-text-dim)" }}>
                  {copied ? <Check size={13} /> : <Copy size={13} />}
                </button>
              </div>
            </div>

            <button
              onClick={handleDisconnect}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs transition-all shrink-0"
              style={{ background: "rgba(220,38,38,0.06)", color: "var(--destructive)", border: "1px solid rgba(220,38,38,0.15)" }}
            >
              <WifiOff size={13} />
              Desconectar
            </button>
          </div>
        </motion.div>
      )}

      {/* AI Agent card */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.15 }}
        className="rounded-2xl p-6 space-y-4"
        style={{ background: "var(--surface-1)", border: "1px solid var(--border)", boxShadow: "var(--z-shadow)" }}
      >
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-xl flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)", border: "1px solid rgba(1,154,103,0.2)" }}>
              <Bot size={15} style={{ color: "#019A67" }} />
            </div>
            <div>
              <h2 className="text-sm font-medium" style={{ color: "var(--z-text)" }}>Agente de IA</h2>
              <p className="text-xs mt-0.5" style={{ color: "var(--z-text-dim)" }}>
                Responde automaticamente no WhatsApp 24/7
              </p>
            </div>
          </div>

          {aiLoaded && (
            <button
              onClick={handleToggleAi}
              disabled={aiToggling}
              className="transition-colors disabled:opacity-60"
            >
              {aiEnabled
                ? <ToggleRight size={28} style={{ color: "#019A67" }} />
                : <ToggleLeft size={28} className="text-z-faint" />}
            </button>
          )}
        </div>

        {/* Status row */}
        <div
          className="flex items-center gap-2 px-3 py-2 rounded-xl"
          style={{
            background: aiEnabled ? "rgba(1,154,103,0.06)" : "var(--muted)",
            border: `1px solid ${aiEnabled ? "rgba(1,154,103,0.2)" : "var(--border)"}`,
          }}
        >
          <div
            className="w-2 h-2 rounded-full shrink-0"
            style={{ background: aiEnabled ? "#019A67" : "#6b7280", boxShadow: aiEnabled ? "0 0 6px rgba(1,154,103,0.5)" : "none" }}
          />
          <span className="text-xs" style={{ color: aiEnabled ? "#019A67" : "var(--z-text-dim)" }}>
            {aiEnabled ? "Agente ativo" : "Agente inativo"}
          </span>
          {aiAgentName && (
            <span className="text-xs text-z-faint ml-1">· {aiAgentName}</span>
          )}
          {aiConvCount > 0 && (
            <div className="flex items-center gap-1 ml-auto">
              <MessageSquare size={11} style={{ color: "#019A67" }} />
              <span className="text-xs font-medium" style={{ color: "#019A67" }}>{aiConvCount} conversas hoje</span>
            </div>
          )}
        </div>

        {/* Info */}
        <div className="flex items-start gap-2 text-xs text-z-faint">
          <Sparkles size={12} style={{ marginTop: 2, flexShrink: 0 }} />
          <span>
            {aiModel
              ? `Modelo: ${aiModel.split("/").pop()}`
              : "Nenhum modelo configurado"}
            {" · "}
            A configuração completa (chave API, modelo, system prompt) está disponível no painel administrativo.
          </span>
        </div>
      </motion.div>

      {/* Connect panel */}
      {(status === "disconnected" || status === "connecting") && isConfigured && (
        <motion.div
          initial={{ opacity: 0, y: 16 }}
          animate={{ opacity: 1, y: 0 }}
          className="rounded-2xl p-5 space-y-4"
          style={{ background: "var(--surface-1)", border: "1px solid var(--border)", boxShadow: "var(--z-shadow)" }}
        >
          <h3 className="text-sm font-medium" style={{ color: "var(--z-text)" }}>Conectar ao WhatsApp</h3>

          {/* Mode selector */}
          <div className="flex items-center p-1 rounded-xl w-fit" style={{ background: "var(--muted)", border: "1px solid var(--border)" }}>
            {(["qr", "phone"] as const).map((m) => (
              <button
                key={m}
                onClick={() => setConnectMode(m)}
                className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs transition-all"
                style={connectMode === m
                  ? { background: "var(--surface-1)", color: "#019A67", boxShadow: "var(--z-shadow)" }
                  : { color: "var(--z-text-dim)" }
                }
              >
                {m === "qr" ? <QrCode size={13} /> : <Phone size={13} />}
                {m === "qr" ? "QR Code" : "Código telefone"}
              </button>
            ))}
          </div>

          {connectMode === "phone" && (
            <div>
              <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>Número do WhatsApp (com DDI)</label>
              <input
                type="tel"
                placeholder="5511999999999"
                value={phoneInput}
                onChange={(e) => setPhoneInput(e.target.value)}
                className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
                style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
              />
            </div>
          )}

          {status === "connecting" && qrCode && connectMode === "qr" && (
            <motion.div initial={{ opacity: 0, scale: 0.95 }} animate={{ opacity: 1, scale: 1 }} className="flex flex-col items-center gap-3 py-4">
              {/* eslint-disable-next-line @next/next/no-img-element */}
              <img src={qrCode} alt="QR Code" className="w-52 h-52 rounded-xl" style={{ border: "3px solid rgba(1,154,103,0.2)" }} />
              <p className="text-xs text-center" style={{ color: "var(--z-text-dim)" }}>Abra o WhatsApp no seu celular e escaneie o QR code</p>
            </motion.div>
          )}

          {status === "connecting" && pairCode && connectMode === "phone" && (
            <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} className="flex flex-col items-center gap-2 py-4">
              <p className="text-xs" style={{ color: "var(--z-text-dim)" }}>Código de pareamento</p>
              <div className="text-3xl font-mono tracking-widest px-6 py-3 rounded-2xl" style={{ background: "rgba(1,154,103,0.08)", border: "1px solid rgba(1,154,103,0.2)", color: "#019A67" }}>
                {pairCode}
              </div>
              <p className="text-xs text-center" style={{ color: "var(--z-text-dim)" }}>
                No WhatsApp: Dispositivos vinculados → Vincular com número de telefone
              </p>
            </motion.div>
          )}

          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.97 }}
            onClick={handleConnect}
            disabled={status === "connecting"}
            className="flex items-center gap-2 px-4 py-2.5 rounded-xl text-sm font-medium text-white disabled:opacity-60"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.25)" }}
          >
            {status === "connecting" ? <RefreshCw size={14} className="animate-spin" /> : <Wifi size={14} />}
            {status === "connecting" ? "Aguardando conexão..." : "Conectar"}
          </motion.button>
        </motion.div>
      )}
    </div>
  );
}
