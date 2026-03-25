"use client";

import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { Search, Shield, ShieldOff, Building2, Plus, X, AlertCircle, Eye, EyeOff } from "lucide-react";
import { getAllUsers, toggleSuperAdmin, getAllClinics, type UserWithClinics, type ClinicWithStats } from "@/lib/db/admin";

function initials(name: string) {
  const p = name.trim().split(" ").filter(Boolean);
  if (p.length === 1) return p[0].slice(0, 2).toUpperCase();
  return (p[0][0] + p[p.length - 1][0]).toUpperCase();
}

function relativeDate(iso: string) {
  const d = Math.floor((Date.now() - new Date(iso).getTime()) / 86400000);
  if (d === 0) return "Hoje";
  if (d === 1) return "Ontem";
  if (d < 30) return `${d}d atrás`;
  return new Date(iso).toLocaleDateString("pt-BR");
}

// ── Create User Modal ──────────────────────────────────────────────────────────
function CreateUserModal({ clinics, onClose, onCreated }: {
  clinics: ClinicWithStats[];
  onClose: () => void;
  onCreated: (user: UserWithClinics) => void;
}) {
  const [form, setForm] = useState({
    full_name: "",
    email: "",
    password: "",
    clinic_id: "",
    role: "member",
  });
  const [showPass, setShowPass] = useState(false);
  const [saving, setSaving]     = useState(false);
  const [error, setError]       = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.full_name.trim() || !form.email.trim() || !form.password) {
      setError("Nome, e-mail e senha são obrigatórios."); return;
    }
    if (form.password.length < 6) {
      setError("A senha deve ter ao menos 6 caracteres."); return;
    }
    setSaving(true); setError("");

    const res = await fetch("/api/admin/create-user", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(form),
    });
    const json = await res.json();

    if (!res.ok) { setError(json.error ?? "Erro ao criar usuário."); setSaving(false); return; }

    const clinic = clinics.find((c) => c.id === form.clinic_id);
    onCreated({
      id: json.user_id,
      full_name: form.full_name,
      active_clinic_id: form.clinic_id || null,
      avatar_url: null,
      is_super_admin: false,
      created_at: new Date().toISOString(),
      updated_at: new Date().toISOString(),
      email: form.email,
      clinics: form.clinic_id && clinic
        ? [{ clinic_id: form.clinic_id, clinic_name: clinic.name, role: form.role }]
        : [],
    });
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <motion.div initial={{ opacity: 0, scale: 0.95, y: 16 }} animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 16 }} transition={{ duration: 0.2 }}
        className="relative w-full max-w-md rounded-2xl p-6 z-10 shadow-2xl"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}>
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">Novo usuário</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)]"><X size={15} /></button>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Nome completo *</label>
            <input type="text" value={form.full_name} onChange={(e) => setForm((f) => ({ ...f, full_name: e.target.value }))}
              placeholder="João da Silva"
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
          </div>
          <div>
            <label className="text-xs text-z-dim block mb-1.5">E-mail *</label>
            <input type="email" value={form.email} onChange={(e) => setForm((f) => ({ ...f, email: e.target.value }))}
              placeholder="joao@clinica.com"
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
          </div>
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Senha *</label>
            <div className="relative">
              <input type={showPass ? "text" : "password"} value={form.password}
                onChange={(e) => setForm((f) => ({ ...f, password: e.target.value }))}
                placeholder="Mínimo 6 caracteres"
                className="w-full px-3 py-2.5 pr-10 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
              <button type="button" onClick={() => setShowPass((p) => !p)}
                className="absolute right-3 top-1/2 -translate-y-1/2 text-z-faint hover:text-z-dim">
                {showPass ? <EyeOff size={14} /> : <Eye size={14} />}
              </button>
            </div>
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs text-z-dim block mb-1.5">Clínica (opcional)</label>
              <select value={form.clinic_id} onChange={(e) => setForm((f) => ({ ...f, clinic_id: e.target.value }))}
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}>
                <option value="">Sem clínica</option>
                {clinics.map((c) => <option key={c.id} value={c.id}>{c.name}</option>)}
              </select>
            </div>
            <div>
              <label className="text-xs text-z-dim block mb-1.5">Função</label>
              <select value={form.role} onChange={(e) => setForm((f) => ({ ...f, role: e.target.value }))}
                disabled={!form.clinic_id}
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none disabled:opacity-50"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}>
                <option value="member">Membro</option>
                <option value="receptionist">Recepcionista</option>
                <option value="doctor">Médico</option>
                <option value="admin">Admin</option>
                <option value="owner">Proprietário</option>
              </select>
            </div>
          </div>

          {error && (
            <div className="flex items-center gap-2 text-xs text-[#e05555] px-3 py-2 rounded-xl" style={{ background: "rgba(224,85,85,0.08)" }}>
              <AlertCircle size={13} /> {error}
            </div>
          )}

          <div className="flex gap-2 pt-1">
            <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>Cancelar</button>
            <motion.button type="submit" disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
              className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
              {saving ? "Criando..." : "Criar usuário"}
            </motion.button>
          </div>
        </form>
      </motion.div>
    </div>
  );
}

