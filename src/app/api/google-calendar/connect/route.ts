import { NextRequest, NextResponse } from "next/server";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import { generateAuthUrl } from "@/lib/google-calendar";

export async function GET(req: NextRequest) {
  const { searchParams } = req.nextUrl;
  const doctorId = searchParams.get("doctor_id");
  const clinicId = searchParams.get("clinic_id");

  if (!doctorId || !clinicId) {
    return NextResponse.json({ error: "doctor_id and clinic_id required" }, { status: 400 });
  }

  // Verify the caller is authenticated and is a member of the clinic
  const cookieStore = await cookies();
  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll: () => cookieStore.getAll(),
        setAll: () => {},
      },
    }
  );

  const { data: { user } } = await supabase.auth.getUser();
  if (!user) {
    return NextResponse.redirect(new URL("/login", req.url));
  }

  const { data: member } = await supabase
    .from("clinic_members")
    .select("id")
    .eq("clinic_id", clinicId)
    .eq("user_id", user.id)
    .maybeSingle();

  if (!member) {
    return NextResponse.json({ error: "Unauthorized" }, { status: 403 });
  }

  const state = Buffer.from(JSON.stringify({ doctorId, clinicId, ts: Date.now() })).toString("base64url");
  const authUrl = generateAuthUrl(state);

  return NextResponse.redirect(authUrl);
}
