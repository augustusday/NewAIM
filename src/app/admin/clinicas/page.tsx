"use client";

import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { useRouter } from "next/navigation";
import {
  Plus, Search, Building2, Users, Activity, Wifi, WifiOff,
  MoreHorizontal, Edit2, PowerOff, Power, X, AlertCircle, Settings, LogIn, Loader2,
} from "lucide-react";
import {
  getAllClinics, createClinic, updateClinic, type ClinicWithStats,
} from "@/lib/db/admin";

const statusColors: Record<string, { color: string; label: string }> = {
  connected:    { color: "#019A67", label: "Conectado" },
  disconnected: { color: "#6b8f78", label: "Desconectado" },
  connecting:   { color: "#f59e0b", label: "Conectando" },
  error:        { color: "#e05555", label: "Erro" },
};

function slugify(s: string) {
  return s.toLowerCase().replace(/\s+/g, "-").replace(/[^a-z0-9-]/g, "");
}

const TIMEZONES = [
  { value: "America/Sao_Paulo",  label: "América/São Paulo (BRT)" },
  { value: "America/Manaus",     label: "América/Manaus (AMT)" },
  { value: "America/Fortaleza",  label: "América/Fortaleza (BRT)" },
  { value: "America/Belem",      label: "América/Belém (BRT)" },
  { value: "America/Recife",     label: "América/Recife (BRT)" },
  { value: "America/Cuiaba",     label: "América/Cuiabá (AMT)" },
];

function NewClinicDialog({ onClose, onCreated }: { onClose: () => void; onCreated: (c: ClinicWithStats) => void }) {
  const [form, setForm] = useState({ name: "", slug: "", timezone: "America/Sao_Paulo" });
  const [saving, setSaving] = useState(false);
  const [error, setError]   = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.name.trim()) { setError("Nome é obrigatório."); return; }
    const slug = form.slug.trim() || slugify(form.name);
    setSaving(true); setError("");
    const clinic = await createClinic({ name: form.name.trim(), slug, timezone: form.timezone });
    setSaving(false);
    if (!clinic) { setError("Erro ao criar clínica. Verifique se o slug já existe."); return; }
    onCreated({ ...clinic, member_count: 0, doctor_count: 0, contact_count: 0, uazapi_status: "disconnected", uazapi_instance_token: null, uazapi_profile_name: null, uazapi_server_url: null });
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <motion.div
        initial={{ opacity: 0, scale: 0.95, y: 16 }} animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 16 }} transition={{ duration: 0.2 }}
        className="relative w-full max-w-md rounded-2xl p-6 z-10 shadow-2xl"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}
      >
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">Nova clínica</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)]"><X size={15} /></button>
        </div>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Nome da clínica *</label>
            <input
              type="text" value={form.name}
              onChange={(e) => setForm((f) => ({ ...f, name: e.target.value, slug: slugify(e.target.value) }))}
              placeholder="Ex: Clínica São Lucas"
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
            />
          </div>
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Slug (identificador único)</label>
            <input
              type="text" value={form.slug}
              onChange={(e) => setForm((f) => ({ ...f, slug: slugify(e.target.value) }))}
              placeholder={form.name ? slugify(form.name) : "clinica-sao-lucas"}
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint font-mono outline-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
            />
            <p className="text-[10px] text-z-faint mt-1">Preenchido automaticamente a partir do nome. Deve ser único.</p>
          </div>
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Fuso horário</label>
            <select value={form.timezone} onChange={(e) => setForm((f) => ({ ...f, timezone: e.target.value }))}
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}>
              {TIMEZONES.map((tz) => <option key={tz.value} value={tz.value}>{tz.label}</option>)}
            </select>
          </div>
          {error && (
            <div className="flex items-center gap-2 text-xs text-[#e05555] px-3 py-2 rounded-xl" style={{ background: "rgba(224,85,85,0.08)" }}>
              <AlertCircle size={13} /> {error}
            </div>
          )}
          <div className="flex gap-2 pt-1">
            <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>Cancelar</button>
            <motion.button type="submit" disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
              className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
              {saving ? "Criando..." : "Criar clínica"}
            </motion.button>
          </div>
        </form>
      </motion.div>
    </div>
  );
}

