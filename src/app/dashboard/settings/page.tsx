"use client";

import { useState, useEffect, useCallback } from "react";
import { useSearchParams } from "next/navigation";
import { Suspense } from "react";
import { motion, AnimatePresence } from "framer-motion";
import {
  Wifi,
  WifiOff,
  RefreshCw,
  Save,
  Trash2,
  AlertCircle,
  Clock,
  Check,
  Building2,
  MapPin,
  Users,
  CalendarDays,
  Stethoscope,
  Plus,
  Pencil,
  X,
  Calendar,
  Link2,
  Link2Off,
  KeyRound,
  Eye,
  EyeOff,
} from "lucide-react";
import { useUazapiConfig } from "@/hooks/use-uazapi-config";
import { useClinic } from "@/hooks/use-clinic";
import { uazapi, type UazapiInstance } from "@/lib/uazapi";
import { supabase } from "@/lib/supabase";
import type { AppointmentType } from "@/lib/database.types";
import type { Doctor } from "@/lib/database.types";

type ConnectionStatus = "idle" | "loading" | "connected" | "connecting" | "disconnected" | "error";

type Tab = "perfil" | "usuarios" | "horarios" | "tipos" | "whatsapp" | "google" | "conta";

const TABS: { id: Tab; label: string; icon: React.ReactNode }[] = [
  { id: "perfil",    label: "Perfil",       icon: <Building2 size={14} /> },
  { id: "usuarios",  label: "Usuários",     icon: <Users size={14} /> },
  { id: "horarios",  label: "Horários",     icon: <Clock size={14} /> },
  { id: "tipos",     label: "Consultas",    icon: <Stethoscope size={14} /> },
  { id: "whatsapp",  label: "WhatsApp",     icon: <Wifi size={14} /> },
  { id: "google",    label: "Google",       icon: <Calendar size={14} /> },
  { id: "conta",     label: "Conta",        icon: <KeyRound size={14} /> },
];

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

const DAYS = [
  { key: "mon", label: "Segunda" },
  { key: "tue", label: "Terça" },
  { key: "wed", label: "Quarta" },
  { key: "thu", label: "Quinta" },
  { key: "fri", label: "Sexta" },
  { key: "sat", label: "Sábado" },
  { key: "sun", label: "Domingo" },
] as const;

const COLOR_PRESETS = [
  "#1DB6A0", "#22d3c0", "#3b82f6", "#8b5cf6", "#f59e0b",
  "#ef4444", "#ec4899", "#06b6d4", "#84cc16", "#f97316",
];

type DayKey = (typeof DAYS)[number]["key"];
type TimePeriod = { start: string; end: string };
type BusinessHours = Partial<Record<DayKey, TimePeriod[]>>;

type MemberRow = {
  id: string;
  role: string;
  joined_at: string | null;
  profiles: { full_name: string } | null;
};

// ── Sub-components ─────────────────────────────────────────────────────────────

function CardShell({ children, delay = 0 }: { children: React.ReactNode; delay?: number }) {
  return (
    <motion.div
      initial={{ opacity: 0, y: 16 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ delay }}
      className="rounded-2xl p-6 space-y-5"
      style={{ background: "var(--surface-1)", border: "1px solid var(--border)", boxShadow: "var(--z-shadow)" }}
    >
      {children}
    </motion.div>
  );
}

function SectionHeader({ icon, title, subtitle }: { icon: React.ReactNode; title: string; subtitle: string }) {
  return (
    <div className="flex items-center gap-3">
      <div className="w-8 h-8 rounded-xl flex items-center justify-center shrink-0"
        style={{ background: "rgba(29,182,160,0.1)", border: "1px solid rgba(29,182,160,0.2)" }}>
        <span style={{ color: "#1DB6A0" }}>{icon}</span>
      </div>
      <div>
        <h2 className="text-sm font-medium" style={{ color: "var(--z-text)" }}>{title}</h2>
        <p className="text-xs mt-0.5" style={{ color: "var(--z-text-dim)" }}>{subtitle}</p>
      </div>
    </div>
  );
}

function SaveButton({ saving, saved, onClick }: { saving: boolean; saved: boolean; onClick: () => void }) {
  return (
    <motion.button
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.97 }}
      onClick={onClick}
      disabled={saving}
      className="flex items-center gap-2 px-4 py-2.5 rounded-xl text-sm font-medium text-white disabled:opacity-60"
      style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)", boxShadow: "0 0 16px rgba(29,182,160,0.25)" }}
    >
      {saving ? <RefreshCw size={14} className="animate-spin" /> : saved ? <Check size={14} /> : <Save size={14} />}
      {saved ? "Salvo!" : "Salvar"}
    </motion.button>
  );
}

// ── Tab: Perfil ────────────────────────────────────────────────────────────────

function TabPerfil({ clinicId }: { clinicId: string }) {
  const [name, setName] = useState("");
  const [address, setAddress] = useState("");
  const [timezone, setTimezone] = useState("America/Sao_Paulo");
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);

  useEffect(() => {
    supabase.from("clinics").select("name, timezone, address").eq("id", clinicId).single()
      .then(({ data }) => {
        if (data) {
          setName(data.name);
          setTimezone(data.timezone ?? "America/Sao_Paulo");
          setAddress(data.address ?? "");
        }
      });
  }, [clinicId]);

  const handleSave = async () => {
    if (!name.trim()) return;
    setSaving(true);
    await supabase.from("clinics").update({
      name: name.trim(),
      timezone,
      address: address.trim() || null,
      updated_at: new Date().toISOString(),
    }).eq("id", clinicId);
    setSaving(false);
    setSaved(true);
    setTimeout(() => setSaved(false), 2500);
  };

  const inputStyle = {
    background: "var(--input)",
    border: "1px solid var(--border)",
    color: "var(--z-text)",
  };

  return (
    <CardShell>
      <SectionHeader icon={<Building2 size={15} />} title="Perfil da Clínica" subtitle="Nome, endereço e fuso horário" />

      <div className="space-y-3">
        <div>
          <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>Nome da clínica</label>
          <input
            type="text"
            placeholder="Nome da clínica"
            value={name}
            onChange={(e) => setName(e.target.value)}
            className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
            style={inputStyle}
            onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(29,182,160,0.5)")}
            onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
          />
        </div>

        <div>
          <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>
            <span className="flex items-center gap-1.5"><MapPin size={11} /> Endereço</span>
          </label>
          <input
            type="text"
            placeholder="Rua, número, bairro, cidade — UF"
            value={address}
            onChange={(e) => setAddress(e.target.value)}
            className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
            style={inputStyle}
            onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(29,182,160,0.5)")}
            onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
          />
          <p className="text-[10px] mt-1" style={{ color: "var(--z-text-faint)" }}>
            Usado pelo agente de IA ao responder sobre localização da clínica.
          </p>
        </div>

        <div>
          <label className="block text-xs font-medium mb-1.5" style={{ color: "var(--z-text-dim)" }}>
            <span className="flex items-center gap-1.5"><Clock size={11} /> Fuso horário</span>
          </label>
          <select
            value={timezone}
            onChange={(e) => setTimezone(e.target.value)}
            className="w-full px-3 py-2.5 rounded-xl text-sm outline-none transition-all"
            style={inputStyle}
          >
            {TIMEZONES.map((tz) => (
              <option key={tz} value={tz}>{tz.replace("America/", "").replace(/_/g, " ")}</option>
            ))}
          </select>
        </div>
      </div>

      <div className="pt-1">
        <SaveButton saving={saving} saved={saved} onClick={handleSave} />
      </div>
    </CardShell>
  );
}

