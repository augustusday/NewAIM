"use client";

import { useState, useEffect } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  ChevronLeft,
  ChevronRight,
  Plus,
  Clock,
  User,
  Stethoscope,
  CalendarDays,
  Filter,
  X,
  AlertCircle,
  CheckCircle,
  XCircle,
  RotateCcw,
  Settings2,
  Save,
  RefreshCw,
  UserPlus,
  Pencil,
  Trash2,
  Upload,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { supabase } from "@/lib/supabase";
import { useClinic } from "@/hooks/use-clinic";
import {
  getAppointmentsForDate,
  getAppointmentsForWeek,
  getDoctors,
  getAppointmentTypes,
  createAppointment,
  updateAppointmentStatus,
  getAvailabilityTemplates,
  upsertAvailabilityTemplate,
  getAvailableSlots,
  createAppointmentType,
  updateAppointmentType,
  deleteAppointmentType,
  createDoctor,
  updateDoctor,
  deleteDoctor,
  type AppointmentFull,
} from "@/lib/db/agenda";
import type { Doctor, AppointmentType, AvailabilityTemplate } from "@/lib/database.types";

const DAYS = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];
const MONTHS = [
  "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
  "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro",
];

const HOURS = Array.from({ length: 10 }, (_, i) => `${String(i + 8).padStart(2, "0")}:00`);
const CELL_HEIGHT = 60;

interface Appointment {
  id: string;
  patient: string;
  type: string;
  doctor: string;
  doctorId: string;
  doctorColor: string;
  time: string;
  endTime: string;
  status: string;
  notes?: string;
  hour: number;
  duration: number;
  date: string;
}

const statusColors: Record<string, string> = {
  confirmed:   "#019A67",
  scheduled:   "#f59e0b",
  cancelled:   "#e05555",
  completed:   "#6b8f78",
  in_progress: "#01c47f",
  no_show:     "#e05555",
};

const statusLabels: Record<string, string> = {
  confirmed:   "Confirmado",
  scheduled:   "Agendado",
  cancelled:   "Cancelado",
  completed:   "Concluído",
  in_progress: "Em atendimento",
  no_show:     "Não compareceu",
};

function timeToDecimal(t: string): number {
  const [h, m] = t.split(":").map(Number);
  return h + m / 60;
}

function addMinutes(time: string, mins: number): string {
  const [h, m] = time.split(":").map(Number);
  const total = h * 60 + m + mins;
  return `${String(Math.floor(total / 60)).padStart(2, "0")}:${String(total % 60).padStart(2, "0")}`;
}

function mapAppointment(a: AppointmentFull): Appointment {
  const startH = timeToDecimal(a.start_time);
  const endH   = timeToDecimal(a.end_time);
  return {
    id:          a.id,
    patient:     a.patient_name,
    type:        a.type_name_snapshot ?? a.appointment_type?.name ?? "Consulta",
    doctor:      a.doctor?.name ?? "—",
    doctorId:    a.doctor?.id ?? "",
    doctorColor: a.doctor?.color ?? "#019A67",
    time:        a.start_time.slice(0, 5),
    endTime:     a.end_time.slice(0, 5),
    status:      a.status,
    notes:       a.notes ?? undefined,
    hour:        startH,
    duration:    Math.max(endH - startH, 0.25),
    date:        a.scheduled_date,
  };
}

function getDaysInMonth(year: number, month: number) {
  return new Date(year, month + 1, 0).getDate();
}

function getFirstDayOfMonth(year: number, month: number) {
  return new Date(year, month, 1).getDay();
}

function getWeekDates(year: number, month: number, day: number): string[] {
  const date = new Date(year, month, day);
  const dow  = date.getDay();
  return Array.from({ length: 7 }, (_, i) => {
    const d = new Date(date);
    d.setDate(date.getDate() - dow + i);
    return d.toISOString().split("T")[0];
  });
}

// ─── Doctor Availability Modal ─────────────────────────────────────────────────
const DAY_NAMES = ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"];

type TimePeriod = { start: string; end: string };

interface DayConfig {
  active: boolean;
  periods: TimePeriod[];
  slot_duration_min: number;
  id?: string;
}

function DoctorAvailabilityModal({
  clinicId,
  doctor,
  onClose,
}: {
  clinicId: string;
  doctor: Doctor;
  onClose: () => void;
}) {
  const defaultConfig: DayConfig = { active: false, periods: [{ start: "08:00", end: "18:00" }], slot_duration_min: 30 };
  const [days, setDays] = useState<DayConfig[]>(Array.from({ length: 7 }, () => ({ ...defaultConfig, periods: [{ start: "08:00", end: "18:00" }] })));
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  useEffect(() => {
    getAvailabilityTemplates(clinicId, doctor.id).then((templates) => {
      setDays((prev) =>
        prev.map((d, i) => {
          const t = templates.find((t: AvailabilityTemplate) => t.day_of_week === i);
          if (!t) return d;
          const rawPeriods = Array.isArray(t.time_periods) && t.time_periods.length > 0
            ? (t.time_periods as TimePeriod[])
            : [{ start: t.start_time, end: t.end_time }];
          return { active: t.active, periods: rawPeriods, slot_duration_min: t.slot_duration_min, id: t.id };
        })
      );
      setLoading(false);
    });
  }, [clinicId, doctor.id]);

  const updateDay = (i: number, patch: Partial<DayConfig>) =>
    setDays((prev) => prev.map((d, idx) => idx === i ? { ...d, ...patch } : d));

  const updatePeriod = (dayIdx: number, periodIdx: number, patch: Partial<TimePeriod>) =>
    setDays((prev) => prev.map((d, i) => {
      if (i !== dayIdx) return d;
      const periods = d.periods.map((p, pi) => pi === periodIdx ? { ...p, ...patch } : p);
      return { ...d, periods };
    }));

  const addPeriod = (dayIdx: number) =>
    setDays((prev) => prev.map((d, i) => i !== dayIdx ? d : { ...d, periods: [...d.periods, { start: "14:00", end: "18:00" }] }));

  const removePeriod = (dayIdx: number, periodIdx: number) =>
    setDays((prev) => prev.map((d, i) => i !== dayIdx ? d : { ...d, periods: d.periods.filter((_, pi) => pi !== periodIdx) }));

  const handleSave = async () => {
    setSaving(true);
    await Promise.all(
      days.map((d, i) => {
        if (!d.active && !d.id) return Promise.resolve();
        return upsertAvailabilityTemplate(clinicId, doctor.id, i, {
          start_time: d.periods[0]?.start ?? "08:00",
          end_time: d.periods[0]?.end ?? "18:00",
          slot_duration_min: d.slot_duration_min,
          active: d.active,
          time_periods: d.periods,
        });
      })
    );
    setSaving(false);
    setSaved(true);
    setTimeout(() => { setSaved(false); onClose(); }, 900);
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" style={{ background: "rgba(0,0,0,0.6)", backdropFilter: "blur(8px)" }}>
      <motion.div
        initial={{ opacity: 0, scale: 0.96, y: 16 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.96, y: 8 }}
        className="w-full max-w-lg rounded-2xl p-6 space-y-5"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.18)", boxShadow: "0 24px 64px rgba(0,0,0,0.6)" }}
      >
        {/* Header */}
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-xl flex items-center justify-center" style={{ background: `${doctor.color}18`, border: `1px solid ${doctor.color}30` }}>
              <Stethoscope size={14} style={{ color: doctor.color }} />
            </div>
            <div>
              <h3 className="text-sm font-medium" style={{ color: "var(--z-text)" }}>Disponibilidade — {doctor.name}</h3>
              <p className="text-xs" style={{ color: "var(--z-text-dim)" }}>{doctor.specialty}</p>
            </div>
          </div>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-z-text transition-colors" style={{ background: "var(--muted)" }}>
            <X size={14} />
          </button>
        </div>

        {loading ? (
          <div className="flex items-center justify-center py-8">
            <RefreshCw size={18} className="animate-spin text-z-dim" />
          </div>
        ) : (
          <div className="space-y-2 max-h-[60vh] overflow-y-auto pr-1">
            {days.map((day, i) => (
              <div
                key={i}
                className="rounded-xl p-3 transition-all"
                style={{
                  background: day.active ? "rgba(1,154,103,0.06)" : "var(--muted)",
                  border: day.active ? "1px solid rgba(1,154,103,0.15)" : "1px solid var(--border)",
                }}
              >
                <div className="flex items-center gap-3 mb-2">
                  {/* Toggle */}
                  <button
                    onClick={() => updateDay(i, { active: !day.active })}
                    className="w-8 h-4 rounded-full transition-all shrink-0 relative"
                    style={{ background: day.active ? "#019A67" : "rgba(255,255,255,0.1)" }}
                  >
                    <div
                      className="absolute top-0.5 w-3 h-3 rounded-full bg-white transition-all"
                      style={{ left: day.active ? "calc(100% - 14px)" : "2px", boxShadow: "0 1px 4px rgba(0,0,0,0.3)" }}
                    />
                  </button>
                  <span className="text-sm font-medium w-20 shrink-0" style={{ color: day.active ? "var(--z-text)" : "var(--z-text-dim)" }}>
                    {DAY_NAMES[i]}
                  </span>
                  {day.active && (
                    <span className="ml-auto text-[10px] px-2 py-0.5 rounded-lg" style={{ background: "rgba(1,154,103,0.1)", color: "#019A67" }}>
                      {day.slot_duration_min}min/slot
                    </span>
                  )}
                </div>

                {day.active && (
                  <div className="ml-11 mt-2 space-y-1.5">
                    {day.periods.map((period, pi) => (
                      <div key={pi} className="flex items-center gap-2">
                        <Clock size={11} className="text-z-dim shrink-0" />
                        <input
                          type="time"
                          value={period.start}
                          onChange={(e) => updatePeriod(i, pi, { start: e.target.value })}
                          className="text-xs outline-none rounded-lg px-2 py-1.5 flex-1"
                          style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
                        />
                        <span className="text-xs text-z-faint">–</span>
                        <input
                          type="time"
                          value={period.end}
                          onChange={(e) => updatePeriod(i, pi, { end: e.target.value })}
                          className="text-xs outline-none rounded-lg px-2 py-1.5 flex-1"
                          style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
                        />
                        {pi === 0 ? (
                          <select
                            value={day.slot_duration_min}
                            onChange={(e) => updateDay(i, { slot_duration_min: Number(e.target.value) })}
                            className="text-xs outline-none rounded-lg px-2 py-1.5"
                            style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
                          >
                            {[15, 20, 30, 45, 60].map((n) => <option key={n} value={n}>{n}min</option>)}
                          </select>
                        ) : (
                          <button
                            onClick={() => removePeriod(i, pi)}
                            className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:text-red-400 transition-colors"
                            style={{ background: "var(--input)", border: "1px solid var(--border)" }}
                          >
                            <X size={11} />
                          </button>
                        )}
                      </div>
                    ))}
                    <button
                      onClick={() => addPeriod(i)}
                      className="flex items-center gap-1 text-[10px] px-2 py-1 rounded-lg transition-colors mt-0.5"
                      style={{ color: "#019A67", background: "rgba(1,154,103,0.07)", border: "1px dashed rgba(1,154,103,0.3)" }}
                    >
                      <Plus size={10} /> add break
                    </button>
                  </div>
                )}
              </div>
            ))}
          </div>
        )}

        {/* Footer */}
        <div className="flex justify-end gap-2 pt-1">
          <button onClick={onClose} className="px-4 py-2 rounded-xl text-sm transition-all" style={{ background: "var(--muted)", color: "var(--z-text-dim)", border: "1px solid var(--border)" }}>
            Cancelar
          </button>
          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.97 }}
            onClick={handleSave}
            disabled={saving || saved}
            className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium text-white disabled:opacity-70"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 14px rgba(1,154,103,0.25)" }}
          >
            {saving ? <RefreshCw size={13} className="animate-spin" /> : saved ? <CheckCircle size={13} /> : <Save size={13} />}
            {saved ? "Salvo!" : "Salvar disponibilidade"}
          </motion.button>
        </div>
      </motion.div>
    </div>
  );
}

