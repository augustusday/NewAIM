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

export async function POST(req: Request) {
  // Verify caller is super_admin
  const server = await createSupabaseServerClient();
  const { data: { user } } = await server.auth.getUser();
  if (!user) return NextResponse.json({ error: "Não autenticado" }, { status: 401 });

  const { data: profile } = await server.from("profiles").select("is_super_admin").eq("id", user.id).single();
  if (!profile?.is_super_admin) return NextResponse.json({ error: "Sem permissão" }, { status: 403 });

  const { full_name, email, password, clinic_id, role } = await req.json();

  if (!email || !password || !full_name) {
    return NextResponse.json({ error: "Nome, e-mail e senha são obrigatórios." }, { status: 400 });
  }

  const admin = getAdmin();

  // Create auth user
  const { data: authData, error: authError } = await admin.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { full_name },
  });

  if (authError || !authData.user) {
    return NextResponse.json({ error: authError?.message ?? "Erro ao criar usuário" }, { status: 400 });
  }

  const newUserId = authData.user.id;

  // Upsert profile
  await admin.from("profiles").upsert({
    id: newUserId,
    full_name,
    is_super_admin: false,
  });

  // Optionally assign to clinic
  if (clinic_id && role) {
    await admin.from("clinic_members").upsert({
      user_id: newUserId,
      clinic_id,
      role,
      active: true,
      invited_at: new Date().toISOString(),
    });
  }

  return NextResponse.json({ user_id: newUserId });
}