// ── Tab: Usuários ──────────────────────────────────────────────────────────────

function TabUsuarios({ clinicId }: { clinicId: string }) {
  const [members, setMembers] = useState<MemberRow[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    supabase
      .from("clinic_members")
      .select("id, role, joined_at, profiles(full_name)")
      .eq("clinic_id", clinicId)
      .eq("active", true)
      .order("joined_at", { ascending: true })
      .then(({ data }) => {
        setMembers((data ?? []) as unknown as MemberRow[]);
        setLoading(false);
      });
  }, [clinicId]);

  const roleLabel = (role: string) =>
    role === "owner" ? "Proprietário" : role === "admin" ? "Admin" : "Membro";

  const roleColor = (role: string) =>
    role === "owner" ? "#1DB6A0" : role === "admin" ? "#3b82f6" : "var(--z-text-dim)";

  return (
    <CardShell>
      <SectionHeader icon={<Users size={15} />} title="Usuários da Clínica" subtitle="Membros com acesso ao sistema" />

      {loading ? (
        <div className="flex items-center justify-center py-8">
          <RefreshCw size={16} className="animate-spin" style={{ color: "var(--z-text-dim)" }} />
        </div>
      ) : members.length === 0 ? (
        <p className="text-sm text-center py-6" style={{ color: "var(--z-text-dim)" }}>Nenhum membro encontrado.</p>
      ) : (
        <div className="space-y-2">
          {members.map((m) => (
            <div
              key={m.id}
              className="flex items-center gap-3 px-3 py-2.5 rounded-xl"
              style={{ background: "var(--muted)", border: "1px solid var(--border)" }}
            >
              <div
                className="w-8 h-8 rounded-full flex items-center justify-center text-xs font-semibold text-white shrink-0"
                style={{ background: "linear-gradient(135deg, #1DB6A0, #22d3c0)" }}
              >
                {(m.profiles?.full_name ?? "?").charAt(0).toUpperCase()}
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium truncate" style={{ color: "var(--z-text)" }}>
                  {m.profiles?.full_name ?? "—"}
                </p>
                {m.joined_at && (
                  <p className="text-[11px]" style={{ color: "var(--z-text-faint)" }}>
                    Desde {new Date(m.joined_at).toLocaleDateString("pt-BR")}
                  </p>
                )}
              </div>
              <span
                className="text-[11px] font-medium px-2 py-0.5 rounded-lg"
                style={{ color: roleColor(m.role), background: `${roleColor(m.role)}18` }}
              >
                {roleLabel(m.role)}
              </span>
            </div>
          ))}
        </div>
      )}

      <p className="text-xs" style={{ color: "var(--z-text-faint)" }}>
        Para convidar ou remover usuários, entre em contato com o administrador da plataforma.
      </p>
    </CardShell>
  );
}

// ── Tab: Horários ──────────────────────────────────────────────────────────────

