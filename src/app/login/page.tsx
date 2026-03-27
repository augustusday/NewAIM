"use client";

import { useState, useEffect, Suspense } from "react";
import Image from "next/image";
import { motion, AnimatePresence } from "framer-motion";
import { Eye, EyeOff, AlertCircle, ArrowRight, Loader2 } from "lucide-react";
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

  const [email, setEmail]         = useState("");
  const [password, setPassword]   = useState("");
  const [showPass, setShowPass]   = useState(false);
  const [loading, setLoading]     = useState(false);
  const [error, setError]         = useState("");
  const [success, setSuccess]     = useState("");

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

      // If user has no clinic linked, find their first membership
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
    <div className="min-h-screen relative overflow-hidden bg-mesh">
      <div
        className="pointer-events-none absolute inset-0"
        style={{
          background:
            "radial-gradient(circle at top, rgba(1,154,103,0.12), transparent 34%), linear-gradient(180deg, rgba(255,255,255,0.38), transparent 28%)",
        }}
      />
      <div
        className="pointer-events-none absolute left-1/2 top-28 h-64 w-64 -translate-x-1/2 rounded-full"
        style={{
          background: "radial-gradient(circle, rgba(1,154,103,0.12) 0%, transparent 68%)",
          filter: "blur(30px)",
        }}
      />

      <div className="relative z-10 mx-auto flex min-h-screen w-full max-w-6xl flex-col items-center px-6 pb-10 pt-8 sm:px-8">
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.35 }}
          className="mb-10 flex w-full justify-center"
        >
          <div className="flex flex-col items-center gap-1.5 text-center">
            <div className="space-y-1.5">
              <Image src="/logo-zelus.png" alt="Zelus" width={120} height={36} className="mx-auto object-contain" />
              <p className="text-[11px] uppercase tracking-[0.24em] text-z-faint">Plataforma clínica integrada</p>
            </div>
          </div>
        </motion.div>

        <div className="w-full max-w-md">
          <motion.div
            initial={{ opacity: 0, y: 18 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.4, delay: 0.1 }}
            className="w-full rounded-[2rem] p-5 sm:p-6"
            style={{
              background: "linear-gradient(180deg, rgba(255,255,255,0.92), rgba(255,255,255,0.78))",
              border: "1px solid rgba(1,154,103,0.14)",
              boxShadow: "var(--z-shadow-md)",
              backdropFilter: "blur(18px)",
            }}
          >
            <div className="mb-7 space-y-2 text-center sm:text-left">
              <h2 className="text-[1.7rem] text-z-text" style={{ fontWeight: 500, letterSpacing: "-0.03em" }}>
                Acesse sua conta
              </h2>
              <p className="text-sm leading-6 text-z-dim">
                Entre para continuar sua operação com agenda, CRM e atendimento.
              </p>
            </div>

            <form onSubmit={handleSubmit} className="space-y-4">
              <div>
                <label className="mb-1.5 block text-xs text-z-dim">Email</label>
                <input
                  type="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  placeholder="seu@email.com"
                  autoComplete="email"
                  className="w-full rounded-2xl px-4 py-3 text-sm text-z-text outline-none transition-all placeholder:text-z-faint"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.13)" }}
                />
              </div>

              <div>
                <label className="mb-1.5 block text-xs text-z-dim">Senha</label>
                <div className="relative">
                  <input
                    type={showPass ? "text" : "password"}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="••••••••"
                    autoComplete="current-password"
                    className="w-full rounded-2xl px-4 py-3 pr-11 text-sm text-z-text outline-none transition-all placeholder:text-z-faint"
                    style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.13)" }}
                  />
                  <button
                    type="button"
                    onClick={() => setShowPass((p) => !p)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-z-faint transition-colors hover:text-z-dim"
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
                    className="flex items-center gap-2 rounded-2xl px-3 py-2.5 text-xs text-[#e05555]"
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
                    className="flex items-center gap-2 rounded-2xl px-3 py-2.5 text-xs text-[#019A67]"
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
                className="mt-2 flex w-full items-center justify-center gap-2 rounded-2xl py-3.5 text-sm font-medium text-white transition-all disabled:opacity-70"
                style={{
                  background: "linear-gradient(135deg, #019A67, #01a870)",
                  boxShadow: "0 16px 28px rgba(1,154,103,0.24)",
                }}
              >
                {loading ? (
                  <Loader2 size={16} className="animate-spin" />
                ) : (
                  <>
                    Entrar na plataforma
                    <ArrowRight size={15} />
                  </>
                )}
              </motion.button>
            </form>

            <p className="mt-6 text-center text-xs text-z-faint">
              O cadastro de usuários é realizado pelo administrador.{" "}
              <a href="mailto:suporte@zelus.app" className="text-[#019A67] transition-colors hover:text-[#01c47f]">
                Contate o suporte
              </a>
            </p>
          </motion.div>
        </div>

        <div className="mt-6 flex flex-wrap items-center justify-center gap-3 text-center">
          {[
            "Agenda integrada",
            "CRM da clínica",
            "WhatsApp conectado",
          ].map((item) => (
            <div
              key={item}
              className="rounded-full px-3 py-1.5 text-[11px] text-z-dim"
              style={{ background: "rgba(255,255,255,0.62)", border: "1px solid rgba(1,154,103,0.09)" }}
            >
              {item}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