// ─── Doctor Management Modal ───────────────────────────────────────────────────
const DOCTOR_COLORS = ["#019A67","#3b82f6","#8b5cf6","#f59e0b","#e05555","#06b6d4","#ec4899","#10b981"];

interface DoctorForm {
  name: string;
  specialty: string;
  crm_number: string;
  color: string;
  observations: string;
  consultation_fee: string;
  insurance_plans: string;
}

const emptyDoctorForm = (): DoctorForm => ({
  name: "", specialty: "", crm_number: "", color: DOCTOR_COLORS[0],
  observations: "", consultation_fee: "", insurance_plans: "",
});

function DoctorManagementModal({
  clinicId,
  doctors,
  onClose,
  onChanged,
  onSchedule,
}: {
  clinicId: string;
  doctors: Doctor[];
  onClose: () => void;
  onChanged: () => void;
  onSchedule: (doctor: Doctor) => void;
}) {
  const [tab, setTab] = useState<"list" | "add" | "bulk">("list");
  const [list, setList] = useState<Doctor[]>(doctors);
  const [form, setForm] = useState<DoctorForm>(emptyDoctorForm());
  const [editingId, setEditingId] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);
  const [bulkText, setBulkText] = useState("");
  const [bulkResult, setBulkResult] = useState<{ ok: number; errors: string[] } | null>(null);
  const [bulkSaving, setBulkSaving] = useState(false);

  const refresh = async () => {
    const updated = await getDoctors(clinicId);
    setList(updated);
    onChanged();
  };

  const startEdit = (doc: Doctor) => {
    setEditingId(doc.id);
    setForm({
      name: doc.name,
      specialty: doc.specialty ?? "",
      crm_number: doc.crm_number ?? "",
      color: doc.color,
      observations: doc.observations ?? "",
      consultation_fee: doc.consultation_fee != null ? String(doc.consultation_fee) : "",
      insurance_plans: (doc.insurance_plans ?? []).join(", "),
    });
    setTab("add");
  };

  const handleSave = async () => {
    if (!form.name.trim()) return;
    setSaving(true);
    const payload = {
      name: form.name.trim(),
      specialty: form.specialty.trim() || undefined,
      crm_number: form.crm_number.trim() || undefined,
      color: form.color,
      observations: form.observations.trim() || undefined,
      consultation_fee: form.consultation_fee ? parseFloat(form.consultation_fee) : undefined,
      insurance_plans: form.insurance_plans
        ? form.insurance_plans.split(",").map((s) => s.trim()).filter(Boolean)
        : [],
    };
    if (editingId) {
      await updateDoctor(editingId, payload);
    } else {
      await createDoctor(clinicId, payload);
    }
    setSaving(false);
    setForm(emptyDoctorForm());
    setEditingId(null);
    setTab("list");
    await refresh();
  };

  const handleDelete = async (id: string) => {
    await deleteDoctor(id);
    setList((prev) => prev.filter((d) => d.id !== id));
    onChanged();
  };

  const handleBulkImport = async () => {
    const lines = bulkText.split("\n").map((l) => l.trim()).filter(Boolean);
    if (!lines.length) return;
    setBulkSaving(true);
    const errors: string[] = [];
    let ok = 0;
    for (const line of lines) {
      // Format: Nome; Especialidade; CRM; Convênios (separados por |); Valor particular
      const parts = line.split(";").map((p) => p.trim());
      const name = parts[0];
      if (!name) { errors.push(`Linha inválida: "${line}"`); continue; }
      const specialty = parts[1] || undefined;
      const crm_number = parts[2] || undefined;
      const insurance_plans = parts[3] ? parts[3].split("|").map((s) => s.trim()).filter(Boolean) : [];
      const consultation_fee = parts[4] ? parseFloat(parts[4].replace(",", ".")) : undefined;
      const color = DOCTOR_COLORS[ok % DOCTOR_COLORS.length];
      const res = await createDoctor(clinicId, { name, specialty, crm_number, color, insurance_plans, consultation_fee });
      if (res) ok++; else errors.push(`Falha ao importar: "${name}"`);
    }
    setBulkSaving(false);
    setBulkResult({ ok, errors });
    if (ok > 0) await refresh();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4" style={{ background: "rgba(0,0,0,0.6)", backdropFilter: "blur(8px)" }}>
      <motion.div
        initial={{ opacity: 0, scale: 0.96, y: 16 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.96, y: 8 }}
        className="w-full max-w-xl rounded-2xl flex flex-col"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.18)", boxShadow: "0 24px 64px rgba(0,0,0,0.6)", maxHeight: "90vh" }}
      >
        {/* Header */}
        <div className="flex items-center justify-between px-6 py-5 border-b border-border shrink-0">
          <div className="flex items-center gap-3">
            <div className="w-8 h-8 rounded-xl flex items-center justify-center" style={{ background: "rgba(1,154,103,0.12)", border: "1px solid rgba(1,154,103,0.2)" }}>
              <Stethoscope size={14} style={{ color: "#019A67" }} />
            </div>
            <h3 className="text-sm font-medium text-z-text">Gerenciar Médicos</h3>
          </div>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-z-text transition-colors" style={{ background: "var(--muted)" }}>
            <X size={14} />
          </button>
        </div>

        {/* Tabs */}
        <div className="flex gap-1 px-6 pt-4 shrink-0">
          {[
            { key: "list", label: "Médicos cadastrados" },
            { key: "add", label: editingId ? "Editar médico" : "Adicionar médico" },
            { key: "bulk", label: "Importar em lote" },
          ].map((t) => (
            <button key={t.key} onClick={() => { setTab(t.key as typeof tab); if (t.key !== "add") { setEditingId(null); setForm(emptyDoctorForm()); } }}
              className="px-3 py-1.5 rounded-lg text-xs transition-all"
              style={{
                background: tab === t.key ? "rgba(1,154,103,0.15)" : "var(--muted)",
                border: tab === t.key ? "1px solid rgba(1,154,103,0.3)" : "1px solid var(--border)",
                color: tab === t.key ? "#01c47f" : "var(--z-text-dim)",
              }}>
              {t.label}
            </button>
          ))}
        </div>

        <div className="flex-1 overflow-y-auto px-6 py-4">
          {/* LIST TAB */}
          {tab === "list" && (
            <div className="space-y-2">
              {list.length === 0 && (
                <div className="text-center py-10">
                  <Stethoscope size={28} className="text-z-faint mx-auto mb-3" />
                  <p className="text-sm text-z-dim">Nenhum médico cadastrado</p>
                  <button onClick={() => setTab("add")} className="mt-3 text-xs text-[#019A67] hover:text-[#01c47f]">Adicionar o primeiro médico →</button>
                </div>
              )}
              {list.map((doc) => (
                <div key={doc.id} className="flex items-center gap-3 px-3 py-3 rounded-xl"
                  style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.08)" }}>
                  <div className="w-3 h-3 rounded-full shrink-0" style={{ background: doc.color }} />
                  <div className="flex-1 min-w-0">
                    <p className="text-sm font-medium text-z-text truncate">{doc.name}</p>
                    <div className="flex items-center gap-2 flex-wrap mt-0.5">
                      {doc.specialty && <span className="text-xs text-z-dim">{doc.specialty}</span>}
                      {doc.crm_number && <span className="text-xs text-z-faint">CRM {doc.crm_number}</span>}
                      {doc.consultation_fee != null && (
                        <span className="text-xs" style={{ color: "#019A67" }}>R$ {Number(doc.consultation_fee).toLocaleString("pt-BR", { minimumFractionDigits: 2 })}</span>
                      )}
                      {(doc.insurance_plans ?? []).length > 0 && (
                        <span className="text-xs text-z-faint">{doc.insurance_plans.join(", ")}</span>
                      )}
                    </div>
                    {doc.observations && <p className="text-xs text-z-faint mt-0.5 truncate">{doc.observations}</p>}
                  </div>
                  <div className="flex items-center gap-1 shrink-0">
                    <button onClick={() => onSchedule(doc)} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] transition-colors" title="Horários">
                      <Clock size={13} />
                    </button>
                    <button onClick={() => startEdit(doc)} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] transition-colors" title="Editar">
                      <Pencil size={13} />
                    </button>
                    <button onClick={() => handleDelete(doc.id)} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#e05555] transition-colors" title="Remover">
                      <Trash2 size={13} />
                    </button>
                  </div>
                </div>
              ))}
              <button onClick={() => setTab("add")}
                className="w-full flex items-center justify-center gap-2 py-2.5 rounded-xl text-sm text-z-dim border border-dashed transition-all hover:text-[#019A67] hover:border-[rgba(1,154,103,0.4)]"
                style={{ borderColor: "var(--border)" }}>
                <Plus size={14} /> Adicionar médico
              </button>
            </div>
          )}

          {/* ADD/EDIT TAB */}
          {tab === "add" && (
            <div className="space-y-3">
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs text-z-dim block mb-1.5">Nome *</label>
                  <input value={form.name} onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))}
                    placeholder="Dr. João Silva"
                    className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                    style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
                </div>
                <div>
                  <label className="text-xs text-z-dim block mb-1.5">Especialidade</label>
                  <input value={form.specialty} onChange={(e) => setForm((f) => ({ ...f, specialty: e.target.value }))}
                    placeholder="Cardiologia"
                    className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                    style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
                </div>
              </div>
              <div className="grid grid-cols-2 gap-3">
                <div>
                  <label className="text-xs text-z-dim block mb-1.5">CRM</label>
                  <input value={form.crm_number} onChange={(e) => setForm((f) => ({ ...f, crm_number: e.target.value }))}
                    placeholder="SP-123456"
                    className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                    style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
                </div>
                <div>
                  <label className="text-xs text-z-dim block mb-1.5">Valor consulta particular (R$)</label>
                  <input value={form.consultation_fee} onChange={(e) => setForm((f) => ({ ...f, consultation_fee: e.target.value }))}
                    placeholder="250,00" type="number" min="0" step="0.01"
                    className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                    style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
                </div>
              </div>
              <div>
                <label className="text-xs text-z-dim block mb-1.5">Convênios aceitos (separados por vírgula)</label>
                <input value={form.insurance_plans} onChange={(e) => setForm((f) => ({ ...f, insurance_plans: e.target.value }))}
                  placeholder="Unimed, Bradesco Saúde, SulAmérica"
                  className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
              </div>
              <div>
                <label className="text-xs text-z-dim block mb-1.5">Observações (opcional)</label>
                <textarea value={form.observations} onChange={(e) => setForm((f) => ({ ...f, observations: e.target.value }))}
                  placeholder="Informações adicionais sobre o médico..." rows={2}
                  className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none resize-none"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }} />
              </div>
              <div>
                <label className="text-xs text-z-dim block mb-1.5">Cor na agenda</label>
                <div className="flex gap-2 flex-wrap">
                  {DOCTOR_COLORS.map((c) => (
                    <button key={c} type="button" onClick={() => setForm((f) => ({ ...f, color: c }))}
                      className="w-7 h-7 rounded-lg transition-all"
                      style={{ background: c, outline: form.color === c ? `2px solid white` : "none", outlineOffset: "2px", boxShadow: form.color === c ? `0 0 8px ${c}80` : "none" }} />
                  ))}
                </div>
              </div>
              <div className="flex gap-2 pt-1">
                <button onClick={() => { setTab("list"); setEditingId(null); setForm(emptyDoctorForm()); }}
                  className="flex-1 py-2.5 rounded-xl text-sm text-z-dim"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
                  Cancelar
                </button>
                <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.97 }}
                  onClick={handleSave} disabled={saving || !form.name.trim()}
                  className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-50"
                  style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
                  {saving ? "Salvando..." : editingId ? "Salvar alterações" : "Cadastrar médico"}
                </motion.button>
              </div>
            </div>
          )}

          {/* BULK TAB */}
          {tab === "bulk" && (
            <div className="space-y-4">
              <div className="px-3 py-3 rounded-xl text-xs text-z-dim space-y-1" style={{ background: "rgba(1,154,103,0.06)", border: "1px solid rgba(1,154,103,0.12)" }}>
                <p className="font-medium text-z-text">Formato por linha:</p>
                <p>Nome; Especialidade; CRM; Convênio 1 | Convênio 2; Valor particular</p>
                <p className="text-z-faint">Exemplo:</p>
                <p className="font-mono text-z-faint">Dr. Ana Lima; Cardiologia; SP-123456; Unimed | Bradesco; 350</p>
                <p className="font-mono text-z-faint">Dr. Pedro Costa; Ortopedia; RJ-789; ; 200</p>
                <p className="text-z-faint">Campos opcionais podem ser deixados em branco (manter o ;)</p>
              </div>
              <div>
                <label className="text-xs text-z-dim block mb-1.5">Cole os dados abaixo (um médico por linha):</label>
                <textarea
                  value={bulkText}
                  onChange={(e) => { setBulkText(e.target.value); setBulkResult(null); }}
                  rows={8}
                  placeholder={"Dr. Ana Lima; Cardiologia; SP-123456; Unimed | Bradesco; 350\nDr. Pedro Costa; Ortopedia; RJ-789; ; 200"}
                  className="w-full px-3 py-2.5 rounded-xl text-sm font-mono text-z-text placeholder:text-z-faint outline-none resize-none"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
                />
              </div>
              {bulkResult && (
                <div className="px-3 py-2.5 rounded-xl text-xs space-y-1"
                  style={{ background: bulkResult.errors.length ? "rgba(224,85,85,0.06)" : "rgba(1,154,103,0.06)", border: `1px solid ${bulkResult.errors.length ? "rgba(224,85,85,0.2)" : "rgba(1,154,103,0.2)"}` }}>
                  <p style={{ color: "#01c47f" }}>{bulkResult.ok} médico(s) importado(s) com sucesso</p>
                  {bulkResult.errors.map((e, i) => <p key={i} style={{ color: "#e05555" }}>{e}</p>)}
                </div>
              )}
              <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.97 }}
                onClick={handleBulkImport} disabled={bulkSaving || !bulkText.trim()}
                className="w-full flex items-center justify-center gap-2 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-50"
                style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
                <Upload size={14} />
                {bulkSaving ? "Importando..." : "Importar médicos"}
              </motion.button>
            </div>
          )}
        </div>
      </motion.div>
    </div>
  );
}