function TabHorarios({ clinicId }: { clinicId: string }) {
  const [hours, setHours] = useState<BusinessHours>({});
  const [saving, setSaving] = useState(false);
  const [saved, setSaved] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    supabase
      .from("clinic_settings")
      .select("business_hours")
      .eq("clinic_id", clinicId)
      .maybeSingle()
      .then(({ data }) => {
        if (data?.business_hours) {
          // Migrate old [startHour, endHour] format if needed
          const raw = data.business_hours as Record<string, unknown>;
          const parsed: BusinessHours = {};
          for (const [k, v] of Object.entries(raw)) {
            if (Array.isArray(v) && v.length === 2 && typeof v[0] === "number") {
              // Old format: [8, 18] → [{start: "08:00", end: "18:00"}]
              parsed[k as DayKey] = [{ start: `${String(v[0]).padStart(2, "0")}:00`, end: `${String(v[1]).padStart(2, "0")}:00` }];
            } else if (Array.isArray(v) && v.length > 0 && typeof (v[0] as TimePeriod).start === "string") {
              parsed[k as DayKey] = v as TimePeriod[];
            }
          }
          setHours(parsed);
        }
        setLoading(false);
      });
  }, [clinicId]);

  const toggleDay = (day: DayKey) => {
    setHours((prev) => {
      const updated = { ...prev };
      if (updated[day]) {
        delete updated[day];
      } else {
        updated[day] = [{ start: "08:00", end: "18:00" }];
      }
      return updated;
    });
  };

  const updatePeriod = (day: DayKey, idx: number, patch: Partial<TimePeriod>) => {
    setHours((prev) => {
      const periods = (prev[day] ?? []).map((p, i) => i === idx ? { ...p, ...patch } : p);
      return { ...prev, [day]: periods };
    });
  };

  const addPeriod = (day: DayKey) => {
    setHours((prev) => ({ ...prev, [day]: [...(prev[day] ?? []), { start: "13:00", end: "18:00" }] }));
  };

  const removePeriod = (day: DayKey, idx: number) => {
    setHours((prev) => ({ ...prev, [day]: (prev[day] ?? []).filter((_, i) => i !== idx) }));
  };

  const handleSave = async () => {
    setSaving(true);
    await supabase
      .from("clinic_settings")
      .update({ business_hours: hours as import("@/lib/database.types").Json, updated_at: new Date().toISOString() })
      .eq("clinic_id", clinicId);
    setSaving(false);
    setSaved(true);
    setTimeout(() => setSaved(false), 2500);
  };

  return (
    <CardShell>
      <SectionHeader icon={<CalendarDays size={15} />} title="Horários de Funcionamento" subtitle="Configure os dias e intervalos de atendimento" />

      {loading ? (
        <div className="flex items-center justify-center py-8">
          <RefreshCw size={16} className="animate-spin" style={{ color: "var(--z-text-dim)" }} />
        </div>
      ) : (
        <div className="space-y-2">
          {DAYS.map(({ key, label }) => {
            const active = !!hours[key];
            const periods = hours[key] ?? [];
            return (
              <div
                key={key}
                className="rounded-xl p-3 transition-all"
                style={{
                  background: active ? "rgba(29,182,160,0.06)" : "var(--muted)",
                  border: `1px solid ${active ? "rgba(29,182,160,0.15)" : "var(--border)"}`,
                }}
              >
                {/* Row: toggle + day name */}
                <div className="flex items-center gap-3 mb-2">
                  <button
                    onClick={() => toggleDay(key)}
                    className="w-8 h-4 rounded-full transition-all shrink-0 relative"
                    style={{ background: active ? "#1DB6A0" : "rgba(255,255,255,0.1)" }}
                  >
                    <div
                      className="absolute top-0.5 w-3 h-3 rounded-full bg-white transition-all"
                      style={{ left: active ? "calc(100% - 14px)" : "2px", boxShadow: "0 1px 4px rgba(0,0,0,0.3)" }}
                    />
                  </button>
                  <span className="text-sm font-medium w-20 shrink-0" style={{ color: active ? "var(--z-text)" : "var(--z-text-dim)" }}>
                    {label}
                  </span>
                  {!active && <span className="text-xs ml-auto" style={{ color: "var(--z-text-faint)" }}>Fechado</span>}
                </div>

                {/* Periods */}
                {active && (
                  <div className="ml-11 space-y-1.5">
                    {periods.map((period, pi) => (
                      <div key={pi} className="flex items-center gap-2">
                        <Clock size={11} className="shrink-0" style={{ color: "var(--z-text-dim)" }} />
                        <input
                          type="time"
                          value={period.start}
                          onChange={(e) => updatePeriod(key, pi, { start: e.target.value })}
                          className="text-xs outline-none rounded-lg px-2 py-1.5 flex-1"
                          style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
                        />
                        <span className="text-xs" style={{ color: "var(--z-text-faint)" }}>–</span>
                        <input
                          type="time"
                          value={period.end}
                          onChange={(e) => updatePeriod(key, pi, { end: e.target.value })}
                          className="text-xs outline-none rounded-lg px-2 py-1.5 flex-1"
                          style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" }}
                        />
                        {pi > 0 ? (
                          <button
                            onClick={() => removePeriod(key, pi)}
                            className="w-6 h-6 rounded-lg flex items-center justify-center transition-colors"
                            style={{ background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text-dim)" }}
                            onMouseEnter={(e) => (e.currentTarget.style.color = "#e05555")}
                            onMouseLeave={(e) => (e.currentTarget.style.color = "var(--z-text-dim)")}
                          >
                            <X size={11} />
                          </button>
                        ) : (
                          <div className="w-6" />
                        )}
                      </div>
                    ))}
                    <button
                      onClick={() => addPeriod(key)}
                      className="flex items-center gap-1 text-[10px] px-2 py-1 rounded-lg transition-colors mt-0.5"
                      style={{ color: "#1DB6A0", background: "rgba(29,182,160,0.07)", border: "1px dashed rgba(29,182,160,0.3)" }}
                    >
                      <Plus size={10} /> add break
                    </button>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      )}

      <div className="pt-1">
        <SaveButton saving={saving} saved={saved} onClick={handleSave} />
      </div>
    </CardShell>
  );
}

// ── Tab: Tipos de Consulta ─────────────────────────────────────────────────────

type TypeForm = { name: string; duration_minutes: number; color: string };

function TabTipos({ clinicId }: { clinicId: string }) {
  const [types, setTypes] = useState<AppointmentType[]>([]);
  const [loading, setLoading] = useState(true);
  const [editing, setEditing] = useState<string | null>(null); // id or "new"
  const [form, setForm] = useState<TypeForm>({ name: "", duration_minutes: 30, color: "#1DB6A0" });
  const [saving, setSaving] = useState(false);

  const load = () => {
    supabase
      .from("appointment_types")
      .select("*")
      .eq("clinic_id", clinicId)
      .eq("active", true)
      .order("name")
      .then(({ data }) => {
        setTypes(data ?? []);
        setLoading(false);
      });
  };

  useEffect(() => { load(); }, [clinicId]); // eslint-disable-line react-hooks/exhaustive-deps

  const openNew = () => {
    setForm({ name: "", duration_minutes: 30, color: "#1DB6A0" });
    setEditing("new");
  };

  const openEdit = (t: AppointmentType) => {
    setForm({ name: t.name, duration_minutes: t.duration_minutes, color: t.color });
    setEditing(t.id);
  };

  const handleSave = async () => {
    if (!form.name.trim()) return;
    setSaving(true);
    if (editing === "new") {
      await supabase.from("appointment_types").insert({
        clinic_id: clinicId,
        name: form.name.trim(),
        duration_minutes: form.duration_minutes,
        color: form.color,
      });
    } else if (editing) {
      await supabase.from("appointment_types").update({
        name: form.name.trim(),
        duration_minutes: form.duration_minutes,
        color: form.color,
      }).eq("id", editing);
    }
    setSaving(false);
    setEditing(null);
    load();
  };

  const handleDelete = async (id: string) => {
    await supabase.from("appointment_types").update({ active: false }).eq("id", id);
    setTypes((prev) => prev.filter((t) => t.id !== id));
  };

  const inputStyle = { background: "var(--input)", border: "1px solid var(--border)", color: "var(--z-text)" };

  return (
    <CardShell>
      <div className="flex items-center justify-between">
        <SectionHeader icon={<Stethoscope size={15} />} title="Tipos de Consulta" subtitle="Categorias e durações de atendimento" />
        <motion.button
          whileHover={{ scale: 1.04 }}
          whileTap={{ scale: 0.96 }}
          onClick={openNew}
          className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-medium text-white"
          style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}
        >
          <Plus size={13} />
          Novo tipo
        </motion.button>
      </div>

      {/* Inline form */}
      <AnimatePresence>
        {editing && (
          <motion.div
            initial={{ opacity: 0, y: -8 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -8 }}
            className="rounded-xl p-4 space-y-3"
            style={{ background: "rgba(29,182,160,0.04)", border: "1px solid rgba(29,182,160,0.2)" }}
          >
            <p className="text-xs font-medium" style={{ color: "#1DB6A0" }}>
              {editing === "new" ? "Novo tipo de consulta" : "Editar tipo"}
            </p>

            <div className="grid grid-cols-2 gap-3">
              <div>
                <label className="block text-xs mb-1" style={{ color: "var(--z-text-dim)" }}>Nome</label>
                <input
                  type="text"
                  placeholder="Ex: Consulta, Retorno..."
                  value={form.name}
                  onChange={(e) => setForm((f) => ({ ...f, name: e.target.value }))}
                  className="w-full px-3 py-2 rounded-lg text-sm outline-none"
                  style={inputStyle}
                  onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(29,182,160,0.5)")}
                  onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
                />
              </div>
              <div>
                <label className="block text-xs mb-1" style={{ color: "var(--z-text-dim)" }}>Duração (min)</label>
                <input
                  type="number"
                  min={5}
                  step={5}
                  value={form.duration_minutes}
                  onChange={(e) => setForm((f) => ({ ...f, duration_minutes: parseInt(e.target.value) || 30 }))}
                  className="w-full px-3 py-2 rounded-lg text-sm outline-none"
                  style={inputStyle}
                  onFocus={(e) => (e.currentTarget.style.borderColor = "rgba(29,182,160,0.5)")}
                  onBlur={(e) => (e.currentTarget.style.borderColor = "var(--border)")}
                />
              </div>
            </div>

            <div>
              <label className="block text-xs mb-1.5" style={{ color: "var(--z-text-dim)" }}>Cor</label>
              <div className="flex items-center gap-2 flex-wrap">
                {COLOR_PRESETS.map((c) => (
                  <button
                    key={c}
                    onClick={() => setForm((f) => ({ ...f, color: c }))}
                    className="w-6 h-6 rounded-full transition-transform"
                    style={{
                      background: c,
                      transform: form.color === c ? "scale(1.25)" : "scale(1)",
                      outline: form.color === c ? `2px solid ${c}` : "none",
                      outlineOffset: "2px",
                    }}
                  />
                ))}
              </div>
            </div>

            <div className="flex items-center gap-2 pt-1">
              <motion.button
                whileHover={{ scale: 1.02 }}
                whileTap={{ scale: 0.97 }}
                onClick={handleSave}
                disabled={saving}
                className="flex items-center gap-2 px-4 py-2 rounded-xl text-sm font-medium text-white disabled:opacity-60"
                style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)" }}
              >
                {saving ? <RefreshCw size={13} className="animate-spin" /> : <Check size={13} />}
                Salvar
              </motion.button>
              <button
                onClick={() => setEditing(null)}
                className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm"
                style={{ color: "var(--z-text-dim)" }}
              >
                <X size={13} />
                Cancelar
              </button>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {loading ? (
        <div className="flex items-center justify-center py-8">
          <RefreshCw size={16} className="animate-spin" style={{ color: "var(--z-text-dim)" }} />
        </div>
      ) : types.length === 0 ? (
        <p className="text-sm text-center py-6" style={{ color: "var(--z-text-dim)" }}>
          Nenhum tipo de consulta cadastrado.
        </p>
      ) : (
        <div className="space-y-2">
          {types.map((t) => (
            <div
              key={t.id}
              className="flex items-center gap-3 px-3 py-2.5 rounded-xl"
              style={{ background: "var(--muted)", border: "1px solid var(--border)" }}
            >
              <div className="w-3 h-3 rounded-full shrink-0" style={{ background: t.color }} />
              <span className="text-sm flex-1" style={{ color: "var(--z-text)" }}>{t.name}</span>
              <span className="text-xs" style={{ color: "var(--z-text-dim)" }}>{t.duration_minutes} min</span>
              <div className="flex items-center gap-1 ml-2">
                <button
                  onClick={() => openEdit(t)}
                  className="w-7 h-7 rounded-lg flex items-center justify-center transition-all"
                  style={{ color: "var(--z-text-dim)" }}
                  onMouseEnter={(e) => (e.currentTarget.style.color = "#1DB6A0")}
                  onMouseLeave={(e) => (e.currentTarget.style.color = "var(--z-text-dim)")}
                >
                  <Pencil size={13} />
                </button>
                <button
                  onClick={() => handleDelete(t.id)}
                  className="w-7 h-7 rounded-lg flex items-center justify-center transition-all"
                  style={{ color: "var(--z-text-dim)" }}
                  onMouseEnter={(e) => (e.currentTarget.style.color = "#e05555")}
                  onMouseLeave={(e) => (e.currentTarget.style.color = "var(--z-text-dim)")}
                >
                  <Trash2 size={13} />
                </button>
              </div>
            </div>
          ))}
        </div>
      )}
    </CardShell>
  );
}

// ── Tab: WhatsApp ──────────────────────────────────────────────────────────────

function TabWhatsapp({ clinicId }: { clinicId: string }) {
  void clinicId;

  const { config, loaded: uazapiLoaded, isConfigured } = useUazapiConfig();
  const [status, setStatus] = useState<ConnectionStatus>("idle");
  const [instance, setInstance] = useState<UazapiInstance | null>(null);
  const [error, setError] = useState("");
  const [qrCode, setQrCode] = useState("");
  const [pollInterval, setPollInterval] = useState<NodeJS.Timeout | null>(null);

  useEffect(() => {
    if (isConfigured) checkStatus();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [uazapiLoaded]);

  useEffect(() => {
    return () => { if (pollInterval) clearInterval(pollInterval); };
  }, [pollInterval]);

  const stopPolling = () => {
    if (pollInterval) { clearInterval(pollInterval); setPollInterval(null); }
  };

  const checkStatus = async () => {
    if (!isConfigured) return;
    setStatus("loading");
    setError("");
    try {
      const res = await uazapi.getStatus();
      setInstance(res.instance);
      if (res.status.connected) {
        setStatus("connected");
        setQrCode("");
        stopPolling();
      } else if (res.instance?.status === "connecting") {
        setStatus("connecting");
        setQrCode(res.instance.qrcode || "");
      } else {
        setStatus("disconnected");
      }
    } catch (e: unknown) {
      setStatus("error");
      setError(e instanceof Error ? e.message : "Erro ao verificar status");
    }
  };

  const handleConnect = async () => {
    setStatus("connecting");
    setError("");
    setQrCode("");
    try {
      // Call /instance/connect without phone → gets QR code
      const res = await uazapi.connect();
      setInstance(res.instance);
      if (res.connected) {
        setStatus("connected");
      } else {
        setStatus("connecting");
        setQrCode(res.instance?.qrcode || "");
        // Poll /instance/status every 4s until connected
        if (pollInterval) clearInterval(pollInterval);
        const id = setInterval(async () => {
          try {
            const poll = await uazapi.getStatus();
            if (poll.status.connected) {
              setStatus("connected");
              setInstance(poll.instance);
              setQrCode("");
              clearInterval(id);
              setPollInterval(null);
            } else if (poll.instance?.qrcode && poll.instance.qrcode !== qrCode) {
              setQrCode(poll.instance.qrcode);
            }
          } catch { /* silent */ }
        }, 4000);
        setPollInterval(id);
      }
    } catch (e: unknown) {
      setStatus("error");
      setError(e instanceof Error ? e.message : "Erro ao conectar");
    }
  };

  const handleDisconnect = async () => {
    try {
      await uazapi.disconnect();
      setStatus("disconnected");
      setInstance(null);
      setQrCode("");
      stopPolling();
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : "Erro ao desconectar");
    }
  };

  const statusConfig: Record<ConnectionStatus, { label: string; color: string; bg: string; dot: string }> = {
    idle:         { label: "Não verificado",         color: "var(--z-text-dim)", bg: "var(--muted)",                    dot: "#6b7280" },
    loading:      { label: "Verificando...",          color: "#f59e0b",           bg: "rgba(245,158,11,0.08)",            dot: "#f59e0b" },
    connected:    { label: "Conectado",               color: "#1DB6A0",           bg: "rgba(29,182,160,0.08)",             dot: "#1DB6A0" },
    connecting:   { label: "Aguardando QR Code",      color: "#f59e0b",           bg: "rgba(245,158,11,0.08)",            dot: "#f59e0b" },
    disconnected: { label: "Desconectado",            color: "var(--z-text-dim)", bg: "var(--muted)",                    dot: "#6b7280" },
    error:        { label: "Erro de conexão",         color: "var(--destructive)", bg: "rgba(220,38,38,0.06)",           dot: "#e05555" },
  };

  const sc = statusConfig[status];

  if (!isConfigured && uazapiLoaded) {
    return (
      <CardShell>
        <SectionHeader icon={<Wifi size={15} />} title="WhatsApp" subtitle="Status da conexão com o WhatsApp" />
        <div className="flex items-center gap-3 px-4 py-3 rounded-xl" style={{ background: "var(--muted)", border: "1px solid var(--border)" }}>
          <AlertCircle size={15} style={{ color: "var(--z-text-dim)", flexShrink: 0 }} />
          <p className="text-sm" style={{ color: "var(--z-text-dim)" }}>
            A instância UAZAPI ainda não foi configurada. Entre em contato com o administrador da plataforma.
          </p>
        </div>
      </CardShell>
    );
  }

  return (
    <CardShell>
      <SectionHeader icon={<Wifi size={15} />} title="WhatsApp" subtitle="Status da conexão com o WhatsApp" />

      {/* Status badge */}
      <div
        className="flex items-center justify-between px-4 py-3 rounded-xl"
        style={{ background: sc.bg, border: `1px solid ${sc.color}30` }}
      >
        <div className="flex items-center gap-2.5">
          <div
            className="w-2 h-2 rounded-full shrink-0"
            style={{
              background: sc.dot,
              boxShadow: status === "connected" ? `0 0 6px ${sc.dot}80` : "none",
              animation: status === "loading" || status === "connecting" ? "pulse 1.5s ease-in-out infinite" : "none",
            }}
          />
          <span className="text-sm font-medium" style={{ color: sc.color }}>{sc.label}</span>
        </div>

        {/* Refresh button */}
        <button
          onClick={checkStatus}
          disabled={status === "loading"}
          className="w-7 h-7 rounded-lg flex items-center justify-center transition-all disabled:opacity-40"
          style={{ color: "var(--z-text-dim)" }}
          title="Verificar status"
        >
          <RefreshCw size={13} className={status === "loading" ? "animate-spin" : ""} />
        </button>
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

      {/* Connected: profile card */}
      <AnimatePresence>
        {status === "connected" && instance && (
          <motion.div
            initial={{ opacity: 0, y: 8 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0 }}
            className="flex items-center gap-4 p-4 rounded-xl"
            style={{ background: "rgba(29,182,160,0.05)", border: "1px solid rgba(29,182,160,0.15)" }}
          >
            {instance.profilePicUrl ? (
              // eslint-disable-next-line @next/next/no-img-element
              <img src={instance.profilePicUrl} alt="Profile" className="w-11 h-11 rounded-full shrink-0 object-cover" />
            ) : (
              <div className="w-11 h-11 rounded-full flex items-center justify-center text-white font-semibold text-sm shrink-0"
                style={{ background: "linear-gradient(135deg, #1DB6A0, #22d3c0)" }}>
                WA
              </div>
            )}
            <div className="flex-1 min-w-0">
              <p className="text-sm font-medium truncate" style={{ color: "var(--z-text)" }}>
                {instance.profileName || instance.name}
              </p>
              <p className="text-xs mt-0.5" style={{ color: "var(--z-text-dim)" }}>
                {instance.isBusiness ? "WhatsApp Business" : "WhatsApp"}
                {instance.owner ? ` · ${instance.owner}` : ""}
              </p>
            </div>
            <button
              onClick={handleDisconnect}
              className="flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-medium shrink-0 transition-all"
              style={{ background: "rgba(220,38,38,0.06)", color: "var(--destructive)", border: "1px solid rgba(220,38,38,0.15)" }}
            >
              <WifiOff size={13} />
              Desconectar
            </button>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Disconnected: connect button + QR */}
      <AnimatePresence>
        {status === "disconnected" && (
          <motion.div initial={{ opacity: 0, y: 8 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0 }}>
            <motion.button
              whileHover={{ scale: 1.02 }}
              whileTap={{ scale: 0.97 }}
              onClick={handleConnect}
              className="flex items-center gap-2 px-4 py-2.5 rounded-xl text-sm font-medium text-white"
              style={{ background: "linear-gradient(135deg, #1DB6A0, #19a896)", boxShadow: "0 0 16px rgba(29,182,160,0.25)" }}
            >
              <Wifi size={14} />
              Conectar via QR Code
            </motion.button>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Connecting: QR code */}
      <AnimatePresence>
        {status === "connecting" && (
          <motion.div
            initial={{ opacity: 0, scale: 0.96 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0 }}
            className="flex flex-col items-center gap-3 py-4"
          >
            {qrCode ? (
              <>
                {/* eslint-disable-next-line @next/next/no-img-element */}
                <img
                  src={qrCode}
                  alt="QR Code WhatsApp"
                  className="w-52 h-52 rounded-xl"
                  style={{ border: "3px solid rgba(29,182,160,0.25)" }}
                />
                <p className="text-xs text-center" style={{ color: "var(--z-text-dim)" }}>
                  Abra o WhatsApp no celular e escaneie o QR code
                </p>
                <p className="text-[10px]" style={{ color: "var(--z-text-faint)" }}>
                  Verificando automaticamente a cada 4 segundos…
                </p>
              </>
            ) : (
              <div className="flex items-center gap-2 py-6" style={{ color: "var(--z-text-dim)" }}>
                <RefreshCw size={15} className="animate-spin" />
                <span className="text-sm">Gerando QR code…</span>
              </div>
            )}
            <button
              onClick={() => { setStatus("disconnected"); setQrCode(""); stopPolling(); }}
              className="text-xs px-3 py-1.5 rounded-lg transition-all"
              style={{ color: "var(--z-text-dim)", background: "var(--muted)", border: "1px solid var(--border)" }}
            >
              Cancelar
            </button>
          </motion.div>
        )}
      </AnimatePresence>
    </CardShell>
  );
}

// ── Tab Google Calendar ────────────────────────────────────────────────────────

type DoctorGoogleStatus = { connected: boolean; email: string | null };

function TabGoogleCalendar({ clinicId }: { clinicId: string }) {
  const [doctors, setDoctors] = useState<Doctor[]>([]);
  const [statuses, setStatuses] = useState<Record<string, DoctorGoogleStatus>>({});
  const [loading, setLoading] = useState(true);
  const [disconnecting, setDisconnecting] = useState<string | null>(null);
  const [syncing, setSyncing] = useState<string | null>(null);
  const [syncResult, setSyncResult] = useState<Record<string, string>>({});

  const loadDoctors = useCallback(async () => {
    const { data } = await supabase
      .from("doctors")
      .select("*")
      .eq("clinic_id", clinicId)
      .eq("active", true)
      .order("name");
    const list: Doctor[] = data ?? [];
    setDoctors(list);

    const entries = await Promise.all(
      list.map(async (d) => {
        const res = await fetch(`/api/google-calendar/status?doctor_id=${d.id}`);
        const s: DoctorGoogleStatus = res.ok ? await res.json() : { connected: false, email: null };
        return [d.id, s] as const;
      })
    );
    setStatuses(Object.fromEntries(entries));
    setLoading(false);
  }, [clinicId]);

  useEffect(() => { loadDoctors(); }, [loadDoctors]);

  const handleConnect = (doctorId: string) => {
    window.location.href = `/api/google-calendar/connect?doctor_id=${doctorId}&clinic_id=${clinicId}`;
  };

  const handleDisconnect = async (doctorId: string) => {
    setDisconnecting(doctorId);
    await fetch("/api/google-calendar/disconnect", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ doctor_id: doctorId, clinic_id: clinicId }),
    });
    setStatuses((prev) => ({ ...prev, [doctorId]: { connected: false, email: null } }));
    setDisconnecting(null);
  };

  const handleSyncAll = async (doctorId: string) => {
    setSyncing(doctorId);
    setSyncResult((prev) => ({ ...prev, [doctorId]: "" }));
    try {
      const res = await fetch("/api/google-calendar/sync-all", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ doctor_id: doctorId, clinic_id: clinicId }),
      });
      const data = await res.json() as { total: number; synced: number };
      setSyncResult((prev) => ({
        ...prev,
        [doctorId]: data.synced === 0 ? "Nenhum agendamento pendente" : `${data.synced} de ${data.total} sincronizados`,
      }));
    } catch {
      setSyncResult((prev) => ({ ...prev, [doctorId]: "Erro ao sincronizar" }));
    }
    setSyncing(null);
  };

  return (
    <CardShell>
      <SectionHeader icon={<Calendar size={15} />} title="Google Agenda" subtitle="Conecte o Google Calendar de cada médico para sincronizar agendamentos automaticamente." />
      {loading ? (
        <div className="flex justify-center py-8">
          <RefreshCw size={16} className="animate-spin" style={{ color: "var(--z-text-dim)" }} />
        </div>
      ) : doctors.length === 0 ? (
        <p className="text-sm text-center py-6" style={{ color: "var(--z-text-dim)" }}>
          Nenhum médico cadastrado.
        </p>
      ) : (
        <div className="space-y-2">
          {doctors.map((doc) => {
            const status = statuses[doc.id];
            const isConnected = status?.connected ?? false;
            const isDisconnecting = disconnecting === doc.id;
            return (
              <div
                key={doc.id}
                className="flex items-center justify-between rounded-xl px-4 py-3"
                style={{
                  background: isConnected ? "rgba(29,182,160,0.05)" : "var(--input)",
                  border: `1px solid ${isConnected ? "rgba(29,182,160,0.2)" : "rgba(29,182,160,0.08)"}`,
                }}
              >
                <div className="flex items-center gap-3 min-w-0">
                  <div
                    className="w-7 h-7 rounded-xl flex items-center justify-center shrink-0 text-xs font-semibold text-white"
                    style={{ background: doc.color ?? "#1DB6A0" }}
                  >
                    {doc.name[0]}
                  </div>
                  <div className="min-w-0">
                    <p className="text-sm font-medium truncate" style={{ color: "var(--z-text)" }}>
                      {doc.name}
                    </p>
                    {isConnected && status?.email ? (
                      <p className="text-[11px] truncate" style={{ color: "#1DB6A0" }}>
                        {status.email}
                      </p>
                    ) : (
                      <p className="text-[11px]" style={{ color: "var(--z-text-dim)" }}>
                        Não conectado
                      </p>
                    )}
                  </div>
                </div>

                {isConnected ? (
                  <div className="flex items-center gap-2 shrink-0">
                    {syncResult[doc.id] && (
                      <span className="text-[10px]" style={{ color: syncResult[doc.id].includes("Erro") ? "#e05555" : "#1DB6A0" }}>
                        {syncResult[doc.id]}
                      </span>
                    )}
                    <button
                      onClick={() => handleSyncAll(doc.id)}
                      disabled={syncing === doc.id}
                      className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg transition-all disabled:opacity-60"
                      style={{ color: "#1DB6A0", background: "rgba(29,182,160,0.08)", border: "1px solid rgba(29,182,160,0.2)" }}
                      title="Sincronizar agendamentos futuros pendentes"
                    >
                      <RefreshCw size={11} className={syncing === doc.id ? "animate-spin" : ""} />
                      Sincronizar
                    </button>
                    <button
                      onClick={() => handleDisconnect(doc.id)}
                      disabled={isDisconnecting}
                      className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg transition-all disabled:opacity-60"
                      style={{ color: "#e05555", background: "rgba(224,85,85,0.08)", border: "1px solid rgba(224,85,85,0.15)" }}
                    >
                      {isDisconnecting ? <RefreshCw size={11} className="animate-spin" /> : <Link2Off size={11} />}
                      Desconectar
                    </button>
                  </div>
                ) : (
                  <button
                    onClick={() => handleConnect(doc.id)}
                    className="flex items-center gap-1.5 text-xs px-3 py-1.5 rounded-lg transition-all"
                    style={{ color: "#1DB6A0", background: "rgba(29,182,160,0.08)", border: "1px solid rgba(29,182,160,0.2)" }}
                  >
                    <Link2 size={11} />
                    Conectar Google
                  </button>
                )}
              </div>
            );
          })}
        </div>
      )}
    </CardShell>
  );
}

// ── Tab Conta ─────────────────────────────────────────────────────────────────

const passwordInputStyle = {
  background: "var(--input)",
  border: "1px solid var(--border)",
  color: "var(--z-text)",
  borderRadius: "10px",
  padding: "9px 36px 9px 12px",
  fontSize: "13px",
  outline: "none",
  width: "100%",
} as const;

function PasswordField({
  label,
  value,
  onChange,
  show,
  onToggle,
  autoComplete,
}: {
  label: string;
  value: string;
  onChange: (v: string) => void;
  show: boolean;
  onToggle: () => void;
  autoComplete?: string;
}) {
  return (
    <div className="space-y-1.5">
      <label className="text-xs font-medium" style={{ color: "var(--z-text-dim)" }}>{label}</label>
      <div className="relative">
        <input
          type={show ? "text" : "password"}
          value={value}
          onChange={(e) => onChange(e.target.value)}
          autoComplete={autoComplete}
          required
          style={passwordInputStyle}
        />
        <button
          type="button"
          onClick={onToggle}
          className="absolute right-3 top-1/2 -translate-y-1/2"
          style={{ color: "var(--z-text-dim)" }}
        >
          {show ? <EyeOff size={14} /> : <Eye size={14} />}
        </button>
      </div>
    </div>
  );
}

function TabConta() {
  const [currentPassword, setCurrentPassword] = useState("");
  const [newPassword, setNewPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [showCurrent, setShowCurrent] = useState(false);
  const [showNew, setShowNew] = useState(false);
  const [showConfirm, setShowConfirm] = useState(false);
  const [saving, setSaving] = useState(false);
  const [feedback, setFeedback] = useState<{ type: "success" | "error"; message: string } | null>(null);

  async function handleChangePassword(e: React.FormEvent) {
    e.preventDefault();
    setFeedback(null);

    if (newPassword.length < 6) {
      setFeedback({ type: "error", message: "A nova senha deve ter pelo menos 6 caracteres." });
      return;
    }
    if (newPassword !== confirmPassword) {
      setFeedback({ type: "error", message: "As senhas não coincidem." });
      return;
    }

    setSaving(true);
    try {
      const { data: { user } } = await supabase.auth.getUser();
      if (!user?.email) throw new Error("Usuário não encontrado.");

      const { error: signInError } = await supabase.auth.signInWithPassword({
        email: user.email,
        password: currentPassword,
      });
      if (signInError) {
        setFeedback({ type: "error", message: "Senha atual incorreta." });
        return;
      }

      const { error } = await supabase.auth.updateUser({ password: newPassword });
      if (error) throw error;

      setFeedback({ type: "success", message: "Senha atualizada com sucesso!" });
      setCurrentPassword("");
      setNewPassword("");
      setConfirmPassword("");
    } catch {
      setFeedback({ type: "error", message: "Erro ao atualizar senha. Tente novamente." });
    } finally {
      setSaving(false);
    }
  }

  return (
    <CardShell>
      <div className="flex items-center gap-2 mb-4">
        <KeyRound size={14} style={{ color: "#1DB6A0" }} />
        <span className="text-sm font-medium" style={{ color: "var(--z-text)" }}>Redefinir Senha</span>
      </div>
      <form onSubmit={handleChangePassword} className="space-y-4">
        <PasswordField
          label="Senha atual"
          value={currentPassword}
          onChange={setCurrentPassword}
          show={showCurrent}
          onToggle={() => setShowCurrent((v) => !v)}
          autoComplete="current-password"
        />
        <PasswordField
          label="Nova senha"
          value={newPassword}
          onChange={setNewPassword}
          show={showNew}
          onToggle={() => setShowNew((v) => !v)}
          autoComplete="new-password"
        />
        <PasswordField
          label="Confirmar nova senha"
          value={confirmPassword}
          onChange={setConfirmPassword}
          show={showConfirm}
          onToggle={() => setShowConfirm((v) => !v)}
          autoComplete="new-password"
        />

        <AnimatePresence>
          {feedback && (
            <motion.div
              initial={{ opacity: 0, y: -4 }}
              animate={{ opacity: 1, y: 0 }}
              exit={{ opacity: 0 }}
              className="flex items-center gap-2 px-3 py-2.5 rounded-xl text-xs"
              style={{
                background: feedback.type === "success" ? "rgba(29,182,160,0.1)" : "rgba(224,85,85,0.1)",
                border: `1px solid ${feedback.type === "success" ? "rgba(29,182,160,0.25)" : "rgba(224,85,85,0.25)"}`,
                color: feedback.type === "success" ? "#1DB6A0" : "#e05555",
              }}
            >
              {feedback.type === "success" ? <Check size={12} /> : <AlertCircle size={12} />}
              {feedback.message}
            </motion.div>
          )}
        </AnimatePresence>

        <button
          type="submit"
          disabled={saving || !currentPassword || !newPassword || !confirmPassword}
          className="flex items-center gap-2 px-4 py-2.5 rounded-xl text-xs font-medium transition-all disabled:opacity-50"
          style={{ background: "#019A67", color: "#fff" }}
        >
          {saving ? <RefreshCw size={12} className="animate-spin" /> : <Save size={12} />}
          {saving ? "Salvando…" : "Atualizar Senha"}
        </button>
      </form>
    </CardShell>
  );
}

// ── Main Page ──────────────────────────────────────────────────────────────────

function SettingsContent() {
  const { clinicId, loaded: clinicLoaded } = useClinic();
  const [activeTab, setActiveTab] = useState<Tab>("perfil");
  const searchParams = useSearchParams();

  // Show feedback toast when returning from Google OAuth
  const googleParam = searchParams.get("google");
  const [googleToast, setGoogleToast] = useState<string | null>(
    googleParam === "connected" ? "Google Calendar conectado com sucesso!" :
    googleParam === "error" ? "Erro ao conectar Google Calendar. Tente novamente." :
    googleParam === "no_refresh_token" ? "Reconecte sua conta Google (revogue o acesso e tente novamente)." :
    null
  );

  useEffect(() => {
    if (googleToast) {
      const t = setTimeout(() => setGoogleToast(null), 5000);
      // Switch to google tab if connected
      if (googleParam === "connected") setActiveTab("google");
      return () => clearTimeout(t);
    }
  }, []);

  useEffect(() => {
    if (googleParam) {
      // Clean up URL without reload
      const url = new URL(window.location.href);
      url.searchParams.delete("google");
      window.history.replaceState({}, "", url.toString());
    }
  }, []);

  if (!clinicLoaded) {
    return (
      <div className="p-6 flex items-center justify-center py-20">
        <RefreshCw size={18} className="animate-spin" style={{ color: "var(--z-text-dim)" }} />
      </div>
    );
  }

  return (
    <div className="p-6 max-w-2xl space-y-6">
      {/* Header */}
      <motion.div initial={{ opacity: 0, y: 16 }} animate={{ opacity: 1, y: 0 }}>
        <h1 className="text-xl" style={{ color: "var(--z-text)", fontWeight: 500 }}>Configurações</h1>
        <p className="text-sm mt-0.5" style={{ color: "var(--z-text-dim)" }}>Gerencie as configurações da sua clínica</p>
      </motion.div>

      {/* Tab bar */}
      <motion.div
        initial={{ opacity: 0, y: 12 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.04 }}
        className="flex items-center gap-1 p-1 rounded-2xl w-fit"
        style={{ background: "var(--surface-1)", border: "1px solid var(--border)", boxShadow: "var(--z-shadow)" }}
      >
        {TABS.map((tab) => (
          <button
            key={tab.id}
            onClick={() => setActiveTab(tab.id)}
            className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-xs font-medium transition-all"
            style={
              activeTab === tab.id
                ? { background: "rgba(29,182,160,0.1)", color: "#1DB6A0", border: "1px solid rgba(29,182,160,0.2)" }
                : { color: "var(--z-text-dim)", border: "1px solid transparent" }
            }
          >
            {tab.icon}
            {tab.label}
          </button>
        ))}
      </motion.div>

      {/* Google OAuth toast */}
      <AnimatePresence>
        {googleToast && (
          <motion.div
            initial={{ opacity: 0, y: -8 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -8 }}
            className="flex items-center gap-2 px-4 py-3 rounded-xl text-sm"
            style={{
              background: googleParam === "connected" ? "rgba(29,182,160,0.1)" : "rgba(224,85,85,0.1)",
              border: `1px solid ${googleParam === "connected" ? "rgba(29,182,160,0.25)" : "rgba(224,85,85,0.25)"}`,
              color: googleParam === "connected" ? "#1DB6A0" : "#e05555",
            }}
          >
            {googleParam === "connected" ? <Check size={14} /> : <AlertCircle size={14} />}
            {googleToast}
          </motion.div>
        )}
      </AnimatePresence>

      {/* Tab content */}
      <AnimatePresence mode="wait">
        <motion.div
          key={activeTab}
          initial={{ opacity: 0, y: 8 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{ opacity: 0, y: -4 }}
          transition={{ duration: 0.15 }}
        >
          {activeTab === "perfil"   && <TabPerfil          clinicId={clinicId} />}
          {activeTab === "usuarios" && <TabUsuarios        clinicId={clinicId} />}
          {activeTab === "horarios" && <TabHorarios        clinicId={clinicId} />}
          {activeTab === "tipos"    && <TabTipos           clinicId={clinicId} />}
          {activeTab === "whatsapp" && <TabWhatsapp        clinicId={clinicId} />}
          {activeTab === "google"   && <TabGoogleCalendar  clinicId={clinicId} />}
          {activeTab === "conta"    && <TabConta />}
        </motion.div>
      </AnimatePresence>
    </div>
  );
}

export default function SettingsPage() {
  return (
    <Suspense fallback={
      <div className="p-6 flex items-center justify-center py-20">
        <RefreshCw size={18} className="animate-spin" style={{ color: "var(--z-text-dim)" }} />
      </div>
    }>
      <SettingsContent />
    </Suspense>
  );
}
