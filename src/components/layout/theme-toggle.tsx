"use client";

import { Moon, Sun } from "lucide-react";
import { motion } from "framer-motion";
import { useTheme } from "@/hooks/use-theme";

export function ThemeToggle({ collapsed = false }: { collapsed?: boolean }) {
  const { theme, toggle } = useTheme();
  const isDark = theme === "dark";

  return (
    <motion.button
      whileTap={{ scale: 0.9 }}
      onClick={toggle}
      className="flex items-center gap-3 w-full px-3 py-2.5 rounded-xl cursor-pointer transition-all duration-200 text-[var(--sidebar-text-dim)] hover:bg-[var(--sidebar-hover-bg)] hover:text-[var(--sidebar-active-text)]"
      title={isDark ? "Modo claro" : "Modo escuro"}
    >
      <div className="relative shrink-0 w-[18px] h-[18px]">
        <motion.div
          initial={false}
          animate={{ opacity: isDark ? 0 : 1, scale: isDark ? 0 : 1 }}
          transition={{ duration: 0.2 }}
          className="absolute inset-0 flex items-center justify-center"
        >
          <Sun size={18} />
        </motion.div>
        <motion.div
          initial={false}
          animate={{ opacity: isDark ? 1 : 0, scale: isDark ? 1 : 0 }}
          transition={{ duration: 0.2 }}
          className="absolute inset-0 flex items-center justify-center"
        >
          <Moon size={18} />
        </motion.div>
      </div>

      {!collapsed && (
        <span className="text-sm font-medium">
          {isDark ? "Modo escuro" : "Modo claro"}
        </span>
      )}
    </motion.button>
  );
}
