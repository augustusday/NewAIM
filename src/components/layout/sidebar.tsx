"use client";

import Link from "next/link";
import { usePathname, useRouter } from "next/navigation";
import { motion, AnimatePresence } from "framer-motion";
import {
  LayoutDashboard,
  MessageCircle,
  Users,
  CalendarDays,
  Settings,
  Bell,
  ChevronRight,
  Stethoscope,
  LogOut,
} from "lucide-react";
import { cn } from "@/lib/utils";
import { useState } from "react";
import { ThemeToggle } from "./theme-toggle";
import { useUser } from "@/hooks/use-user";
import { supabase } from "@/lib/supabase";

const navItems = [
  {
    href: "/dashboard",
    icon: LayoutDashboard,
    label: "Dashboard",
    description: "Visão geral",
  },
  {
    href: "/dashboard/chats",
    icon: MessageCircle,
    label: "Chats",
    description: "WhatsApp",
    badge: 12,
  },
  {
    href: "/dashboard/crm",
    icon: Users,
    label: "CRM",
    description: "Contatos",
  },
  {
    href: "/dashboard/agenda",
    icon: CalendarDays,
    label: "Agenda",
    description: "Consultas",
  },
];

export function Sidebar() {
  const pathname = usePathname();
  const router = useRouter();
  const [collapsed, setCollapsed] = useState(false);
  const { user } = useUser();

  const handleLogout = async () => {
    await supabase.auth.signOut();
    router.replace("/login");
  };

  const initials = user?.full_name
    ? user.full_name.split(" ").slice(0, 2).map((w) => w[0]).join("").toUpperCase()
    : "?";

  return (
    <motion.aside
      animate={{ width: collapsed ? 68 : 232 }}
      transition={{ duration: 0.3, ease: "easeOut" as const }}
      className="relative flex flex-col h-full overflow-hidden shrink-0"
      style={{
        background: "var(--sidebar-bg)",
        borderRight: "1px solid var(--sidebar-border)",
        boxShadow: "var(--z-shadow)",
      }}
    >
      {/* Ambient top glow */}
      <div
        className="absolute top-0 left-0 right-0 h-24 pointer-events-none"
        style={{
          background:
            "radial-gradient(ellipse 120% 80% at 50% 0%, rgba(1,154,103,0.08) 0%, transparent 70%)",
        }}
      />

      {/* Logo */}
      <div
        className="flex items-center h-14 px-3.5 shrink-0"
        style={{ borderBottom: "1px solid var(--sidebar-border)" }}
      >
        <div className="flex items-center gap-2.5 flex-1 min-w-0">
          <div
            className="w-7 h-7 rounded-xl flex items-center justify-center shrink-0"
            style={{
              background: "linear-gradient(135deg, #019A67 0%, #01c47f 100%)",
              boxShadow: "0 0 12px rgba(1,154,103,0.35)",
            }}
          >
            <Stethoscope size={14} className="text-white" />
          </div>
          <AnimatePresence>
            {!collapsed && (
              <motion.span
                initial={{ opacity: 0, x: -8 }}
                animate={{ opacity: 1, x: 0 }}
                exit={{ opacity: 0, x: -8 }}
                transition={{ duration: 0.2 }}
                className="text-base font-semibold truncate"
                style={{ color: "var(--sidebar-text)", letterSpacing: "0.02em" }}
              >
                zelus
              </motion.span>
            )}
          </AnimatePresence>
        </div>

        <motion.button
          animate={{ rotate: collapsed ? 0 : 180 }}
          transition={{ duration: 0.3 }}
          onClick={() => setCollapsed(!collapsed)}
          className="w-6 h-6 rounded-lg flex items-center justify-center shrink-0 transition-colors duration-200"
          style={{ color: "var(--sidebar-text-dim)" }}
        >
          <ChevronRight size={13} />
        </motion.button>
      </div>

      {/* Clinic pill */}
      <AnimatePresence>
        {!collapsed && (
          <motion.div
            initial={{ opacity: 0, height: 0 }}
            animate={{ opacity: 1, height: "auto" }}
            exit={{ opacity: 0, height: 0 }}
            className="mx-3 mt-3 overflow-hidden"
          >
            <div
              className="px-3 py-2 rounded-xl"
              style={{
                background: "var(--accent)",
                border: "1px solid var(--border)",
              }}
            >
              <p
                className="text-[10px] uppercase tracking-widest font-medium mb-0.5"
                style={{ color: "var(--z-text-dim)" }}
              >
                Clínica
              </p>
              <p
                className="text-xs font-medium truncate"
                style={{ color: "var(--z-text)" }}
              >
                {user?.clinic_name ?? "—"}
              </p>
            </div>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Nav */}
      <nav className="flex-1 px-2 py-3 space-y-0.5 overflow-y-auto">
        {navItems.map((item, i) => {
          const active =
            pathname === item.href ||
            (item.href !== "/dashboard" && pathname.startsWith(item.href));
          const Icon = item.icon;

          return (
            <Link key={item.href} href={item.href}>
              <motion.div
                initial={{ opacity: 0, x: -12 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ delay: i * 0.05 }}
                className="relative flex items-center gap-3 px-3 py-2.5 rounded-xl cursor-pointer transition-all duration-200"
                style={{
                  background: active ? "var(--sidebar-active-bg)" : "transparent",
                  color: active ? "var(--sidebar-active-text)" : "var(--sidebar-text-dim)",
                }}
              >
                {active && (
                  <motion.div
                    layoutId="nav-active"
                    className="absolute inset-0 rounded-xl"
                    style={{
                      background: "var(--sidebar-active-bg)",
                      border: "1px solid rgba(1,154,103,0.2)",
                    }}
                    transition={{ duration: 0.25, ease: "easeOut" as const }}
                  />
                )}

                <Icon size={17} className="relative z-10 shrink-0" />

                <AnimatePresence>
                  {!collapsed && (
                    <motion.div
                      initial={{ opacity: 0, x: -6 }}
                      animate={{ opacity: 1, x: 0 }}
                      exit={{ opacity: 0, x: -6 }}
                      className="flex-1 flex items-center justify-between relative z-10 overflow-hidden"
                    >
                      <span className="text-sm font-medium truncate">
                        {item.label}
                      </span>
                      {item.badge && !active && (
                        <span
                          className="text-[10px] font-medium px-1.5 py-0.5 rounded-full shrink-0"
                          style={{
                            background: "rgba(1,154,103,0.15)",
                            color: "#019A67",
                          }}
                        >
                          {item.badge}
                        </span>
                      )}
                    </motion.div>
                  )}
                </AnimatePresence>
              </motion.div>
            </Link>
          );
        })}
      </nav>

      {/* Bottom */}
      <div
        className="px-2 pb-3 space-y-0.5"
        style={{ borderTop: "1px solid var(--sidebar-border)", paddingTop: "12px" }}
      >
        {/* Notifications */}
        <div
          className="flex items-center gap-3 px-3 py-2.5 rounded-xl cursor-pointer transition-all duration-200"
          style={{ color: "var(--sidebar-text-dim)" }}
        >
          <div className="relative shrink-0">
            <Bell size={17} />
            <span
              className="absolute -top-0.5 -right-0.5 w-2 h-2 rounded-full"
              style={{ background: "#019A67" }}
            />
          </div>
          <AnimatePresence>
            {!collapsed && (
              <motion.span
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="text-sm font-medium"
              >
                Notificações
              </motion.span>
            )}
          </AnimatePresence>
        </div>

        {/* Settings */}
        <Link href="/dashboard/settings">
          <div
            className={cn(
              "flex items-center gap-3 px-3 py-2.5 rounded-xl cursor-pointer transition-all duration-200",
              pathname.startsWith("/dashboard/settings") && "rounded-xl"
            )}
            style={{
              background: pathname.startsWith("/dashboard/settings")
                ? "var(--sidebar-active-bg)"
                : "transparent",
              color: pathname.startsWith("/dashboard/settings")
                ? "var(--sidebar-active-text)"
                : "var(--sidebar-text-dim)",
            }}
          >
            <Settings size={17} className="shrink-0" />
            <AnimatePresence>
              {!collapsed && (
                <motion.span
                  initial={{ opacity: 0 }}
                  animate={{ opacity: 1 }}
                  exit={{ opacity: 0 }}
                  className="text-sm font-medium"
                >
                  Configurações
                </motion.span>
              )}
            </AnimatePresence>
          </div>
        </Link>

        {/* Theme toggle */}
        <ThemeToggle collapsed={collapsed} />

        {/* User */}
        <button
          onClick={handleLogout}
          className="w-full flex items-center gap-2.5 px-3 py-2.5 rounded-xl cursor-pointer transition-all duration-200 mt-1 hover:bg-[rgba(224,85,85,0.06)] group"
          style={{ borderTop: "1px solid var(--sidebar-border)", paddingTop: "10px", marginTop: "8px" }}
        >
          <div
            className="w-7 h-7 rounded-full flex items-center justify-center text-[11px] font-semibold text-white shrink-0"
            style={{ background: "linear-gradient(135deg, #019A67, #01c47f)" }}
          >
            {initials}
          </div>
          <AnimatePresence>
            {!collapsed && (
              <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
                className="flex-1 overflow-hidden text-left"
              >
                <p
                  className="text-xs font-medium truncate"
                  style={{ color: "var(--z-text)" }}
                >
                  {user?.full_name ?? "—"}
                </p>
                <p
                  className="text-[10px] truncate"
                  style={{ color: "var(--z-text-dim)" }}
                >
                  {user?.is_super_admin ? "Super Admin" : "Usuário"}
                </p>
              </motion.div>
            )}
          </AnimatePresence>
          <AnimatePresence>
            {!collapsed && (
              <motion.div
                initial={{ opacity: 0 }}
                animate={{ opacity: 1 }}
                exit={{ opacity: 0 }}
              >
                <LogOut size={13} className="group-hover:text-[#e05555] transition-colors" style={{ color: "var(--z-text-faint)" }} />
              </motion.div>
            )}
          </AnimatePresence>
        </button>
      </div>
    </motion.aside>
  );
}
