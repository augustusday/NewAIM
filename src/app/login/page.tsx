"use client";

import { useState, useEffect, Suspense } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Eye,
  EyeOff,
  ArrowRight,
  Loader2,
  CalendarCheck2,
  MessageSquareText,
  UsersRound,
  CheckCircle2,
} from "lucide-react";
import Image from "next/image";
import { supabase } from "@/lib/supabase";
import { useRouter, useSearchParams } from "next/navigation";

export default function LoginPage() {
  return (
    <Suspense>
      <LoginForm />
    </Suspense>
  );
}

const FEATURES = [
  { icon: CalendarCheck2,    text: "Agenda integrada com IA" },
  { icon: MessageSquareText, text: "WhatsApp conectado" },
  { icon: UsersRound,        text: "CRM de pacientes" },
];

const SPRING = { type: "spring" as const, stiffness: 360, damping: 40 };

function LoginForm() {
  const router       = useRouter();
  const searchParams = useSearchParams();
  const redirect     = searchParams.get("redirect") ?? "/dashboard";

  const [email, setEmail]       = useState("");
  const [password, setPassword] = useState("");
  const [showPass, setShowPass] = useState(false);
  const [loading, setLoading]   = useState(false);
  const [error, setError]       = useState("");

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (user) router.replace(redirect);
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError("");
    if (!email || !password) { setError("Preencha todos os campos."); return; }
    setLoading(true);

    try {
      const { data: authData, error: err } = await supabase.auth.signInWithPassword({ email, password });
      if (err) {
        setError(err.message === "Invalid login credentials" ? "Email ou senha incorretos." : err.message);
        return;
      }

      const user = authData.user;
      if (!user) { setError("Erro ao obter dados do usuário."); return; }

      const { data: profile } = await supabase
        .from("profiles")
        .select("is_super_admin, active_clinic_id")
        .eq("id", user.id)
        .single();

      if (!profile?.active_clinic_id) {
        const { data: membership } = await supabase
          .from("clinic_members")
          .select("clinic_id")
          .eq("user_id", user.id)
          .eq("active", true)
          .limit(1)
          .maybeSingle();

        if (membership) {
          await supabase
            .from("profiles")
            .update({ active_clinic_id: membership.clinic_id })
            .eq("id", user.id);
        }
      }

      const destination = profile?.is_super_admin ? "/admin" : redirect;
      router.replace(destination);
      setTimeout(() => { window.location.href = destination; }, 800);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Erro inesperado. Tente novamente.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex">

      {/* ── LEFT PANEL — Brand ── */}
      <div
        className="hidden lg:flex lg:w-[44%] xl:w-[42%] flex-col justify-between relative overflow-hidden"
        style={{
          background: "linear-gradient(160deg, #0d2420 0%, #0f2e28 40%, #134039 100%)",
        }}
      >
        {/* Grid pattern overlay */}
        <div
          className="absolute inset-0 pointer-events-none"
          style={{
            backgroundImage: `
              linear-gradient(rgba(29,182,160,0.06) 1px, transparent 1px),
              linear-gradient(90deg, rgba(29,182,160,0.06) 1px, transparent 1px)
            `,
            backgroundSize: "48px 48px",
          }}
        />

        {/* Glow blob */}
        <div
          className="absolute pointer-events-none"
          style={{
            width: 360,
            height: 360,
            borderRadius: "50%",
            background: "radial-gradient(circle, rgba(29,182,160,0.18) 0%, transparent 70%)",
            top: "30%",
            left: "50%",
            transform: "translate(-50%, -50%)",
            filter: "blur(40px)",
          }}
        />

        <div className="relative z-10 flex flex-col h-full p-10 xl:p-14">
          {/* Logo */}
          <motion.div
            initial={{ opacity: 0, y: -12 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ ...SPRING, delay: 0.1 }}
            className="flex items-center"
          >
            <Image src="/brand-mark.png" alt="AgendaIAMed" width={36} height={54} className="object-contain" />
          </motion.div>

          {/* Center content */}
          <div className="flex-1 flex flex-col justify-center">
            <motion.div
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ ...SPRING, delay: 0.2 }}
            >
              <p
                className="text-[11px] font-semibold uppercase tracking-[0.18em] mb-4"
                style={{ color: "#1DB6A0" }}
              >
                Plataforma para clínicas
              </p>
              <h2
                className="text-[2.6rem] xl:text-[3rem] leading-[1.1] font-bold mb-6"
                style={{
                  color: "#fff",
                  fontFamily: "var(--font-display)",
                  letterSpacing: "-0.02em",
                }}
              >
                Sua clínica,{" "}
                <span
                  style={{
                    color: "transparent",
                    backgroundClip: "text",
                    WebkitBackgroundClip: "text",
                    backgroundImage: "linear-gradient(90deg, #1DB6A0, #4de8d0)",
                  }}
                >
                  mais inteligente.
                </span>
              </h2>
              <p
                className="text-[14px] leading-relaxed"
                style={{ color: "rgba(255,255,255,0.55)", maxWidth: 320 }}
              >
                Agenda, CRM de pacientes e WhatsApp com inteligência artificial em uma só plataforma.
              </p>
            </motion.div>

            {/* Feature list */}
            <div className="mt-10 space-y-3">
              {FEATURES.map(({ icon: Icon, text }, i) => (
                <motion.div
                  key={text}
                  initial={{ opacity: 0, x: -12 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ ...SPRING, delay: 0.35 + i * 0.07 }}
                  className="flex items-center gap-3"
                >
                  <div
                    className="flex items-center justify-center rounded-lg shrink-0"
                    style={{
                      width: 30,
                      height: 30,
                      background: "rgba(29,182,160,0.12)",
                      border: "1px solid rgba(29,182,160,0.2)",
                    }}
                  >
                    <Icon size={14} strokeWidth={2} style={{ color: "#1DB6A0" }} />
                  </div>
                  <span className="text-[13px]" style={{ color: "rgba(255,255,255,0.7)" }}>
                    {text}
                  </span>
                  <CheckCircle2 size={12} style={{ color: "rgba(29,182,160,0.6)", marginLeft: "auto" }} />
                </motion.div>
              ))}
            </div>
          </div>

          {/* Bottom */}
          <motion.p
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.7 }}
            className="text-[11px]"
            style={{ color: "rgba(255,255,255,0.25)" }}
          >
            © {new Date().getFullYear()} AgendaIAMed. Todos os direitos reservados.
          </motion.p>
        </div>
      </div>

      {/* ── RIGHT PANEL — Form ── */}
      <div
        className="flex-1 flex flex-col items-center justify-center px-6 py-12 lg:px-16"
        style={{ background: "var(--background)" }}
      >
        {/* Mobile logo */}
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={SPRING}
          className="flex lg:hidden items-center mb-10"
        >
          <Image src="/brand-mark.png" alt="AgendaIAMed" width={30} height={46} className="object-contain" />
        </motion.div>

        <div className="w-full max-w-[380px]">
          {/* Heading */}
          <motion.div
            initial={{ opacity: 0, y: 14 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ ...SPRING, delay: 0.08 }}
            className="mb-8"
          >
            <h1
              className="text-[2rem] font-bold leading-tight tracking-tight mb-2"
              style={{
                color: "var(--z-text)",
                fontFamily: "var(--font-display)",
                letterSpacing: "-0.025em",
              }}
            >
              Bem-vindo de volta
            </h1>
            <p className="text-[14px]" style={{ color: "var(--z-text-dim)" }}>
              Entre com suas credenciais para continuar.
            </p>
          </motion.div>

          {/* Form */}
          <motion.form
            onSubmit={handleSubmit}
            initial={{ opacity: 0, y: 14 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ ...SPRING, delay: 0.14 }}
            className="space-y-4"
          >
            {/* Email */}
            <div>
              <label
                className="block text-[12px] font-semibold mb-1.5"
                style={{ color: "var(--z-text-dim)", letterSpacing: "0.01em" }}
              >
                Email
              </label>
              <input
                type="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                placeholder="seu@email.com"
                autoComplete="email"
                className="w-full text-[14px] outline-none rounded-lg"
                style={{
                  padding: "11px 14px",
                  background: "var(--surface-1)",
                  border: "1.5px solid var(--border)",
                  color: "var(--z-text)",
                  transition: "border-color 180ms ease",
                }}
                onFocus={(e) => {
                  e.currentTarget.style.borderColor = "rgba(29,182,160,0.6)";
                }}
                onBlur={(e) => {
                  e.currentTarget.style.borderColor = "var(--border)";
                }}
              />
            </div>

            {/* Password */}
            <div>
              <label
                className="block text-[12px] font-semibold mb-1.5"
                style={{ color: "var(--z-text-dim)", letterSpacing: "0.01em" }}
              >
                Senha
              </label>
              <div className="relative">
                <input
                  type={showPass ? "text" : "password"}
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  placeholder="••••••••"
                  autoComplete="current-password"
                  className="w-full text-[14px] outline-none rounded-lg pr-11"
                  style={{
                    padding: "11px 14px",
                    background: "var(--surface-1)",
                    border: "1.5px solid var(--border)",
                    color: "var(--z-text)",
                    transition: "border-color 180ms ease",
                  }}
                  onFocus={(e) => {
                    e.currentTarget.style.borderColor = "rgba(29,182,160,0.6)";
                  }}
                  onBlur={(e) => {
                    e.currentTarget.style.borderColor = "var(--border)";
                  }}
                />
                <button
                  type="button"
                  onClick={() => setShowPass((p) => !p)}
                  className="absolute right-3.5 top-1/2 -translate-y-1/2 transition-colors"
                  style={{ color: "var(--z-text-faint)" }}
                  onMouseEnter={(e) => {
                    (e.currentTarget as HTMLButtonElement).style.color = "var(--z-text-dim)";
                  }}
                  onMouseLeave={(e) => {
                    (e.currentTarget as HTMLButtonElement).style.color = "var(--z-text-faint)";
                  }}
                >
                  {showPass ? <EyeOff size={15} strokeWidth={1.75} /> : <Eye size={15} strokeWidth={1.75} />}
                </button>
              </div>
            </div>

            {/* Error message */}
            <AnimatePresence>
              {error && (
                <motion.div
                  initial={{ opacity: 0, scale: 0.97, y: -4 }}
                  animate={{ opacity: 1, scale: 1, y: 0 }}
                  exit={{ opacity: 0, scale: 0.97, y: -4 }}
                  transition={{ duration: 0.15, ease: [0.23, 1, 0.32, 1] }}
                  className="flex items-center gap-2.5 rounded-lg text-[13px]"
                  style={{
                    padding: "10px 14px",
                    background: "rgba(244,67,54,0.06)",
                    border: "1px solid rgba(244,67,54,0.18)",
                    color: "#F44336",
                  }}
                >
                  <div
                    className="w-1.5 h-1.5 rounded-full shrink-0"
                    style={{ background: "#F44336" }}
                  />
                  {error}
                </motion.div>
              )}
            </AnimatePresence>

            {/* Submit */}
            <motion.button
              type="submit"
              disabled={loading}
              whileTap={{ scale: loading ? 1 : 0.97 }}
              className="w-full flex items-center justify-center gap-2 rounded-lg text-[14px] font-semibold text-white mt-2"
              style={{
                padding: "13px",
                background: loading
                  ? "rgba(29,182,160,0.6)"
                  : "linear-gradient(135deg, #1DB6A0 0%, #19a896 100%)",
                boxShadow: loading ? "none" : "0 8px 24px rgba(29,182,160,0.28)",
                transition: "box-shadow 200ms ease, background 200ms ease",
                cursor: loading ? "not-allowed" : "pointer",
              }}
              onMouseEnter={(e) => {
                if (!loading)
                  (e.currentTarget as HTMLButtonElement).style.boxShadow =
                    "0 12px 28px rgba(29,182,160,0.38)";
              }}
              onMouseLeave={(e) => {
                if (!loading)
                  (e.currentTarget as HTMLButtonElement).style.boxShadow =
                    "0 8px 24px rgba(29,182,160,0.28)";
              }}
            >
              {loading ? (
                <Loader2 size={16} strokeWidth={2} className="animate-spin" />
              ) : (
                <>
                  Entrar na plataforma
                  <ArrowRight size={15} strokeWidth={2} />
                </>
              )}
            </motion.button>
          </motion.form>

          {/* Footer */}
          <motion.p
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.5 }}
            className="mt-8 text-[12px] text-center"
            style={{ color: "var(--z-text-faint)" }}
          >
            Cadastros são realizados pelo administrador.{" "}
            <a
              href="mailto:suporte@agendaiamed.com.br"
              className="transition-colors"
              style={{ color: "#1DB6A0" }}
              onMouseEnter={(e) => {
                (e.currentTarget as HTMLAnchorElement).style.color = "#22d3c0";
              }}
              onMouseLeave={(e) => {
                (e.currentTarget as HTMLAnchorElement).style.color = "#1DB6A0";
              }}
            >
              Contatar suporte
            </a>
          </motion.p>
        </div>
      </div>
    </div>
  );
}
