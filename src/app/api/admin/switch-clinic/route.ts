import { createClient } from "@supabase/supabase-js";
import { createSupabaseServerClient } from "@/lib/supabase-server";
import type { Database } from "@/lib/database.types";
import { NextResponse } from "next/server";

function getAdmin() {
  return createClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { autoRefreshToken: false, persistSession: false } }
  );
}

/**
 * POST /api/admin/switch-clinic
 * Body: { clinicId: string }
 *
 * Switches the super admin's active clinic context:
 * - Sets profiles.active_clinic_id to the target clinic
 * - Silently ensures the super admin is in clinic_members (so RLS passes)
 */
export async function POST(req: Request) {
  const server = await createSupabaseServerClient();
  const { data: { user } } = await server.auth.getUser();
  if (!user) return NextResponse.json({ error: "Não autenticado" }, { status: 401 });

  const { data: profile } = await server.from("profiles").select("is_super_admin").eq("id", user.id).single();
  if (!profile?.is_super_admin) return NextResponse.json({ error: "Sem permissão" }, { status: 403 });

  const { clinicId } = await req.json() as { clinicId: string };
  if (!clinicId) return NextResponse.json({ error: "clinicId é obrigatório" }, { status: 400 });

  const admin = getAdmin();

  // Update active clinic on profile
  await admin.from("profiles").update({ active_clinic_id: clinicId }).eq("id", user.id);

  // Ensure membership exists so RLS passes for all dashboard queries
  await admin.from("clinic_members").upsert({
    user_id: user.id,
    clinic_id: clinicId,
    role: "admin",
    active: true,
    invited_at: new Date().toISOString(),
  }, { onConflict: "user_id,clinic_id" });

  return NextResponse.json({ ok: true });
}
