"use client";

import { useState, useEffect, useCallback, useRef } from "react";
import { useParams, useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import {
  ArrowLeft, Plus, Edit2, X, AlertCircle,
  UserMinus, Clock, Calendar, Stethoscope, Users, ChevronRight,
  ToggleLeft, ToggleRight, RefreshCw, Wifi, WifiOff, Bot,
  Save, Eye, EyeOff, Mail, ClipboardList, Zap, Wrench, CheckCircle2, XCircle,
  Phone, ChevronLeft,
} from "lucide-react";
import {
  getClinicById,
  getClinicSettings,
  updateClinicSettings,
  getClinicMembers,
  removeClinicMember,
  updateMemberRole,
  getAllDoctors,
  createDoctor,
  updateDoctor,
  toggleDoctor,
  getAvailabilityTemplates,
  upsertAvailabilityTemplate,
  deleteAvailabilityTemplate,
  getAllAppointmentTypes,
  createAppointmentType,
  updateAppointmentType,
  getAllUsers,
  addUserToClinic,
  type UserWithClinics,
} from "@/lib/db/admin";
import { CLINIC_MEMBER_ROLE_OPTIONS, DEFAULT_CLINIC_MEMBER_ROLE } from "@/lib/clinic-member-roles";
import { supabase } from "@/lib/supabase";
import type { Database } from "@/lib/database.types";

type Clinic = Database["public"]["Tables"]["clinics"]["Row"];
type Doctor = Database["public"]["Tables"]["doctors"]["Row"];
type AvailTemplate = Database["public"]["Tables"]["availability_templates"]["Row"];
type AppType = Database["public"]["Tables"]["appointment_types"]["Row"];
type MemberWithProfile = Database["public"]["Tables"]["clinic_members"]["Row"] & {
  profile: { id: string; full_name: string } | null;
};

const DAYS = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];
const COLOR_OPTS = ["#1DB6A0","#6366f1","#f59e0b","#e05555","#0ea5e9","#8b5cf6","#ec4899","#14b8a6"];

// ─── Helpers ──────────────────────────────────────────────────────────────────
function ColorDot({ color, size = 14 }: { color: string; size?: number }) {
  return <span className="inline-block rounded-full shrink-0" style={{ width: size, height: size, background: color }} />;
}

function Badge({ color, label }: { color: string; label: string }) {
  return (
    <span className="text-[10px] px-1.5 py-0.5 rounded font-medium"
      style={{ background: `${color}18`, color }}>{label}</span>
  );
}

// ─── Modals ───────────────────────────────────────────────────────────────────
function Modal({ title, onClose, children }: { title: string; onClose: () => void; children: React.ReactNode }) {
  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <motion.div initial={{ opacity: 0, scale: 0.95, y: 16 }} animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 16 }} transition={{ duration: 0.2 }}
        className="relative w-full max-w-md rounded-2xl p-6 z-10 shadow-2xl"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.2)" }}>
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">{title}</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(29,182,160,0.08)]"><X size={15} /></button>
        </div>
        {children}
      </motion.div>
    </div>
  );
}

function InputField({ label, value, onChange, placeholder, type = "text" }: {
  label: string; value: string; onChange: (v: string) => void; placeholder?: string; type?: string;
}) {
  return (
    <div>
      <label className="text-xs text-z-dim block mb-1.5">{label}</label>
      <input type={type} value={value} onChange={(e) => onChange(e.target.value)} placeholder={placeholder}
        className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
        style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }} />
    </div>
  );
}

// ─── Doctor Modal ─────────────────────────────────────────────────────────────
function DoctorModal({ doctor, clinicId, onClose, onSaved }: {
  doctor?: Doctor; clinicId: string; onClose: () => void;
  onSaved: (d: Doctor) => void;
}) {
  const [form, setForm] = useState({
    name: doctor?.name ?? "",
    specialty: doctor?.specialty ?? "",
    crm_number: doctor?.crm_number ?? "",
    color: doctor?.color ?? "#1DB6A0",
  });
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.name.trim()) { setError("Nome é obrigatório."); return; }
    setSaving(true); setError("");
    if (doctor) {
      await updateDoctor(doctor.id, form);
      onSaved({ ...doctor, ...form });
    } else {
      const d = await createDoctor(clinicId, form);
      if (!d) { setError("Erro ao criar médico."); setSaving(false); return; }
      onSaved(d);
    }
    setSaving(false);
    onClose();
  };

  return (
    <Modal title={doctor ? "Editar médico" : "Novo médico"} onClose={onClose}>
      <form onSubmit={handleSubmit} className="space-y-4">
        <InputField label="Nome *" value={form.name} onChange={(v) => setForm((f) => ({ ...f, name: v }))} placeholder="Dr. João Silva" />
        <div className="grid grid-cols-2 gap-3">
          <InputField label="Especialidade" value={form.specialty} onChange={(v) => setForm((f) => ({ ...f, specialty: v }))} placeholder="Clínico geral" />
          <InputField label="CRM" value={form.crm_number} onChange={(v) => setForm((f) => ({ ...f, crm_number: v }))} placeholder="12345/SP" />
        </div>
        <div>
          <label className="text-xs text-z-dim block mb-1.5">Cor</label>
          <div className="flex gap-2 flex-wrap">
            {COLOR_OPTS.map((c) => (
              <button key={c} type="button" onClick={() => setForm((f) => ({ ...f, color: c }))}
                className="w-7 h-7 rounded-full transition-all"
                style={{ background: c, outline: form.color === c ? `2px solid white` : "none", outlineOffset: 2 }} />
            ))}
          </div>
        </div>
        {error && (
          <div className="flex items-center gap-2 text-xs text-[#e05555] px-3 py-2 rounded-xl" style={{ background: "rgba(224,85,85,0.08)" }}>
            <AlertCircle size={13} /> {error}
          </div>
        )}
        <div className="flex gap-2 pt-1">
          <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim" style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.1)" }}>Cancelar</button>
          <motion.button type="submit" disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
            className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
            style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
            {saving ? "Salvando..." : "Salvar"}
          </motion.button>
        </div>
      </form>
    </Modal>
  );
}

// ─── Schedule Modal ───────────────────────────────────────────────────────────
type TimePeriod = { start: string; end: string };
type DayEntry = { enabled: boolean; periods: TimePeriod[]; slot: number; id?: string };

