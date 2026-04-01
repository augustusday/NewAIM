import { NextRequest, NextResponse } from "next/server";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import type { Database } from "@/lib/database.types";

export interface OpenRouterModel {
  id: string;
  name: string;
  description?: string;
  context_length?: number;
  pricing?: { prompt: string; completion: string };
}

/**
 * GET /api/admin/openrouter-models?key=sk-or-...
 *
 * Fetches all models from OpenRouter using the provided API key.
 * The key is passed as a query param (already owned by the caller — this is just a CORS proxy).
 * Only accessible to authenticated users (super_admin check not strictly needed here
 * since the caller already has the key).
 */
export async function GET(req: NextRequest) {
  const apiKey = req.nextUrl.searchParams.get("key");
  if (!apiKey) {
    return NextResponse.json({ error: "Missing key" }, { status: 400 });
  }

  // Basic auth check — must be authenticated
  const cookieStore = await cookies();
  const supabase = createServerClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    { cookies: { getAll: () => cookieStore.getAll() } }
  );
  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  }

  try {
    const res = await fetch("https://openrouter.ai/api/v1/models", {
      headers: {
        Authorization: `Bearer ${apiKey}`,
        "HTTP-Referer": "https://agendaiamed.com.br",
        "X-Title": "AgendaIAMed Admin",
      },
      next: { revalidate: 300 }, // cache 5 min
    });

    if (!res.ok) {
      const err = await res.text();
      return NextResponse.json({ error: err }, { status: res.status });
    }

    const json = await res.json() as { data: OpenRouterModel[] };

    // Return sorted by provider then name
    const models = (json.data ?? []).sort((a, b) => a.id.localeCompare(b.id));

    return NextResponse.json({ models });
  } catch (err) {
    const msg = err instanceof Error ? err.message : "Failed to fetch models";
    return NextResponse.json({ error: msg }, { status: 500 });
  }
}