// ─── Appointment Types Modal ───────────────────────────────────────────────────
function AppointmentTypesModal({
  clinicId,
  types,
  onClose,
  onChanged,
}: {
  clinicId: string;
  types: AppointmentType[];
  onClose: () => void;
  onChanged: () => void;
}) {
  const [list, setList] = useState<AppointmentType[]>(types);
  const [newName, setNewName] = useState("");
  const [newDur, setNewDur] = useState(30);
  const [newColor, setNewColor] = useState("#019A67");
  const [saving, setSaving] = useState(false);

  const handleCreate = async () => {
    if (!newName.trim()) return;
    setSaving(true);
    await createAppointmentType(clinicId, { name: newName.trim(), color: newColor, duration_minutes: newDur });
    setNewName(""); setSaving(false);
    onChanged();
    const updated = await getAppointmentTypes(clinicId);
    setList(updated);
  };

  const handleDelete = async (id: string) => {
    await deleteAppointmentType(id);
    setList((prev) => prev.filter((t) => t.id !== id));
    onChanged();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
        className="absolute inset-0 bg-black/50 backdrop-blur-sm" onClick={onClose} />
      <motion.div initial={{ opacity: 0, scale: 0.95, y: 16 }} animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 16 }} transition={{ duration: 0.2 }}
        className="relative w-full max-w-md rounded-2xl p-6 shadow-2xl z-10"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}
      >
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">Tipos de consulta</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all">
            <X size={15} />
          </button>
        </div>

        {/* Existing types */}
        <div className="space-y-2 mb-4 max-h-48 overflow-y-auto">
          {list.length === 0 && <p className="text-xs text-z-faint text-center py-3">Nenhum tipo cadastrado</p>}
          {list.map((t) => (
            <div key={t.id} className="flex items-center justify-between px-3 py-2 rounded-xl"
              style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.08)" }}>
              <div className="flex items-center gap-2.5">
                <div className="w-3 h-3 rounded-full shrink-0" style={{ background: t.color }} />
                <span className="text-sm text-z-text">{t.name}</span>
                <span className="text-xs text-z-faint">{t.duration_minutes}min</span>
              </div>
              <button onClick={() => handleDelete(t.id)} className="p-1 rounded-lg text-z-faint hover:text-[#e05555] transition-colors">
                <X size={13} />
              </button>
            </div>
          ))}
        </div>

        {/* Create new */}
        <div className="space-y-3 pt-3" style={{ borderTop: "1px solid var(--border)" }}>
          <p className="text-xs text-z-dim font-medium">Novo tipo</p>
          <div className="flex gap-2">
            <input
              value={newName}
              onChange={(e) => setNewName(e.target.value)}
              placeholder="Nome do tipo"
              className="flex-1 px-3 py-2 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
            />
            <input type="color" value={newColor} onChange={(e) => setNewColor(e.target.value)}
              className="w-10 h-9 rounded-lg cursor-pointer border-0 p-0.5" style={{ background: "var(--input)" }} />
          </div>
          <div className="flex items-center gap-3">
            <label className="text-xs text-z-dim shrink-0">Duração (min):</label>
            <div className="flex gap-1.5">
              {[15, 30, 45, 60, 90].map((d) => (
                <button key={d} type="button" onClick={() => setNewDur(d)}
                  className="px-2.5 py-1 rounded-lg text-xs transition-all"
                  style={{
                    background: newDur === d ? "rgba(1,154,103,0.15)" : "var(--input)",
                    border: newDur === d ? "1px solid rgba(1,154,103,0.4)" : "1px solid rgba(1,154,103,0.1)",
                    color: newDur === d ? "#01c47f" : "var(--z-text-dim)",
                  }}>
                  {d}
                </button>
              ))}
            </div>
          </div>
          <motion.button whileHover={{ scale: 1.02 }} whileTap={{ scale: 0.98 }}
            onClick={handleCreate} disabled={saving || !newName.trim()}
            className="w-full py-2.5 rounded-xl text-sm font-medium text-white disabled:opacity-50"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
            {saving ? "Salvando..." : "Criar tipo"}
          </motion.button>
        </div>
      </motion.div>
    </div>
  );
}