function ScheduleModal({ doctor, clinicId, templates, onClose, onSaved }: {
  doctor: Doctor; clinicId: string; templates: AvailTemplate[];
  onClose: () => void; onSaved: (templates: AvailTemplate[]) => void;
}) {
  const initDays = (): DayEntry[] => DAYS.map((_, dow) => {
    const t = templates.find((t) => t.day_of_week === dow);
    const rawPeriods = Array.isArray(t?.time_periods) && t.time_periods.length > 0
      ? (t.time_periods as TimePeriod[])
      : [{ start: t?.start_time ?? "08:00", end: t?.end_time ?? "18:00" }];
    return { enabled: !!t && t.active, periods: rawPeriods, slot: t?.slot_duration_min ?? 30, id: t?.id };
  });

  const [days, setDays] = useState<DayEntry[]>(initDays);
  const [saving, setSaving] = useState(false);

  const updateDay = (dow: number, patch: Partial<DayEntry>) =>
    setDays((prev) => prev.map((d, i) => i === dow ? { ...d, ...patch } : d));

  const updatePeriod = (dow: number, pi: number, patch: Partial<TimePeriod>) =>
    setDays((prev) => prev.map((d, i) => {
      if (i !== dow) return d;
      return { ...d, periods: d.periods.map((p, idx) => idx === pi ? { ...p, ...patch } : p) };
    }));

  const addPeriod = (dow: number) =>
    setDays((prev) => prev.map((d, i) => i !== dow ? d : { ...d, periods: [...d.periods, { start: "14:00", end: "18:00" }] }));

  const removePeriod = (dow: number, pi: number) =>
    setDays((prev) => prev.map((d, i) => i !== dow ? d : { ...d, periods: d.periods.filter((_, idx) => idx !== pi) }));

  const handleSave = async () => {
    setSaving(true);
    const newTemplates: AvailTemplate[] = [];
    for (let dow = 0; dow < 7; dow++) {
      const d = days[dow];
      if (d.enabled) {
        await upsertAvailabilityTemplate({
          id: d.id,
          clinic_id: clinicId,
          doctor_id: doctor.id,
          day_of_week: dow,
          start_time: d.periods[0]?.start ?? "08:00",
          end_time: d.periods[0]?.end ?? "18:00",
          slot_duration_min: d.slot,
          active: true,
          time_periods: d.periods,
        });
        newTemplates.push({
          id: d.id ?? "",
          clinic_id: clinicId,
          doctor_id: doctor.id,
          day_of_week: dow,
          start_time: d.periods[0]?.start ?? "08:00",
          end_time: d.periods[0]?.end ?? "18:00",
          slot_duration_min: d.slot,
          active: true,
          time_periods: d.periods as unknown as import("@/lib/database.types").Json,
        });
      } else if (d.id) {
        await deleteAvailabilityTemplate(d.id);
      }
    }
    setSaving(false);
    onSaved(newTemplates);
    onClose();
  };

  return (
    <Modal title={`Horários — ${doctor.name}`} onClose={onClose}>
      <div className="space-y-2 max-h-[55vh] overflow-y-auto pr-1">
        {DAYS.map((dayLabel, dow) => {
          const d = days[dow];
          return (
            <div key={dow} className="rounded-xl p-3 transition-all" style={{ background: d.enabled ? "rgba(29,182,160,0.05)" : "var(--input)", border: `1px solid ${d.enabled ? "rgba(29,182,160,0.2)" : "rgba(29,182,160,0.08)"}` }}>
              <div className="flex items-start gap-3">
                <button onClick={() => updateDay(dow, { enabled: !d.enabled })} className="shrink-0 mt-0.5">
                  {d.enabled ? <ToggleRight size={20} style={{ color: "#1DB6A0" }} /> : <ToggleLeft size={20} className="text-z-dim" />}
                </button>
                <span className="text-sm font-medium text-z-text w-8 shrink-0 pt-0.5">{dayLabel}</span>
                {d.enabled && (
                  <div className="flex-1 space-y-1.5">
                    {d.periods.map((period, pi) => (
                      <div key={pi} className="flex items-center gap-2">
                        <input type="time" value={period.start} onChange={(e) => updatePeriod(dow, pi, { start: e.target.value })}
                          className="text-xs rounded-lg px-2 py-1.5 flex-1 text-z-text outline-none"
                          style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.15)" }} />
                        <span className="text-z-dim text-xs">–</span>
                        <input type="time" value={period.end} onChange={(e) => updatePeriod(dow, pi, { end: e.target.value })}
                          className="text-xs rounded-lg px-2 py-1.5 flex-1 text-z-text outline-none"
                          style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.15)" }} />
                        {pi === 0 ? (
                          <select value={d.slot} onChange={(e) => updateDay(dow, { slot: Number(e.target.value) })}
                            className="text-xs rounded-lg px-2 py-1.5 text-z-text outline-none"
                            style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.15)" }}>
                            {[15, 20, 30, 45, 60].map((m) => <option key={m} value={m}>{m}min</option>)}
                          </select>
                        ) : (
                          <button onClick={() => removePeriod(dow, pi)}
                            className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:text-red-400 transition-colors"
                            style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.15)" }}>
                            <X size={10} />
                          </button>
                        )}
                      </div>
                    ))}
                    <button onClick={() => addPeriod(dow)}
                      className="flex items-center gap-1 text-[10px] px-2 py-1 rounded-lg transition-colors"
                      style={{ color: "#1DB6A0", background: "rgba(29,182,160,0.07)", border: "1px dashed rgba(29,182,160,0.3)" }}>
                      <Plus size={9} /> add break
                    </button>
                  </div>
                )}
              </div>
            </div>
          );
        })}
      </div>
      <div className="flex gap-2 mt-4">
        <button onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim" style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.1)" }}>Cancelar</button>
        <motion.button onClick={handleSave} disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
          className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
          style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
          {saving ? "Salvando..." : "Salvar horários"}
        </motion.button>
      </div>
    </Modal>
  );
}

