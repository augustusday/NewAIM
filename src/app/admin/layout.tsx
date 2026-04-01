"use client";

import { useEffect, useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import Link from "next/link";
import { motion, AnimatePresence } from "framer-motion";
import {
  BarChart2,
  Building2,
  Users,
  MessageSquareText,
  Bot,
  LogOut,
  Shield,
  ArrowUpLeft,
  PanelLeftClose,
  PanelLeftOpen,
} from "lucide-react";
import Image from "next/image";
import { supabase } from "@/lib/supabase";

const NAV = [
  { href: "/admin",           label: "Visão Geral",  icon: BarChart2 },
  { href: "/admin/clinicas",  label: "Clínicas",     icon: Building2 },
  { href: "/admin/usuarios",  label: "Usuários",     icon: Users },
  { href: "/admin/whatsapp",  label: "WhatsApp",     icon: MessageSquareText },
  { href: "/admin/agente",    label: "Agente de IA", icon: Bot },
];

const SPRING      = { type: "spring" as const, stiffness: 400, damping: 40 };
const SPRING_SLOW = { type: "spring" as const, stiffness: 300, damping: 35 };
const EASE_OUT    = [0.23, 1, 0.32, 1] as const;

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  const router    = useRouter();
  const pathname  = usePathname();
  const [userEmail, setUserEmail]   = useState("");
  const [collapsed, setCollapsed]   = useState(false);

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (!user) { router.replace("/login"); return; }
      setUserEmail(user.email ?? "");
    });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const handleLogout = async () => {
    await supabase.auth.signOut();
    router.replace("/login");
  };

  const initial = userEmail?.[0]?.toUpperCase() ?? "A";

  return (
    <div className="flex h-screen overflow-hidden" style={{ background: "var(--background)" }}>

      {/* ── Sidebar ── */}
      <motion.aside
        animate={{ width: collapsed ? 64 : 224 }}
        transition={SPRING_SLOW}
        className="relative flex flex-col h-full overflow-hidden shrink-0"
        style={{
          background: "var(--sidebar-bg)",
          borderRight: "1px solid var(--sidebar-border)",
        }}
      >
        {/* ── Logo bar ── */}
        <div
          className="flex items-center justify-between shrink-0"
          style={{
            height: 56,
            padding: "0 14px",
            borderBottom: "1px solid var(--sidebar-border)",
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

            <AnimatePresence initial={false}>
              {!collapsed && (
                <motion.div
                  key="wordmark"
                  initial={{ opacity: 0, x: -6 }}
                  animate={{ opacity: 1, x: 0 }}
                  exit={{ opacity: 0, x: -6 }}
                  transition={{ duration: 0.18, ease: EASE_OUT }}
                  className="overflow-hidden flex items-center gap-2 min-w-0"
                >
                  <span
                    className="text-[14px] font-semibold whitespace-nowrap tracking-tight"
                    style={{ color: "var(--z-text)", fontFamily: "var(--font-display)" }}
                  >
                    Agenda<span style={{ color: "#1DB6A0" }}>IA</span>Med
                  </span>
                  {/* Admin badge */}
                  <div
                    className="flex items-center gap-1 rounded-md px-1.5 py-0.5 shrink-0"
                    style={{
                      background: "rgba(245,158,11,0.1)",
                      border: "1px solid rgba(245,158,11,0.25)",
                    }}
                  >
                    <Shield size={9} style={{ color: "#f59e0b" }} />
                    <span className="text-[9px] font-semibold uppercase tracking-wider" style={{ color: "#f59e0b" }}>
                      Admin
                    </span>
                  </div>
                </motion.div>
              )}
            </AnimatePresence>
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

        {/* ── Section label ── */}
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
              Plataforma
            </motion.p>
          ) : (
            <div key="spacer" style={{ height: 14 }} />
          )}
        </AnimatePresence>

        {/* ── Nav ── */}
        <nav className="flex-1 overflow-y-auto overflow-x-hidden px-2 pb-2 space-y-0.5">
          {NAV.map(({ href, label, icon: Icon }, i) => {
            const isActive = pathname === href || (href !== "/admin" && pathname.startsWith(href));
            return (
              <motion.div
                key={href}
                initial={{ opacity: 0, x: -8 }}
                animate={{ opacity: 1, x: 0 }}
                transition={{ ...SPRING, delay: i * 0.04 }}
              >
                <Link href={href}>
                  <div
                    className="relative flex items-center gap-3 rounded-lg group cursor-pointer"
                    style={{
                      padding: collapsed ? "9px 10px" : "9px 12px",
                      background: isActive ? "rgba(29,182,160,0.08)" : "transparent",
                      color: isActive ? "#1DB6A0" : "var(--sidebar-text-dim)",
                      transition: "background 180ms ease, color 180ms ease",
                    }}
                    onMouseEnter={(e) => {
                      if (!isActive)
                        (e.currentTarget as HTMLDivElement).style.background = "var(--sidebar-hover-bg)";
                    }}
                    onMouseLeave={(e) => {
                      if (!isActive)
                        (e.currentTarget as HTMLDivElement).style.background = "transparent";
                    }}
                  >
                    {isActive && (
                      <motion.div
                        layoutId="admin-indicator"
                        className="absolute left-0 top-1.5 bottom-1.5 rounded-full"
                        style={{ width: 2.5, background: "#1DB6A0" }}
                        transition={SPRING}
                      />
                    )}
                    <Icon
                      size={16}
                      strokeWidth={isActive ? 2.25 : 1.75}
                      className="shrink-0"
                      style={{ marginLeft: isActive ? 6 : 4 }}
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
          })}
        </nav>

        {/* ── Bottom ── */}
        <div style={{ borderTop: "1px solid var(--sidebar-border)", padding: "10px 8px 12px" }}>
          {/* Back to app */}
          <Link href="/dashboard">
            <div
              className="relative flex items-center gap-3 rounded-lg cursor-pointer mb-0.5"
              style={{
                padding: collapsed ? "9px 10px" : "9px 12px",
                color: "var(--sidebar-text-dim)",
                transition: "background 180ms ease",
              }}
              onMouseEnter={(e) => {
                (e.currentTarget as HTMLDivElement).style.background = "var(--sidebar-hover-bg)";
              }}
              onMouseLeave={(e) => {
                (e.currentTarget as HTMLDivElement).style.background = "transparent";
              }}
            >
              <ArrowUpLeft
                size={16}
                strokeWidth={1.75}
                className="shrink-0"
                style={{ marginLeft: 4 }}
              />
              <AnimatePresence initial={false}>
                {!collapsed && (
                  <motion.span
                    key="app-label"
                    initial={{ opacity: 0, width: 0 }}
                    animate={{ opacity: 1, width: "auto" }}
                    exit={{ opacity: 0, width: 0 }}
                    transition={{ duration: 0.18, ease: EASE_OUT }}
                    className="text-[13px] font-medium truncate overflow-hidden whitespace-nowrap"
                  >
                    Ir para o app
                  </motion.span>
                )}
              </AnimatePresence>
            </div>
          </Link>

          {/* Logout */}
          <button
            onClick={handleLogout}
            className="w-full flex items-center gap-2.5 rounded-lg group"
            style={{
              paddingTop: 10,
              paddingBottom: 8,
              paddingLeft: collapsed ? 10 : 12,
              paddingRight: collapsed ? 10 : 12,
              marginTop: 4,
              borderTop: "1px solid var(--sidebar-border)",
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
              className="shrink-0 flex items-center justify-center rounded-full text-[11px] font-bold text-white"
              style={{
                width: 28,
                height: 28,
                background: "linear-gradient(135deg, #f59e0b 0%, #d97706 100%)",
                marginLeft: collapsed ? -2 : 0,
              }}
            >
              {initial}
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
                    {userEmail || "Admin"}
                  </p>
                  <p className="text-[10px] truncate leading-tight mt-0.5" style={{ color: "var(--z-text-faint)" }}>
                    Super Admin
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

      {/* ── Content ── */}
      <main className="flex-1 overflow-auto">
        {children}
      </main>
    </div>
  );
}
