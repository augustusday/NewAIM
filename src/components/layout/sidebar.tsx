"use client";

import Link from "next/link";
import Image from "next/image";
import { usePathname, useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import {
  BarChart2,
  MessageSquareText,
  UsersRound,
  CalendarCheck2,
  SlidersHorizontal,
  Bell,
  LogOut,
  Shield,
  PanelLeftClose,
  PanelLeftOpen,
} from "lucide-react";
import { useState } from "react";
import { useUser } from "@/hooks/use-user";
import { supabase } from "@/lib/supabase";

// Order: Conversas, Agenda, Dashboard, Pacientes
const NAV_MAIN = [
  { href: "/dashboard/chats",  icon: MessageSquareText, label: "Conversas",  sub: "WhatsApp" },
  { href: "/dashboard/agenda", icon: CalendarCheck2,    label: "Agenda",     sub: "Consultas" },
  { href: "/dashboard",        icon: BarChart2,         label: "Dashboard",  sub: "Visão geral" },
  { href: "/dashboard/crm",    icon: UsersRound,        label: "Pacientes",  sub: "CRM" },
];

const NAV_SYSTEM = [
  { href: "/dashboard/settings", icon: SlidersHorizontal, label: "Configurações" },
];

const SPRING      = { type: "spring" as const, stiffness: 400, damping: 40 };
const SPRING_SLOW = { type: "spring" as const, stiffness: 300, damping: 35 };
const EASE_OUT    = [0.23, 1, 0.32, 1] as const;

interface NavItemProps {
  href: string;
  icon: React.ElementType;
  label: string;
  active: boolean;
  collapsed: boolean;
  index: number;
}

function NavItem({ href, icon: Icon, label, active, collapsed, index }: NavItemProps) {
  return (
    <motion.div
      initial={{ opacity: 0, x: -8 }}
      animate={{ opacity: 1, x: 0 }}
      transition={{ ...SPRING, delay: index * 0.04 }}
    >
      <Link href={href}>
        <div
          className="relative flex items-center gap-3 rounded-lg cursor-pointer group"
          style={{
            padding: collapsed ? "9px 10px" : "9px 12px",
            background: active ? "rgba(29,182,160,0.08)" : "transparent",
            color: active ? "#1DB6A0" : "var(--sidebar-text-dim)",
            transition: "background 180ms ease, color 180ms ease",
          }}
          onMouseEnter={(e) => {
            if (!active)
              (e.currentTarget as HTMLDivElement).style.background = "var(--sidebar-hover-bg)";
          }}
          onMouseLeave={(e) => {
            if (!active)
              (e.currentTarget as HTMLDivElement).style.background = "transparent";
          }}
        >
          {active && (
            <motion.div
              layoutId="sidebar-indicator"
              className="absolute left-0 top-1.5 bottom-1.5 rounded-full"
              style={{ width: 2.5, background: "#1DB6A0" }}
              transition={SPRING}
            />
          )}
          <Icon
            size={16}
            strokeWidth={active ? 2.25 : 1.75}
            className="shrink-0"
            style={{ marginLeft: active ? 6 : 4 }}
          />
          <AnimatePresence initial={false}>
            {!collapsed && (
              <motion.span
                key="label"
                initial={{ opacity: 0, width: 0 }}
                animate={{ opacity: 1, width: "auto" }}
                exit={{ opacity: 0, width: 0 }}
                transition={{ duration: 0.18, ease: EASE_OUT }}
                className="text-[13px] font-medium truncate overflow-hidden whitespace-nowrap"
              >
                {label}
              </motion.span>
            )}
          </AnimatePresence>
        </div>
      </Link>
    </motion.div>
  );
}

function SectionLabel({ label, collapsed }: { label: string; collapsed: boolean }) {
  return (
    <AnimatePresence initial={false}>
      {!collapsed ? (
        <motion.p
          key="label"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.15 }}
          className="px-3 pb-1 pt-3 text-[10px] font-semibold uppercase select-none"
          style={{ color: "var(--z-text-faint)", letterSpacing: "0.1em" }}
        >
          {label}
        </motion.p>
      ) : (
        <div key="spacer" style={{ height: 14 }} />
      )}
    </AnimatePresence>
  );
}