// ─── New Appointment Dialog ────────────────────────────────────────────────────
function NewAppointmentDialog({
  clinicId,
  doctors,
  appointmentTypes,
  initialDate,
  onClose,
  onCreated,
}: {
  clinicId: string;
  doctors: Doctor[];
  appointmentTypes: AppointmentType[];
  initialDate: string;
  onClose: () => void;
  onCreated: (appt: Appointment) => void;
}) {
  const [form, setForm] = useState({
    patient_name: "",
    patient_phone: "",
    contact_id: "" as string,
    doctor_id: doctors[0]?.id ?? "",
    type_id: appointmentTypes[0]?.id ?? "",
    scheduled_date: initialDate,
    start_time: "09:00",
    notes: "",
  });
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");
  const [availableSlots, setAvailableSlots] = useState<string[]>([]);
  const [loadingSlots, setLoadingSlots] = useState(false);

  // Contact search state
  const [contactSearch, setContactSearch] = useState("");
  const [contactResults, setContactResults] = useState<{ id: string; full_name: string; phone: string | null }[]>([]);
  const [contactSearchOpen, setContactSearchOpen] = useState(false);
  const [contactSearching, setContactSearching] = useState(false);

  // Search contacts when user types
  useEffect(() => {
    const q = contactSearch.trim();
    if (q.length < 2) { setContactResults([]); return; }
    setContactSearching(true);
    const timer = setTimeout(async () => {
      const { data } = await supabase
        .from("contacts")
        .select("id, full_name, phone")
        .eq("clinic_id", clinicId)
        .or(`full_name.ilike.%${q}%,phone.ilike.%${q}%`)
        .order("full_name")
        .limit(6);
      setContactResults(data ?? []);
      setContactSearching(false);
    }, 250);
    return () => clearTimeout(timer);
  }, [contactSearch, clinicId]);

  const selectedType = appointmentTypes.find((t) => t.id === form.type_id);
  const duration = selectedType?.duration_minutes ?? 30;
  const end_time = addMinutes(form.start_time, duration);

  // Load slots when doctor or date changes
  useEffect(() => {
    if (!form.doctor_id || !form.scheduled_date) return;
    setLoadingSlots(true);
    getAvailableSlots(clinicId, form.doctor_id, form.scheduled_date).then((slots) => {
      setAvailableSlots(slots);
      if (slots.length > 0 && !slots.includes(form.start_time)) {
        setForm((f) => ({ ...f, start_time: slots[0] }));
      }
      setLoadingSlots(false);
    });
  }, [form.doctor_id, form.scheduled_date, clinicId]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.patient_name.trim()) { setError("Nome do paciente é obrigatório."); return; }
    if (!form.doctor_id) { setError("Selecione um médico."); return; }
    setSaving(true);
    setError("");

    // If no contact was selected, create one from the typed name/phone
    let contactId = form.contact_id || undefined;
    if (!contactId && form.patient_name.trim()) {
      const { data: newContact } = await supabase
        .from("contacts")
        .insert({
          clinic_id: clinicId,
          full_name: form.patient_name.trim(),
          phone: form.patient_phone.replace(/\D/g, "") || null,
          status: "lead",
        })
        .select("id")
        .single();
      if (newContact) contactId = newContact.id;
    }

    const appt = await createAppointment(clinicId, {
      doctor_id:         form.doctor_id,
      patient_name:      form.patient_name.trim(),
      patient_phone:     form.patient_phone || undefined,
      contact_id:        contactId,
      type_id:           form.type_id || undefined,
      type_name_snapshot: selectedType?.name,
      scheduled_date:    form.scheduled_date,
      start_time:        form.start_time,
      end_time,
      notes:             form.notes || undefined,
    });

    setSaving(false);
    if (!appt) { setError("Erro ao criar agendamento. Tente novamente."); return; }

    // Google Calendar sync (logs result in dev)
    fetch("/api/google-calendar/sync-appointment", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ appointment_id: appt.id, action: "create" }),
    }).then((r) => r.json()).catch((e) => console.error("[GCal sync create error]", e));

    const doctor = doctors.find((d) => d.id === form.doctor_id);
    onCreated({
      id:          appt.id,
      patient:     appt.patient_name,
      type:        selectedType?.name ?? "Consulta",
      doctor:      doctor?.name ?? "—",
      doctorId:    doctor?.id ?? "",
      doctorColor: doctor?.color ?? "#019A67",
      time:        appt.start_time.slice(0, 5),
      endTime:     appt.end_time.slice(0, 5),
      status:      appt.status,
      notes:       appt.notes ?? undefined,
      hour:        timeToDecimal(appt.start_time),
      duration:    Math.max(timeToDecimal(appt.end_time) - timeToDecimal(appt.start_time), 0.25),
      date:        appt.scheduled_date,
    });
    onClose();
  };

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        exit={{ opacity: 0 }}
        className="absolute inset-0 bg-black/50 backdrop-blur-sm"
        onClick={onClose}
      />
      <motion.div
        initial={{ opacity: 0, scale: 0.95, y: 16 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        exit={{ opacity: 0, scale: 0.95, y: 16 }}
        transition={{ duration: 0.2 }}
        className="relative w-full max-w-lg rounded-2xl p-6 shadow-2xl z-10"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}
      >
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">Novo agendamento</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all">
            <X size={15} />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          {/* Contact search */}
          <div className="relative">
            <label className="text-xs text-z-dim mb-1.5 block">Paciente *</label>
            {form.contact_id ? (
              // Selected contact pill
              <div className="flex items-center gap-2 px-3 py-2.5 rounded-xl"
                style={{ background: "rgba(1,154,103,0.08)", border: "1px solid rgba(1,154,103,0.25)" }}>
                <span className="text-sm flex-1" style={{ color: "var(--z-text)" }}>{form.patient_name}</span>
                {form.patient_phone && (
                  <span className="text-xs" style={{ color: "var(--z-text-dim)" }}>{form.patient_phone}</span>
                )}
                <button
                  type="button"
                  onClick={() => setForm((f) => ({ ...f, contact_id: "", patient_name: "", patient_phone: "" }))}
                  className="text-z-dim hover:text-red-400 transition-colors"
                >
                  <X size={13} />
                </button>
              </div>
            ) : (
              <div className="relative">
                <input
                  type="text"
                  value={contactSearch}
                  onChange={(e) => { setContactSearch(e.target.value); setContactSearchOpen(true); }}
                  onFocus={() => setContactSearchOpen(true)}
                  placeholder="Buscar por nome ou telefone..."
                  className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
                />
                {contactSearching && (
                  <RefreshCw size={13} className="absolute right-3 top-1/2 -translate-y-1/2 animate-spin text-z-dim" />
                )}
                {/* Dropdown */}
                {contactSearchOpen && (contactResults.length > 0 || contactSearch.trim().length >= 2) && (
                  <div className="absolute z-20 w-full mt-1 rounded-xl overflow-hidden shadow-lg"
                    style={{ background: "var(--surface-1)", border: "1px solid var(--border)" }}>
                    {contactResults.map((c) => (
                      <button
                        key={c.id}
                        type="button"
                        onClick={() => {
                          setForm((f) => ({ ...f, contact_id: c.id, patient_name: c.full_name, patient_phone: c.phone ?? "" }));
                          setContactSearch("");
                          setContactSearchOpen(false);
                        }}
                        className="w-full flex items-center gap-3 px-3 py-2.5 text-left transition-all"
                        style={{ color: "var(--z-text)" }}
                        onMouseEnter={(e) => (e.currentTarget.style.background = "rgba(1,154,103,0.06)")}
                        onMouseLeave={(e) => (e.currentTarget.style.background = "transparent")}
                      >
                        <div className="w-7 h-7 rounded-full flex items-center justify-center text-xs font-semibold text-white shrink-0"
                          style={{ background: "linear-gradient(135deg,#019A67,#01c47f)" }}>
                          {c.full_name.charAt(0).toUpperCase()}
                        </div>
                        <div className="flex-1 min-w-0">
                          <p className="text-sm truncate">{c.full_name}</p>
                          {c.phone && <p className="text-xs" style={{ color: "var(--z-text-dim)" }}>{c.phone}</p>}
                        </div>
                      </button>
                    ))}
                    {/* Create new option */}
                    {contactSearch.trim().length >= 2 && (
                      <button
                        type="button"
                        onClick={() => {
                          setForm((f) => ({ ...f, patient_name: contactSearch.trim() }));
                          setContactSearch("");
                          setContactSearchOpen(false);
                        }}
                        className="w-full flex items-center gap-2 px-3 py-2.5 text-left text-sm border-t transition-all"
                        style={{ color: "#019A67", borderColor: "var(--border)" }}
                        onMouseEnter={(e) => (e.currentTarget.style.background = "rgba(1,154,103,0.06)")}
                        onMouseLeave={(e) => (e.currentTarget.style.background = "transparent")}
                      >
                        <Plus size={13} />
                        Criar contato "{contactSearch.trim()}"
                      </button>
                    )}
                  </div>
                )}
              </div>
            )}
          </div>

          {/* Phone — only show when contact not selected from CRM */}
          {!form.contact_id && (
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs text-z-dim mb-1.5 block">Telefone</label>
              <input
                type="tel"
                value={form.patient_phone}
                onChange={(e) => setForm((f) => ({ ...f, patient_phone: e.target.value }))}
                placeholder="+55 11 99999-9999"
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
              />
            </div>

            {/* Type */}
            <div>
              <label className="text-xs text-z-dim mb-1.5 block">Tipo de consulta</label>
              <select
                value={form.type_id}
                onChange={(e) => setForm((f) => ({ ...f, type_id: e.target.value }))}
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
              >
                {appointmentTypes.map((t) => (
                  <option key={t.id} value={t.id}>{t.name} ({t.duration_minutes}min)</option>
                ))}
              </select>
            </div>
          </div>
          )}

          {/* Doctor */}
          <div>
            <label className="text-xs text-z-dim mb-1.5 block">Médico *</label>
            <div className="flex gap-2 flex-wrap">
              {doctors.map((doc) => (
                <button
                  key={doc.id}
                  type="button"
                  onClick={() => setForm((f) => ({ ...f, doctor_id: doc.id }))}
                  className="flex items-center gap-2 px-3 py-2 rounded-xl text-xs transition-all"
                  style={{
                    background: form.doctor_id === doc.id ? `${doc.color}15` : "var(--input)",
                    border: form.doctor_id === doc.id ? `1px solid ${doc.color}40` : "1px solid rgba(1,154,103,0.1)",
                    color: form.doctor_id === doc.id ? doc.color : "var(--z-text-dim)",
                  }}
                >
                  <div className="w-2 h-2 rounded-full" style={{ background: doc.color }} />
                  {doc.name}
                </button>
              ))}
            </div>
          </div>

          <div className="grid grid-cols-2 gap-3">
            {/* Date */}
            <div>
              <label className="text-xs text-z-dim mb-1.5 block">Data</label>
              <input
                type="date"
                value={form.scheduled_date}
                onChange={(e) => setForm((f) => ({ ...f, scheduled_date: e.target.value }))}
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
              />
            </div>

            {/* Time */}
            <div>
              <label className="text-xs text-z-dim mb-1.5 block">Horário · término: {end_time}</label>
              {availableSlots.length > 0 ? (
                <div className="flex flex-wrap gap-1.5 max-h-24 overflow-y-auto">
                  {availableSlots.map((slot) => (
                    <button
                      key={slot}
                      type="button"
                      onClick={() => setForm((f) => ({ ...f, start_time: slot }))}
                      className="px-2.5 py-1 rounded-lg text-xs transition-all"
                      style={{
                        background: form.start_time === slot ? "rgba(1,154,103,0.2)" : "var(--input)",
                        border: form.start_time === slot ? "1px solid rgba(1,154,103,0.5)" : "1px solid rgba(1,154,103,0.1)",
                        color: form.start_time === slot ? "#01c47f" : "var(--z-text-dim)",
                      }}
                    >
                      {slot}
                    </button>
                  ))}
                </div>
              ) : (
                <input
                  type="time"
                  value={form.start_time}
                  onChange={(e) => setForm((f) => ({ ...f, start_time: e.target.value }))}
                  min="08:00"
                  max="17:30"
                  step="1800"
                  className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
                  placeholder={loadingSlots ? "Carregando..." : "Sem horários disponíveis"}
                />
              )}
            </div>
          </div>

          {/* Notes */}
          <div>
            <label className="text-xs text-z-dim mb-1.5 block">Observações</label>
            <textarea
              value={form.notes}
              onChange={(e) => setForm((f) => ({ ...f, notes: e.target.value }))}
              placeholder="Informações adicionais..."
              rows={2}
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none resize-none"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
            />
          </div>

          {error && (
            <div className="flex items-center gap-2 text-xs text-[#e05555] px-3 py-2 rounded-xl" style={{ background: "rgba(224,85,85,0.08)" }}>
              <AlertCircle size={13} /> {error}
            </div>
          )}

          <div className="flex gap-2 pt-1">
            <button
              type="button"
              onClick={onClose}
              className="flex-1 py-2.5 rounded-xl text-sm text-z-dim"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
            >
              Cancelar
            </button>
            <motion.button
              type="submit"
              disabled={saving}
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              className="flex-1 py-2.5 rounded-xl text-sm text-white font-medium disabled:opacity-60"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
            >
              {saving ? "Agendando..." : "Confirmar agendamento"}
            </motion.button>
          </div>
        </form>
      </motion.div>
    </div>
  );
}

