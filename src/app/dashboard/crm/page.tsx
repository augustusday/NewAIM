"use client";

import { useState, useEffect, useRef } from "react";
import { useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import {
  Search,
  Plus,
  LayoutList,
  Kanban,
  Phone,
  Mail,
  MoreHorizontal,
  Calendar,
  Filter,
  ChevronDown,
  User,
  TrendingUp,
  Heart,
  Clock,
  CheckCircle2,
  X,
  MessageCircle,
  FileText,
  ChevronRight,
  Send,
  Edit2,
  Check,
  AlertCircle,
  Save,
  Loader2,
  ShieldCheck,
  Cake,
  IdCard,
  Banknote,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useClinic } from "@/hooks/use-clinic";
import {
  getContacts,
  createContact,
  updateContact,
  getContactNotes,
  addContactNote,
  getContactAppointments,
} from "@/lib/db/crm";
import type { Contact as DBContact, ContactNote, Appointment } from "@/lib/database.types";

interface Contact {
  id: string;
  name: string;
  phone: string;
  email: string;
  tag: string;
  tagColor: string;
  lastContact: string;
  status: string;
  raw: DBContact;
}

const statusTagMap: Record<string, { label: string; color: string }> = {
  lead:     { label: "Lead",     color: "#019A67" },
  patient:  { label: "Paciente", color: "#01c47f" },
  return:   { label: "Retorno",  color: "#f59e0b" },
  inactive: { label: "Inativo",  color: "#6b8f78" },
};

const statusOptions = [
  { value: "lead",     label: "Lead",     color: "#019A67" },
  { value: "patient",  label: "Paciente", color: "#01c47f" },
  { value: "return",   label: "Retorno",  color: "#f59e0b" },
  { value: "inactive", label: "Inativo",  color: "#6b8f78" },
];

const appointmentStatusColors: Record<string, string> = {
  confirmed: "#019A67",
  scheduled: "#f59e0b",
  cancelled: "#e05555",
  completed: "#6b8f78",
  in_progress: "#01c47f",
  no_show: "#e05555",
};

const appointmentStatusLabels: Record<string, string> = {
  confirmed: "Confirmado",
  scheduled: "Agendado",
  cancelled: "Cancelado",
  completed: "Concluído",
  in_progress: "Em atendimento",
  no_show: "Não compareceu",
};

function relativeDate(iso: string): string {
  const diff = Date.now() - new Date(iso).getTime();
  const days = Math.floor(diff / 86400000);
  if (days === 0) return "Hoje";
  if (days === 1) return "Ontem";
  if (days < 7) return `${days} dias`;
  if (days < 30) return `${Math.floor(days / 7)} sem.`;
  return `${Math.floor(days / 30)} meses`;
}

function formatDatePT(iso: string): string {
  return new Date(iso).toLocaleDateString("pt-BR", { day: "2-digit", month: "short", year: "numeric" });
}

function initials(name: string): string {
  const parts = (name ?? "").trim().split(" ").filter(Boolean);
  if (parts.length === 0) return "?";
  if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
  return ((parts[0][0] ?? "") + (parts[parts.length - 1][0] ?? "")).toUpperCase() || "?";
}

function mapContact(c: DBContact): Contact {
  const tm = statusTagMap[c.status] ?? { label: c.status, color: "#019A67" };
  return {
    id: c.id,
    name: c.full_name,
    phone: c.phone ?? "",
    email: c.email ?? "",
    tag: tm.label,
    tagColor: tm.color,
    lastContact: relativeDate(c.updated_at),
    status: c.status,
    raw: c,
  };
}

// ─── New Contact Dialog ───────────────────────────────────────────────────────
function NewContactDialog({
  clinicId,
  onClose,
  onCreated,
}: {
  clinicId: string;
  onClose: () => void;
  onCreated: (c: Contact) => void;
}) {
  const [form, setForm] = useState({ full_name: "", phone: "", email: "", status: "lead" });
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState("");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!form.full_name.trim()) { setError("Nome é obrigatório."); return; }
    setSaving(true);
    setError("");
    const contact = await createContact(clinicId, form);
    setSaving(false);
    if (!contact) { setError("Erro ao criar contato. Tente novamente."); return; }
    onCreated(mapContact(contact));
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
        className="relative w-full max-w-md rounded-2xl p-6 shadow-2xl z-10"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.2)" }}
      >
        <div className="flex items-center justify-between mb-5">
          <h2 className="text-base font-medium text-z-text">Novo contato</h2>
          <button onClick={onClose} className="w-7 h-7 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all">
            <X size={15} />
          </button>
        </div>

        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="text-xs text-z-dim mb-1.5 block">Nome completo *</label>
            <input
              type="text"
              value={form.full_name}
              onChange={(e) => setForm((f) => ({ ...f, full_name: e.target.value }))}
              placeholder="Ex: Ana Paula Ferreira"
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none transition-all"
              style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
            />
          </div>
          <div className="grid grid-cols-2 gap-3">
            <div>
              <label className="text-xs text-z-dim mb-1.5 block">Telefone</label>
              <input
                type="tel"
                value={form.phone}
                onChange={(e) => setForm((f) => ({ ...f, phone: e.target.value }))}
                placeholder="+55 11 99999-9999"
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none transition-all"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
              />
            </div>
            <div>
              <label className="text-xs text-z-dim mb-1.5 block">Status</label>
              <select
                value={form.status}
                onChange={(e) => setForm((f) => ({ ...f, status: e.target.value }))}
                className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text outline-none transition-all"
                style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
              >
                {statusOptions.map((o) => (
                  <option key={o.value} value={o.value}>{o.label}</option>
                ))}
              </select>
            </div>
          </div>
          <div>
            <label className="text-xs text-z-dim mb-1.5 block">Email</label>
            <input
              type="email"
              value={form.email}
              onChange={(e) => setForm((f) => ({ ...f, email: e.target.value }))}
              placeholder="email@exemplo.com"
              className="w-full px-3 py-2.5 rounded-xl text-sm text-z-text placeholder:text-z-faint outline-none transition-all"
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
              className="flex-1 py-2.5 rounded-xl text-sm text-z-dim transition-all"
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
              {saving ? "Salvando..." : "Criar contato"}
            </motion.button>
          </div>
        </form>
      </motion.div>
    </div>
  );
}