export default function UsuariosPage() {
  const [users, setUsers]         = useState<UserWithClinics[]>([]);
  const [clinics, setClinics]     = useState<ClinicWithStats[]>([]);
  const [loading, setLoading]     = useState(true);
  const [search, setSearch]       = useState("");
  const [toggling, setToggling]   = useState<string | null>(null);
  const [showCreate, setShowCreate] = useState(false);

  useEffect(() => {
    Promise.all([getAllUsers(), getAllClinics()]).then(([u, c]) => {
      setUsers(u); setClinics(c); setLoading(false);
    });
  }, []);

  const filtered = users.filter((u) =>
    (u.full_name ?? "").toLowerCase().includes(search.toLowerCase()) ||
    (u.email ?? "").toLowerCase().includes(search.toLowerCase())
  );

  const handleToggleSuperAdmin = async (user: UserWithClinics) => {
    setToggling(user.id);
    const newVal = !user.is_super_admin;
    await toggleSuperAdmin(user.id, newVal);
    setUsers((prev) => prev.map((u) => u.id === user.id ? { ...u, is_super_admin: newVal } : u));
    setToggling(null);
  };

  const superAdmins  = filtered.filter((u) => u.is_super_admin);
  const regularUsers = filtered.filter((u) => !u.is_super_admin);

  const renderUserRow = (user: UserWithClinics, i: number) => (
    <motion.div key={user.id} initial={{ opacity: 0, x: -8 }} animate={{ opacity: 1, x: 0 }} transition={{ delay: i * 0.04 }}
      className="flex items-center gap-4 px-5 py-3.5 border-b border-border hover:bg-[rgba(1,154,103,0.03)] transition-colors">
      <div className="w-9 h-9 rounded-xl flex items-center justify-center text-xs font-medium text-white shrink-0"
        style={{ background: user.is_super_admin ? "linear-gradient(135deg, #f59e0b, #d97706)" : "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" }}>
        {initials(user.full_name || "U")}
      </div>

      <div className="flex-1 min-w-0">
        <div className="flex items-center gap-2">
          <p className="text-sm font-medium text-z-text truncate">{user.full_name || "Sem nome"}</p>
          {user.is_super_admin && (
            <span className="flex items-center gap-1 text-[9px] px-1.5 py-0.5 rounded font-medium shrink-0" style={{ background: "rgba(245,158,11,0.15)", color: "#f59e0b" }}>
              <Shield size={8} /> Super Admin
            </span>
          )}
        </div>
        <p className="text-[10px] text-z-faint">{user.email ?? user.id.slice(0, 12) + "…"}</p>
      </div>

      <div className="flex-1 min-w-0 hidden md:flex items-center gap-1 flex-wrap">
        {user.clinics.length === 0 ? (
          <span className="text-xs text-z-faint">Sem clínica</span>
        ) : user.clinics.map((c) => (
          <span key={c.clinic_id} className="text-[10px] px-2 py-0.5 rounded-lg flex items-center gap-1"
            style={{ background: "rgba(1,154,103,0.08)", color: "#019A67" }}>
            <Building2 size={8} /> {c.clinic_name}
            <span className="opacity-60">· {c.role}</span>
          </span>
        ))}
      </div>

      <div className="hidden lg:block shrink-0">
        <span className="text-xs text-z-faint">{relativeDate(user.created_at)}</span>
      </div>

      <div className="shrink-0">
        <button onClick={() => handleToggleSuperAdmin(user)} disabled={toggling === user.id}
          title={user.is_super_admin ? "Remover Super Admin" : "Tornar Super Admin"}
          className="flex items-center gap-1.5 px-2.5 py-1.5 rounded-lg text-[10px] font-medium transition-all disabled:opacity-50"
          style={{
            background: user.is_super_admin ? "rgba(224,85,85,0.08)" : "rgba(1,154,103,0.08)",
            color: user.is_super_admin ? "#e05555" : "#019A67",
            border: user.is_super_admin ? "1px solid rgba(224,85,85,0.2)" : "1px solid rgba(1,154,103,0.2)",
          }}>
          {toggling === user.id ? (
            <span className="w-3 h-3 rounded-full border-2 border-current border-t-transparent animate-spin" />
          ) : user.is_super_admin ? (
            <><ShieldOff size={10} /> Remover admin</>
          ) : (
            <><Shield size={10} /> Tornar admin</>
          )}
        </button>
      </div>
    </motion.div>
  );

  return (
    <div className="p-6 space-y-5">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl text-z-text" style={{ fontWeight: 500, letterSpacing: "-0.02em" }}>Usuários</h1>
          <p className="text-sm text-z-dim mt-0.5">{loading ? "..." : `${users.length} usuário${users.length !== 1 ? "s" : ""} na plataforma`}</p>
        </div>
        <div className="flex items-center gap-2">
          <div className="flex items-center gap-2 px-3 py-2 rounded-xl" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
            <Search size={13} className="text-z-dim" />
            <input type="text" placeholder="Buscar..." value={search} onChange={(e) => setSearch(e.target.value)}
              className="bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none w-40" />
          </div>
          <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }} onClick={() => setShowCreate(true)}
            className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-white font-medium"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.3)" }}>
            <Plus size={14} /> Novo usuário
          </motion.button>
        </div>
      </div>

      <div className="grid grid-cols-3 gap-3">
        {[
          { label: "Total de usuários", value: loading ? "—" : String(users.length),                                 color: "#019A67" },
          { label: "Super Admins",       value: loading ? "—" : String(users.filter((u) => u.is_super_admin).length), color: "#f59e0b" },
          { label: "Com clínica",        value: loading ? "—" : String(users.filter((u) => u.clinics.length > 0).length), color: "#6366f1" },
        ].map((s) => (
          <div key={s.label} className="rounded-xl p-4" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.08)" }}>
            <p className="text-2xl text-z-text mb-0.5" style={{ fontWeight: 500 }}>{s.value}</p>
            <p className="text-xs text-z-dim">{s.label}</p>
          </div>
        ))}
      </div>

      <div className="rounded-2xl overflow-hidden" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.1)" }}>
        {loading ? (
          Array.from({ length: 5 }).map((_, i) => (
            <div key={i} className="flex items-center gap-4 px-5 py-4 border-b border-border">
              <div className="w-9 h-9 rounded-xl animate-pulse" style={{ background: "rgba(1,154,103,0.08)" }} />
              <div className="flex-1 space-y-2">
                <div className="h-3 w-40 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
                <div className="h-2.5 w-24 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.04)" }} />
              </div>
            </div>
          ))
        ) : filtered.length === 0 ? (
          <div className="px-5 py-12 text-center">
            <p className="text-sm text-z-dim">Nenhum usuário encontrado</p>
            {!search && <button onClick={() => setShowCreate(true)} className="mt-3 text-xs text-[#019A67] hover:text-[#01c47f]">+ Criar usuário</button>}
          </div>
        ) : (
          <>
            {superAdmins.length > 0 && superAdmins.map((u, i) => renderUserRow(u, i))}
            {regularUsers.map((u, i) => renderUserRow(u, superAdmins.length + i))}
          </>
        )}
      </div>

      <div className="rounded-xl px-4 py-3 flex items-start gap-3" style={{ background: "rgba(245,158,11,0.06)", border: "1px solid rgba(245,158,11,0.15)" }}>
        <Shield size={14} className="shrink-0 mt-0.5" style={{ color: "#f59e0b" }} />
        <p className="text-xs text-z-dim leading-relaxed">
          <span className="font-medium" style={{ color: "#f59e0b" }}>Super Admins</span> têm acesso total ao painel administrativo. Usuários criados aqui já têm e-mail confirmado e podem fazer login imediatamente.
        </p>
      </div>

      <AnimatePresence>
        {showCreate && (
          <CreateUserModal
            clinics={clinics}
            onClose={() => setShowCreate(false)}
            onCreated={(u) => setUsers((prev) => [u, ...prev])}
          />
        )}
      </AnimatePresence>
    </div>
  );
}
