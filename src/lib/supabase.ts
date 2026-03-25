import { createBrowserClient } from "@supabase/ssr";
import type { Database } from "./database.types";

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

export const supabase = createBrowserClient<Database>(supabaseUrl, supabaseAnonKey);

// Demo clinic ID (seed data) — used until real auth is wired up
export const DEMO_CLINIC_ID = "a0000000-0000-0000-0000-000000000001";
