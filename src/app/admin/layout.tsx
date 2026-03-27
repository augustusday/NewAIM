"use client";

import { useEffect, useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import Link from "next/link";
import { motion } from "framer-motion";
import Image from "next/image";
import {
  LayoutDashboard,
  Building2,
  Users,
  MessageSquare,
  Settings,
  LogOut,
  ChevronRight,
  Shield,
  Bot,
} from "lucide-react";
import { supabase } from "@/lib/supabase";
import { cn } from "@/lib/utils";

const NAV = [
  { href: "/admin",           label: "Visão Geral",  icon: LayoutDashboard },
  { href: "/admin/clinicas",  label: "Clínicas",     icon: Building2 },
  { href: "/admin/usuarios",  label: "Usuários",     icon: Users },
  { href: "/admin/whatsapp",  label: "WhatsApp",     icon: MessageSquare },
  { href: "/admin/agente",    label: "Agente de IA", icon: Bot },
];

export default function AdminLayout({ children }: { children: React.ReactNode }) {
  const router   = useRouter();
  const pathname = usePathname();
  const [userEmail, setUserEmail] = useState("");

  useEffect(() => {
    supabase.auth.getUser().then(({ data: { user } }) => {
      if (!user) { router.replace("/login"); return; }
      setUserEmail(user.email ?? "");
    });
  }, []);

  const handleLogout = async () => {
    await supabase.auth.signOut();
    router.replace("/login");
  };

  return (
    <div className="flex h-screen overflow-hidden" style={{ background: "var(--background)" }}>
      {/* Sidebar */}
      <aside
        className="w-56 flex flex-col border-r border-border shrink-0"
        style={{ background: "var(--surface-2)" }}
      >
        {/* Logo */}
        <div className="flex items-center gap-3 px-5 py-5 border-b border-border">
          <Image src="/logo-zelus.png" alt="Zelus" width={90} height={28} className="object-contain" />
          <div className="flex items-center gap-1">
            <Shield size={9} style={{ color: "#019A67" }} />
            <span className="text-[9px] uppercase tracking-widest" style={{ color: "#019A67" }}>Admin</span>
          </div>
        </div>

        {/* Nav */}
        <nav className="flex-1 px-3 py-4 space-y-1 overflow-y-auto">
          {NAV.map(({ href, label, icon: Icon }) => {
            const isActive = pathname === href || (href !== "/admin" && pathname.startsWith(href));
            return (
              <Link
                key={href}
                href={href}
                className={cn(
                  "flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm transition-all duration-200 group relative",
                  isActive ? "text-[#01c47f]" : "text-z-dim hover:text-z-text"
                )}
                style={{
                  background: isActive ? "rgba(1,154,103,0.12)" : "transparent",
                  border: isActive ? "1px solid rgba(1,154,103,0.2)" : "1px solid transparent",
                }}
              >
                <Icon size={16} />
                <span>{label}</span>
                {isActive && <ChevronRight size={12} className="ml-auto opacity-60" />}
              </Link>
            );
          })}
        </nav>

        {/* Back to dashboard */}
        <div className="px-3 py-3 border-t border-border space-y-1">
          <Link
            href="/dashboard"
            className="flex items-center gap-3 px-3 py-2.5 rounded-xl text-sm text-z-dim hover:text-z-text transition-all"
          >
            <LayoutDashboard size={15} />
            <span>Ir para o app</span>
          </Link>

          {/* User */}
          <div className="flex items-center gap-2.5 px-3 py-2.5">
            <div
              className="w-7 h-7 rounded-lg flex items-center justify-center text-xs font-medium text-white shrink-0"
              style={{ background: "linear-gradient(135deg, #019A67, #01a870)" }}
            >
              {userEmail?.[0]?.toUpperCase() ?? "A"}
            </div>
            <div className="flex-1 min-w-0">
              <p className="text-xs text-z-text truncate">{userEmail || "Admin"}</p>
              <p className="text-[10px] text-z-faint">Super Admin</p>
            </div>
            <button onClick={handleLogout} className="text-z-faint hover:text-[#e05555] transition-colors shrink-0">
              <LogOut size={13} />
            </button>
          </div>
        </div>
      </aside>

      {/* Content */}
      <main className="flex-1 overflow-auto">
        {children}
      </main>
    </div>
  );
}
