import { NextRequest, NextResponse } from "next/server";
import { createServerClient } from "@supabase/ssr";
import { cookies } from "next/headers";
import { getDoctorGoogleStatus } from "@/lib/google-calendar";

export async function GET(req: NextRequest) {
  const doctorId = req.nextUrl.searchParams.get("doctor_id");
  if (!doctorId) return NextResponse.json({ error: "doctor_id required" }, { status: 400 });

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
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });

  const status = await getDoctorGoogleStatus(doctorId);
  return NextResponse.json(status);
}
