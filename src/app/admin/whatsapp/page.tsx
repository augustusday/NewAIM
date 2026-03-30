"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Wifi, WifiOff, QrCode, Loader2, RefreshCw, Trash2, Plus,
  Settings, Copy, Check, AlertCircle, Smartphone, X, Save, KeyRound, Eye, EyeOff, Link,
} from "lucide-react";
import {
  getAllClinics, getPlatformSettings, setPlatformSetting,
  saveClinicUazapiToken, clearClinicUazapi, type ClinicWithStats,
} from "@/lib/db/admin";

// ── UAZAPI helpers (proxy through our API route) ──────────────────────────────
async function uazapiRequest(
  clinicId: string,
  method: "GET" | "POST" | "DELETE",
  path: string,
  body?: unknown
) {
  const res = await fetch("/api/uazapi", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ clinicId, method, path, body }),
  });
  return res.json();
}

const statusMeta: Record<string, { color: string; label: string; dot?: boolean }> = {
  connected:    { color: "#019A67", label: "Conectado",   dot: true },
  disconnected: { color: "#6b8f78", label: "Desconectado" },
  connecting:   { color: "#f59e0b", label: "Conectando",  dot: true },
  qr_ready:     { color: "#6366f1", label: "Aguardando QR", dot: true },
  error:        { color: "#e05555", label: "Erro" },
};

