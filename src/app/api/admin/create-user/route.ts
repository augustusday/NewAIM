import { createClient } from "@supabase/supabase-js";
import { createSupabaseServerClient } from "@/lib/supabase-server";
import { DEFAULT_CLINIC_MEMBER_ROLE, isClinicMemberRole } from "@/lib/clinic-member-roles";
import type { Database } from "@/lib/database.types";
import { NextResponse } from "next/server";

function getAdmin() {
  return createClient<Database>(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { autoRefreshToken: false, persistSession: false } }
  );
}

export async function POST(req: Request) {
  // Verify caller is super_admin
  const server = await createSupabaseServerClient();
  const { data: { user } } = await server.auth.getUser();
  if (!user) return NextResponse.json({ error: "Não autenticado" }, { status: 401 });

  const { data: profile } = await server.from("profiles").select("is_super_admin").eq("id", user.id).single();
  if (!profile?.is_super_admin) return NextResponse.json({ error: "Sem permissão" }, { status: 403 });

  const { full_name, email, password, clinic_id, role } = await req.json();

  const normalizedFullName = typeof full_name === "string" ? full_name.trim() : "";
  const normalizedEmail = typeof email === "string" ? email.trim().toLowerCase() : "";
  const normalizedPassword = typeof password === "string" ? password : "";
  const normalizedClinicId = typeof clinic_id === "string" && clinic_id.trim() ? clinic_id.trim() : null;
  const requestedRole = typeof role === "string" && role.trim() ? role.trim() : DEFAULT_CLINIC_MEMBER_ROLE;

  if (!normalizedEmail || !normalizedPassword || !normalizedFullName) {
    return NextResponse.json({ error: "Nome, e-mail e senha são obrigatórios." }, { status: 400 });
  }

  if (normalizedClinicId && !isClinicMemberRole(requestedRole)) {
    return NextResponse.json({ error: "Função inválida para vínculo com clínica." }, { status: 400 });
  }

  const admin = getAdmin();

  if (normalizedClinicId) {
    const { data: clinic, error: clinicError } = await admin
      .from("clinics")
      .select("id")
      .eq("id", normalizedClinicId)
      .maybeSingle();

    if (clinicError || !clinic) {
      return NextResponse.json({ error: "Clínica inválida." }, { status: 400 });
    }
  }

  // Create auth user
  const { data: authData, error: authError } = await admin.auth.admin.createUser({
    email: normalizedEmail,
    password: normalizedPassword,
    email_confirm: true,
    user_metadata: { full_name: normalizedFullName },
  });

  if (authError || !authData.user) {
    return NextResponse.json({ error: authError?.message ?? "Erro ao criar usuário" }, { status: 400 });
  }

  const newUserId = authData.user.id;

  const rollbackUser = async () => {
    await admin.from("clinic_members").delete().eq("user_id", newUserId);
    await admin.from("profiles").delete().eq("id", newUserId);
    await admin.auth.admin.deleteUser(newUserId);
  };

  // Upsert profile
  const { error: profileError } = await admin.from("profiles").upsert({
    id: newUserId,
    full_name: normalizedFullName,
    is_super_admin: false,
    active_clinic_id: normalizedClinicId,
  });

  if (profileError) {
    await rollbackUser();
    return NextResponse.json({ error: profileError.message }, { status: 400 });
  }

  // Optionally assign to clinic
  if (normalizedClinicId) {
    const { error: memberError } = await admin.from("clinic_members").upsert({
      user_id: newUserId,
      clinic_id: normalizedClinicId,
      role: requestedRole,
      active: true,
      invited_at: new Date().toISOString(),
    }, { onConflict: "user_id,clinic_id" });

    if (memberError) {
      await rollbackUser();
      return NextResponse.json({ error: memberError.message }, { status: 400 });
    }
  }

  return NextResponse.json({ user_id: newUserId });
}
