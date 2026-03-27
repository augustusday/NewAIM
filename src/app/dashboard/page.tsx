"use client";

import { useEffect, useState } from "react";
import { motion } from "framer-motion";
import Link from "next/link";
import {
  TrendingUp,
  Users,
  CalendarDays,
  MessageCircle,
  ArrowUpRight,
  Activity,
  Clock,
  Star,
  Zap,
} from "lucide-react";
import { useClinic } from "@/hooks/use-clinic";
import { useUser } from "@/hooks/use-user";
import {
  getDashboardStats,
  getAppointmentsByDay,
  getTopDoctors,
  getTodayAppointments,
  type DoctorWithAppointments,
  type AppointmentWithDoctor,
} from "@/lib/db/dashboard";
import type { DashboardStats, AppointmentsByDay } from "@/lib/database.types";

const fadeUp = {
  initial: { opacity: 0, y: 20 },
  animate: { opacity: 1, y: 0 },
  transition: { duration: 0.5, ease: "easeOut" as const },
};

const statusColors: Record<string, string> = {
  confirmed: "#019A67",
  scheduled: "#f59e0b",
  cancelled: "#e05555",
  completed: "#6b8f78",
  in_progress: "#01c47f",
  no_show: "#e05555",
};

const statusLabels: Record<string, string> = {
  confirmed: "Confirmado",
  scheduled: "Agendado",
  cancelled: "Cancelado",
  completed: "Concluído",
  in_progress: "Em atendimento",
  no_show: "Não compareceu",
};

const DAY_LABELS = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];

function formatDate(date: Date) {
  return date.toLocaleDateString("pt-BR", {
    weekday: "long",
    day: "numeric",
    month: "long",
    year: "numeric",
  });
}

function initials(name: string) {
  const parts = name.trim().split(" ").filter(Boolean);
  if (parts.length === 1) return parts[0].slice(0, 2).toUpperCase();
  return (parts[0][0] + parts[parts.length - 1][0]).toUpperCase();
}

