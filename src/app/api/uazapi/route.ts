import { NextRequest, NextResponse } from "next/server";
import { createServerClient } from "@supabase/ssr";

export async function POST(req: NextRequest) {
  try {
    const supabase = createServerClient(
      process.env.NEXT_PUBLIC_SUPABASE_URL!,
      process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
      {
        cookies: {
          getAll() { return req.cookies.getAll(); },
          setAll() { /* read-only in API routes */ },
        },
      }
    );
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) {
      return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
    }

    const { method, path, body, clinicId: overrideClinicId } = await req.json();

    if (!method || !path) {
      return NextResponse.json({ error: "Missing required fields" }, { status: 400 });
    }

    // Determine which clinic's UAZAPI to use
    let targetClinicId: string | null = null;

    if (overrideClinicId) {
      // Only super_admin can target other clinics
      const { data: profile } = await supabase
        .from("profiles")
        .select("is_super_admin")
        .eq("id", user.id)
        .single();

      if (!profile?.is_super_admin) {
        return NextResponse.json({ error: "Forbidden" }, { status: 403 });
      }
      targetClinicId = overrideClinicId;
    } else {
      // Normal user: use their active clinic
      const { data: profile } = await supabase
        .from("profiles")
        .select("active_clinic_id")
        .eq("id", user.id)
        .single();

      targetClinicId = profile?.active_clinic_id ?? null;
    }

    if (!targetClinicId) {
      return NextResponse.json({ error: "No active clinic" }, { status: 400 });
    }

    // Look up UAZAPI credentials server-side
    const { data: settings } = await supabase
      .from("clinic_settings")
      .select("uazapi_server_url, uazapi_instance_token")
      .eq("clinic_id", targetClinicId)
      .maybeSingle();

    const serverUrl = settings?.uazapi_server_url;
    const instanceToken = settings?.uazapi_instance_token;

    if (!serverUrl || !instanceToken) {
      return NextResponse.json({ error: "UAZAPI not configured for this clinic" }, { status: 400 });
    }

    const base = serverUrl.replace(/\/$/, "");
    const url = `${base}${path}`;

    const headers: Record<string, string> = {
      "Content-Type": "application/json",
      token: instanceToken,
    };

    const fetchInit: RequestInit = { method, headers };

    if (method !== "GET" && body !== undefined) {
      fetchInit.body = JSON.stringify(body);
    }

    const upstream = await fetch(url, fetchInit);
    const data = await upstream.json().catch(() => ({}));

    return NextResponse.json(data, { status: upstream.status });
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : "Internal error";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