export function Sidebar() {
  const pathname = usePathname();
  const router   = useRouter();
  const [collapsed, setCollapsed] = useState(false);
  const { user } = useUser();

  const handleLogout = async () => {
    await supabase.auth.signOut();
    router.replace("/login");
  };

  const initials = user?.full_name
    ? user.full_name.split(" ").slice(0, 2).map((w: string) => w[0]).join("").toUpperCase()
    : "?";

  return (
    <motion.aside
      animate={{ width: collapsed ? 64 : 248 }}
      transition={SPRING_SLOW}
      className="relative flex flex-col h-full overflow-hidden shrink-0"
      style={{
        background: "var(--sidebar-bg)",
        borderRight: "1px solid var(--sidebar-border)",
      }}
    >
      {/* ── Logo bar ── */}
      <div
        className="shrink-0"
        style={{
          height: collapsed ? 88 : 64,
          padding: collapsed ? "8px 0" : "0 14px",
          borderBottom: "1px solid var(--sidebar-border)",
        }}
      >
        <div
          className="flex h-full"
          style={{
            flexDirection: collapsed ? "column" : "row",
            alignItems: "center",
            justifyContent: collapsed ? "center" : "space-between",
            gap: collapsed ? 6 : 0,
          }}
        >
          <div className="flex items-center gap-2.5 min-w-0 overflow-hidden">
            <div
              className="shrink-0 flex items-center justify-center"
              style={{ width: collapsed ? 24 : 28, height: collapsed ? 36 : 42 }}
            >
              <Image
                src="/brand-mark.png"
                alt="AgendaIAMed"
                width={collapsed ? 24 : 28}
                height={collapsed ? 36 : 42}
                className="object-contain"
              />
            </div>
          </div>

          <motion.button
            whileTap={{ scale: 0.88 }}
            onClick={() => setCollapsed((c) => !c)}
            className="shrink-0 flex items-center justify-center rounded-md"
            style={{ width: 26, height: 26, color: "var(--z-text-faint)" }}
            title={collapsed ? "Expandir menu" : "Recolher menu"}
          >
            {collapsed
              ? <PanelLeftOpen size={14} strokeWidth={1.75} />
              : <PanelLeftClose size={14} strokeWidth={1.75} />}
          </motion.button>
        </div>
      </div>

      {/* ── Super admin banner ── */}
      <AnimatePresence>
        {user?.is_super_admin && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            transition={SPRING}
            className="overflow-hidden"
            style={{ padding: "8px 10px 0" }}
          >
            <a
              href="/admin"
              className="flex items-center gap-2 rounded-md w-full"
              style={{
                padding: "6px 10px",
                background: "rgba(245,158,11,0.08)",
                border: "1px solid rgba(245,158,11,0.2)",
              }}
            >
              <Shield size={10} style={{ color: "#f59e0b", flexShrink: 0 }} />
              <AnimatePresence initial={false}>
                {!collapsed && (
                  <motion.span
                    initial={{ opacity: 0 }}
                    animate={{ opacity: 1 }}
                    exit={{ opacity: 0 }}
                    className="text-[11px] font-medium truncate"
                    style={{ color: "#f59e0b" }}
                  >
                    Painel Admin
                  </motion.span>
                )}
              </AnimatePresence>
            </a>
          </motion.div>
        )}
      </AnimatePresence>

      {/* ── Clinic chip ── */}
      <AnimatePresence initial={false}>
        {!collapsed && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            transition={{ duration: 0.18 }}
            className="overflow-hidden"
            style={{ padding: "10px 10px 0" }}
          >
            <div
              className="flex items-center gap-2 rounded-md"
              style={{
                padding: "7px 10px",
                background: "rgba(29,182,160,0.06)",
                border: "1px solid rgba(29,182,160,0.12)",
              }}
            >
              <div className="rounded-sm shrink-0" style={{ width: 6, height: 6, background: "#1DB6A0" }} />
              <p className="text-[12px] font-medium truncate" style={{ color: "var(--z-text-dim)" }}>
                {user?.clinic_name ?? "Clínica"}
              </p>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* ── Navigation ── */}
      <nav className="flex-1 overflow-y-auto overflow-x-hidden" style={{ padding: "4px 8px 8px" }}>
        <SectionLabel label="Módulos" collapsed={collapsed} />

        <div className="space-y-0.5">
          {NAV_MAIN.map((item, i) => {
            const active =
              item.href === "/dashboard"
                ? pathname === "/dashboard"
                : pathname.startsWith(item.href);
            return (
              <NavItem
                key={item.href}
                href={item.href}
                icon={item.icon}
                label={item.label}
                active={active}
                collapsed={collapsed}
                index={i}
              />
            );
          })}
        </div>

        <SectionLabel label="Sistema" collapsed={collapsed} />

        <div className="space-y-0.5">
          {/* Notifications */}
          <div
            className="relative flex items-center gap-3 rounded-lg cursor-pointer"
            style={{
              padding: collapsed ? "9px 10px" : "9px 12px",
              color: "var(--sidebar-text-dim)",
            }}
          >
            <div className="relative shrink-0" style={{ marginLeft: 4 }}>
              <Bell size={16} strokeWidth={1.75} />
              <span
                className="absolute -top-0.5 -right-0.5 w-1.5 h-1.5 rounded-full"
                style={{ background: "#1DB6A0" }}
              />
            </div>
            <AnimatePresence initial={false}>
              {!collapsed && (
                <motion.span
                  key="notif"
                  initial={{ opacity: 0, width: 0 }}
                  animate={{ opacity: 1, width: "auto" }}
                  exit={{ opacity: 0, width: 0 }}
                  transition={{ duration: 0.18, ease: EASE_OUT }}
                  className="text-[13px] font-medium truncate overflow-hidden whitespace-nowrap"
                >
                  Notificações
                </motion.span>
              )}
            </AnimatePresence>
          </div>

          {NAV_SYSTEM.map((item, i) => {
            const active = pathname.startsWith(item.href);
            return (
              <NavItem
                key={item.href}
                href={item.href}
                icon={item.icon}
                label={item.label}
                active={active}
                collapsed={collapsed}
                index={NAV_MAIN.length + i}
              />
            );
          })}
        </div>
      </nav>

      {/* ── Bottom — User / Logout (no dark mode toggle) ── */}
      <div style={{ borderTop: "1px solid var(--sidebar-border)", padding: "10px 8px 12px" }}>
        <button
          onClick={handleLogout}
          className="w-full flex items-center gap-2.5 rounded-lg group"
          style={{
            padding: collapsed ? "8px 10px" : "8px 12px",
            color: "var(--sidebar-text-dim)",
            transition: "background 180ms ease",
          }}
          onMouseEnter={(e) => {
            (e.currentTarget as HTMLButtonElement).style.background = "rgba(244,67,54,0.05)";
          }}
          onMouseLeave={(e) => {
            (e.currentTarget as HTMLButtonElement).style.background = "transparent";
          }}
        >
          <div
            className="shrink-0 flex items-center justify-center rounded-full text-[11px] font-semibold text-white"
            style={{
              width: 28,
              height: 28,
              background: "linear-gradient(135deg, #1DB6A0 0%, #22d3c0 100%)",
              marginLeft: collapsed ? -2 : 0,
            }}
          >
            {initials}
          </div>

          <AnimatePresence initial={false}>
            {!collapsed && (
              <motion.div
                key="userinfo"
                initial={{ opacity: 0, width: 0 }}
                animate={{ opacity: 1, width: "auto" }}
                exit={{ opacity: 0, width: 0 }}
                transition={{ duration: 0.18, ease: EASE_OUT }}
                className="flex-1 overflow-hidden text-left"
              >
                <p className="text-[12px] font-semibold truncate leading-tight" style={{ color: "var(--z-text)" }}>
                  {user?.full_name ?? "—"}
                </p>
                <p className="text-[10px] truncate leading-tight mt-0.5" style={{ color: "var(--z-text-faint)" }}>
                  {user?.is_super_admin ? "Super Admin" : "Membro"}
                </p>
              </motion.div>
            )}
          </AnimatePresence>

          <AnimatePresence initial={false}>
            {!collapsed && (
              <motion.div
                key="logout-icon"
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                transition={{ duration: 0.15 }}
              >
                <LogOut
                  size={13}
                  strokeWidth={1.75}
                  className="group-hover:text-[#F44336] transition-colors duration-150"
                  style={{ color: "var(--z-text-faint)" }}
                />
              </motion.div>
            )}
          </AnimatePresence>
        </button>
      </div>
    </motion.aside>
  );
}
