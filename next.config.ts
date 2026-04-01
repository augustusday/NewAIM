import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Keep googleapis out of the server bundle — load from node_modules at runtime.
  // This avoids bundling a ~170MB package into every server build artifact.
  serverExternalPackages: ["googleapis"],

  // Tell webpack/Turbopack to tree-shake these large packages on import,
  // so only the icons/functions you actually use get compiled.
  experimental: {
    optimizePackageImports: ["lucide-react", "framer-motion", "date-fns"],
  },
};

export default nextConfig;