// ─── Appt Type Modal ──────────────────────────────────────────────────────────
function ApptTypeModal({ type, clinicId, onClose, onSaved }: {
  type?: AppType; clinicId: string; onClose: () => void; onSaved: (t: AppType) => void;
}) {
  const [form, setForm] = useState({
    name: type?.name ?? "",
    duration_minutes: type?.duration_minutes ?? 30,
    color: type?.color ?? "#1DB6A0",
  });
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.name.trim()) { setError("Nome é obrigatório."); return; }
    setSaving(true); setError("");
    if (type) {
      await updateAppointmentType(type.id, form);
      onSaved({ ...type, ...form });
    } else {
      const t = await createAppointmentType(clinicId, form);
      if (!t) { setError("Erro ao criar tipo."); setSaving(false); return; }
      onSaved(t);
    }
    setSaving(false);
    onClose();
  };

  return (
    <Modal title={type ? "Editar tipo" : "Novo tipo de consulta"} onClose={onClose}>
      <form onSubmit={handleSubmit} className="space-y-4">
        <InputField label="Nome *" value={form.name} onChange={(v) => setForm((f) => ({ ...f, name: v }))} placeholder="Consulta de rotina" />
        <div>
          <label className="text-xs text-z-dim block mb-1.5">Duração (minutos)</label>
          <select value={form.duration_minutes} onChange={(e) => setForm((f) => ({ ...f, duration_minutes: Number(e.target.value) }))}
            className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
            style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }}>
            {[15, 20, 30, 45, 60, 90, 120].map((m) => <option key={m} value={m}>{m} min</option>)}
          </select>
        </div>
        <div>
          <label className="text-xs text-z-dim block mb-1.5">Cor</label>
          <div className="flex gap-2 flex-wrap">
            {COLOR_OPTS.map((c) => (
              <button key={c} type="button" onClick={() => setForm((f) => ({ ...f, color: c }))}
                className="w-7 h-7 rounded-full transition-all"
                style={{ background: c, outline: form.color === c ? `2px solid white` : "none", outlineOffset: 2 }} />
            ))}
          </div>
        </div>
        {error && (
          <div className="flex items-center gap-2 text-xs text-[#e05555] px-3 py-2 rounded-xl" style={{ background: "rgba(224,85,85,0.08)" }}>
            <AlertCircle size={13} /> {error}
          </div>
        )}
        <div className="flex gap-2 pt-1">
          <button type="button" onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim" style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.1)" }}>Cancelar</button>
          <motion.button type="submit" disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
            className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
            style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
            {saving ? "Salvando..." : "Salvar"}
          </motion.button>
        </div>
      </form>
    </Modal>
  );
}

// ─── Add Member Modal ─────────────────────────────────────────────────────────
function AddMemberModal({ clinicId, existingIds, onClose, onAdded }: {
  clinicId: string; existingIds: string[]; onClose: () => void;
  onAdded: (m: MemberWithProfile) => void;
}) {
  const [users, setUsers] = useState<{ id: string; full_name: string }[]>([]);
  const [selected, setSelected] = useState("");
  const [role, setRole] = useState(DEFAULT_CLINIC_MEMBER_ROLE);
  const [saving, setSaving] = useState(false);

  useEffect(() => {
    getAllUsers().then((all) => {
      setUsers(all.filter((u) => !existingIds.includes(u.id)).map((u) => ({ id: u.id, full_name: u.full_name ?? u.id })));
    });
  }, [existingIds]);

  const handleAdd = async () => {
    if (!selected) return;
    setSaving(true);
    await addUserToClinic(selected, clinicId, role);
    const user = users.find((u) => u.id === selected);
    onAdded({
      id: "",
      clinic_id: clinicId,
      user_id: selected,
      role,
      active: true,
      invited_at: new Date().toISOString(),
      joined_at: null,
      profile: user ? { id: user.id, full_name: user.full_name } : null,
    });
    setSaving(false);
    onClose();
  };

  return (
    <Modal title="Adicionar membro" onClose={onClose}>
      <div className="space-y-4">
        <div>
          <label className="text-xs text-z-dim block mb-1.5">Usuário</label>
          <select value={selected} onChange={(e) => setSelected(e.target.value)}
            className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
            style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }}>
            <option value="">Selecione um usuário</option>
            {users.map((u) => <option key={u.id} value={u.id}>{u.full_name}</option>)}
          </select>
        </div>
        <div>
          <label className="text-xs text-z-dim block mb-1.5">Função</label>
          <select value={role} onChange={(e) => setRole(e.target.value as typeof role)}
            className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
            style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }}>
            {CLINIC_MEMBER_ROLE_OPTIONS.map((option) => (
              <option key={option.value} value={option.value}>{option.label}</option>
            ))}
          </select>
        </div>
        <div className="flex gap-2 pt-1">
          <button onClick={onClose} className="flex-1 py-2.5 rounded-xl text-sm text-z-dim" style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.1)" }}>Cancelar</button>
          <motion.button onClick={handleAdd} disabled={!selected || saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
            className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
            style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
            {saving ? "Adicionando..." : "Adicionar"}
          </motion.button>
        </div>
      </div>
    </Modal>
  );
}

// ─── WhatsApp + AI Tabs ────────────────────────────────────────────────────────
import type { OpenRouterModel } from "@/app/api/admin/openrouter-models/route";

async function fetchOpenRouterModels(apiKey: string): Promise<OpenRouterModel[]> {
  const res = await fetch(`/api/admin/openrouter-models?key=${encodeURIComponent(apiKey)}`);
  if (!res.ok) return [];
  const json = await res.json() as { models?: OpenRouterModel[] };
  return json.models ?? [];
}

type ClinicSettings = Database["public"]["Tables"]["clinic_settings"]["Row"];

// Shared field component
function Field({ label, value, onChange, placeholder, type = "text", mono = false, children }: {
  label: string; value: string; onChange?: (v: string) => void; placeholder?: string;
  type?: string; mono?: boolean; children?: React.ReactNode;
}) {
  return (
    <div>
      <label className="text-xs text-z-dim block mb-1.5">{label}</label>
      <div className="relative">
        <input type={type} value={value} onChange={onChange ? (e) => onChange(e.target.value) : undefined}
          placeholder={placeholder}
          className={`w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none ${children ? "pr-10" : ""} ${mono ? "font-mono" : ""}`}
          style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }} />
        {children && <div className="absolute right-3 top-1/2 -translate-y-1/2">{children}</div>}
      </div>
    </div>
  );
}