// ─── Contact Detail Panel ─────────────────────────────────────────────────────
function ContactPanel({
  clinicId,
  contact,
  onClose,
  onStatusChange,
  onContactUpdate,
}: {
  clinicId: string;
  contact: Contact;
  onClose: () => void;
  onStatusChange: (id: string, status: string) => void;
  onContactUpdate: (updated: DBContact) => void;
}) {
  const router = useRouter();
  const [tab, setTab] = useState<"info" | "appointments" | "notes">("info");
  const [notes, setNotes] = useState<ContactNote[]>([]);
  const [appointments, setAppointments] = useState<Appointment[]>([]);
  const [noteText, setNoteText] = useState("");
  const [loadingNotes, setLoadingNotes] = useState(false);
  const [loadingAppts, setLoadingAppts] = useState(false);
  const [savingNote, setSavingNote] = useState(false);
  const [changingStatus, setChangingStatus] = useState(false);
  const [currentStatus, setCurrentStatus] = useState(contact.status);
  const [editing, setEditing] = useState(false);
  const [saving, setSaving] = useState(false);
  const [draft, setDraft] = useState({
    full_name: contact.raw.full_name ?? "",
    phone: contact.raw.phone ?? "",
    email: contact.raw.email ?? "",
    birth_date: contact.raw.birth_date ?? "",
    gender: contact.raw.gender ?? "",
    document: contact.raw.document ?? "",
    insurance_type: contact.raw.insurance_type ?? "particular",
    insurance_name: contact.raw.insurance_name ?? "",
    insurance_value: contact.raw.insurance_value ?? "",
    notes: contact.raw.notes ?? "",
  });
  const noteRef = useRef<HTMLTextAreaElement>(null);

  useEffect(() => {
    setCurrentStatus(contact.status);
    setDraft({
      full_name: contact.raw.full_name ?? "",
      phone: contact.raw.phone ?? "",
      email: contact.raw.email ?? "",
      birth_date: contact.raw.birth_date ?? "",
      gender: contact.raw.gender ?? "",
      document: contact.raw.document ?? "",
      insurance_type: contact.raw.insurance_type ?? "particular",
      insurance_name: contact.raw.insurance_name ?? "",
      insurance_value: contact.raw.insurance_value ?? "",
      notes: contact.raw.notes ?? "",
    });
    setEditing(false);
  }, [contact.id]);

  useEffect(() => {
    if (tab === "notes" && notes.length === 0) {
      setLoadingNotes(true);
      getContactNotes(contact.id).then((data) => { setNotes(data); setLoadingNotes(false); });
    }
    if (tab === "appointments" && appointments.length === 0) {
      setLoadingAppts(true);
      getContactAppointments(clinicId, contact.id).then((data) => { setAppointments(data); setLoadingAppts(false); });
    }
  }, [tab, contact.id]);

  const handleAddNote = async () => {
    if (!noteText.trim()) return;
    setSavingNote(true);
    const note = await addContactNote(clinicId, contact.id, noteText.trim());
    setSavingNote(false);
    if (note) { setNotes((prev) => [note, ...prev]); setNoteText(""); }
  };

  const handleStatusChange = async (newStatus: string) => {
    if (newStatus === currentStatus) return;
    setChangingStatus(true);
    await updateContact(contact.id, { status: newStatus });
    setChangingStatus(false);
    setCurrentStatus(newStatus);
    onStatusChange(contact.id, newStatus);
  };

  const handleSave = async () => {
    setSaving(true);
    const updated = await updateContact(contact.id, {
      full_name: draft.full_name.trim() || contact.raw.full_name,
      phone: draft.phone.trim() || undefined,
      email: draft.email.trim() || undefined,
      birth_date: draft.birth_date || undefined,
      gender: draft.gender || undefined,
      document: draft.document.trim() || undefined,
      insurance_type: draft.insurance_type || undefined,
      insurance_name: draft.insurance_name.trim() || undefined,
      insurance_value: draft.insurance_value.trim() || undefined,
      notes: draft.notes.trim() || undefined,
    });
    setSaving(false);
    if (updated) { onContactUpdate(updated); setEditing(false); }
  };

  const d = (k: keyof typeof draft) => (v: string) => setDraft((p) => ({ ...p, [k]: v }));
  const inputCls = "w-full px-2.5 py-1.5 rounded-lg text-xs text-z-text placeholder:text-z-faint outline-none focus:ring-1 focus:ring-[#019A67]";
  const inputStyle = { background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" };
  const labelCls = "block text-[10px] text-z-faint mb-1";

  return (
    <motion.div
      initial={{ opacity: 0, x: 24 }}
      animate={{ opacity: 1, x: 0 }}
      exit={{ opacity: 0, x: 24 }}
      transition={{ duration: 0.25, ease: "easeOut" }}
      className="w-80 border-l border-border flex flex-col overflow-hidden shrink-0"
      style={{ background: "var(--surface-1)" }}
    >
      {/* Header */}
      <div className="p-5 border-b border-border">
        <div className="flex items-start justify-between mb-4">
          <div className="flex items-center gap-3">
            <div
              className="w-11 h-11 rounded-xl flex items-center justify-center text-sm font-medium text-white shrink-0"
              style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.9))" }}
            >
              {initials(contact.name)}
            </div>
            <div>
              <p className="text-sm font-medium text-z-text">{contact.name}</p>
              <p className="text-xs text-z-dim mt-0.5">{contact.phone || "Sem telefone"}</p>
            </div>
          </div>
          <div className="flex items-center gap-1">
            <button
              onClick={() => { if (editing) { setEditing(false); } else { setEditing(true); setTab("info"); } }}
              className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all"
              title={editing ? "Cancelar edição" : "Editar contato"}
            >
              {editing ? <X size={13} /> : <Edit2 size={13} />}
            </button>
            <button onClick={onClose} className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:bg-[rgba(1,154,103,0.08)] transition-all">
              <X size={14} />
            </button>
          </div>
        </div>

        {/* Status selector */}
        {!editing && (
          <div className="flex gap-1 flex-wrap">
            {statusOptions.map((opt) => (
              <button
                key={opt.value}
                onClick={() => handleStatusChange(opt.value)}
                disabled={changingStatus}
                className="flex items-center gap-1 text-[10px] px-2 py-1 rounded-lg font-medium transition-all"
                style={{
                  background: currentStatus === opt.value ? `${opt.color}20` : "var(--input)",
                  color: currentStatus === opt.value ? opt.color : "var(--z-text-dim)",
                  border: currentStatus === opt.value ? `1px solid ${opt.color}40` : "1px solid transparent",
                }}
              >
                {currentStatus === opt.value && <Check size={9} />}
                {opt.label}
              </button>
            ))}
          </div>
        )}
      </div>

      {/* Tabs */}
      {!editing && (
        <div className="flex border-b border-border shrink-0" style={{ background: "var(--surface-2)" }}>
          {([
            { id: "info", label: "Info", icon: User },
            { id: "appointments", label: "Consultas", icon: Calendar },
            { id: "notes", label: "Notas", icon: FileText },
          ] as const).map(({ id, label, icon: Icon }) => (
            <button
              key={id}
              onClick={() => setTab(id)}
              className={cn("flex-1 flex items-center justify-center gap-1.5 py-3 text-xs transition-all",
                tab === id ? "text-[#01c47f] border-b-2 border-[#019A67]" : "text-z-dim")}
            >
              <Icon size={12} />
              {label}
            </button>
          ))}
        </div>
      )}

      {/* Content */}
      <div className="flex-1 overflow-y-auto">
        <AnimatePresence mode="wait">

          {/* ── Edit mode ──────────────────────────────────── */}
          {editing && (
            <motion.div key="edit" initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}
              className="p-5 space-y-4">
              <p className="text-xs font-medium text-z-dim">Editar contato</p>

              <div>
                <label className={labelCls}>Nome completo</label>
                <input className={inputCls} style={inputStyle} value={draft.full_name} onChange={(e) => d("full_name")(e.target.value)} placeholder="Nome completo" />
              </div>
              <div>
                <label className={labelCls}>Telefone</label>
                <input className={inputCls} style={inputStyle} value={draft.phone} onChange={(e) => d("phone")(e.target.value)} placeholder="(11) 99999-9999" />
              </div>
              <div>
                <label className={labelCls}>Email</label>
                <input type="email" className={inputCls} style={inputStyle} value={draft.email} onChange={(e) => d("email")(e.target.value)} placeholder="email@exemplo.com" />
              </div>
              <div className="grid grid-cols-2 gap-2">
                <div>
                  <label className={labelCls}>Data de nascimento</label>
                  <input type="date" className={inputCls} style={inputStyle} value={draft.birth_date} onChange={(e) => d("birth_date")(e.target.value)} />
                </div>
                <div>
                  <label className={labelCls}>Gênero</label>
                  <select className={inputCls} style={inputStyle} value={draft.gender} onChange={(e) => d("gender")(e.target.value)}>
                    <option value="">—</option>
                    <option value="masculino">Masculino</option>
                    <option value="feminino">Feminino</option>
                    <option value="outro">Outro</option>
                  </select>
                </div>
              </div>
              <div>
                <label className={labelCls}>CPF / Documento</label>
                <input className={inputCls} style={inputStyle} value={draft.document} onChange={(e) => d("document")(e.target.value)} placeholder="000.000.000-00" />
              </div>

              {/* Insurance */}
              <div>
                <label className={labelCls}>Tipo de atendimento</label>
                <div className="flex gap-1">
                  {(["particular", "convenio"] as const).map((t) => (
                    <button key={t} type="button"
                      onClick={() => d("insurance_type")(t)}
                      className="flex-1 py-1.5 rounded-lg text-[10px] font-medium transition-all"
                      style={{
                        background: draft.insurance_type === t ? "rgba(1,154,103,0.15)" : "var(--input)",
                        color: draft.insurance_type === t ? "#019A67" : "var(--z-text-dim)",
                        border: draft.insurance_type === t ? "1px solid rgba(1,154,103,0.3)" : "1px solid transparent",
                      }}>
                      {t === "particular" ? "Particular" : "Convênio"}
                    </button>
                  ))}
                </div>
              </div>
              {draft.insurance_type === "convenio" && (
                <div>
                  <label className={labelCls}>Nome do convênio</label>
                  <input className={inputCls} style={inputStyle} value={draft.insurance_name} onChange={(e) => d("insurance_name")(e.target.value)} placeholder="Unimed, Bradesco..." />
                </div>
              )}
              <div>
                <label className={labelCls}>Valor / Cobertura</label>
                <input className={inputCls} style={inputStyle} value={draft.insurance_value} onChange={(e) => d("insurance_value")(e.target.value)} placeholder="R$ 150,00" />
              </div>

              <div>
                <label className={labelCls}>Observações internas</label>
                <textarea className={cn(inputCls, "resize-none")} style={inputStyle} rows={3} value={draft.notes} onChange={(e) => d("notes")(e.target.value)} placeholder="Informações extras..." />
              </div>

              <div className="flex gap-2 pt-1">
                <button onClick={() => setEditing(false)}
                  className="flex-1 py-2 rounded-xl text-xs text-z-dim transition-all"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}>
                  Cancelar
                </button>
                <button onClick={handleSave} disabled={saving}
                  className="flex-1 py-2 rounded-xl text-xs text-white font-medium flex items-center justify-center gap-1.5 disabled:opacity-60"
                  style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}>
                  {saving ? <Loader2 size={12} className="animate-spin" /> : <Save size={12} />}
                  Salvar
                </button>
              </div>
            </motion.div>
          )}

          {/* ── Info tab ───────────────────────────────────── */}
          {!editing && tab === "info" && (
            <motion.div
              key="info"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="p-5 space-y-4"
            >
              <div className="space-y-3">
                {contact.phone && (
                  <div className="flex items-center gap-3">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                      <Phone size={12} style={{ color: "#019A67" }} />
                    </div>
                    <div>
                      <p className="text-[10px] text-z-faint">Telefone</p>
                      <p className="text-xs text-z-text">{contact.phone}</p>
                    </div>
                  </div>
                )}
                {contact.email && (
                  <div className="flex items-center gap-3">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                      <Mail size={12} style={{ color: "#019A67" }} />
                    </div>
                    <div>
                      <p className="text-[10px] text-z-faint">Email</p>
                      <p className="text-xs text-z-text">{contact.email}</p>
                    </div>
                  </div>
                )}
                {contact.raw.birth_date && (
                  <div className="flex items-center gap-3">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                      <Cake size={12} style={{ color: "#019A67" }} />
                    </div>
                    <div>
                      <p className="text-[10px] text-z-faint">Nascimento</p>
                      <p className="text-xs text-z-text">{new Date(contact.raw.birth_date + "T12:00:00").toLocaleDateString("pt-BR")}</p>
                    </div>
                  </div>
                )}
                {contact.raw.document && (
                  <div className="flex items-center gap-3">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                      <IdCard size={12} style={{ color: "#019A67" }} />
                    </div>
                    <div>
                      <p className="text-[10px] text-z-faint">CPF / Documento</p>
                      <p className="text-xs text-z-text">{contact.raw.document}</p>
                    </div>
                  </div>
                )}
                {(contact.raw.insurance_type || contact.raw.insurance_name) && (
                  <div className="flex items-center gap-3">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                      <ShieldCheck size={12} style={{ color: "#019A67" }} />
                    </div>
                    <div>
                      <p className="text-[10px] text-z-faint">Atendimento</p>
                      <p className="text-xs text-z-text">
                        {contact.raw.insurance_type === "convenio"
                          ? `Convênio${contact.raw.insurance_name ? ` — ${contact.raw.insurance_name}` : ""}`
                          : "Particular"}
                      </p>
                    </div>
                  </div>
                )}
                {contact.raw.insurance_value && (
                  <div className="flex items-center gap-3">
                    <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                      <Banknote size={12} style={{ color: "#019A67" }} />
                    </div>
                    <div>
                      <p className="text-[10px] text-z-faint">Valor</p>
                      <p className="text-xs text-z-text">{contact.raw.insurance_value}</p>
                    </div>
                  </div>
                )}
                <div className="flex items-center gap-3">
                  <div className="w-7 h-7 rounded-lg flex items-center justify-center shrink-0" style={{ background: "rgba(1,154,103,0.1)" }}>
                    <Clock size={12} style={{ color: "#019A67" }} />
                  </div>
                  <div>
                    <p className="text-[10px] text-z-faint">Último contato</p>
                    <p className="text-xs text-z-text">{contact.lastContact}</p>
                  </div>
                </div>
                {contact.raw.tags && contact.raw.tags.length > 0 && (
                  <div>
                    <p className="text-[10px] text-z-faint mb-2">Tags</p>
                    <div className="flex flex-wrap gap-1">
                      {contact.raw.tags.map((tag) => (
                        <span key={tag} className="text-[10px] px-2 py-0.5 rounded-full" style={{ background: "rgba(1,154,103,0.1)", color: "#019A67" }}>
                          {tag}
                        </span>
                      ))}
                    </div>
                  </div>
                )}
                {contact.raw.notes && (
                  <div className="p-3 rounded-xl text-xs text-z-dim" style={{ background: "rgba(1,154,103,0.04)", border: "1px solid rgba(1,154,103,0.1)" }}>
                    {contact.raw.notes}
                  </div>
                )}
              </div>

              <div className="pt-2 space-y-2">
                <button
                  onClick={() => contact.raw.wa_chat_id && router.push(`/dashboard/chats?open=${contact.raw.wa_chat_id}`)}
                  disabled={!contact.raw.wa_chat_id}
                  className="w-full py-2.5 rounded-xl text-sm text-white font-medium flex items-center justify-center gap-2 disabled:opacity-40"
                  style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
                  title={!contact.raw.wa_chat_id ? "Contato sem WhatsApp vinculado" : undefined}
                >
                  <MessageCircle size={14} />
                  Abrir chat
                </button>
                <button
                  onClick={() => router.push("/dashboard/agenda")}
                  className="w-full py-2.5 rounded-xl text-xs text-z-dim flex items-center justify-center gap-2 transition-all hover:bg-[rgba(1,154,103,0.05)]"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
                >
                  <Calendar size={13} />
                  Agendar consulta
                </button>
              </div>
            </motion.div>
          )}

          {tab === "appointments" && (
            <motion.div
              key="appointments"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="p-5 space-y-3"
            >
              {loadingAppts ? (
                <div className="space-y-3">
                  {[1, 2].map((i) => (
                    <div key={i} className="h-16 rounded-xl animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
                  ))}
                </div>
              ) : appointments.length === 0 ? (
                <div className="text-center py-8">
                  <Calendar size={28} className="mx-auto text-z-faint mb-2" />
                  <p className="text-xs text-z-dim">Nenhuma consulta encontrada</p>
                </div>
              ) : (
                appointments.map((appt) => {
                  const statusColor = appointmentStatusColors[appt.status] ?? "#6b8f78";
                  return (
                    <div
                      key={appt.id}
                      className="p-3 rounded-xl space-y-2"
                      style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.08)" }}
                    >
                      <div className="flex items-start justify-between gap-2">
                        <div>
                          <p className="text-xs font-medium text-z-text">{appt.type_name_snapshot ?? "Consulta"}</p>
                          <p className="text-[10px] text-z-dim mt-0.5">
                            {formatDatePT(appt.scheduled_date)} · {appt.start_time.slice(0, 5)}
                          </p>
                        </div>
                        <span
                          className="text-[10px] px-2 py-0.5 rounded-lg font-medium shrink-0"
                          style={{ background: `${statusColor}15`, color: statusColor }}
                        >
                          {appointmentStatusLabels[appt.status] ?? appt.status}
                        </span>
                      </div>
                    </div>
                  );
                })
              )}
            </motion.div>
          )}

          {tab === "notes" && (
            <motion.div
              key="notes"
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              className="flex flex-col h-full"
            >
              <div className="flex-1 p-5 space-y-3 overflow-y-auto">
                {loadingNotes ? (
                  <div className="space-y-3">
                    {[1, 2].map((i) => (
                      <div key={i} className="h-16 rounded-xl animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
                    ))}
                  </div>
                ) : notes.length === 0 ? (
                  <div className="text-center py-8">
                    <FileText size={28} className="mx-auto text-z-faint mb-2" />
                    <p className="text-xs text-z-dim">Nenhuma nota ainda</p>
                  </div>
                ) : (
                  notes.map((note) => (
                    <div
                      key={note.id}
                      className="p-3 rounded-xl"
                      style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.08)" }}
                    >
                      <p className="text-xs text-z-text leading-relaxed">{note.body}</p>
                      <p className="text-[10px] text-z-faint mt-2">{relativeDate(note.created_at)}</p>
                    </div>
                  ))
                )}
              </div>

              {/* Note input */}
              <div className="p-4 border-t border-border shrink-0">
                <div
                  className="flex items-end gap-2 rounded-xl p-2"
                  style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.15)" }}
                >
                  <textarea
                    ref={noteRef}
                    value={noteText}
                    onChange={(e) => setNoteText(e.target.value)}
                    onKeyDown={(e) => {
                      if (e.key === "Enter" && (e.metaKey || e.ctrlKey)) handleAddNote();
                    }}
                    placeholder="Adicionar nota... (⌘+Enter)"
                    rows={2}
                    className="flex-1 bg-transparent text-xs text-z-text placeholder:text-z-faint outline-none resize-none"
                  />
                  <button
                    onClick={handleAddNote}
                    disabled={!noteText.trim() || savingNote}
                    className="w-7 h-7 rounded-lg flex items-center justify-center text-white disabled:opacity-40 transition-all shrink-0"
                    style={{ background: "#019A67" }}
                  >
                    <Send size={12} />
                  </button>
                </div>
              </div>
            </motion.div>
          )}
        </AnimatePresence>
      </div>
    </motion.div>
  );
}

