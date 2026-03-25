"use client";

import { useState, useEffect, Suspense } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Eye, EyeOff, AlertCircle, Stethoscope, ArrowRight, Loader2, Settings, X, Check } from "lucide-react";
import { supabase } from "@/lib/supabase";
import { useRouter, useSearchParams } from "next/navigation";

export default function LoginPage() {
  return (
    <Suspense>
      <LoginForm />
    </Suspense>
  );
}

function LoginForm() {
  const router       = useRouter();
  const searchParams = useSearchParams();
  const redirect     = searchParams.get("redirect") ?? "/dashboard";

  const [mode, setMode]           = useState<"login" | "signup">("login");
  const [email, setEmail]         = useState("");
  const [password, setPassword]   = useState("");
  const [fullName, setFullName]   = useState("");
  const [showPass, setShowPass]   = useState(false);
  const [loading, setLoading]     = useState(false);
  const [error, setError]         = useState("");
  const [success, setSuccess]     = useState("");

  // Server config dialog
  const [showServerConfig, setShowServerConfig] = useState(false);
  const [serverUrl, setServerUrl]               = useState("");
  const [serverSaving, setServerSaving]         = useState(false);
  const [serverSaved, setServerSaved]           = useState(false);

  useEffect(() => {
    if (showServerConfig && !serverUrl) {
      fetch("/api/platform-config")
        .then((r) => r.json())
        .then((d: { uazapi_server_url?: string }) => setServerUrl(d.uazapi_server_url ?? ""));
    }
  }, [showServerConfig]);

  const handleSaveServer = async () => {
    setServerSaving(true);
    await fetch("/api/platform-config", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ uazapi_server_url: serverUrl }),
    });
    setServerSaving(false);
    setServerSaved(true);
    setTimeout(() => setServerSaved(false), 2000);
  };

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (user) router.replace(redirect);
    });
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(""); setSuccess("");
    if (!email || !password) { setError("Preencha todos os campos."); return; }
    setLoading(true);

    try {
      if (mode === "login") {
        const { data: authData, error: err } = await supabase.auth.signInWithPassword({ email, password });
        if (err) {
          setError(err.message === "Invalid login credentials" ? "Email ou senha incorretos." : err.message);
          return;
        }

        const user = authData.user;
        if (!user) {
          setError("Erro ao obter dados do usuário. Tente novamente.");
          return;
        }

        // Fetch profile and ensure clinic link
        const { data: profile } = await supabase
          .from("profiles")
          .select("is_super_admin, active_clinic_id")
          .eq("id", user.id)
          .single();

        // If user has no clinic linked, link them to the first available clinic
        if (!profile?.active_clinic_id) {
          const { data: clinic } = await supabase
            .from("clinics")
            .select("id")
            .eq("active", true)
            .limit(1)
            .maybeSingle();

          if (clinic) {
            await supabase.from("clinic_members").upsert({
              clinic_id: clinic.id,
              user_id: user.id,
              role: profile?.is_super_admin ? "owner" : "staff",
              active: true,
            }, { onConflict: "clinic_id,user_id" });

            await supabase
              .from("profiles")
              .update({ active_clinic_id: clinic.id })
              .eq("id", user.id);
          }
        }

        const destination = profile?.is_super_admin ? "/admin" : redirect;
        // Use window.location as fallback in case router.replace silently fails
        router.replace(destination);
        setTimeout(() => { window.location.href = destination; }, 800);
      } else {
        if (!fullName.trim()) { setError("Informe seu nome completo."); return; }
        const { data, error: err } = await supabase.auth.signUp({
          email, password,
          options: { data: { full_name: fullName } },
        });
        if (err) { setError(err.message); return; }
        if (data.user && !data.session) {
          setSuccess("Conta criada! Verifique seu email para confirmar.");
          return;
        }
        if (data.user) {
          await supabase.from("profiles").upsert({
            id: data.user.id,
            full_name: fullName,
            updated_at: new Date().toISOString(),
          });
        }
        router.replace(redirect);
      }
    } catch (err) {
      setError(err instanceof Error ? err.message : "Erro inesperado. Tente novamente.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div
      className="min-h-screen flex relative"
      style={{ background: "var(--background)" }}
    >
      {/* Gear icon for server config */}
      <button
        onClick={() => setShowServerConfig(true)}
        className="fixed bottom-4 right-4 z-50 w-8 h-8 rounded-full flex items-center justify-center transition-all hover:scale-110"
        style={{ background: "var(--surface-2)", border: "1px solid var(--border)", color: "var(--z-text-faint)" }}
        title="Configurar servidor UAZAPI"
      >
        <Settings size={14} />
      </button>

      {/* Server config dialog */}
      <AnimatePresence>
        {showServerConfig && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            className="fixed inset-0 z-50 flex items-center justify-center p-4"
            style={{ background: "rgba(0,0,0,0.5)", backdropFilter: "blur(4px)" }}
            onClick={(e) => { if (e.target === e.currentTarget) setShowServerConfig(false); }}
          >
            <motion.div
              initial={{ opacity: 0, scale: 0.95, y: 10 }}
              animate={{ opacity: 1, scale: 1, y: 0 }}
              exit={{ opacity: 0, scale: 0.95, y: 10 }}
              className="w-full max-w-md rounded-2xl p-6 space-y-4"
              style={{ background: "var(--surface-1)", border: "1px solid var(--border)" }}
            >
              <div className="flex items-center justify-between">
                <h3 className="text-sm font-medium text-z-text">Configuração do Servidor</h3>
                <button
                  onClick={() => setShowServerConfig(false)}
                  className="text-z-faint hover:text-z-dim transition-colors"
                >
                  <X size={16} />
                </button>
              </div>

              <div>
                <label className="block text-xs text-z-dim mb-1.5">URL do servidor UAZAPI</label>
                <input
                  type="url"
                  value={serverUrl}
                  onChange={(e) => setServerUrl(e.target.value)}
                  placeholder="https://api.seuservidor.com"
                  className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none focus:ring-1 focus:ring-[#019A67]"
                  style={{ background: "var(--input)", border: "1px solid var(--border)" }}
                />
                <p className="text-[10px] text-z-faint mt-1.5">
                  URL base do seu servidor UAZAPI (sem barra no final). Esta configuração é global para toda a plataforma.
                </p>
              </div>

              <div className="flex justify-end gap-2 pt-1">
                <button
                  onClick={() => setShowServerConfig(false)}
                  className="px-4 py-2 rounded-xl text-sm text-z-dim hover:text-z-text transition-colors"
                  style={{ border: "1px solid var(--border)" }}
                >
                  Cancelar
                </button>
                <button
                  onClick={handleSaveServer}
                  disabled={serverSaving}
                  className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium text-white disabled:opacity-60"
                  style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
                >
                  {serverSaving ? (
                    <Loader2 size={13} className="animate-spin" />
                  ) : serverSaved ? (
                    <Check size={13} />
                  ) : null}
                  {serverSaved ? "Salvo!" : "Salvar"}
                </button>
              </div>
            </motion.div>
          </motion.div>
        )}
      </AnimatePresence>
      {/* Left decorative panel */}
      <div
        className="hidden lg:flex flex-col justify-between w-[45%] p-12 relative overflow-hidden"
        style={{
          background: "linear-gradient(135deg, #020f09 0%, #041a10 50%, #061f14 100%)",
          borderRight: "1px solid rgba(1,154,103,0.12)",
        }}
      >
        {/* Glow orb */}
        <div
          className="absolute top-1/3 left-1/2 -translate-x-1/2 -translate-y-1/2 w-96 h-96 rounded-full pointer-events-none"
          style={{
            background: "radial-gradient(circle, rgba(1,154,103,0.12) 0%, transparent 70%)",
            filter: "blur(60px)",
          }}
        />

        {/* Logo */}
        <div className="relative z-10 flex items-center gap-3">
          <div
            className="w-10 h-10 rounded-xl flex items-center justify-center"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 20px rgba(1,154,103,0.4)" }}
          >
            <Stethoscope size={20} className="text-white" />
          </div>
          <span className="text-xl text-white" style={{ fontFamily: "'Outfit', sans-serif", fontWeight: 500, letterSpacing: "-0.02em" }}>
            Zelus
          </span>
        </div>

        {/* Central copy */}
        <div className="relative z-10 space-y-6">
          <div>
            <p className="text-[10px] uppercase tracking-[0.2em] text-[#019A67] mb-4">Plataforma de gestão clínica</p>
            <h2
              className="text-white leading-tight"
              style={{ fontFamily: "'DM Serif Display', serif", fontSize: "clamp(2rem, 3vw, 2.8rem)" }}
            >
              Gestão inteligente para sua clínica
            </h2>
          </div>
          <p className="text-sm leading-relaxed" style={{ color: "rgba(255,255,255,0.4)" }}>
            CRM, Agenda, WhatsApp e IA integrados em uma única plataforma. Automatize o agendamento e foque no que importa: seus pacientes.
          </p>

          {/* Feature list */}
          <div className="space-y-3 pt-2">
            {[
              "Agendamento automatizado via WhatsApp",
              "CRM com histórico completo do paciente",
              "Dashboard com métricas em tempo real",
            ].map((f) => (
              <div key={f} className="flex items-center gap-3">
                <div className="w-1.5 h-1.5 rounded-full shrink-0" style={{ background: "#019A67" }} />
                <span className="text-xs" style={{ color: "rgba(255,255,255,0.5)" }}>{f}</span>
              </div>
            ))}
          </div>
        </div>

        {/* Bottom */}
        <div className="relative z-10">
          <p className="text-xs" style={{ color: "rgba(255,255,255,0.2)" }}>© 2026 Zelus · Todos os direitos reservados</p>
        </div>
      </div>

      {/* Right form panel */}
      <div className="flex-1 flex flex-col items-center justify-center p-8">
        {/* Mobile logo */}
        <div className="lg:hidden flex items-center gap-3 mb-10">
          <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
            <Stethoscope size={18} className="text-white" />
          </div>
          <span className="text-lg text-z-text" style={{ fontWeight: 500 }}>Zelus</span>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.4 }}
          className="w-full max-w-sm"
        >
          {/* Header */}
          <div className="mb-8">
            <h1 className="text-2xl text-z-text mb-1.5" style={{ fontWeight: 500, letterSpacing: "-0.02em" }}>
              {mode === "login" ? "Bem-vindo de volta" : "Criar conta"}
            </h1>
            <p className="text-sm text-z-dim">
              {mode === "login"
                ? "Acesse sua conta para continuar"
                : "Preencha os dados para começar"}
            </p>
          </div>

          {/* Mode toggle */}
          <div
            className="flex p-1 rounded-xl mb-6"
            style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
          >
            {(["login", "signup"] as const).map((m) => (
              <button
                key={m}
                onClick={() => { setMode(m); setError(""); setSuccess(""); }}
                className="flex-1 py-2 rounded-lg text-sm transition-all duration-200"
                style={{
                  background: mode === m ? "rgba(1,154,103,0.15)" : "transparent",
                  color: mode === m ? "#01c47f" : "var(--z-text-dim)",
                }}
              >
                {m === "login" ? "Entrar" : "Cadastro"}
              </button>
            ))}
          </div>

          <form onSubmit={handleSubmit} className="space-y-4">
            <AnimatePresence>
              {mode === "signup" && (
                <motion.div
                  initial={{ opacity: 0, height: 0 }}
                  animate={{ opacity: 1, height: "auto" }}
                  exit={{ opacity: 0, height: 0 }}
                  transition={{ duration: 0.2 }}
                >
                  <label className="text-xs text-z-dim block mb-1.5">Nome completo</label>
                  <input
                    type="text"
                    value={fullName}
                    onChange={(e) => setFullName(e.target.value)}
                    placeholder="Seu nome completo"
                    autoComplete="name"
                    className="w-full px-4 py-3 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none transition-all"
                    style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
                  />
                </motion.div>
              )}
            </AnimatePresence>

            <div>
              <label className="text-xs text-z-dim block mb-1.5">Email</label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="seu@email.com"
                autoComplete="email"
                className="w-full px-4 py-3 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none transition-all"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
              />
            </div>

            <div>
              <label className="text-xs text-z-dim block mb-1.5">Senha</label>
              <div className="relative">
                <input
                  type={showPass ? "text" : "password"}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="••••••••"
                  autoComplete={mode === "login" ? "current-password" : "new-password"}
                  className="w-full px-4 py-3 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none transition-all pr-11"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
                />
                <button
                  type="button"
                  onClick={() => setShowPass((p) => !p)}
                  className="absolute right-3 top-1/2 -translate-y-1/2 text-z-faint hover:text-z-dim transition-colors"
                >
                  {showPass ? <EyeOff size={16} /> : <Eye size={16} />}
                </button>
              </div>
            </div>

            <AnimatePresence>
              {error && (
                <motion.div
                  initial={{ opacity: 0, y: -6 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -6 }}
                  className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-xs text-[#e05555]"
                  style={{ background: "rgba(224,85,85,0.08)", border: "1px solid rgba(224,85,85,0.15)" }}
                >
                  <AlertCircle size={13} className="shrink-0" />
                  {error}
                </motion.div>
              )}
              {success && (
                <motion.div
                  initial={{ opacity: 0, y: -6 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -6 }}
                  className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-xs text-[#019A67]"
                  style={{ background: "rgba(1,154,103,0.08)", border: "1px solid rgba(1,154,103,0.2)" }}
                >
                  {success}
                </motion.div>
              )}
            </AnimatePresence>

            <motion.button
              type="submit"
              disabled={loading}
              whileHover={{ scale: loading ? 1 : 1.01 }}
              whileTap={{ scale: loading ? 1 : 0.99 }}
              className="w-full py-3 rounded-xl text-sm text-white font-medium flex items-center justify-center gap-2 transition-all disabled:opacity-70 mt-2"
              style={{
                background: "linear-gradient(135deg, #019A67, #01a870)",
                boxShadow: "0 0 24px rgba(1,154,103,0.3)",
              }}
            >
              {loading ? (
                <Loader2 size={16} className="animate-spin" />
              ) : (
                <>
                  {mode === "login" ? "Entrar" : "Criar conta"}
                  <ArrowRight size={15} />
                </>
              )}
            </motion.button>
          </form>

          {mode === "login" && (
            <p className="text-center text-xs text-z-faint mt-6">
              Problemas para entrar?{" "}
              <a href="mailto:suporte@zelus.app" className="text-[#019A67] hover:text-[#01c47f] transition-colors">
                Contate o suporte
              </a>
            </p>
          )}
        </motion.div>
      </div>
    </div>
  );
}