// ─── WhatsApp Tab ─────────────────────────────────────────────────────────────
function WhatsappTab({ clinicId }: { clinicId: string }) {
  const [settings, setSettings] = useState<ClinicSettings | null>(null);
  const [token, setToken]         = useState("");
  const [showToken, setShowToken] = useState(false);
  const [saving, setSaving]       = useState(false);
  const [savedMsg, setSavedMsg]   = useState("");

  useEffect(() => {
    getClinicSettings(clinicId).then((s) => {
      if (!s) return;
      setSettings(s);
      setToken(s.uazapi_instance_token ?? "");
    });
  }, [clinicId]);

  const save = async () => {
    setSaving(true);
    await updateClinicSettings(clinicId, { uazapi_instance_token: token || null });
    setSaving(false); setSavedMsg("Salvo!"); setTimeout(() => setSavedMsg(""), 2500);
  };

  const waStatus = settings?.uazapi_status ?? "disconnected";
  const waConnected = waStatus === "connected";

  return (
    <div className="space-y-5 max-w-2xl">
      <div className="rounded-2xl p-5 space-y-4" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)" }}>
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            {waConnected ? <Wifi size={15} style={{ color: "#1DB6A0" }} /> : <WifiOff size={15} className="text-z-dim" />}
            <span className="text-sm font-medium text-z-text">UAZAPI — WhatsApp</span>
          </div>
          <span className="text-xs px-2 py-0.5 rounded-lg" style={{
            background: waConnected ? "rgba(29,182,160,0.1)" : "rgba(107,143,120,0.1)",
            color: waConnected ? "#1DB6A0" : "#6b8f78",
          }}>
            {waConnected ? "Conectado" : "Desconectado"}
            {settings?.uazapi_profile_name && ` · ${settings.uazapi_profile_name}`}
          </span>
        </div>

        <Field label="Token da instância UAZAPI" value={token} onChange={setToken}
          placeholder="Ex: abc123token..." mono type={showToken ? "text" : "password"}>
          <button type="button" onClick={() => setShowToken((p) => !p)} className="text-z-faint hover:text-z-dim">
            {showToken ? <EyeOff size={14} /> : <Eye size={14} />}
          </button>
        </Field>

        <div className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-xs"
          style={{ background: "rgba(29,182,160,0.04)", border: "1px solid rgba(29,182,160,0.12)" }}>
          <Wifi size={11} style={{ color: "#1DB6A0", flexShrink: 0 }} />
          <span className="text-z-dim">
            O servidor UAZAPI é compartilhado por todas as clínicas — configure a URL em{" "}
            <a href="/admin/whatsapp" className="underline" style={{ color: "#1DB6A0" }}>Admin → WhatsApp</a>.
          </span>
        </div>
      </div>

      <div className="flex justify-end">
        <motion.button onClick={save} disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
          className="flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
          style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
          {saving ? <span className="w-3 h-3 rounded-full border-2 border-white border-t-transparent animate-spin" /> : <Save size={14} />}
          {savedMsg || (saving ? "Salvando..." : "Salvar")}
        </motion.button>
      </div>
    </div>
  );
}

// ─── Agente de IA Tab ─────────────────────────────────────────────────────────
type ExecRow = {
  id: string; phone: string | null; contact_name: string | null;
  status: string; input_preview: string | null; final_response: string | null;
  iterations: number; started_at: string; duration_ms: number | null; error_message: string | null;
};
type StepRow = {
  id: string; step_index: number; type: string; tool_name: string | null;
  tool_args: Record<string, unknown> | null; tool_result: string | null;
  duration_ms: number | null; error: string | null;
};

function ClinicExecLogs({ clinicId }: { clinicId: string }) {
  const [execs, setExecs]       = useState<ExecRow[]>([]);
  const [loading, setLoading]   = useState(true);
  const [selected, setSelected] = useState<ExecRow | null>(null);
  const [steps, setSteps]       = useState<StepRow[]>([]);
  const [stepsLoading, setStepsLoading] = useState(false);

  const loadExecs = useCallback(() => {
    setLoading(true);
    supabase.from("ai_executions")
      .select("id,phone,contact_name,status,input_preview,final_response,iterations,started_at,duration_ms,error_message")
      .eq("clinic_id", clinicId)
      .order("started_at", { ascending: false })
      .limit(30)
      .then(({ data }) => { setExecs((data ?? []) as ExecRow[]); setLoading(false); });
  }, [clinicId]);

  useEffect(() => { loadExecs(); }, [loadExecs]);

  const openExec = async (exec: ExecRow) => {
    setSelected(exec);
    setSteps([]);
    setStepsLoading(true);
    const { data } = await supabase.from("ai_execution_steps")
      .select("*").eq("execution_id", exec.id).order("step_index");
    setSteps((data ?? []) as StepRow[]);
    setStepsLoading(false);
  };

  const statusColor = (s: string) => s === "success" ? "#1DB6A0" : s === "error" ? "#e05555" : "#f59e0b";

  if (selected) {
    return (
      <div>
        <button onClick={() => setSelected(null)} className="flex items-center gap-1.5 text-xs text-z-dim hover:text-z-text mb-3">
          <ChevronLeft size={13} /> Voltar às execuções
        </button>
        <div className="flex items-center gap-2 mb-3">
          <p className="text-sm font-medium text-z-text">{selected.contact_name ?? selected.phone ?? "Desconhecido"}</p>
          <span className="text-[10px] px-2 py-0.5 rounded-full font-medium" style={{ background: `${statusColor(selected.status)}15`, color: statusColor(selected.status) }}>
            {selected.status}
          </span>
          {selected.duration_ms != null && <span className="text-[10px] text-z-faint">{(selected.duration_ms / 1000).toFixed(1)}s</span>}
        </div>
        {selected.input_preview && (
          <div className="mb-3 px-3 py-2 rounded-xl text-xs text-z-dim" style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}>
            {selected.input_preview}
          </div>
        )}
        {stepsLoading ? (
          <p className="text-xs text-z-faint text-center py-4">Carregando steps...</p>
        ) : (
          <div className="space-y-1.5">
            {steps.map((step) => {
              const color = step.error ? "#e05555" : step.type === "llm_call" ? "#6366f1" : step.type === "tool_call" ? "#f59e0b" : "#1DB6A0";
              const icon = step.type === "llm_call" ? <Zap size={10} /> : step.type === "tool_call" ? <Wrench size={10} /> : step.error ? <XCircle size={10} /> : <CheckCircle2 size={10} />;
              const label = step.type === "llm_call" ? "LLM" : step.type === "tool_call" ? `↳ ${step.tool_name}` : `✓ ${step.tool_name}`;
              return (
                <div key={step.id} className="flex items-start gap-2 px-3 py-2 rounded-xl text-xs"
                  style={{ background: `${color}06`, border: `1px solid ${color}20` }}>
                  <div className="w-5 h-5 rounded-md flex items-center justify-center text-white shrink-0 mt-0.5" style={{ background: color }}>{icon}</div>
                  <div className="flex-1 min-w-0">
                    <p className="font-medium truncate" style={{ color }}>{label}</p>
                    {step.tool_result && <p className="text-z-faint truncate mt-0.5">{step.tool_result.slice(0, 100)}</p>}
                    {step.error && <p className="truncate mt-0.5" style={{ color: "#e05555" }}>{step.error}</p>}
                  </div>
                  {step.duration_ms != null && <span className="text-z-faint shrink-0">{step.duration_ms}ms</span>}
                </div>
              );
            })}
          </div>
        )}
        {selected.final_response && (
          <div className="mt-3 px-3 py-2.5 rounded-xl" style={{ background: "rgba(29,182,160,0.06)", border: "1px solid rgba(29,182,160,0.2)" }}>
            <p className="text-[10px] font-medium mb-1" style={{ color: "#1DB6A0" }}>Resposta final</p>
            <p className="text-xs text-z-text whitespace-pre-wrap">{selected.final_response}</p>
          </div>
        )}
      </div>
    );
  }

  return (
    <div>
      <div className="flex items-center justify-between mb-2">
        <p className="text-xs text-z-dim">{execs.length} execuções recentes</p>
        <button onClick={loadExecs} className="text-z-faint hover:text-z-dim transition-colors"><RefreshCw size={11} /></button>
      </div>
      {loading ? (
        <p className="text-xs text-z-faint text-center py-6">Carregando...</p>
      ) : execs.length === 0 ? (
        <div className="text-center py-8">
          <ClipboardList size={20} className="mx-auto mb-2 text-z-faint" />
          <p className="text-xs text-z-faint">Nenhuma execução registrada ainda.</p>
        </div>
      ) : (
        <div className="space-y-1.5">
          {execs.map((exec, i) => (
            <motion.button key={exec.id} initial={{ opacity: 0, y: 3 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: i * 0.02 }}
              onClick={() => openExec(exec)}
              className="w-full flex items-center gap-3 px-3 py-2.5 rounded-xl text-left hover:opacity-80 transition-opacity"
              style={{ background: "var(--surface-2)", border: "1px solid rgba(29,182,160,0.08)" }}>
              <div className="w-2 h-2 rounded-full shrink-0" style={{ background: statusColor(exec.status) }} />
              <div className="flex-1 min-w-0">
                <p className="text-xs font-medium text-z-text truncate">{exec.contact_name ?? exec.phone ?? "Desconhecido"}</p>
                {exec.input_preview && <p className="text-[10px] text-z-faint truncate">{exec.input_preview}</p>}
              </div>
              <div className="flex items-center gap-2 shrink-0 text-[10px] text-z-faint">
                {exec.duration_ms != null && <span className="flex items-center gap-0.5"><Clock size={9} />{(exec.duration_ms / 1000).toFixed(1)}s</span>}
                <Phone size={9} />
                <span>{new Date(exec.started_at).toLocaleString("pt-BR", { day: "2-digit", month: "2-digit", hour: "2-digit", minute: "2-digit" })}</span>
                <ChevronRight size={11} />
              </div>
            </motion.button>
          ))}
        </div>
      )}
    </div>
  );
}