// ─── Main Page ─────────────────────────────────────────────────────────────────
export default function AgendaPage() {
  const { clinicId, loaded: clinicLoaded } = useClinic();
  const today = new Date();
  const [currentMonth, setCurrentMonth] = useState(today.getMonth());
  const [currentYear, setCurrentYear]   = useState(today.getFullYear());
  const [selectedDay, setSelectedDay]   = useState(today.getDate());
  const [view, setView]                 = useState<"day" | "week">("day");
  const [selectedAppointment, setSelectedAppointment] = useState<Appointment | null>(null);
  const [rawAppointments, setRawAppointments]         = useState<AppointmentFull[]>([]);
  const [doctors, setDoctors]             = useState<Doctor[]>([]);
  const [appointmentTypes, setApptTypes]  = useState<AppointmentType[]>([]);
  const [loading, setLoading]             = useState(true);
  const [showNewDialog, setShowNewDialog] = useState(false);
  const [activeDoctorFilter, setActiveDoctorFilter] = useState<string | null>(null);
  const [updatingStatus, setUpdatingStatus] = useState(false);
  const [localStatusMap, setLocalStatusMap] = useState<Record<string, string>>({});
  const [availabilityDoctor, setAvailabilityDoctor] = useState<Doctor | null>(null);
  const [showTypesModal, setShowTypesModal] = useState(false);
  const [showDoctorsModal, setShowDoctorsModal] = useState(false);

  const selectedDate = new Date(currentYear, currentMonth, selectedDay).toISOString().split("T")[0];
  const weekDates    = getWeekDates(currentYear, currentMonth, selectedDay);

  useEffect(() => {
    if (!clinicLoaded) return;
    getDoctors(clinicId).then(setDoctors);
    getAppointmentTypes(clinicId).then(setApptTypes);
  }, [clinicId, clinicLoaded]);

  useEffect(() => {
    if (!clinicLoaded) return;
    setLoading(true);
    if (view === "day") {
      getAppointmentsForDate(clinicId, selectedDate).then((data) => {
        setRawAppointments(data);
        setLoading(false);
      });
    } else {
      getAppointmentsForWeek(clinicId, weekDates[0], weekDates[6]).then((data) => {
        setRawAppointments(data);
        setLoading(false);
      });
    }
  }, [clinicId, clinicLoaded, selectedDate, view]);

  const daysInMonth = getDaysInMonth(currentYear, currentMonth);
  const firstDay    = getFirstDayOfMonth(currentYear, currentMonth);

  const allAppointments = rawAppointments.map(mapAppointment);
  const dayAppointments = allAppointments
    .filter((a) => a.date === selectedDate)
    .filter((a) => !activeDoctorFilter || a.doctorId === activeDoctorFilter);

  const prevMonth = () => {
    if (currentMonth === 0) { setCurrentMonth(11); setCurrentYear((y) => y - 1); }
    else setCurrentMonth((m) => m - 1);
  };
  const nextMonth = () => {
    if (currentMonth === 11) { setCurrentMonth(0); setCurrentYear((y) => y + 1); }
    else setCurrentMonth((m) => m + 1);
  };
  const prevDay = () => {
    const d = new Date(currentYear, currentMonth, selectedDay - 1);
    setCurrentYear(d.getFullYear()); setCurrentMonth(d.getMonth()); setSelectedDay(d.getDate());
  };
  const nextDay = () => {
    const d = new Date(currentYear, currentMonth, selectedDay + 1);
    setCurrentYear(d.getFullYear()); setCurrentMonth(d.getMonth()); setSelectedDay(d.getDate());
  };

  const getEffectiveStatus = (appt: Appointment) => localStatusMap[appt.id] ?? appt.status;

  const handleStatusUpdate = async (id: string, status: string) => {
    setUpdatingStatus(true);
    await updateAppointmentStatus(id, status);
    setLocalStatusMap((prev) => ({ ...prev, [id]: status }));
    setUpdatingStatus(false);
    if (selectedAppointment?.id === id) {
      setSelectedAppointment((prev) => prev ? { ...prev, status } : prev);
    }
    // Fire-and-forget Google Calendar sync on cancellation
    if (status === "cancelled") {
      fetch("/api/google-calendar/sync-appointment", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ appointment_id: id, action: "delete" }),
      }).catch(() => {});
    }
  };

  const handleAppointmentCreated = (appt: Appointment) => {
    if (appt.date === selectedDate || view === "week") {
      const mockRaw: AppointmentFull = {
        id: appt.id, patient_name: appt.patient, doctor_id: appt.doctorId,
        clinic_id: clinicId, scheduled_date: appt.date, start_time: `${appt.time}:00`,
        end_time: `${appt.endTime}:00`, status: appt.status, source: "manual",
        type_name_snapshot: appt.type, notes: appt.notes ?? null, contact_id: null,
        patient_phone: null, type_id: null, chat_session_id: null, google_event_id: null,
        created_at: new Date().toISOString(), created_by: null, updated_at: new Date().toISOString(),
        doctor: doctors.find((d) => d.id === appt.doctorId)
          ? { id: appt.doctorId, name: appt.doctor, specialty: null, color: appt.doctorColor }
          : null,
        appointment_type: null,
      };
      setRawAppointments((prev) => [...prev, mockRaw]);
    }
  };

  // appointments with dots in mini-calendar
  const datesWithAppts = new Set(allAppointments.map((a) => a.date));

  return (
    <div className="flex h-full">
      {/* ── Left panel ─────────────────────────────────────────────────── */}
      <div
        className="w-64 flex flex-col border-r border-border shrink-0 overflow-y-auto"
        style={{ background: "var(--surface-2)" }}
      >
        {/* Mini calendar */}
        <div className="p-4">
          <div className="flex items-center justify-between mb-4">
            <button onClick={prevMonth} className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
              <ChevronLeft size={13} />
            </button>
            <span className="text-xs font-medium text-z-text">{MONTHS[currentMonth]} {currentYear}</span>
            <button onClick={nextMonth} className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
              <ChevronRight size={13} />
            </button>
          </div>

          <div className="grid grid-cols-7 mb-1">
            {DAYS.map((d) => (
              <div key={d} className="text-center text-[9px] text-z-faint py-1 font-medium">{d[0]}</div>
            ))}
          </div>

          <div className="grid grid-cols-7 gap-0.5">
            {Array.from({ length: firstDay }).map((_, i) => <div key={`e${i}`} />)}
            {Array.from({ length: daysInMonth }).map((_, i) => {
              const day = i + 1;
              const isToday = day === today.getDate() && currentMonth === today.getMonth() && currentYear === today.getFullYear();
              const isSelected = day === selectedDay && currentMonth === currentMonth && currentYear === currentYear;
              const dateStr = new Date(currentYear, currentMonth, day).toISOString().split("T")[0];
              const hasAppt = datesWithAppts.has(dateStr);

              return (
                <motion.button
                  key={day}
                  whileHover={{ scale: 1.1 }}
                  whileTap={{ scale: 0.9 }}
                  onClick={() => setSelectedDay(day)}
                  className={cn(
                    "relative w-7 h-7 rounded-lg text-[11px] flex items-center justify-center mx-auto transition-all duration-200",
                    isSelected ? "text-white font-medium" : isToday ? "text-[#01c47f] font-medium" : "text-z-dim hover:text-z-dim"
                  )}
                  style={
                    isSelected
                      ? { background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 10px rgba(1,154,103,0.3)" }
                      : isToday ? { background: "rgba(1,154,103,0.15)" } : {}
                  }
                >
                  {day}
                  {hasAppt && !isSelected && (
                    <div className="absolute bottom-0.5 left-1/2 -translate-x-1/2 w-1 h-1 rounded-full" style={{ background: "#019A67" }} />
                  )}
                </motion.button>
              );
            })}
          </div>
        </div>

        {/* Doctors filter */}
        <div className="px-4 pb-4">
          <div className="flex items-center gap-2 mb-3">
            <Stethoscope size={12} className="text-z-dim" />
            <span className="text-[10px] text-z-dim uppercase tracking-widest font-medium">Médicos</span>
            {activeDoctorFilter && (
              <button
                onClick={() => setActiveDoctorFilter(null)}
                className="ml-auto text-[10px] text-[#019A67] hover:text-[#01c47f]"
              >
                Limpar
              </button>
            )}
          </div>

          <div className="space-y-1.5">
            {doctors.map((doc) => {
              const count = allAppointments.filter((a) => a.doctorId === doc.id && a.date === selectedDate).length;
              const isActive = activeDoctorFilter === doc.id;
              return (
                <div
                  key={doc.id}
                  className="group w-full flex items-center gap-2.5 px-2 py-2 rounded-xl transition-all"
                  style={{
                    background: isActive ? `${doc.color}12` : "transparent",
                    border: isActive ? `1px solid ${doc.color}30` : "1px solid transparent",
                  }}
                >
                  <button
                    className="flex items-center gap-2 flex-1 text-left"
                    onClick={() => setActiveDoctorFilter(isActive ? null : doc.id)}
                  >
                    <div className="w-3 h-3 rounded-sm shrink-0" style={{ background: doc.color }} />
                    <span className="text-xs text-z-dim flex-1 truncate">{doc.name}</span>
                    <span className="text-[10px] text-z-faint">{count}</span>
                  </button>
                  <button
                    onClick={(e) => { e.stopPropagation(); setAvailabilityDoctor(doc); }}
                    className="w-5 h-5 rounded-md flex items-center justify-center opacity-0 group-hover:opacity-100 transition-all text-z-faint hover:text-[#019A67]"
                    title="Editar disponibilidade"
                  >
                    <Settings2 size={11} />
                  </button>
                </div>
              );
            })}
          </div>
        </div>

        {/* Quick stats */}
        <div className="mt-auto px-4 pb-4">
          <div
            className="rounded-xl p-3 space-y-2"
            style={{ background: "rgba(1,154,103,0.06)", border: "1px solid rgba(1,154,103,0.12)" }}
          >
            <div className="flex items-center justify-between">
              <span className="text-[10px] text-z-dim">Hoje</span>
              <span className="text-xs font-medium text-[#01c47f]">{dayAppointments.length} consultas</span>
            </div>
            <div className="w-full h-1 rounded-full bg-[rgba(1,154,103,0.1)]">
              <motion.div
                initial={{ width: 0 }}
                animate={{ width: `${Math.min((dayAppointments.length / 10) * 100, 100)}%` }}
                transition={{ duration: 0.8, ease: "easeOut" }}
                className="h-full rounded-full"
                style={{ background: "linear-gradient(90deg, #019A67, #01c47f)" }}
              />
            </div>
            <p className="text-[10px] text-z-faint">{Math.max(10 - dayAppointments.length, 0)} horários livres (estimado)</p>
          </div>
        </div>
      </div>

      {/* ── Main calendar ──────────────────────────────────────────────── */}
      <div className="flex-1 flex flex-col overflow-hidden">
        {/* Header */}
        <div
          className="flex items-center justify-between px-6 py-4 border-b border-border shrink-0"
          style={{ background: "var(--surface-2)", backdropFilter: "blur(20px)" }}
        >
          <div className="flex items-center gap-3">
            <div className="flex items-center gap-1">
              <button onClick={prevDay} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                <ChevronLeft size={14} />
              </button>
              <button onClick={nextDay} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all">
                <ChevronRight size={14} />
              </button>
            </div>
            <div>
              <h2 className="text-base font-medium text-z-text">
                {view === "day"
                  ? `${DAYS[new Date(currentYear, currentMonth, selectedDay).getDay()]}, ${selectedDay} de ${MONTHS[currentMonth]}`
                  : `Semana de ${new Date(weekDates[0] + "T12:00:00").getDate()} de ${MONTHS[new Date(weekDates[0] + "T12:00:00").getMonth()]}`}
              </h2>
              <p className="text-xs text-z-dim mt-0.5">
                {view === "day"
                  ? `${dayAppointments.length} consultas agendadas`
                  : `${allAppointments.length} consultas na semana`}
                {activeDoctorFilter && ` · ${doctors.find((d) => d.id === activeDoctorFilter)?.name}`}
              </p>
            </div>
          </div>

          <div className="flex items-center gap-2">
            {/* View toggle */}
            <div
              className="flex items-center p-0.5 rounded-xl"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
            >
              {(["day", "week"] as const).map((v) => (
                <button
                  key={v}
                  onClick={() => setView(v)}
                  className={cn(
                    "px-3 py-1.5 rounded-lg text-xs transition-all duration-200",
                    view === v ? "text-[#01c47f] bg-[rgba(1,154,103,0.15)]" : "text-z-dim hover:text-z-dim"
                  )}
                >
                  {v === "day" ? "Dia" : "Semana"}
                </button>
              ))}
            </div>

            <button
              onClick={() => setActiveDoctorFilter(activeDoctorFilter ? null : doctors[0]?.id ?? null)}
              className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs transition-all"
              style={{
                background: activeDoctorFilter ? "rgba(1,154,103,0.1)" : "var(--input)",
                border: activeDoctorFilter ? "1px solid rgba(1,154,103,0.2)" : "1px solid rgba(1,154,103,0.1)",
                color: activeDoctorFilter ? "#019A67" : "var(--z-text-dim)",
              }}
            >
              <Filter size={12} />
              Filtrar
            </button>

            <button
              onClick={() => setShowDoctorsModal(true)}
              className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-z-dim transition-all"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
            >
              <UserPlus size={14} />
              Médicos
            </button>

            <button
              onClick={() => setShowTypesModal(true)}
              className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-z-dim transition-all"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
            >
              <Settings2 size={14} />
              Tipos
            </button>

            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.98 }}
              onClick={() => setShowNewDialog(true)}
              className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-white font-medium"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.3)" }}
            >
              <Plus size={14} />
              Agendar
            </motion.button>
          </div>
        </div>

        {/* Time grid */}
        <div className="flex-1 overflow-auto">
          {view === "day" ? (
            <DayView
              appointments={dayAppointments}
              localStatusMap={localStatusMap}
              onSelect={setSelectedAppointment}
              selectedId={selectedAppointment?.id}
              today={today}
              selectedDate={selectedDate}
            />
          ) : (
            <WeekView
              weekDates={weekDates}
              allAppointments={allAppointments.filter((a) => !activeDoctorFilter || a.doctorId === activeDoctorFilter)}
              localStatusMap={localStatusMap}
              onSelect={(appt, dateStr) => {
                setSelectedAppointment(appt);
                const d = new Date(dateStr + "T12:00:00");
                setCurrentYear(d.getFullYear());
                setCurrentMonth(d.getMonth());
                setSelectedDay(d.getDate());
              }}
              selectedId={selectedAppointment?.id}
              today={today}
            />
          )}
        </div>
      </div>

      {/* ── Detail panel ────────────────────────────────────────────────── */}
      <AnimatePresence>
        {selectedAppointment && (
          <motion.div
            initial={{ opacity: 0, x: 24 }}
            animate={{ opacity: 1, x: 0 }}
            exit={{ opacity: 0, x: 24 }}
            transition={{ duration: 0.25, ease: "easeOut" }}
            className="w-72 border-l border-border flex flex-col overflow-y-auto shrink-0"
            style={{ background: "var(--surface-1)" }}
          >
            <div className="flex items-center justify-between p-5 border-b border-border">
              <h3 className="text-sm font-medium text-z-text">Detalhes</h3>
              <button
                onClick={() => setSelectedAppointment(null)}
                className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all"
              >
                <X size={14} />
              </button>
            </div>

            <div className="p-5 space-y-5">
              {/* Patient */}
              <div>
                <p className="text-[10px] text-z-faint uppercase tracking-widest mb-2">Paciente</p>
                <div className="flex items-center gap-3">
                  <div
                    className="w-10 h-10 rounded-xl flex items-center justify-center text-sm font-medium text-white"
                    style={{ background: `linear-gradient(135deg, ${selectedAppointment.doctorColor}60, ${selectedAppointment.doctorColor})` }}
                  >
                    {selectedAppointment.patient.trim().split(" ").filter(Boolean).slice(0, 2).map((w) => w[0]).join("")}
                  </div>
                  <div>
                    <p className="text-sm font-medium text-z-text">{selectedAppointment.patient}</p>
                    <p className="text-xs text-z-dim">{selectedAppointment.type}</p>
                  </div>
                </div>
              </div>

              {/* Details */}
              <div className="space-y-3">
                <div className="flex items-center gap-2.5">
                  <Clock size={13} className="text-z-dim" />
                  <span className="text-xs text-z-dim">{selectedAppointment.time} – {selectedAppointment.endTime}</span>
                </div>
                <div className="flex items-center gap-2.5">
                  <User size={13} className="text-z-dim" />
                  <span className="text-xs text-z-dim">{selectedAppointment.doctor}</span>
                </div>
                <div className="flex items-center gap-2.5">
                  <CalendarDays size={13} className="text-z-dim" />
                  <span className="text-xs text-z-dim">
                    {new Date(selectedAppointment.date + "T12:00:00").toLocaleDateString("pt-BR", { day: "numeric", month: "long" })}
                  </span>
                </div>
              </div>

              {/* Status */}
              <div>
                <p className="text-[10px] text-z-faint uppercase tracking-widest mb-2">Status</p>
                {(() => {
                  const effectiveStatus = getEffectiveStatus(selectedAppointment);
                  const color = statusColors[effectiveStatus] ?? "#6b8f78";
                  return (
                    <div
                      className="inline-flex items-center gap-2 px-3 py-1.5 rounded-xl text-xs font-medium"
                      style={{ background: `${color}15`, color, border: `1px solid ${color}30` }}
                    >
                      <div className="w-1.5 h-1.5 rounded-full" style={{ background: color }} />
                      {statusLabels[effectiveStatus] ?? effectiveStatus}
                    </div>
                  );
                })()}
              </div>

              {/* Notes */}
              {selectedAppointment.notes && (
                <div>
                  <p className="text-[10px] text-z-faint uppercase tracking-widest mb-2">Observações</p>
                  <p className="text-xs text-z-dim leading-relaxed">{selectedAppointment.notes}</p>
                </div>
              )}

              {/* Actions */}
              {(() => {
                const effectiveStatus = getEffectiveStatus(selectedAppointment);
                const isCancelled = effectiveStatus === "cancelled";
                const isCompleted = effectiveStatus === "completed";
                if (isCancelled || isCompleted) return null;
                return (
                  <div className="space-y-2 pt-2">
                    {effectiveStatus !== "confirmed" && (
                      <motion.button
                        whileHover={{ scale: 1.02 }}
                        whileTap={{ scale: 0.98 }}
                        disabled={updatingStatus}
                        onClick={() => handleStatusUpdate(selectedAppointment.id, "confirmed")}
                        className="w-full py-2.5 rounded-xl text-sm text-white font-medium flex items-center justify-center gap-2 disabled:opacity-60"
                        style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 12px rgba(1,154,103,0.25)" }}
                      >
                        <CheckCircle size={14} />
                        Confirmar consulta
                      </motion.button>
                    )}
                    {effectiveStatus === "confirmed" && (
                      <motion.button
                        whileHover={{ scale: 1.02 }}
                        whileTap={{ scale: 0.98 }}
                        disabled={updatingStatus}
                        onClick={() => handleStatusUpdate(selectedAppointment.id, "in_progress")}
                        className="w-full py-2.5 rounded-xl text-sm text-white font-medium flex items-center justify-center gap-2 disabled:opacity-60"
                        style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
                      >
                        <CheckCircle size={14} />
                        Iniciar atendimento
                      </motion.button>
                    )}
                    {effectiveStatus === "in_progress" && (
                      <motion.button
                        whileHover={{ scale: 1.02 }}
                        whileTap={{ scale: 0.98 }}
                        disabled={updatingStatus}
                        onClick={() => handleStatusUpdate(selectedAppointment.id, "completed")}
                        className="w-full py-2.5 rounded-xl text-sm text-white font-medium flex items-center justify-center gap-2 disabled:opacity-60"
                        style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
                      >
                        <CheckCircle size={14} />
                        Finalizar atendimento
                      </motion.button>
                    )}
                    <button
                      disabled={updatingStatus}
                      onClick={() => handleStatusUpdate(selectedAppointment.id, "scheduled")}
                      className="w-full py-2.5 rounded-xl text-sm text-z-dim flex items-center justify-center gap-2 transition-all disabled:opacity-60"
                      style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
                    >
                      <RotateCcw size={13} />
                      Reagendar
                    </button>
                    <button
                      disabled={updatingStatus}
                      onClick={() => handleStatusUpdate(selectedAppointment.id, "cancelled")}
                      className="w-full py-2.5 rounded-xl text-sm text-[#e05555] flex items-center justify-center gap-2 hover:bg-[rgba(224,85,85,0.08)] transition-all disabled:opacity-60"
                      style={{ border: "1px solid rgba(224,85,85,0.15)" }}
                    >
                      <XCircle size={13} />
                      Cancelar consulta
                    </button>
                  </div>
                );
              })()}
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* New appointment dialog */}
      <AnimatePresence>
        {showNewDialog && (
          <NewAppointmentDialog
            clinicId={clinicId}
            doctors={doctors}
            appointmentTypes={appointmentTypes}
            initialDate={selectedDate}
            onClose={() => setShowNewDialog(false)}
            onCreated={handleAppointmentCreated}
          />
        )}
        {availabilityDoctor && (
          <DoctorAvailabilityModal
            clinicId={clinicId}
            doctor={availabilityDoctor}
            onClose={() => setAvailabilityDoctor(null)}
          />
        )}
        {showTypesModal && (
          <AppointmentTypesModal
            clinicId={clinicId}
            types={appointmentTypes}
            onClose={() => setShowTypesModal(false)}
            onChanged={() => getAppointmentTypes(clinicId).then(setApptTypes)}
          />
        )}
        {showDoctorsModal && (
          <DoctorManagementModal
            clinicId={clinicId}
            doctors={doctors}
            onClose={() => setShowDoctorsModal(false)}
            onChanged={() => getDoctors(clinicId).then(setDoctors)}
            onSchedule={(doc) => { setShowDoctorsModal(false); setAvailabilityDoctor(doc); }}
          />
        )}
      </AnimatePresence>
    </div>
  );
}

