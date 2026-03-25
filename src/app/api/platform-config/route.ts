import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import type { Database } from "@/lib/database.types";

function getAdmin() {
  return createClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!
  );
}

/** GET — public, returns current uazapi_server_url from platform_settings */
export async function GET() {
  const admin = getAdmin();
  const { data } = await admin
    .from("platform_settings")
    .select("value")
    .eq("key", "uazapi_server_url")
    .maybeSingle();

  return NextResponse.json({ uazapi_server_url: data?.value ?? "" });
}

/** POST — saves uazapi_server_url to platform_settings (uses service role, setup action) */
export async function POST(req: NextRequest) {
  try {
    const body = await req.json() as { uazapi_server_url?: string };
    const url = (body.uazapi_server_url ?? "").trim();

    const admin = getAdmin();
    await admin
      .from("platform_settings")
      .upsert({ key: "uazapi_server_url", value: url, updated_at: new Date().toISOString() });

    return NextResponse.json({ ok: true });
  } catch (err) {
    const message = err instanceof Error ? err.message : "Internal error";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
