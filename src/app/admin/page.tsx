"use client";

import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import { Building2, Users, Activity, MessageSquare, TrendingUp, Wifi, WifiOff, Clock } from "lucide-react";
import { getAllClinics, type ClinicWithStats } from "@/lib/db/admin";

const statusColors: Record<string, { color: string; label: string }> = {
  connected:    { color: "#019A67", label: "Conectado" },
  disconnected: { color: "#6b8f78", label: "Desconectado" },
  connecting:   { color: "#f59e0b", label: "Conectando" },
  error:        { color: "#e05555", label: "Erro" },
};

const planColors: Record<string, string> = {
  free:       "#6b8f78",
  starter:    "#6366f1",
  pro:        "#019A67",
  enterprise: "#f59e0b",
};

function formatDate(iso: string) {
  return new Date(iso).toLocaleDateString("pt-BR", { day: "2-digit", month: "short", year: "numeric" });
}

export default function AdminOverviewPage() {
  const [clinics, setClinics] = useState<ClinicWithStats[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    getAllClinics().then((data) => { setClinics(data); setLoading(false); });
  }, []);

  const totalClinics       = clinics.length;
  const activeClinics      = clinics.filter((c) => c.active).length;
  const connectedWhatsApp  = clinics.filter((c) => c.uazapi_status === "connected").length;
  const totalMembers       = clinics.reduce((s, c) => s + c.member_count, 0);

  const stats = [
    { label: "Total de clínicas",    value: loading ? "—" : String(totalClinics),      sub: `${activeClinics} ativas`,            icon: Building2,    color: "#019A67" },
    { label: "Usuários cadastrados", value: loading ? "—" : String(totalMembers),       sub: "em todas as clínicas",              icon: Users,        color: "#6366f1" },
    { label: "WhatsApp conectados",  value: loading ? "—" : String(connectedWhatsApp),  sub: `de ${totalClinics} clínicas`,       icon: MessageSquare, color: "#01c47f" },
    { label: "Planos ativos",        value: loading ? "—" : String(activeClinics),      sub: "faturamento recorrente",            icon: TrendingUp,   color: "#f59e0b" },
  ];

  return (
    <div className="p-6 space-y-6">
      <div>
        <h1 className="text-2xl text-z-text" style={{ fontWeight: 500, letterSpacing: "-0.02em" }}>Painel Administrativo</h1>
        <p className="text-sm text-z-dim mt-1">Gestão global da plataforma Zelus</p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-4">
        {stats.map((s, i) => {
          const Icon = s.icon;
          return (
            <motion.div
              key={s.label}
              initial={{ opacity: 0, y: 20 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.07, duration: 0.4 }}
              className="rounded-2xl p-5"
              style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.1)" }}
            >
              <div className="flex items-center justify-between mb-4">
                <div className="w-9 h-9 rounded-xl flex items-center justify-center" style={{ background: `${s.color}15`, border: `1px solid ${s.color}25` }}>
                  <Icon size={17} style={{ color: s.color }} />
                </div>
              </div>
              <p className="text-2xl text-z-text mb-0.5" style={{ fontWeight: 500, letterSpacing: "-0.03em" }}>{s.value}</p>
              <p className="text-sm text-z-dim">{s.label}</p>
              <p className="text-xs text-z-faint mt-0.5">{s.sub}</p>
            </motion.div>
          );
        })}
      </div>

      {/* Clinics table */}
      <motion.div
        initial={{ opacity: 0, y: 16 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.32 }}
        className="rounded-2xl overflow-hidden"
        style={{ background: "var(--surface-1)", border: "1px solid rgba(1,154,103,0.1)" }}
      >
        <div className="flex items-center justify-between px-5 py-4 border-b border-border">
          <div>
            <h3 className="text-sm font-medium text-z-text">Clínicas cadastradas</h3>
            <p className="text-xs text-z-dim mt-0.5">{totalClinics} clínicas na plataforma</p>
          </div>
          <a href="/admin/clinicas" className="text-xs text-[#019A67] hover:text-[#01c47f] transition-colors">
            Gerenciar →
          </a>
        </div>

        <div className="divide-y divide-border">
          {loading ? (
            Array.from({ length: 3 }).map((_, i) => (
              <div key={i} className="flex items-center gap-4 px-5 py-4">
                <div className="w-9 h-9 rounded-xl animate-pulse" style={{ background: "rgba(1,154,103,0.08)" }} />
                <div className="flex-1 space-y-2">
                  <div className="h-3 w-40 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.06)" }} />
                  <div className="h-2.5 w-28 rounded animate-pulse" style={{ background: "rgba(1,154,103,0.04)" }} />
                </div>
              </div>
            ))
          ) : clinics.length === 0 ? (
            <div className="px-5 py-10 text-center">
              <p className="text-sm text-z-dim">Nenhuma clínica cadastrada</p>
              <a href="/admin/clinicas" className="mt-2 text-xs text-[#019A67] hover:text-[#01c47f] block">
                + Criar primeira clínica
              </a>
            </div>
          ) : (
            clinics.slice(0, 8).map((clinic) => {
              const waStatus = statusColors[clinic.uazapi_status ?? "disconnected"] ?? statusColors.disconnected;
              const planColor = planColors[clinic.plan] ?? "#6b8f78";
              return (
                <div key={clinic.id} className="flex items-center gap-4 px-5 py-3.5 hover:bg-[rgba(1,154,103,0.03)] transition-colors">
                  <div
                    className="w-9 h-9 rounded-xl flex items-center justify-center text-xs font-medium text-white shrink-0"
                    style={{ background: "linear-gradient(135deg, rgba(1,154,103,0.5), rgba(1,154,103,0.8))" }}
                  >
                    {clinic.name.slice(0, 2).toUpperCase()}
                  </div>

                  <div className="flex-1 min-w-0">
                    <div className="flex items-center gap-2">
                      <p className="text-sm font-medium text-z-text truncate">{clinic.name}</p>
                      {!clinic.active && (
                        <span className="text-[9px] px-1.5 py-0.5 rounded font-medium" style={{ background: "rgba(224,85,85,0.12)", color: "#e05555" }}>Suspenso</span>
                      )}
                    </div>
                    <div className="flex items-center gap-3 mt-0.5">
                      <span className="text-xs text-z-faint flex items-center gap-1">
                        <Users size={10} /> {clinic.member_count} membros
                      </span>
                      <span className="text-xs text-z-faint flex items-center gap-1">
                        <Activity size={10} /> {clinic.doctor_count} médicos
                      </span>
                      <span className="text-xs text-z-faint flex items-center gap-1">
                        <Clock size={10} /> {formatDate(clinic.created_at)}
                      </span>
                    </div>
                  </div>

                  <div className="flex items-center gap-3 shrink-0">
                    {/* WhatsApp status */}
                    <div className="flex items-center gap-1.5">
                      {clinic.uazapi_status === "connected"
                        ? <Wifi size={12} style={{ color: waStatus.color }} />
                        : <WifiOff size={12} style={{ color: waStatus.color }} />
                      }
                      <span className="text-[10px]" style={{ color: waStatus.color }}>{waStatus.label}</span>
                    </div>

                    {/* Plan badge */}
                    <span
                      className="text-[10px] px-2 py-0.5 rounded-lg font-medium capitalize"
                      style={{ background: `${planColor}15`, color: planColor }}
                    >
                      {clinic.plan}
                    </span>
                  </div>
                </div>
              );
            })
          )}
        </div>
      </motion.div>
    </div>
  );
}