// ─── Day View ──────────────────────────────────────────────────────────────────
function DayView({
  appointments,
  localStatusMap,
  onSelect,
  selectedId,
  today,
  selectedDate,
}: {
  appointments: Appointment[];
  localStatusMap: Record<string, string>;
  onSelect: (a: Appointment) => void;
  selectedId?: string;
  today: Date;
  selectedDate: string;
}) {
  const todayStr = today.toISOString().split("T")[0];
  const isToday  = selectedDate === todayStr;
  const nowHour  = today.getHours() + today.getMinutes() / 60;

  return (
    <div className="flex">
      {/* Time labels */}
      <div className="w-16 shrink-0 border-r border-border">
        {HOURS.map((hour) => (
          <div
            key={hour}
            className="flex items-start justify-end pr-3 pt-1 text-[10px] text-z-faint"
            style={{ height: `${CELL_HEIGHT}px` }}
          >
            {hour}
          </div>
        ))}
      </div>

      {/* Day column */}
      <div className="flex-1 relative">
        {HOURS.map((hour) => (
          <div key={hour} className="border-b border-border" style={{ height: `${CELL_HEIGHT}px` }} />
        ))}

        {/* Current time indicator */}
        {isToday && nowHour >= 8 && nowHour <= 18 && (
          <div
            className="absolute left-0 right-0 pointer-events-none z-10"
            style={{ top: `${(nowHour - 8) * CELL_HEIGHT}px` }}
          >
            <div className="flex items-center gap-0">
              <div className="w-2 h-2 rounded-full shrink-0 ml-1" style={{ background: "#019A67", boxShadow: "0 0 6px rgba(1,154,103,0.6)" }} />
              <div className="flex-1 h-px" style={{ background: "linear-gradient(90deg, #019A67, transparent)" }} />
            </div>
          </div>
        )}

        {/* Appointments */}
        {appointments.map((appt, i) => {
          const effectiveStatus = localStatusMap[appt.id] ?? appt.status;
          const top    = (appt.hour - 8) * CELL_HEIGHT;
          const height = appt.duration * CELL_HEIGHT - 4;
          const color  = appt.doctorColor;

          return (
            <motion.div
              key={appt.id}
              initial={{ opacity: 0, scale: 0.95, x: -8 }}
              animate={{ opacity: 1, scale: 1, x: 0 }}
              transition={{ delay: i * 0.06, duration: 0.3 }}
              onClick={() => onSelect(appt)}
              className="absolute left-3 right-3 rounded-xl px-3 py-2 cursor-pointer overflow-hidden group"
              style={{
                top:        `${top + 2}px`,
                height:     `${height}px`,
                background: selectedId === appt.id ? `${color}20` : `${color}12`,
                border:     `1px solid ${color}30`,
                borderLeft: `3px solid ${color}`,
              }}
              whileHover={{ scale: 1.01, background: `${color}20` }}
            >
              <div className="flex items-center justify-between h-full">
                <div className="min-w-0">
                  <p className="text-xs font-medium truncate" style={{ color }}>
                    {appt.patient}
                  </p>
                  {height > 30 && (
                    <p className="text-[10px] text-z-dim truncate">
                      {appt.type} · {appt.time}
                    </p>
                  )}
                </div>
                <div
                  className="text-[10px] px-1.5 py-0.5 rounded font-medium shrink-0 ml-2"
                  style={{ background: `${statusColors[effectiveStatus]}18`, color: statusColors[effectiveStatus] }}
                >
                  {effectiveStatus === "confirmed" ? "✓" : effectiveStatus === "cancelled" ? "✕" : effectiveStatus === "completed" ? "✔" : "…"}
                </div>
              </div>
            </motion.div>
          );
        })}
      </div>
    </div>
  );
}

