"use client";

// Dark mode removed — platform runs light mode only.
export function useTheme() {
  return { theme: "light" as const, toggle: () => {} };
}