function EditClinicDialog({ clinic, onClose, onSaved }: { clinic: ClinicWithStats; onClose: () => void; onSaved: (id: string, data: Partial<ClinicWithStats>) => void }) {
  const [form, setForm] = useState({ name: clinic.name, slug: clinic.slug, timezone: clinic.timezone, address: clinic.address ?? "" });
  const [saving, setSaving] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setSaving(true);
    const payload = { ...form, address: form.address.trim() || null };
    await updateClinic(clinic.id, payload);
    setSaving(false);
    onSaved(clinic.id, payload);
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <motion.div initial={{ opacity: 0, scale: 0.95, y: 16 }} animate={{ opacity: 1, scale: 1, y: 0 }} exit={{ opacity: 0, scale: 0.95, y: 16 }} transition={{ duration: 0.2 }}
        className="relative w-full max-w-sm rounded-2xl p-6 z-10" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}>
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">Editar clínica</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)]"><X size={15} /></button>
        </div>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Nome</label>
            <input type="text" value={form.name} onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))}
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
          </div>
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Endereço</label>
            <input type="text" value={form.address} onChange={(e) => setForm((f) => ({ ...f, address: e.target.value }))}
              placeholder="Rua, número, bairro, cidade — UF"
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
          </div>
          <div>
            <label className="text-xs text-z-dim block mb-1.5">Fuso horário</label>
            <select value={form.timezone} onChange={(e) => setForm((f) => ({ ...f, timezone: e.target.value }))}
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}>
              {TIMEZONES.map((tz) => <option key={tz.value} value={tz.value}>{tz.label}</option>)}
            </select>
          </div>
          <div className="flex gap-2 pt-1">
            <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>Cancelar</button>
            <motion.button type="submit" disabled={saving} className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
              {saving ? "Salvando..." : "Salvar"}
            </motion.button>
          </div>
        </form>
      </motion.div>
    </div>
  );
}