// ─── Week View ─────────────────────────────────────────────────────────────────
function WeekView({
  weekDates,
  allAppointments,
  localStatusMap,
  onSelect,
  selectedId,
  today,
}: {
  weekDates: string[];
  allAppointments: Appointment[];
  localStatusMap: Record<string, string>;
  onSelect: (a: Appointment, date: string) => void;
  selectedId?: string;
  today: Date;
}) {
  const todayStr = today.toISOString().split("T")[0];

  return (
    <div className="flex">
      {/* Time labels */}
      <div className="w-14 shrink-0 border-r border-border">
        <div style={{ height: "40px" }} />
        {HOURS.map((hour) => (
          <div
            key={hour}
            className="flex items-start justify-end pr-2 pt-1 text-[10px] text-z-faint"
            style={{ height: `${CELL_HEIGHT}px` }}
          >
            {hour}
          </div>
        ))}
      </div>

      {/* Day columns */}
      <div className="flex-1 overflow-x-auto">
        <div className="flex min-w-0" style={{ minWidth: "560px" }}>
          {weekDates.map((dateStr) => {
            const d       = new Date(dateStr + "T12:00:00");
            const isToday = dateStr === todayStr;
            const appts   = allAppointments.filter((a) => a.date === dateStr);
            const nowHour = today.getHours() + today.getMinutes() / 60;

            return (
              <div key={dateStr} className="flex-1 flex flex-col border-r border-border min-w-0">
                {/* Day header */}
                <div
                  className="h-10 flex flex-col items-center justify-center border-b border-border shrink-0"
                  style={{ background: isToday ? "rgba(1,154,103,0.06)" : "transparent" }}
                >
                  <span className="text-[9px] text-z-faint">{DAYS[d.getDay()]}</span>
                  <span
                    className={cn("text-xs font-medium", isToday ? "text-[#01c47f]" : "text-z-dim")}
                  >
                    {d.getDate()}
                  </span>
                </div>

                {/* Grid */}
                <div className="relative">
                  {HOURS.map((hour) => (
                    <div key={hour} className="border-b border-border" style={{ height: `${CELL_HEIGHT}px` }} />
                  ))}

                  {/* Current time */}
                  {isToday && nowHour >= 8 && nowHour <= 18 && (
                    <div
                      className="absolute left-0 right-0 pointer-events-none z-10"
                      style={{ top: `${(nowHour - 8) * CELL_HEIGHT}px` }}
                    >
                      <div className="h-px" style={{ background: "#019A67" }} />
                    </div>
                  )}

                  {/* Appointments */}
                  {appts.map((appt, i) => {
                    const effectiveStatus = localStatusMap[appt.id] ?? appt.status;
                    const top    = (appt.hour - 8) * CELL_HEIGHT;
                    const height = appt.duration * CELL_HEIGHT - 2;
                    const color  = appt.doctorColor;

                    return (
                      <motion.div
                        key={appt.id}
                        initial={{ opacity: 0 }}
                        animate={{ opacity: 1 }}
                        transition={{ delay: i * 0.04 }}
                        onClick={() => onSelect(appt, dateStr)}
                        className="absolute left-1 right-1 rounded-lg px-1.5 py-1 cursor-pointer overflow-hidden"
                        style={{
                          top:        `${top + 1}px`,
                          height:     `${height}px`,
                          background: selectedId === appt.id ? `${color}25` : `${color}15`,
                          borderLeft: `2px solid ${color}`,
                          border:     selectedId === appt.id ? `1px solid ${color}40` : undefined,
                        }}
                        whileHover={{ background: `${color}25` }}
                      >
                        <p className="text-[10px] font-medium truncate" style={{ color }}>
                          {appt.patient.split(" ")[0]}
                        </p>
                        {height > 28 && (
                          <p className="text-[9px] text-z-faint truncate">{appt.time}</p>
                        )}
                      </motion.div>
                    );
                  })}
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
