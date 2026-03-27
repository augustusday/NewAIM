import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { exchangeCodeForTokens, getGoogleEmailFromTokens } from "@/lib/google-calendar";

function getAdmin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!.trim()
  );
}

export async function GET(req: NextRequest) {
  const { searchParams } = req.nextUrl;
  const code = searchParams.get("code");
  const state = searchParams.get("state");
  const error = searchParams.get("error");

  const appUrl = process.env.NEXT_PUBLIC_APP_URL ?? req.nextUrl.origin;

  if (error || !code || !state) {
    return NextResponse.redirect(`${appUrl}/dashboard/settings?google=error`);
  }

  let doctorId: string;
  let clinicId: string;
  try {
    const decoded = JSON.parse(Buffer.from(state, "base64url").toString("utf-8"));
    doctorId = decoded.doctorId;
    clinicId = decoded.clinicId;
    if (!doctorId || !clinicId) throw new Error("invalid state");
  } catch {
    return NextResponse.redirect(`${appUrl}/dashboard/settings?google=error`);
  }

  try {
    const tokens = await exchangeCodeForTokens(code);

    if (!tokens.refresh_token) {
      return NextResponse.redirect(`${appUrl}/dashboard/settings?google=no_refresh_token`);
    }

    const googleEmail = tokens.access_token
      ? await getGoogleEmailFromTokens(tokens.access_token)
      : null;

    const admin = getAdmin();
    await admin.from("doctor_google_tokens").upsert(
      {
        doctor_id: doctorId,
        clinic_id: clinicId,
        access_token: tokens.access_token!,
        refresh_token: tokens.refresh_token,
        expiry_date: tokens.expiry_date ?? 0,
        google_email: googleEmail,
        updated_at: new Date().toISOString(),
      },
      { onConflict: "doctor_id" }
    );

    // Auto-sync existing appointments in background (fire-and-forget)
    fetch(`${appUrl}/api/google-calendar/sync-all`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ doctor_id: doctorId, clinic_id: clinicId }),
    }).catch((e) => console.error("[GCal callback] sync-all error:", e));

    return NextResponse.redirect(`${appUrl}/dashboard/settings?google=connected`);
  } catch (err) {
    console.error("[GCal callback] error:", err);
    return NextResponse.redirect(`${appUrl}/dashboard/settings?google=error`);
  }
}
