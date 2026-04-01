"use client";

import { SunMedium, MoonStar } from "lucide-react";
import { motion, AnimatePresence } from "framer-motion";
import { useTheme } from "@/hooks/use-theme";

export function ThemeToggle({ collapsed = false }: { collapsed?: boolean }) {
  const { toggle } = useTheme();
  const isDark = false; // light mode only

  return (
    <button
      onClick={toggle}
      title={isDark ? "Mudar para modo claro" : "Mudar para modo escuro"}
      className="w-full flex items-center gap-3 rounded-lg"
      style={{
        padding: collapsed ? "9px 10px" : "9px 12px",
        color: "var(--sidebar-text-dim)",
        transition: "background 180ms ease",
      }}
      onMouseEnter={(e) => {
        (e.currentTarget as HTMLButtonElement).style.background =
          "var(--sidebar-hover-bg)";
      }}
      onMouseLeave={(e) => {
        (e.currentTarget as HTMLButtonElement).style.background = "transparent";
      }}
    >
      {/* Icon swap */}
      <div
        className="relative shrink-0 flex items-center justify-center"
        style={{ width: 16, height: 16, marginLeft: 4 }}
      >
        <motion.div
          animate={{ opacity: isDark ? 0 : 1, scale: isDark ? 0.6 : 1, rotate: isDark ? -30 : 0 }}
          transition={{ duration: 0.2, ease: [0.23, 1, 0.32, 1] }}
          className="absolute inset-0 flex items-center justify-center"
        >
          <SunMedium size={16} strokeWidth={1.75} />
        </motion.div>
        <motion.div
          animate={{ opacity: isDark ? 1 : 0, scale: isDark ? 1 : 0.6, rotate: isDark ? 0 : 30 }}
          transition={{ duration: 0.2, ease: [0.23, 1, 0.32, 1] }}
          className="absolute inset-0 flex items-center justify-center"
        >
          <MoonStar size={15} strokeWidth={1.75} />
        </motion.div>
      </div>

      <AnimatePresence initial={false}>
        {!collapsed && (
          <motion.span
            key="theme-label"
            initial={{ opacity: 0, width: 0 }}
            animate={{ opacity: 1, width: "auto" }}
            exit={{ opacity: 0, width: 0 }}
            transition={{ duration: 0.18, ease: [0.23, 1, 0.32, 1] }}
            className="text-[13px] font-medium truncate overflow-hidden whitespace-nowrap"
          >
            {isDark ? "Modo escuro" : "Modo claro"}
          </motion.span>
        )}
      </AnimatePresence>
    </button>
  );
}