// ─── Main Page ────────────────────────────────────────────────────────────────
export default function CRMPage() {
  const { clinicId, loaded: clinicLoaded } = useClinic();
  const [view, setView] = useState<"list" | "kanban">("list");
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedContact, setSelectedContact] = useState<Contact | null>(null);
  const [contacts, setContacts] = useState<Contact[]>([]);
  const [loading, setLoading] = useState(true);
  const [showNewDialog, setShowNewDialog] = useState(false);
  const [statusFilter, setStatusFilter] = useState<string>("all");
  const [showFilterMenu, setShowFilterMenu] = useState(false);

  useEffect(() => {
    if (!clinicLoaded) return;
    getContacts(clinicId).then((data) => {
      setContacts(data.map(mapContact));
      setLoading(false);
    });
  }, [clinicId, clinicLoaded]);

  const filteredContacts = contacts.filter((c) => {
    const matchSearch = c.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
      c.phone.includes(searchQuery) ||
      c.email.toLowerCase().includes(searchQuery.toLowerCase());
    const matchStatus = statusFilter === "all" || c.status === statusFilter;
    return matchSearch && matchStatus;
  });

  const handleStatusChange = (id: string, newStatus: string) => {
    setContacts((prev) =>
      prev.map((c) => {
        if (c.id !== id) return c;
        const tm = statusTagMap[newStatus] ?? { label: newStatus, color: "#019A67" };
        return { ...c, status: newStatus, tag: tm.label, tagColor: tm.color, raw: { ...c.raw, status: newStatus } };
      })
    );
    if (selectedContact?.id === id) {
      setSelectedContact((prev) => {
        if (!prev) return prev;
        const tm = statusTagMap[newStatus] ?? { label: newStatus, color: "#019A67" };
        return { ...prev, status: newStatus, tag: tm.label, tagColor: tm.color, raw: { ...prev.raw, status: newStatus } };
      });
    }
  };

  const handleContactUpdate = (updated: DBContact) => {
    const mapped = mapContact(updated);
    setContacts((prev) => prev.map((c) => (c.id === updated.id ? mapped : c)));
    setSelectedContact(mapped);
  };

  const kanbanColumns = [
    { id: "lead",     label: "Leads",     color: "#019A67",           icon: TrendingUp,   contacts: filteredContacts.filter((c) => c.status === "lead") },
    { id: "patient",  label: "Pacientes", color: "#01c47f",           icon: Heart,        contacts: filteredContacts.filter((c) => c.status === "patient") },
    { id: "return",   label: "Retorno",   color: "#f59e0b",           icon: Clock,        contacts: filteredContacts.filter((c) => c.status === "return") },
    { id: "inactive", label: "Inativo",   color: "#6b8f78",           icon: CheckCircle2, contacts: filteredContacts.filter((c) => c.status === "inactive") },
  ];

  return (
    <div className="flex flex-col h-full">
      {/* Header */}
      <div
        className="flex items-center justify-between px-6 py-4 border-b border-border shrink-0"
        style={{ background: "var(--surface-2)", backdropFilter: "blur(20px)" }}
      >
        <div>
          <h1 className="text-xl text-z-text" style={{ fontWeight: 500 }}>CRM</h1>
          <p className="text-xs text-z-dim mt-0.5">
            {loading ? "..." : `${contacts.length} contatos`}
            {statusFilter !== "all" && ` · filtrado por ${statusTagMap[statusFilter]?.label}`}
          </p>
        </div>

        <div className="flex items-center gap-2">
          {/* Search */}
          <div
            className="flex items-center gap-2 px-3 py-2 rounded-xl"
            style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
          >
            <Search size={13} className="text-z-dim" />
            <input
              type="text"
              placeholder="Buscar contato..."
              value={searchQuery}
              onChange={(e) => setSearchQuery(e.target.value)}
              className="bg-transparent text-sm text-z-text placeholder:text-z-faint outline-none w-40"
            />
            {searchQuery && (
              <button onClick={() => setSearchQuery("")} className="text-z-faint hover:text-z-dim">
                <X size={12} />
              </button>
            )}
          </div>

          {/* Filter */}
          <div className="relative">
            <button
              onClick={() => setShowFilterMenu((p) => !p)}
              className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-z-dim hover:text-z-dim transition-all"
              style={{
                background: statusFilter !== "all" ? "rgba(1,154,103,0.1)" : "var(--input)",
                border: statusFilter !== "all" ? "1px solid rgba(1,154,103,0.2)" : "1px solid rgba(1,154,103,0.1)",
                color: statusFilter !== "all" ? "#019A67" : undefined,
              }}
            >
              <Filter size={13} />
              {statusFilter !== "all" ? statusTagMap[statusFilter]?.label : "Filtros"}
              <ChevronDown size={12} />
            </button>
            <AnimatePresence>
              {showFilterMenu && (
                <motion.div
                  initial={{ opacity: 0, y: 6, scale: 0.96 }}
                  animate={{ opacity: 1, y: 0, scale: 1 }}
                  exit={{ opacity: 0, y: 6, scale: 0.96 }}
                  transition={{ duration: 0.15 }}
                  className="absolute right-0 top-full mt-1 rounded-xl shadow-2xl z-20 py-1 min-w-32"
                  style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.15)" }}
                >
                  {[{ value: "all", label: "Todos" }, ...statusOptions].map((opt) => (
                    <button
                      key={opt.value}
                      onClick={() => { setStatusFilter(opt.value); setShowFilterMenu(false); }}
                      className="w-full px-3 py-2 text-left text-xs text-z-dim hover:bg-[rgba(1,154,103,0.06)] flex items-center gap-2 transition-all"
                    >
                      {statusFilter === opt.value && <Check size={10} className="text-[#019A67]" />}
                      <span style={{ marginLeft: statusFilter === opt.value ? 0 : 14 }}>{opt.label}</span>
                    </button>
                  ))}
                </motion.div>
              )}
            </AnimatePresence>
          </div>

          {/* View toggle */}
          <div
            className="flex items-center p-0.5 rounded-xl"
            style={{ background: "var(--input)", border: "1px solid rgba(1,154,103,0.1)" }}
          >
            <button
              onClick={() => setView("list")}
              className={cn(
                "p-1.5 rounded-lg transition-all duration-200",
                view === "list" ? "text-[#019A67] bg-[rgba(1,154,103,0.15)]" : "text-z-dim hover:text-z-dim"
              )}
            >
              <LayoutList size={15} />
            </button>
            <button
              onClick={() => setView("kanban")}
              className={cn(
                "p-1.5 rounded-lg transition-all duration-200",
                view === "kanban" ? "text-[#019A67] bg-[rgba(1,154,103,0.15)]" : "text-z-dim hover:text-z-dim"
              )}
            >
              <Kanban size={15} />
            </button>
          </div>

          {/* Add button */}
          <motion.button
            whileHover={{ scale: 1.02 }}
            whileTap={{ scale: 0.98 }}
            onClick={() => setShowNewDialog(true)}
            className="flex items-center gap-1.5 px-3 py-2 rounded-xl text-sm text-white font-medium"
            style={{ background: "linear-gradient(135deg, #019A67, #01a870)", boxShadow: "0 0 16px rgba(1,154,103,0.3)" }}
          >
            <Plus size={14} />
            Novo contato
          </motion.button>
        </div>
      </div>

      {/* Main layout */}
      <div className="flex flex-1 overflow-hidden">
        {/* Content */}
        <div className={cn("flex-1 overflow-auto p-6", selectedContact && "pr-3")}>
          <AnimatePresence mode="wait">
            {view === "list" ? (
              <motion.div
                key="list"
                initial={{ opacity: 0, y: 8 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -8 }}
                transition={{ duration: 0.25 }}
              >
                <div
                  className="rounded-2xl overflow-hidden"
                  style={{ background: "var(--surface-2)", border: "1px solid rgba(1,154,103,0.1)" }}
                >
                  {/* Table head */}
                  <div
                    className="grid grid-cols-12 gap-4 px-5 py-3 text-xs text-z-dim font-medium border-b border-border"
                    style={{ background: "var(--surface-1)" }}
                  >
                    <div className="col-span-3 flex items-center gap-2"><User size={12} />Nome</div>
                    <div className="col-span-2">Telefone</div>
                    <div className="col-span-3">Email</div>
                    <div className="col-span-1">Últ. contato</div>
                    <div className="col-span-2">Tag</div>
                    <div className="col-span-1 text-right">Ações</div>
                  </div>

                  {loading ? (
                    Array.from({ length: 5 }).map((_, i) => (
                      <div key={i} className="grid grid-cols-12 gap-4 px-5 py-3.5 border-b border-border">
                        <div className="col-span-3 flex items-center gap-3">
                          <div className="w-8 h-8 rounded-xl animate-pulse" style={{ background: "rgba(1,154,103,0.08)" }} />
                          <div className="h-3 w-28 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
                        </div>
                        <div className="col-span-9 flex items-center">
                          <div className="h-3 w-full rounded animate-pulse" style={{ background: "rgba(1,154,103,0.04)" }} />
                        </div>
                      </div>
                    ))
                  ) : filteredContacts.length === 0 ? (
                    <div className="px-5 py-12 text-center">
                      <p className="text-sm text-z-dim">Nenhum contato encontrado</p>
                      <button onClick={() => setShowNewDialog(true)} className="mt-3 text-xs text-[#019A67] hover:text-[#01c47f]">
                        + Criar contato
                      </button>
                    </div>
                  ) : (
                    filteredContacts.map((contact, i) => (
                      <motion.div
                        key={contact.id}
                        initial={{ opacity: 0, x: -8 }}
                        animate={{ opacity: 1, x: 0 }}
                        transition={{ delay: i * 0.03 }}
                        onClick={() => setSelectedContact(selectedContact?.id === contact.id ? null : contact)}
                        className={cn(
                          "grid grid-cols-12 gap-4 px-5 py-3.5 border-b border-border cursor-pointer transition-all group",
                          selectedContact?.id === contact.id
                            ? "bg-[rgba(1,154,103,0.06)]"
                            : "hover:bg-[rgba(1,154,103,0.04)]"
                        )}
                      >
                        <div className="col-span-3 flex items-center gap-3">
                          <div
                            className="w-8 h-8 rounded-xl flex items-center justify-center text-xs font-medium text-white shrink-0"
                            style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" }}
                          >
                            {initials(contact.name)}
                          </div>
                          <span className={cn("text-sm font-medium truncate transition-colors", selectedContact?.id === contact.id ? "text-[#01c47f]" : "text-z-text group-hover:text-[#01c47f]")}>
                            {contact.name}
                          </span>
                        </div>

                        <div className="col-span-2 flex items-center">
                          <span className="text-sm text-z-dim">{contact.phone || "—"}</span>
                        </div>
                        <div className="col-span-3 flex items-center">
                          <span className="text-sm text-z-dim truncate">{contact.email || "—"}</span>
                        </div>
                        <div className="col-span-1 flex items-center">
                          <span className="text-xs text-z-dim">{contact.lastContact}</span>
                        </div>
                        <div className="col-span-2 flex items-center">
                          <span
                            className="text-xs px-2 py-0.5 rounded-lg font-medium"
                            style={{ background: `${contact.tagColor}18`, color: contact.tagColor, border: `1px solid ${contact.tagColor}30` }}
                          >
                            {contact.tag}
                          </span>
                        </div>

                        <div className="col-span-1 flex items-center justify-end gap-1 opacity-0 group-hover:opacity-100 transition-opacity">
                          <button
                            className="w-6 h-6 rounded-lg flex items-center justify-center text-z-dim hover:text-[#019A67] hover:bg-[rgba(1,154,103,0.1)] transition-all"
                            onClick={(e) => { e.stopPropagation(); }}
                          >
                            <ChevronRight size={12} />
                          </button>
                        </div>
                      </motion.div>
                    ))
                  )}
                </div>
              </motion.div>
            ) : (
              <motion.div
                key="kanban"
                initial={{ opacity: 0, y: 8 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -8 }}
                transition={{ duration: 0.25 }}
                className="flex gap-4 h-full overflow-x-auto pb-4"
              >
                {kanbanColumns.map((col, ci) => {
                  const Icon = col.icon;
                  return (
                    <motion.div
                      key={col.id}
                      initial={{ opacity: 0, y: 16 }}
                      animate={{ opacity: 1, y: 0 }}
                      transition={{ delay: ci * 0.08 }}
                      className="w-72 shrink-0 flex flex-col gap-3"
                    >
                      <div
                        className="flex items-center justify-between px-4 py-3 rounded-xl"
                        style={{ background: `${col.color}10`, border: `1px solid ${col.color}25` }}
                      >
                        <div className="flex items-center gap-2">
                          <Icon size={14} style={{ color: col.color }} />
                          <span className="text-sm font-medium" style={{ color: col.color }}>{col.label}</span>
                          <span className="text-[10px] px-1.5 py-0.5 rounded-full font-medium" style={{ background: `${col.color}20`, color: col.color }}>
                            {col.contacts.length}
                          </span>
                        </div>
                        <button
                          onClick={() => setShowNewDialog(true)}
                          className="w-5 h-5 rounded-md flex items-center justify-center transition-all"
                          style={{ color: col.color }}
                        >
                          <Plus size={12} />
                        </button>
                      </div>

                      <div className="flex flex-col gap-2 overflow-y-auto">
                        {col.contacts.map((contact, ci2) => (
                          <motion.div
                            key={contact.id}
                            initial={{ opacity: 0, scale: 0.95 }}
                            animate={{ opacity: 1, scale: 1 }}
                            transition={{ delay: ci * 0.08 + ci2 * 0.05 }}
                            onClick={() => setSelectedContact(selectedContact?.id === contact.id ? null : contact)}
                            className="p-4 rounded-xl cursor-pointer group transition-all duration-200"
                            style={{
                              background: selectedContact?.id === contact.id ? "rgba(1,154,103,0.08)" : "var(--surface-1)",
                              border: selectedContact?.id === contact.id ? "1px solid rgba(1,154,103,0.3)" : "1px solid rgba(1,154,103,0.1)",
                            }}
                            whileHover={{ borderColor: "rgba(1,154,103,0.25)", background: "rgba(1,154,103,0.05)" }}
                          >
                            <div className="flex items-center justify-between mb-3">
                              <div className="flex items-center gap-2.5">
                                <div
                                  className="w-8 h-8 rounded-xl flex items-center justify-center text-xs font-medium text-white"
                                  style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" }}
                                >
                                  {initials(contact.name)}
                                </div>
                                <div>
                                  <p className="text-xs font-medium text-z-text">{contact.name}</p>
                                  <p className="text-[10px] text-z-dim">{contact.phone || "—"}</p>
                                </div>
                              </div>
                              <button className="opacity-0 group-hover:opacity-100 text-z-dim hover:text-z-dim transition-all">
                                <MoreHorizontal size={14} />
                              </button>
                            </div>

                            <div className="flex items-center justify-between">
                              <span
                                className="text-[10px] px-2 py-0.5 rounded font-medium"
                                style={{ background: `${contact.tagColor}15`, color: contact.tagColor }}
                              >
                                {contact.tag}
                              </span>
                            </div>

                            <div className="mt-2.5 flex items-center gap-3 text-[10px] text-z-faint">
                              <span className="flex items-center gap-1">
                                <Calendar size={9} />
                                {contact.lastContact}
                              </span>
                              {contact.phone && (
                                <span className="flex items-center gap-1">
                                  <Phone size={9} />
                                  {contact.phone.slice(-4)}
                                </span>
                              )}
                            </div>
                          </motion.div>
                        ))}

                        <button
                          onClick={() => setShowNewDialog(true)}
                          className="w-full py-3 rounded-xl text-xs transition-all duration-200 flex items-center justify-center gap-1.5"
                          style={{ border: `1px dashed ${col.color}30`, color: col.color }}
                        >
                          <Plus size={12} />
                          Adicionar
                        </button>
                      </div>
                    </motion.div>
                  );
                })}
              </motion.div>
            )}
          </AnimatePresence>
        </div>

        {/* Contact detail panel */}
        <AnimatePresence>
          {selectedContact && (
            <ContactPanel
              clinicId={clinicId}
              contact={selectedContact}
              onClose={() => setSelectedContact(null)}
              onStatusChange={handleStatusChange}
              onContactUpdate={handleContactUpdate}
            />
          )}
        </AnimatePresence>
      </div>

      {/* New contact dialog */}
      <AnimatePresence>
        {showNewDialog && (
          <NewContactDialog
            clinicId={clinicId}
            onClose={() => setShowNewDialog(false)}
            onCreated={(c) => setContacts((prev) => [c, ...prev])}
          />
        )}
      </AnimatePresence>
    </div>
  );
}