function AgenteTab({ clinicId }: { clinicId: string }) {
  const [form, setForm] = useState({
    ai_enabled: false, ai_agent_name: "", ai_model: "google/gemini-2.0-flash-001",
    ai_openai_key: "", ai_system_prompt: "",
  });
  const [showKey, setShowKey]           = useState(false);
  const [saving, setSaving]             = useState(false);
  const [savedMsg, setSavedMsg]         = useState("");
  const [models, setModels]             = useState<OpenRouterModel[]>([]);
  const [modelsLoading, setModelsLoading] = useState(false);
  const [modelsError, setModelsError]   = useState<string | null>(null);
  const modelsFetchedForKey             = useRef<string | null>(null);
  const [logsTab, setLogsTab]           = useState<"config" | "logs">("config");

  useEffect(() => {
    getClinicSettings(clinicId).then((s) => {
      if (!s) return;
      setForm({
        ai_enabled: s.ai_enabled ?? false, ai_agent_name: s.ai_agent_name ?? "",
        ai_model: s.ai_model ?? "google/gemini-2.0-flash-001",
        ai_openai_key: s.ai_openai_key ?? "", ai_system_prompt: s.ai_system_prompt ?? "",
      });
    });
  }, [clinicId]);

  const save = async () => {
    setSaving(true);
    await updateClinicSettings(clinicId, {
      ai_enabled: form.ai_enabled, ai_agent_name: form.ai_agent_name || null,
      ai_model: form.ai_model || null, ai_openai_key: form.ai_openai_key || null,
      ai_system_prompt: form.ai_system_prompt || null,
    });
    setSaving(false); setSavedMsg("Salvo!"); setTimeout(() => setSavedMsg(""), 2500);
  };

  useEffect(() => {
    const key = form.ai_openai_key?.trim();
    if (!key || modelsFetchedForKey.current === key) return;
    modelsFetchedForKey.current = key;
    setModelsLoading(true); setModelsError(null);
    fetchOpenRouterModels(key).then((list) => {
      setModels(list);
      if (list.length === 0) setModelsError("Chave inválida ou sem modelos");
      setModelsLoading(false);
    });
  }, [form.ai_openai_key]);

  return (
    <div className="space-y-4 max-w-2xl">
      {/* Sub-tabs */}
      <div className="flex gap-1 p-1 rounded-xl w-fit" style={{ background: "var(--surface-2)", border: "1px solid var(--border)" }}>
        {([["config", "Configuração", <Bot size={12} key="b" />], ["logs", "Logs de Execução", <ClipboardList size={12} key="l" />]] as const).map(([id, label, icon]) => (
          <button key={id} onClick={() => setLogsTab(id)}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-xs transition-all"
            style={{ background: logsTab === id ? "rgba(29,182,160,0.12)" : "transparent", color: logsTab === id ? "#1DB6A0" : "var(--z-dim)", fontWeight: logsTab === id ? 500 : 400 }}>
            {icon}{label}
          </button>
        ))}
      </div>

      {logsTab === "config" && (
        <div className="rounded-2xl p-5 space-y-4" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)" }}>
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Bot size={15} style={{ color: form.ai_enabled ? "#1DB6A0" : undefined }} className={form.ai_enabled ? "" : "text-z-dim"} />
              <span className="text-sm font-medium text-z-text">Agente de IA</span>
            </div>
            <button onClick={() => setForm((f) => ({ ...f, ai_enabled: !f.ai_enabled }))}>
              {form.ai_enabled ? <ToggleRight size={22} style={{ color: "#1DB6A0" }} /> : <ToggleLeft size={22} className="text-z-faint" />}
            </button>
          </div>

          <div className="grid grid-cols-2 gap-3">
            <Field label="Nome do agente" value={form.ai_agent_name} onChange={(v) => setForm((f) => ({ ...f, ai_agent_name: v }))} placeholder="Assistente" />
            <div>
              <label className="text-xs text-z-dim block mb-1.5">
                Modelo LLM (OpenRouter)
                {modelsLoading && <span className="ml-1 text-z-faint"> · carregando...</span>}
                {modelsError && <span className="ml-1" style={{ color: "#e05555" }}> · {modelsError}</span>}
                {models.length > 0 && <span className="ml-1 text-z-faint"> · {models.length} modelos</span>}
              </label>
              <select value={form.ai_model} onChange={(e) => setForm((f) => ({ ...f, ai_model: e.target.value }))}
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
                style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }}>
                {models.length === 0 ? (
                  <option value={form.ai_model}>{form.ai_model || "— insira a chave para carregar —"}</option>
                ) : (
                  Object.entries(models.reduce<Record<string, OpenRouterModel[]>>((acc, m) => {
                    const provider = m.id.split("/")[0] ?? "other";
                    (acc[provider] ??= []).push(m); return acc;
                  }, {})).sort(([a], [b]) => a.localeCompare(b)).map(([provider, list]) => (
                    <optgroup key={provider} label={provider}>
                      {list.map((m) => <option key={m.id} value={m.id}>{m.name ?? m.id}</option>)}
                    </optgroup>
                  ))
                )}
              </select>
            </div>
          </div>

          <Field label="Chave OpenRouter API" value={form.ai_openai_key}
            onChange={(v) => setForm((f) => ({ ...f, ai_openai_key: v }))}
            placeholder="sk-or-..." mono type={showKey ? "text" : "password"}>
            <button type="button" onClick={() => setShowKey((p) => !p)} className="text-z-faint hover:text-z-dim">
              {showKey ? <EyeOff size={14} /> : <Eye size={14} />}
            </button>
          </Field>

          <div>
            <label className="text-xs text-z-dim block mb-1.5">System Prompt</label>
            <textarea value={form.ai_system_prompt} onChange={(e) => setForm((f) => ({ ...f, ai_system_prompt: e.target.value }))}
              rows={7} placeholder={`Você é [Nome], assistente virtual da [Clínica]. Responda de forma acolhedora e profissional...`}
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none resize-none font-mono"
              style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }} />
            <p className="text-[10px] text-z-faint mt-1">O agente já recebe contexto automático da clínica (médicos, horários, CRM). Defina personalidade e instruções específicas aqui.</p>
          </div>

          <div className="flex justify-end">
            <motion.button onClick={save} disabled={saving} whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
              className="flex items-center gap-2 px-5 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
              {saving ? <span className="w-3 h-3 rounded-full border-2 border-white border-t-transparent animate-spin" /> : <Save size={14} />}
              {savedMsg || (saving ? "Salvando..." : "Salvar")}
            </motion.button>
          </div>
        </div>
      )}

      {logsTab === "logs" && (
        <div className="rounded-2xl p-4" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)" }}>
          <ClinicExecLogs clinicId={clinicId} />
        </div>
      )}
    </div>
  );
}