export default function ClinicasPage() {
  const router = useRouter();
  const [clinics, setClinics]         = useState<ClinicWithStats[]>([]);
  const [loading, setLoading]         = useState(true);
  const [search, setSearch]           = useState("");
  const [showNew, setShowNew]         = useState(false);
  const [editClinic, setEditClinic]   = useState<ClinicWithStats | null>(null);
  const [openMenu, setOpenMenu]       = useState<string | null>(null);
  const [accessingId, setAccessingId] = useState<string | null>(null);

  const handleAccessClinic = async (clinic: ClinicWithStats) => {
    setAccessingId(clinic.id);
    setOpenMenu(null);
    try {
      await fetch("/api/admin/switch-clinic", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ clinicId: clinic.id }),
      });
      router.push("/dashboard");
    } finally {
      setAccessingId(null);
    }
  };

  useEffect(() => {
    getAllClinics().then((data) => { setClinics(data); setLoading(false); });
  }, []);

  const filtered = clinics.filter((c) =>
    c.name.toLowerCase().includes(search.toLowerCase()) || c.slug.includes(search.toLowerCase())
  );

  const handleToggleActive = async (clinic: ClinicWithStats) => {
    await updateClinic(clinic.id, { active: !clinic.active });
    setClinics((prev) => prev.map((c) => c.id === clinic.id ? { ...c, active: !clinic.active } : c));
    setOpenMenu(null);
  };

  return (
    <div className="p-6 space-y-5">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl text-z-text" style={{ fontWeight: 500, letterSpacing: "-0.02em" }}>Clínicas</h1>
          <p className="text-sm text-z-dim mt-0.5">{loading ? "..." : `${clinics.length} clínica${clinics.length !== 1 ? "s" : ""} cadastrada${clinics.length !== 1 ? "s" : ""}`}</p>
        </div>
        <div className="flex items-center gap-2">
          <div className="flex items-center gap-2 px-3 py-2 rounded-xl" style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
            <Search size={13} className="text-z-dim" />
            <input type="text" placeholder="Buscar clínica..." value={search} onChange={(e) => setSearch(e.target.value)}
              className="bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none w-40" />
          </div>
          <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }} onClick={() => setShowNew(true)}
            className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-white font-medium"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.3)" }}>
            <Plus size={14} /> Nova clínica
          </motion.button>
        </div>
      </div>

      {/* Table */}
      <div className="rounded-2xl overflow-hidden" style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.1)" }}>
        <div className="grid grid-cols-12 gap-4 px-5 py-3 text-xs text-z-dim font-medium border-b border-border" style={{ background: "var(--surface-2)" }}>
          <div className="col-span-4 flex items-center gap-2"><Building2 size={12} /> Clínica</div>
          <div className="col-span-2">Membros / Médicos</div>
          <div className="col-span-3">WhatsApp</div>
          <div className="col-span-2">Cadastro</div>
          <div className="col-span-1 text-right">Ações</div>
        </div>

        {loading ? (
          Array.from({ length: 4 }).map((_, i) => (
            <div key={i} className="grid grid-cols-12 gap-4 px-5 py-4 border-b border-border">
              <div className="col-span-4 flex items-center gap-3">
                <div className="w-9 h-9 rounded-xl animate-pulse" style={{ background: "rgba(1,154,103,0.08)" }} />
                <div className="h-3 w-36 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
              </div>
              <div className="col-span-8 flex items-center"><div className="h-3 w-full rounded animate-pulse" style={{ background: "rgba(1,154,103,0.04)" }} /></div>
            </div>
          ))
        ) : filtered.length === 0 ? (
          <div className="px-5 py-12 text-center">
            <p className="text-sm text-z-dim">{search ? "Nenhuma clínica encontrada" : "Nenhuma clínica cadastrada"}</p>
            {!search && <button onClick={() => setShowNew(true)} className="mt-3 text-xs text-[#019A67] hover:text-[#01c47f]">+ Criar clínica</button>}
          </div>
        ) : (
          filtered.map((clinic, i) => {
            const wa = statusColors[clinic.uazapi_status ?? "disconnected"] ?? statusColors.disconnected;
            return (
              <motion.div key={clinic.id} initial={{ opacity: 0 }} animate={{ opacity: 1 }} transition={{ delay: i * 0.04 }}
                className="grid grid-cols-12 gap-4 px-5 py-3.5 border-b border-border hover:bg-[rgba(1,154,103,0.03)] transition-colors relative">
                {/* Clinic */}
                <div className="col-span-4 flex items-center gap-3">
                  <div className="w-9 h-9 rounded-xl flex items-center justify-center text-xs font-medium text-white shrink-0"
                    style={{ background: clinic.active ? "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" : "rgba(107,143,120,0.4)" }}>
                    {clinic.name.slice(0, 2).toUpperCase()}
                  </div>
                  <div className="min-w-0">
                    <div className="flex items-center gap-2">
                      <p className="text-sm font-medium text-z-text truncate">{clinic.name}</p>
                      {!clinic.active && <span className="text-[9px] px-1.5 py-0.5 rounded font-medium shrink-0" style={{ background: "rgba(224,85,85,0.12)", color: "#e05555" }}>Suspenso</span>}
                    </div>
                    <p className="text-[10px] text-z-faint">{clinic.slug}</p>
                  </div>
                </div>

                {/* Members / Doctors */}
                <div className="col-span-2 flex items-center gap-3">
                  <span className="text-xs text-z-dim flex items-center gap-1"><Users size={11} /> {clinic.member_count}</span>
                  <span className="text-xs text-z-dim flex items-center gap-1"><Activity size={11} /> {clinic.doctor_count}</span>
                </div>

                {/* WhatsApp */}
                <div className="col-span-3 flex items-center gap-1.5">
                  {clinic.uazapi_status === "connected" ? <Wifi size={12} style={{ color: wa.color }} /> : <WifiOff size={12} style={{ color: wa.color }} />}
                  <span className="text-xs" style={{ color: wa.color }}>{wa.label}</span>
                  {clinic.uazapi_profile_name && <span className="text-[10px] text-z-faint truncate">· {clinic.uazapi_profile_name}</span>}
                </div>

                {/* Created at */}
                <div className="col-span-2 flex items-center">
                  <span className="text-xs text-z-dim">{new Date(clinic.created_at).toLocaleDateString("pt-BR")}</span>
                </div>

                {/* Actions */}
                <div className="col-span-1 flex items-center justify-end">
                  <div className="relative">
                    <button onClick={() => setOpenMenu(openMenu === clinic.id ? null : clinic.id)}
                      className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-z-text hover:bg-[rgba(1,154,103,0.08)] transition-all">
                      <MoreHorizontal size={14} />
                    </button>
                    <AnimatePresence>
                      {openMenu === clinic.id && (
                        <motion.div initial={{ opacity: 0, y: 4, scale: 0.96 }} animate={{ opacity: 1, y: 0, scale: 1 }} exit={{ opacity: 0, y: 4, scale: 0.96 }}
                          transition={{ duration: 0.12 }} className="absolute right-0 top-full mt-1 rounded-xl shadow-2xl z-20 py-1 min-w-36"
                          style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.15)" }}>
                          <button onClick={() => handleAccessClinic(clinic)}
                            disabled={!!accessingId}
                            className="w-full flex items-center gap-2 px-3 py-2 text-xs font-medium transition-all disabled:opacity-50"
                            style={{ color: "#019A67" }}>
                            {accessingId === clinic.id ? <Loader2 size={11} className="animate-spin" /> : <LogIn size={11} />}
                            Acessar como clínica
                          </button>
                          <div className="my-1 border-t" style={{ borderColor: "var(--border)" }} />
                          <button onClick={() => router.push(`/admin/clinicas/${clinic.id}`)}
                            className="w-full flex items-center gap-2 px-3 py-2 text-xs text-z-dim hover:bg-[rgba(1,154,103,0.06)] transition-all">
                            <Settings size={11} /> Gerenciar
                          </button>
                          <button onClick={() => { setEditClinic(clinic); setOpenMenu(null); }}
                            className="w-full flex items-center gap-2 px-3 py-2 text-xs text-z-dim hover:bg-[rgba(1,154,103,0.06)] transition-all">
                            <Edit2 size={11} /> Editar
                          </button>
                          <button onClick={() => handleToggleActive(clinic)}
                            className="w-full flex items-center gap-2 px-3 py-2 text-xs transition-all"
                            style={{ color: clinic.active ? "#e05555" : "#019A67" }}>
                            {clinic.active ? <><PowerOff size={11} /> Suspender</> : <><Power size={11} /> Reativar</>}
                          </button>
                        </motion.div>
                      )}
                    </AnimatePresence>
                  </div>
                </div>
              </motion.div>
            );
          })
        )}
      </div>

      <AnimatePresence>
        {showNew && <NewClinicDialog onClose={() => setShowNew(false)} onCreated={(c) => setClinics((prev) => [c, ...prev])} />}
        {editClinic && <EditClinicDialog clinic={editClinic} onClose={() => setEditClinic(null)}
          onSaved={(id, data) => setClinics((prev) => prev.map((c) => c.id === id ? { ...c, ...data } : c))} />}
      </AnimatePresence>
    </div>
  );
}