// ── Clinic WhatsApp card ──────────────────────────────────────────────────────
function ClinicWaCard({
  clinic,
  serverUrl,
  onRefresh,
}: {
  clinic: ClinicWithStats;
  serverUrl: string;
  onRefresh: () => void;
}) {
  const [status, setStatus]       = useState(clinic.uazapi_status ?? "disconnected");
  const [qrCode, setQrCode]       = useState<string | null>(null);
  const [pairCode, setPairCode]   = useState<string | null>(null);
  const [profileName, setProfileName] = useState(clinic.uazapi_profile_name ?? "");
  const [loading, setLoading]     = useState(false);
  const [showConfig, setShowConfig] = useState(false);
  const [token, setToken]         = useState(clinic.uazapi_instance_token ?? "");
  const [savingToken, setSavingToken] = useState(false);
  const [copied, setCopied]       = useState(false);
  const [webhookStatus, setWebhookStatus] = useState<"idle" | "registering" | "ok" | "error">("idle");
  const pollRef                   = useRef<ReturnType<typeof setInterval> | null>(null);

  const stopPoll = () => { if (pollRef.current) { clearInterval(pollRef.current); pollRef.current = null; } };

  const fetchStatus = useCallback(async () => {
    if (!serverUrl || !clinic.uazapi_instance_token) return;
    const data = await uazapiRequest(clinic.id, "GET", "/instance/status");
    if (data?.instance) {
      const newStatus = data.instance.status ?? data.connectionStatus ?? "disconnected";
      setStatus(newStatus);
      setQrCode(data.instance.qrcode ?? null);
      setPairCode(data.instance.pairingCode ?? null);
      if (data.instance.name) setProfileName(data.instance.name);
      if (newStatus === "connected") stopPoll();
    }
  }, [serverUrl, clinic.id, clinic.uazapi_instance_token]);

  useEffect(() => {
    if (clinic.uazapi_instance_token && serverUrl) fetchStatus();
    return stopPoll;
  }, [clinic.uazapi_instance_token, serverUrl]);

  const handleConnect = async () => {
    if (!serverUrl || !clinic.uazapi_instance_token) return;
    setLoading(true);
    await uazapiRequest(clinic.id, "POST", "/instance/connect");
    await fetchStatus();
    setLoading(false);
    // Poll every 4s for QR / connection
    pollRef.current = setInterval(fetchStatus, 4000);
  };

  const handleDisconnect = async () => {
    if (!serverUrl || !clinic.uazapi_instance_token) return;
    setLoading(true);
    await uazapiRequest(clinic.id, "DELETE", "/instance/disconnect");
    setStatus("disconnected"); setQrCode(null); setPairCode(null);
    setLoading(false); stopPoll();
  };

  const handleSaveToken = async () => {
    if (!token.trim()) return;
    setSavingToken(true);
    await saveClinicUazapiToken(clinic.id, token.trim(), serverUrl);
    setSavingToken(false);

    // Auto-register webhook URL with UAZAPI
    if (serverUrl) {
      setWebhookStatus("registering");
      try {
        const webhookUrl = `${window.location.origin}/api/webhooks/uazapi?token=${token.trim()}`;
        await uazapiRequest(clinic.id, "POST", "/webhook/set", {
          url: webhookUrl,
          enabled: true,
          events: ["messages", "connection"],
        });
        setWebhookStatus("ok");
      } catch {
        setWebhookStatus("error");
      }
    }

    setShowConfig(false);
    onRefresh();
  };

  const handleClearInstance = async () => {
    setLoading(true);
    await clearClinicUazapi(clinic.id);
    setStatus("disconnected"); setQrCode(null); setPairCode(null); setProfileName("");
    setLoading(false); onRefresh();
  };

  const copyToken = () => {
    if (clinic.uazapi_instance_token) {
      navigator.clipboard.writeText(clinic.uazapi_instance_token);
      setCopied(true); setTimeout(() => setCopied(false), 1500);
    }
  };

  const sm = statusMeta[status] ?? statusMeta.disconnected;
  const hasInstance = !!clinic.uazapi_instance_token;

  return (
    <div className="rounded-2xl overflow-hidden" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.1)" }}>
      {/* Card header */}
      <div className="flex items-center justify-between px-5 py-4 border-b border-border">
        <div className="flex items-center gap-3">
          <div className="w-9 h-9 rounded-xl flex items-center justify-center text-xs font-medium text-white shrink-0"
            style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" }}>
            {clinic.name.slice(0, 2).toUpperCase()}
          </div>
          <div>
            <p className="text-sm font-medium text-z-text">{clinic.name}</p>
            <div className="flex items-center gap-1.5 mt-0.5">
              {sm.dot && <div className="w-1.5 h-1.5 rounded-full animate-pulse" style={{ background: sm.color }} />}
              <span className="text-[10px]" style={{ color: sm.color }}>{sm.label}</span>
              {profileName && <span className="text-[10px] text-z-faint">· {profileName}</span>}
            </div>
          </div>
        </div>

        <div className="flex items-center gap-1.5">
          {hasInstance && (
            <button onClick={fetchStatus} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-z-text hover:bg-[rgba(1,154,103,0.08)] transition-all">
              <RefreshCw size={13} />
            </button>
          )}
          <button onClick={() => setShowConfig((p) => !p)} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-z-text hover:bg-[rgba(1,154,103,0.08)] transition-all">
            <Settings size={13} />
          </button>
        </div>
      </div>

      {/* Config panel */}
      <AnimatePresence>
        {showConfig && (
          <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.2 }} className="overflow-hidden border-b border-border">
            <div className="px-5 py-4 space-y-3" style={{ background: "rgba(1,154,103,0.03)" }}>
              <p className="text-xs text-z-dim font-medium">Token da instância UAZAPI</p>
              <div className="flex gap-2">
                <input type="text" value={token} onChange={(e) => setToken(e.target.value)}
                  placeholder="Cole o token da instância aqui..."
                  className="flex-1 px-3 py-2 rounded-xl text-xs text-z-text placeholder:text-z-faint outline-none font-mono"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
                <motion.button whileHover={{ scale: 1.02 }} onClick={handleSaveToken} disabled={savingToken}
                  className="px-3 py-2 rounded-xl text-xs text-white font-medium flex items-center gap-1.5 disabled:opacity-60"
                  style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
                  {savingToken ? <Loader2 size={12} className="animate-spin" /> : <Save size={12} />}
                  Salvar
                </motion.button>
              </div>
              {hasInstance && (
                <>
                  <div className="flex items-center justify-between">
                    <button onClick={copyToken} className="flex items-center gap-1.5 text-[10px] text-z-dim hover:text-z-text transition-colors">
                      {copied ? <Check size={11} className="text-[#019A67]" /> : <Copy size={11} />}
                      {copied ? "Copiado!" : "Copiar token atual"}
                    </button>
                    <button onClick={handleClearInstance} className="flex items-center gap-1.5 text-[10px] text-[#e05555] hover:opacity-80 transition-opacity">
                      <Trash2 size={11} /> Remover instância
                    </button>
                  </div>
                  {/* Webhook URL display */}
                  <div className="mt-1 space-y-1.5">
                    <p className="text-[10px] text-z-faint flex items-center gap-1"><Link size={10} /> URL do webhook registrado no UAZAPI:</p>
                    <div className="px-2.5 py-1.5 rounded-lg font-mono text-[10px] text-z-dim break-all" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
                      {typeof window !== "undefined" ? `${window.location.origin}/api/webhooks/uazapi?token=${clinic.uazapi_instance_token}` : `/api/webhooks/uazapi?token=${clinic.uazapi_instance_token}`}
                    </div>
                    {webhookStatus === "registering" && (
                      <p className="text-[10px] text-z-faint flex items-center gap-1"><Loader2 size={10} className="animate-spin" /> Registrando webhook…</p>
                    )}
                    {webhookStatus === "ok" && (
                      <p className="text-[10px] text-[#019A67] flex items-center gap-1"><Check size={10} /> Webhook registrado com sucesso</p>
                    )}
                    {webhookStatus === "error" && (
                      <p className="text-[10px] text-[#e05555] flex items-center gap-1"><AlertCircle size={10} /> Falha ao registrar webhook — verifique a URL do servidor</p>
                    )}
                  </div>
                </>
              )}
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Main area */}
      <div className="p-5">
        {!hasInstance ? (
          <div className="text-center py-4 space-y-3">
            <WifiOff size={28} className="mx-auto" style={{ color: "#6b8f78" }} />
            <p className="text-sm text-z-dim">Instância não configurada</p>
            <p className="text-xs text-z-faint">Configure o token da instância UAZAPI para esta clínica.</p>
            <button onClick={() => setShowConfig(true)}
              className="flex items-center gap-2 mx-auto px-4 py-2 rounded-xl text-sm text-white font-medium"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
              <Plus size={14} /> Configurar instância
            </button>
          </div>
        ) : status === "connected" ? (
          <div className="space-y-3">
            <div className="flex items-center gap-3 p-3 rounded-xl" style={{ background: "rgba(1,154,103,0.06)", border: "1px solid rgba(1,154,103,0.15)" }}>
              <Wifi size={16} style={{ color: "#019A67" }} />
              <div>
                <p className="text-xs font-medium text-[#01c47f]">WhatsApp conectado</p>
                {profileName && <p className="text-[10px] text-z-dim">{profileName}</p>}
              </div>
            </div>
            <button onClick={handleDisconnect} disabled={loading}
              className="w-full py-2 rounded-xl text-xs text-[#e05555] flex items-center justify-center gap-2 transition-all hover:bg-[rgba(224,85,85,0.08)] disabled:opacity-50"
              style={{ border: "1px solid rgba(224,85,85,0.15)" }}>
              {loading ? <Loader2 size={12} className="animate-spin" /> : <WifiOff size={12} />}
              Desconectar
            </button>
          </div>
        ) : (
          <div className="space-y-4">
            {/* QR Code */}
            {qrCode && (
              <div className="flex flex-col items-center gap-3 p-4 rounded-xl" style={{ background: "rgba(1,154,103,0.04)", border: "1px solid rgba(1,154,103,0.1)" }}>
                <div className="flex items-center gap-2 text-xs text-z-dim">
                  <QrCode size={13} />
                  Escaneie o QR code no WhatsApp
                </div>
                <div className="bg-white p-3 rounded-xl">
                  {/* eslint-disable-next-line @next/next/no-img-element */}
                  <img src={qrCode.startsWith("data:") ? qrCode : `data:image/png;base64,${qrCode}`} alt="QR Code" className="w-44 h-44 object-contain" />
                </div>
                <p className="text-[10px] text-z-faint">Atualizando em 4s…</p>
              </div>
            )}

            {/* Pairing code */}
            {pairCode && (
              <div className="text-center p-4 rounded-xl" style={{ background: "rgba(1,154,103,0.04)", border: "1px solid rgba(1,154,103,0.1)" }}>
                <p className="text-[10px] text-z-dim mb-2">Código de emparelhamento</p>
                <p className="text-2xl font-mono font-medium text-[#01c47f] tracking-[0.15em]">
                  {pairCode.slice(0, 4)}-{pairCode.slice(4)}
                </p>
              </div>
            )}

            {/* Connect button */}
            {!qrCode && !pairCode && (
              <button onClick={handleConnect} disabled={loading || !serverUrl}
                className="w-full py-2.5 rounded-xl text-sm text-white font-medium flex items-center justify-center gap-2 disabled:opacity-60"
                style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
                {loading ? <Loader2 size={14} className="animate-spin" /> : <Wifi size={14} />}
                {loading ? "Conectando..." : "Conectar WhatsApp"}
              </button>
            )}

            {status === "connecting" && (
              <div className="flex items-center justify-center gap-2 text-xs text-z-dim">
                <Loader2 size={12} className="animate-spin" />
                Aguardando conexão…
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

// ── Main page ─────────────────────────────────────────────────────────────────
export default function WhatsAppAdminPage() {
  const [clinics, setClinics]           = useState<ClinicWithStats[]>([]);
  const [serverUrl, setServerUrl]       = useState("");
  const [editingUrl, setEditingUrl]     = useState(false);
  const [urlDraft, setUrlDraft]         = useState("");
  const [savingUrl, setSavingUrl]       = useState(false);
  const [loading, setLoading]           = useState(true);
  const [urlSaved, setUrlSaved]         = useState(false);
  const [openaiKey, setOpenaiKey]       = useState("");
  const [openaiDraft, setOpenaiDraft]   = useState("");
  const [editingKey, setEditingKey]     = useState(false);
  const [savingKey, setSavingKey]       = useState(false);
  const [keySaved, setKeySaved]         = useState(false);
  const [showKey, setShowKey]           = useState(false);

  const loadData = useCallback(async () => {
    const [clinicsData, settings] = await Promise.all([getAllClinics(), getPlatformSettings()]);
    setClinics(clinicsData);
    setServerUrl(settings.uazapi_server_url ?? "");
    setUrlDraft(settings.uazapi_server_url ?? "");
    setOpenaiKey(settings.openai_api_key ?? "");
    setOpenaiDraft(settings.openai_api_key ?? "");
    setLoading(false);
  }, []);

  useEffect(() => { loadData(); }, [loadData]);

  const handleSaveServerUrl = async () => {
    setSavingUrl(true);
    await setPlatformSetting("uazapi_server_url", urlDraft.trim());
    setServerUrl(urlDraft.trim());
    setSavingUrl(false);
    setEditingUrl(false);
    setUrlSaved(true);
    setTimeout(() => setUrlSaved(false), 2000);
  };

  const handleSaveOpenaiKey = async () => {
    setSavingKey(true);
    await setPlatformSetting("openai_api_key", openaiDraft.trim());
    setOpenaiKey(openaiDraft.trim());
    setSavingKey(false);
    setEditingKey(false);
    setKeySaved(true);
    setTimeout(() => setKeySaved(false), 2000);
  };

  const connected    = clinics.filter((c) => c.uazapi_status === "connected").length;
  const configured   = clinics.filter((c) => c.uazapi_instance_token).length;
  const disconnected = clinics.filter((c) => c.uazapi_instance_token && c.uazapi_status !== "connected").length;

  return (
    <div className="p-6 space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-2xl text-z-text" style={{ fontWeight: 500, letterSpacing: "-0.02em" }}>WhatsApp / UAZAPI</h1>
        <p className="text-sm text-z-dim mt-0.5">Gerenciamento de instâncias WhatsApp por clínica</p>
      </div>

      {/* Server URL card */}
      <div className="rounded-2xl p-5" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.15)" }}>
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-xl flex items-center justify-center" style={{ background: "rgba(1,154,103,0.1)" }}>
              <Settings size={15} style={{ color: "#019A67" }} />
            </div>
            <div>
              <p className="text-sm font-medium text-z-text">Servidor UAZAPI (global)</p>
              <p className="text-xs text-z-faint">Uma URL para toda a plataforma — cada clínica tem seu próprio token de instância</p>
            </div>
          </div>
          {!editingUrl ? (
            <button onClick={() => setEditingUrl(true)} className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs text-z-dim hover:text-z-text transition-all" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
              <Settings size={11} /> Editar URL
            </button>
          ) : (
            <button onClick={() => setEditingUrl(false)} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all">
              <X size={13} />
            </button>
          )}
        </div>

        {editingUrl ? (
          <div className="flex gap-2">
            <input type="url" value={urlDraft} onChange={(e) => setUrlDraft(e.target.value)}
              placeholder="https://api.uazapi.com"
              className="flex-1 px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none font-mono"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
            <motion.button whileHover={{ scale: 1.02 }} onClick={handleSaveServerUrl} disabled={savingUrl}
              className="px-4 py-2.5 rounded-xl text-sm text-white font-medium flex items-center gap-2 disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
              {savingUrl ? <Loader2 size={14} className="animate-spin" /> : <Save size={14} />}
              Salvar
            </motion.button>
          </div>
        ) : (
          <div className="flex items-center gap-3 px-3 py-2.5 rounded-xl font-mono text-sm" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
            {serverUrl ? (
              <><div className="w-2 h-2 rounded-full shrink-0 animate-pulse" style={{ background: "#019A67" }} /><span className="text-z-dim truncate">{serverUrl}</span></>
            ) : (
              <><div className="w-2 h-2 rounded-full shrink-0" style={{ background: "#6b8f78" }} /><span className="text-z-faint">URL não configurada</span></>
            )}
            {urlSaved && <span className="ml-auto text-[10px] text-[#019A67] flex items-center gap-1 shrink-0"><Check size={10} /> Salvo</span>}
          </div>
        )}

        {!serverUrl && !editingUrl && (
          <div className="mt-3 flex items-center gap-2 text-xs text-[#f59e0b]" style={{ background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.2)", borderRadius: "10px", padding: "8px 12px" }}>
            <AlertCircle size={12} className="shrink-0" /> Configure a URL do servidor UAZAPI para habilitar o WhatsApp em todas as clínicas.
          </div>
        )}
      </div>

      {/* OpenAI API Key card */}
      <div className="rounded-2xl p-5" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.15)" }}>
        <div className="flex items-center justify-between mb-4">
          <div className="flex items-center gap-2.5">
            <div className="w-8 h-8 rounded-xl flex items-center justify-center" style={{ background: "rgba(1,154,103,0.1)" }}>
              <KeyRound size={15} style={{ color: "#019A67" }} />
            </div>
            <div>
              <p className="text-sm font-medium text-z-text">Chave OpenAI (global)</p>
              <p className="text-xs text-z-faint">Usada para transcrição de áudio e respostas do agente de IA em todas as clínicas</p>
            </div>
          </div>
          {!editingKey ? (
            <button onClick={() => setEditingKey(true)} className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs text-z-dim hover:text-z-text transition-all" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
              <Settings size={11} /> {openaiKey ? "Alterar chave" : "Configurar"}
            </button>
          ) : (
            <button onClick={() => setEditingKey(false)} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all">
              <X size={13} />
            </button>
          )}
        </div>

        {editingKey ? (
          <div className="flex gap-2">
            <div className="flex-1 flex items-center gap-1 rounded-xl px-3" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}>
              <input
                type={showKey ? "text" : "password"}
                value={openaiDraft}
                onChange={(e) => setOpenaiDraft(e.target.value)}
                placeholder="sk-..."
                className="flex-1 py-2.5 bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none font-mono"
              />
              <button onClick={() => setShowKey((v) => !v)} className="text-z-dim hover:text-z-text transition-colors p-1">
                {showKey ? <EyeOff size={13} /> : <Eye size={13} />}
              </button>
            </div>
            <motion.button whileHover={{ scale: 1.02 }} onClick={handleSaveOpenaiKey} disabled={savingKey}
              className="px-4 py-2.5 rounded-xl text-sm text-white font-medium flex items-center gap-2 disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
              {savingKey ? <Loader2 size={14} className="animate-spin" /> : <Save size={14} />}
              Salvar
            </motion.button>
          </div>
        ) : (
          <div className="flex items-center gap-3 px-3 py-2.5 rounded-xl font-mono text-sm" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
            {openaiKey ? (
              <><div className="w-2 h-2 rounded-full shrink-0 animate-pulse" style={{ background: "#019A67" }} /><span className="text-z-dim truncate">sk-...{openaiKey.slice(-8)}</span></>
            ) : (
              <><div className="w-2 h-2 rounded-full shrink-0" style={{ background: "#6b8f78" }} /><span className="text-z-faint">Chave não configurada</span></>
            )}
            {keySaved && <span className="ml-auto text-[10px] text-[#019A67] flex items-center gap-1 shrink-0"><Check size={10} /> Salvo</span>}
          </div>
        )}

        {!openaiKey && !editingKey && (
          <div className="mt-3 flex items-center gap-2 text-xs text-[#f59e0b]" style={{ background: "rgba(245,158,11,0.08)", border: "1px solid rgba(245,158,11,0.2)", borderRadius: "10px", padding: "8px 12px" }}>
            <AlertCircle size={12} className="shrink-0" /> Configure a chave OpenAI para habilitar transcrição de áudio e o agente de IA.
          </div>
        )}
      </div>

      {/* Stats row */}
      <div className="grid grid-cols-3 gap-3">
        {[
          { label: "Conectados",     value: loading ? "—" : String(connected),    color: "#019A67" },
          { label: "Configurados",   value: loading ? "—" : String(configured),   color: "#6366f1" },
          { label: "Desconectados",  value: loading ? "—" : String(disconnected), color: "#6b8f78" },
        ].map((s) => (
          <div key={s.label} className="rounded-xl p-4" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.08)" }}>
            <p className="text-2xl text-z-text mb-0.5" style={{ fontWeight: 500 }}>{s.value}</p>
            <p className="text-xs" style={{ color: s.color }}>{s.label}</p>
          </div>
        ))}
      </div>

      {/* Clinic cards grid */}
      {loading ? (
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
          {Array.from({ length: 3 }).map((_, i) => (
            <div key={i} className="rounded-2xl h-48 animate-pulse" style={{ background: "rgba(1,154,103,0.05)", border: "1px solid rgba(1,154,103,0.08)" }} />
          ))}
        </div>
      ) : clinics.length === 0 ? (
        <div className="text-center py-12">
          <Smartphone size={36} className="mx-auto text-z-faint mb-3" />
          <p className="text-sm text-z-dim">Nenhuma clínica cadastrada</p>
          <a href="/admin/clinicas" className="mt-2 text-xs text-[#019A67] hover:text-[#01c47f] block">+ Criar primeira clínica</a>
        </div>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-4">
          {clinics.map((clinic) => (
            <ClinicWaCard key={clinic.id} clinic={clinic} serverUrl={serverUrl} onRefresh={loadData} />
          ))}
        </div>
      )}
    </div>
  );
}