// ─── Tabs ─────────────────────────────────────────────────────────────────────
type Tab = "medicos" | "tipos" | "membros" | "whatsapp" | "agente";

// ─── Main page ────────────────────────────────────────────────────────────────
export default function ClinicDetailPage() {
  const params = useParams();
  const router = useRouter();
  const clinicId = params.id as string;

  const [clinic, setClinic] = useState<Clinic | null>(null);
  const [tab, setTab] = useState<Tab>("medicos");
  const [loading, setLoading] = useState(true);

  // doctors
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [doctorTemplates, setDoctorTemplates] = useState<Record<string, AvailTemplate[]>>({});
  const [editDoctor, setEditDoctor] = useState<Doctor | null | undefined>(undefined); // undefined = closed, null = new
  const [scheduleDoctor, setScheduleDoctor] = useState<Doctor | null>(null);

  // appt types
  const [apptTypes, setApptTypes] = useState<AppType[]>([]);
  const [editType, setEditType] = useState<AppType | null | undefined>(undefined);

  // members
  const [members, setMembers] = useState<MemberWithProfile[]>([]);
  const [showAddMember, setShowAddMember] = useState(false);
  const [allUsers, setAllUsers] = useState<UserWithClinics[]>([]);

  const loadClinic = useCallback(async () => {
    setLoading(true);
    const [c, docs, types, mems, users] = await Promise.all([
      getClinicById(clinicId),
      getAllDoctors(clinicId),
      getAllAppointmentTypes(clinicId),
      getClinicMembers(clinicId),
      getAllUsers(),
    ]);
    setClinic(c);
    setDoctors(docs);
    setApptTypes(types);
    setMembers(mems);
    setAllUsers(users);
    setLoading(false);
  }, [clinicId]);

  useEffect(() => { loadClinic(); }, [loadClinic]);

  const loadTemplates = async (doctorId: string) => {
    if (doctorTemplates[doctorId]) return;
    const ts = await getAvailabilityTemplates(doctorId);
    setDoctorTemplates((prev) => ({ ...prev, [doctorId]: ts }));
  };

  const [expandedDoctor, setExpandedDoctor] = useState<string | null>(null);
  const toggleExpand = async (doctorId: string) => {
    if (expandedDoctor === doctorId) { setExpandedDoctor(null); return; }
    setExpandedDoctor(doctorId);
    await loadTemplates(doctorId);
  };

  if (loading) {
    return (
      <div className="p-6 space-y-4">
        <div className="h-6 w-48 rounded-xl animate-pulse" style={{ background: "rgba(29,182,160,0.08)" }} />
        <div className="h-4 w-64 rounded-xl animate-pulse" style={{ background: "rgba(29,182,160,0.05)" }} />
      </div>
    );
  }

  if (!clinic) {
    return (
      <div className="p-6">
        <p className="text-sm text-z-dim">Clínica não encontrada.</p>
        <button onClick={() => router.push("/admin/clinicas")} className="mt-3 text-xs text-[#1DB6A0] hover:text-[#22d3c0]">← Voltar</button>
      </div>
    );
  }

  const tabs: { id: Tab; label: string; icon: React.ReactNode }[] = [
    { id: "medicos",  label: "Médicos & Horários", icon: <Stethoscope size={14} /> },
    { id: "tipos",    label: "Tipos de Consulta",  icon: <Calendar size={14} /> },
    { id: "membros",  label: "Membros",             icon: <Users size={14} /> },
    { id: "whatsapp", label: "WhatsApp",            icon: <Wifi size={14} /> },
    { id: "agente",   label: "Agente de IA",        icon: <Bot size={14} /> },
  ];

  const emailMap = new Map(allUsers.map((u) => [u.id, u.email]));

  return (
    <div className="p-6 space-y-5">
      {/* Header */}
      <div className="flex items-center gap-3">
        <button onClick={() => router.push("/admin/clinicas")}
          className="w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:text-z-text hover:bg-[rgba(29,182,160,0.08)] transition-all">
          <ArrowLeft size={16} />
        </button>
        <div className="flex items-center gap-3">
          <div className="w-10 h-10 rounded-xl flex items-center justify-center text-sm font-medium text-white"
            style={{ background: "linear-gradient(135deg, rgba(29,182,160,0.6), rgba(29,182,160,0.9))" }}>
            {clinic.name.slice(0, 2).toUpperCase()}
          </div>
          <div>
            <h1 className="text-xl text-z-text" style={{ fontWeight: 500, letterSpacing: "-0.02em" }}>{clinic.name}</h1>
            <p className="text-xs text-z-dim">{clinic.slug} · {clinic.plan}</p>
          </div>
        </div>
        <button onClick={loadClinic} className="ml-auto w-8 h-8 rounded-xl flex items-center justify-center text-z-dim hover:bg-[rgba(29,182,160,0.08)] transition-all">
          <RefreshCw size={14} />
        </button>
      </div>

      {/* Tabs */}
      <div className="flex gap-1 p-1 rounded-xl" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)", width: "fit-content" }}>
        {tabs.map((t) => (
          <button key={t.id} onClick={() => setTab(t.id)}
            className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg text-sm transition-all"
            style={{
              background: tab === t.id ? "rgba(29,182,160,0.12)" : "transparent",
              color: tab === t.id ? "#1DB6A0" : "var(--z-dim)",
              fontWeight: tab === t.id ? 500 : 400,
            }}>
            {t.icon}{t.label}
          </button>
        ))}
      </div>

      {/* ── Tab: Médicos ──────────────────────────────────────────────────────── */}
      {tab === "medicos" && (
        <div className="space-y-3">
          <div className="flex items-center justify-between">
            <p className="text-sm text-z-dim">{doctors.length} médico{doctors.length !== 1 ? "s" : ""} cadastrado{doctors.length !== 1 ? "s" : ""}</p>
            <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }} onClick={() => setEditDoctor(null)}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs text-white font-medium"
              style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
              <Plus size={12} /> Novo médico
            </motion.button>
          </div>

          <div className="rounded-2xl overflow-hidden" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)" }}>
            {doctors.length === 0 ? (
              <div className="px-5 py-10 text-center">
                <p className="text-sm text-z-dim">Nenhum médico cadastrado</p>
                <button onClick={() => setEditDoctor(null)} className="mt-2 text-xs text-[#1DB6A0] hover:text-[#22d3c0]">+ Adicionar médico</button>
              </div>
            ) : doctors.map((doc, i) => {
              const isExpanded = expandedDoctor === doc.id;
              const templates = doctorTemplates[doc.id] ?? [];
              const activeDays = templates.filter((t) => t.active).map((t) => DAYS[t.day_of_week]).join(", ");
              return (
                <div key={doc.id} className={i < doctors.length - 1 ? "border-b border-border" : ""}>
                  <div className="px-4 py-3 flex items-center gap-3 hover:bg-[rgba(29,182,160,0.02)] transition-colors">
                    <ColorDot color={doc.color} size={10} />
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-2">
                        <p className="text-sm font-medium text-z-text">{doc.name}</p>
                        {!doc.active && <Badge color="#e05555" label="Inativo" />}
                        {doc.specialty && <span className="text-xs text-z-dim">{doc.specialty}</span>}
                      </div>
                      {doc.crm_number && <p className="text-[10px] text-z-faint">CRM {doc.crm_number}</p>}
                    </div>
                    <div className="flex items-center gap-1.5">
                      <button onClick={() => { setScheduleDoctor(doc); loadTemplates(doc.id); }}
                        className="flex items-center gap-1 px-2 py-1 rounded-lg text-xs text-z-dim hover:bg-[rgba(29,182,160,0.08)] transition-all">
                        <Clock size={11} /> Horários
                      </button>
                      <button onClick={() => setEditDoctor(doc)}
                        className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(29,182,160,0.08)] transition-all">
                        <Edit2 size={12} />
                      </button>
                      <button onClick={() => toggleDoctor(doc.id, !doc.active).then(() => setDoctors((prev) => prev.map((d) => d.id === doc.id ? { ...d, active: !d.active } : d)))}
                        className="w-7 h-7 rounded-lg flex items-center justify-center transition-all"
                        style={{ color: doc.active ? "#e05555" : "#1DB6A0" }}
                        title={doc.active ? "Desativar" : "Ativar"}>
                        {doc.active ? <ToggleRight size={15} /> : <ToggleLeft size={15} />}
                      </button>
                      <button onClick={() => toggleExpand(doc.id)}
                        className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(29,182,160,0.08)] transition-all">
                        <motion.div animate={{ rotate: isExpanded ? 90 : 0 }} transition={{ duration: 0.15 }}>
                          <ChevronRight size={13} />
                        </motion.div>
                      </button>
                    </div>
                  </div>
                  <AnimatePresence>
                    {isExpanded && (
                      <motion.div initial={{ height: 0, opacity: 0 }} animate={{ height: "auto", opacity: 1 }} exit={{ height: 0, opacity: 0 }} transition={{ duration: 0.2 }}
                        className="overflow-hidden px-4 pb-3">
                        <div className="rounded-xl p-3" style={{ background: "rgba(29,182,160,0.04)", border: "1px solid rgba(29,182,160,0.1)" }}>
                          {templates.length === 0 ? (
                            <p className="text-xs text-z-dim">Sem horários configurados. <button onClick={() => setScheduleDoctor(doc)} className="text-[#1DB6A0] hover:underline">Configurar</button></p>
                          ) : (
                            <>
                              <p className="text-[10px] text-z-dim mb-2">Dias ativos: <span className="text-z-text">{activeDays || "—"}</span></p>
                              <div className="grid grid-cols-2 gap-1.5">
                                {templates.filter((t) => t.active).map((t) => (
                                  <div key={t.id} className="flex items-center gap-2 text-xs text-z-dim">
                                    <span className="font-medium text-z-text w-7">{DAYS[t.day_of_week]}</span>
                                    <span>{t.start_time}–{t.end_time}</span>
                                    <span className="text-z-faint">{t.slot_duration_min}min</span>
                                  </div>
                                ))}
                              </div>
                            </>
                          )}
                        </div>
                      </motion.div>
                    )}
                  </AnimatePresence>
                </div>
              );
            })}
          </div>
        </div>
      )}

      {/* ── Tab: Tipos de Consulta ────────────────────────────────────────────── */}
      {tab === "tipos" && (
        <div className="space-y-3">
          <div className="flex items-center justify-between">
            <p className="text-sm text-z-dim">{apptTypes.filter((t) => t.active).length} tipo{apptTypes.filter((t) => t.active).length !== 1 ? "s" : ""} ativo{apptTypes.filter((t) => t.active).length !== 1 ? "s" : ""}</p>
            <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }} onClick={() => setEditType(null)}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs text-white font-medium"
              style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
              <Plus size={12} /> Novo tipo
            </motion.button>
          </div>

          <div className="rounded-2xl overflow-hidden" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)" }}>
            {apptTypes.length === 0 ? (
              <div className="px-5 py-10 text-center">
                <p className="text-sm text-z-dim">Nenhum tipo de consulta cadastrado</p>
                <button onClick={() => setEditType(null)} className="mt-2 text-xs text-[#1DB6A0] hover:text-[#22d3c0]">+ Adicionar tipo</button>
              </div>
            ) : apptTypes.map((at, i) => (
              <div key={at.id} className={`px-4 py-3 flex items-center gap-3 hover:bg-[rgba(29,182,160,0.02)] transition-colors ${i < apptTypes.length - 1 ? "border-b border-border" : ""}`}>
                <ColorDot color={at.color} size={10} />
                <div className="flex-1">
                  <div className="flex items-center gap-2">
                    <p className="text-sm font-medium text-z-text">{at.name}</p>
                    {!at.active && <Badge color="#e05555" label="Inativo" />}
                  </div>
                  <p className="text-xs text-z-dim">{at.duration_minutes} min</p>
                </div>
                <div className="flex items-center gap-1.5">
                  <button onClick={() => setEditType(at)}
                    className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(29,182,160,0.08)] transition-all">
                    <Edit2 size={12} />
                  </button>
                  <button onClick={() => updateAppointmentType(at.id, { active: !at.active }).then(() => setApptTypes((prev) => prev.map((t) => t.id === at.id ? { ...t, active: !t.active } : t)))}
                    className="w-7 h-7 rounded-lg flex items-center justify-center transition-all"
                    style={{ color: at.active ? "#e05555" : "#1DB6A0" }}
                    title={at.active ? "Desativar" : "Ativar"}>
                    {at.active ? <ToggleRight size={15} /> : <ToggleLeft size={15} />}
                  </button>
                </div>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* ── Tab: Membros ──────────────────────────────────────────────────────── */}
      {tab === "membros" && (
        <div className="space-y-3">
          <div className="flex items-center justify-between">
            <p className="text-sm text-z-dim">{members.length} membro{members.length !== 1 ? "s" : ""}</p>
            <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }} onClick={() => setShowAddMember(true)}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs text-white font-medium"
              style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}>
              <Plus size={12} /> Adicionar membro
            </motion.button>
          </div>

          <div className="rounded-2xl overflow-hidden" style={{ background: "var(--surface-1)", border: "1px solid rgba(29,182,160,0.1)" }}>
            {members.length === 0 ? (
              <div className="px-5 py-10 text-center">
                <p className="text-sm text-z-dim">Nenhum membro</p>
                <button onClick={() => setShowAddMember(true)} className="mt-2 text-xs text-[#1DB6A0] hover:text-[#22d3c0]">+ Adicionar membro</button>
              </div>
            ) : members.map((m, i) => (
              <div key={m.id} className={`px-4 py-3 flex items-center gap-3 hover:bg-[rgba(29,182,160,0.02)] transition-colors ${i < members.length - 1 ? "border-b border-border" : ""}`}>
                <div className="w-8 h-8 rounded-full flex items-center justify-center text-xs font-medium text-white"
                  style={{ background: "linear-gradient(135deg, rgba(29,182,160,0.5), rgba(29,182,160,0.8))" }}>
                  {(m.profile?.full_name ?? "?").slice(0, 2).toUpperCase()}
                </div>
                <div className="flex-1 min-w-0">
                  <p className="text-sm font-medium text-z-text truncate">{m.profile?.full_name ?? m.user_id}</p>
                  <div className="flex items-center gap-2 mt-0.5">
                    <p className="text-xs text-z-dim flex items-center gap-1">
                      <Mail size={9} className="shrink-0" />
                      {emailMap.get(m.user_id) ?? <span className="text-z-faint">—</span>}
                    </p>
                    <span className="text-[10px] text-z-faint">· desde {new Date(m.invited_at).toLocaleDateString("pt-BR")}</span>
                  </div>
                </div>
                <select value={m.role}
                  onChange={async (e) => {
                    await updateMemberRole(m.user_id, clinicId, e.target.value);
                    setMembers((prev) => prev.map((x) => x.user_id === m.user_id ? { ...x, role: e.target.value } : x));
                  }}
                  className="text-xs rounded-lg px-2 py-1.5 text-z-text outline-none"
                  style={{ background: "var(--input)", border: "1px solid rgba(29,182,160,0.15)" }}>
                  {CLINIC_MEMBER_ROLE_OPTIONS.map((option) => (
                    <option key={option.value} value={option.value}>{option.label}</option>
                  ))}
                </select>
                <button onClick={async () => {
                  await removeClinicMember(m.user_id, clinicId);
                  setMembers((prev) => prev.filter((x) => x.user_id !== m.user_id));
                }}
                  className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#e05555] hover:bg-[rgba(224,85,85,0.08)] transition-all">
                  <UserMinus size={12} />
                </button>
              </div>
            ))}
          </div>
        </div>
      )}

      {/* ── Tab: WhatsApp ─────────────────────────────────────────────────────── */}
      {tab === "whatsapp" && <WhatsappTab clinicId={clinicId} />}

      {/* ── Tab: Agente de IA ─────────────────────────────────────────────────── */}
      {tab === "agente" && <AgenteTab clinicId={clinicId} />}

      {/* ── Modals ─────────────────────────────────────────────────────────────── */}
      <AnimatePresence>
        {editDoctor !== undefined && (
          <DoctorModal
            doctor={editDoctor ?? undefined}
            clinicId={clinicId}
            onClose={() => setEditDoctor(undefined)}
            onSaved={(d) => {
              setDoctors((prev) => {
                const idx = prev.findIndex((x) => x.id === d.id);
                return idx >= 0 ? prev.map((x) => x.id === d.id ? d : x) : [d, ...prev];
              });
            }}
          />
        )}
        {scheduleDoctor && (
          <ScheduleModal
            doctor={scheduleDoctor}
            clinicId={clinicId}
            templates={doctorTemplates[scheduleDoctor.id] ?? []}
            onClose={() => setScheduleDoctor(null)}
            onSaved={(ts) => setDoctorTemplates((prev) => ({ ...prev, [scheduleDoctor.id]: ts }))}
          />
        )}
        {editType !== undefined && (
          <ApptTypeModal
            type={editType ?? undefined}
            clinicId={clinicId}
            onClose={() => setEditType(undefined)}
            onSaved={(t) => {
              setApptTypes((prev) => {
                const idx = prev.findIndex((x) => x.id === t.id);
                return idx >= 0 ? prev.map((x) => x.id === t.id ? t : x) : [t, ...prev];
              });
            }}
          />
        )}
        {showAddMember && (
          <AddMemberModal
            clinicId={clinicId}
            existingIds={members.map((m) => m.user_id)}
            onClose={() => setShowAddMember(false)}
            onAdded={(m) => setMembers((prev) => [...prev, m])}
          />
        )}
      </AnimatePresence>
    </div>
  );
}