export default function DashboardPage() {
  const { clinicId, loaded: clinicLoaded } = useClinic();
  const { user } = useUser();

  const greeting = (() => {
    const h = new Date().getHours();
    if (h < 12) return "Bom dia";
    if (h < 18) return "Boa tarde";
    return "Boa noite";
  })();
  const [stats, setStats] = useState<DashboardStats | null>(null);
  const [chartData, setChartData] = useState<AppointmentsByDay[]>([]);
  const [topDoctors, setTopDoctors] = useState<DoctorWithAppointments[]>([]);
  const [appointments, setAppointments] = useState<AppointmentWithDoctor[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (!clinicLoaded) return;

    // Build last 7 days range for chart
    const today = new Date();
    const sevenDaysAgo = new Date(today);
    sevenDaysAgo.setDate(today.getDate() - 6);
    const fromStr = sevenDaysAgo.toISOString().split("T")[0];
    const toStr = today.toISOString().split("T")[0];

    Promise.all([
      getDashboardStats(clinicId),
      getAppointmentsByDay(clinicId, fromStr, toStr),
      getTopDoctors(clinicId),
      getTodayAppointments(clinicId),
    ]).then(([s, chart, doctors, appts]) => {
      setStats(s);
      setChartData(chart);
      setTopDoctors(doctors);
      setAppointments(appts);
      setLoading(false);
    }).catch((err) => {
      console.error("[Dashboard] Failed to load data:", err);
      setLoading(false);
    });
  }, [clinicId, clinicLoaded]);

  // Build chart bars for last 7 days (fill gaps with 0)
  const today = new Date();
  const last7Days = Array.from({ length: 7 }, (_, i) => {
    const d = new Date(today);
    d.setDate(today.getDate() - 6 + i);
    return d.toISOString().split("T")[0];
  });

  const chartMap = Object.fromEntries(
    chartData.map((r) => [r.scheduled_date, r.total ?? 0])
  );

  const bars = last7Days.map((dateStr) => {
    const d = new Date(dateStr + "T12:00:00");
    return {
      day: DAY_LABELS[d.getDay()],
      value: chartMap[dateStr] ?? 0,
      isToday: dateStr === today.toISOString().split("T")[0],
    };
  });

  const maxVal = Math.max(...bars.map((b) => b.value), 1);
  const totalWeek = bars.reduce((s, b) => s + b.value, 0);

  const statCards = [
    {
      label: "Consultas hoje",
      value: loading ? "—" : String(stats?.appointments_today ?? 0),
      icon: CalendarDays,
      sub: `${stats?.confirmed_today ?? 0} confirmadas`,
      positive: true,
    },
    {
      label: "Total de pacientes",
      value: loading ? "—" : String(stats?.patients_count ?? 0),
      icon: Users,
      sub: `${stats?.new_contacts_month ?? 0} novos este mês`,
      positive: true,
    },
    {
      label: "Chats abertos",
      value: loading ? "—" : String(stats?.open_chats ?? 0),
      icon: MessageCircle,
      sub: `${stats?.total_unread ?? 0} mensagens não lidas`,
      positive: (stats?.total_unread ?? 0) === 0,
    },
    {
      label: "Consultas no mês",
      value: loading ? "—" : String(stats?.appointments_month ?? 0),
      icon: TrendingUp,
      sub: `${stats?.leads_count ?? 0} leads no CRM`,
      positive: true,
    },
  ];

  return (
    <div className="p-6 space-y-6 min-h-full">
      {/* Header */}
      <motion.div {...fadeUp} className="flex items-center justify-between">
        <div>
          <h1
            className="text-2xl text-z-text"
            style={{ fontFamily: "'Outfit', sans-serif", fontWeight: 500 }}
          >
            {greeting}, {user?.full_name ?? "—"}
          </h1>
          <p className="text-sm text-z-dim mt-0.5">{formatDate(new Date())}</p>
        </div>
        <div className="flex items-center gap-2">
          <div
            className="flex items-center gap-2 px-3 py-1.5 rounded-xl text-xs text-[#01c47f]"
            style={{
              background: "rgba(1,154,103,0.1)",
              border: "1px solid rgba(1,154,103,0.2)",
            }}
          >
            <div className="relative">
              <div className="w-1.5 h-1.5 rounded-full bg-[#019A67]" />
              <div className="absolute inset-0 rounded-full bg-[#019A67] animate-ping opacity-60" />
            </div>
            Sistema ativo
          </div>
        </div>
      </motion.div>

      {/* Stats grid */}
      <div className="grid grid-cols-1 sm:grid-cols-2 xl:grid-cols-4 gap-4">
        {statCards.map((stat, i) => {
          const Icon = stat.icon;
          return (
            <motion.div
              key={stat.label}
              initial={{ opacity: 0, y: 24 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: i * 0.07, duration: 0.5, ease: "easeOut" as const }}
              className="relative rounded-2xl p-5 overflow-hidden cursor-pointer group"
              style={{
                background: "var(--surface-1)",
                border: "1px solid rgba(1,154,103,0.12)",
                backdropFilter: "blur(20px)",
              }}
            >
              <div
                className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-300 rounded-2xl pointer-events-none"
                style={{
                  background:
                    "radial-gradient(ellipse 80% 60% at 50% 0%, rgba(1,154,103,0.08) 0%, transparent 70%)",
                }}
              />

              <div className="flex items-start justify-between mb-4">
                <div
                  className="w-9 h-9 rounded-xl flex items-center justify-center"
                  style={{
                    background: "rgba(1,154,103,0.12)",
                    border: "1px solid rgba(1,154,103,0.2)",
                  }}
                >
                  <Icon size={17} style={{ color: "#019A67" }} />
                </div>
                <div
                  className="flex items-center gap-1 text-xs px-2 py-0.5 rounded-lg font-medium"
                  style={{
                    background: "rgba(1,154,103,0.1)",
                    color: "#01c47f",
                  }}
                >
                  <ArrowUpRight size={12} />
                  ao vivo
                </div>
              </div>

              <p
                className="text-2xl text-z-text mb-0.5"
                style={{ fontWeight: 500, letterSpacing: "-0.02em" }}
              >
                {stat.value}
              </p>
              <p className="text-sm text-z-dim">{stat.label}</p>
              <p className="text-xs text-z-faint mt-0.5">{stat.sub}</p>
            </motion.div>
          );
        })}
      </div>

      {/* Charts row */}
      <div className="grid grid-cols-1 xl:grid-cols-3 gap-4">
        {/* Bar chart */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, duration: 0.5 }}
          className="xl:col-span-2 rounded-2xl p-5"
          style={{
            background: "var(--surface-1)",
            border: "1px solid rgba(1,154,103,0.12)",
          }}
        >
          <div className="flex items-center justify-between mb-5">
            <div>
              <h3 className="text-sm font-medium text-z-text">Consultas por dia</h3>
              <p className="text-xs text-z-dim mt-0.5">Últimos 7 dias</p>
            </div>
            <div
              className="flex items-center gap-1.5 text-xs text-[#019A67] px-2.5 py-1 rounded-lg"
              style={{ background: "rgba(1,154,103,0.1)" }}
            >
              <Activity size={12} />
              {totalWeek} total
            </div>
          </div>

          <div className="flex items-end gap-3 h-32">
            {bars.map((d, i) => (
              <motion.div
                key={d.day + i}
                className="flex-1 flex flex-col items-center gap-2"
                initial={{ opacity: 0, scaleY: 0 }}
                animate={{ opacity: 1, scaleY: 1 }}
                transition={{
                  delay: 0.4 + i * 0.06,
                  duration: 0.4,
                  ease: "easeOut" as const,
                }}
                style={{ transformOrigin: "bottom" }}
              >
                <span className="text-[10px] text-z-dim">{d.value}</span>
                <div
                  className="w-full rounded-lg"
                  style={{
                    height: `${(d.value / maxVal) * 96}px`,
                    background: d.isToday
                      ? "linear-gradient(180deg, #01c47f 0%, #019A67 100%)"
                      : "rgba(1,154,103,0.2)",
                    border: d.isToday
                      ? "1px solid rgba(1,196,127,0.4)"
                      : "1px solid rgba(1,154,103,0.15)",
                    boxShadow: d.isToday ? "0 0 12px rgba(1,154,103,0.25)" : "none",
                    minHeight: "4px",
                  }}
                />
                <span className="text-[10px] text-z-faint">{d.day}</span>
              </motion.div>
            ))}
          </div>
        </motion.div>

        {/* Top doctors */}
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.35, duration: 0.5 }}
          className="rounded-2xl p-5"
          style={{
            background: "var(--surface-1)",
            border: "1px solid rgba(1,154,103,0.12)",
          }}
        >
          <div className="flex items-center justify-between mb-5">
            <h3 className="text-sm font-medium text-z-text">Médicos</h3>
            <Zap size={14} style={{ color: "#019A67" }} />
          </div>

          {loading ? (
            <div className="space-y-4">
              {[1, 2, 3].map((i) => (
                <div key={i} className="flex items-center gap-3">
                  <div className="w-8 h-8 rounded-xl bg-[rgba(1,154,103,0.08)] animate-pulse shrink-0" />
                  <div className="flex-1 space-y-1.5">
                    <div className="h-3 w-24 bg-[rgba(1,154,103,0.08)] rounded animate-pulse" />
                    <div className="h-2 w-16 bg-[rgba(1,154,103,0.05)] rounded animate-pulse" />
                  </div>
                </div>
              ))}
            </div>
          ) : (
            <div className="space-y-4">
              {topDoctors.map((doc, i) => (
                <motion.div
                  key={doc.id}
                  initial={{ opacity: 0, x: 12 }}
                  animate={{ opacity: 1, x: 0 }}
                  transition={{ delay: 0.5 + i * 0.08 }}
                  className="flex items-center gap-3"
                >
                  <div
                    className="w-8 h-8 rounded-xl flex items-center justify-center text-xs font-semibold text-white shrink-0"
                    style={{ background: doc.color || "#019A67" }}
                  >
                    {initials(doc.name)}
                  </div>
                  <div className="flex-1 min-w-0">
                    <p className="text-xs font-medium text-z-text truncate">{doc.name}</p>
                    <p className="text-[10px] text-z-dim truncate">{doc.specialty}</p>
                  </div>
                  <div className="text-right shrink-0">
                    <div className="flex items-center gap-1">
                      <Star size={10} className="fill-[#f59e0b] text-[#f59e0b]" />
                      <span className="text-[10px] text-z-dim">
                        {doc.appointments_count}
                      </span>
                    </div>
                    <p className="text-[10px] text-z-dim">
                      {doc.appointments_count} cons.
                    </p>
                  </div>
                </motion.div>
              ))}
              {topDoctors.length === 0 && (
                <p className="text-xs text-z-faint text-center py-4">
                  Nenhum médico cadastrado
                </p>
              )}
            </div>
          )}
        </motion.div>
      </div>

      {/* Today appointments */}
      <motion.div
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 0.45, duration: 0.5 }}
        className="rounded-2xl"
        style={{
          background: "var(--surface-1)",
          border: "1px solid rgba(1,154,103,0.12)",
        }}
      >
        <div className="flex items-center justify-between p-5 border-b border-border">
          <div>
            <h3 className="text-sm font-medium text-z-text">Consultas de hoje</h3>
            <p className="text-xs text-z-dim mt-0.5">
              {loading ? "..." : `${appointments.length} agendamentos`}
            </p>
          </div>
          <Link href="/dashboard/agenda" className="text-xs text-[#019A67] hover:text-[#01c47f] transition-colors">
            Ver todos →
          </Link>
        </div>

        <div className="divide-y divide-border">
          {loading ? (
            Array.from({ length: 3 }).map((_, i) => (
              <div key={i} className="flex items-center gap-4 px-5 py-3.5">
                <div className="w-8 h-8 rounded-xl bg-[rgba(1,154,103,0.08)] animate-pulse shrink-0" />
                <div className="flex-1 space-y-1.5">
                  <div className="h-3 w-32 bg-[rgba(1,154,103,0.08)] rounded animate-pulse" />
                  <div className="h-2 w-24 bg-[rgba(1,154,103,0.05)] rounded animate-pulse" />
                </div>
              </div>
            ))
          ) : appointments.length === 0 ? (
            <div className="px-5 py-8 text-center">
              <p className="text-sm text-z-dim">Nenhuma consulta hoje</p>
            </div>
          ) : (
            appointments.map((appt, i) => (
              <motion.div
                key={appt.id}
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                transition={{ delay: 0.5 + i * 0.06 }}
                className="flex items-center gap-4 px-5 py-3.5 hover:bg-[rgba(1,154,103,0.03)] transition-colors"
              >
                <div
                  className="w-8 h-8 rounded-xl flex items-center justify-center text-xs font-medium shrink-0"
                  style={{
                    background: "rgba(1,154,103,0.12)",
                    color: "#01c47f",
                    border: "1px solid rgba(1,154,103,0.2)",
                  }}
                >
                  {initials(appt.patient_name)}
                </div>

                <div className="flex-1 min-w-0">
                  <p className="text-sm text-z-text font-medium truncate">
                    {appt.patient_name}
                  </p>
                  <p className="text-xs text-z-dim truncate">
                    {appt.doctor?.name ?? "—"}
                    {appt.doctor?.specialty ? ` · ${appt.doctor.specialty}` : ""}
                  </p>
                </div>

                <div className="hidden sm:flex items-center gap-1.5 text-xs text-z-dim">
                  <Clock size={12} />
                  {appt.start_time.slice(0, 5)}
                </div>

                {appt.type_name_snapshot && (
                  <div className="hidden md:block">
                    <span
                      className="text-xs px-2 py-0.5 rounded-md"
                      style={{
                        background: "rgba(1,154,103,0.08)",
                        color: "var(--z-text-dim)",
                      }}
                    >
                      {appt.type_name_snapshot}
                    </span>
                  </div>
                )}

                <div
                  className="text-xs px-2.5 py-1 rounded-lg font-medium shrink-0"
                  style={{
                    background: `${statusColors[appt.status] ?? "#6b8f78"}18`,
                    color: statusColors[appt.status] ?? "#6b8f78",
                    border: `1px solid ${statusColors[appt.status] ?? "#6b8f78"}30`,
                  }}
                >
                  {statusLabels[appt.status] ?? appt.status}
                </div>
              </motion.div>
            ))
          )}
        </div>
      </motion.div>
    </div>
  );
}
