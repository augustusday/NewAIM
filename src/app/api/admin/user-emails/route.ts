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
 * GET /api/admin/user-emails
 * Returns a map of { [userId]: email } for all auth users.
 * Requires super_admin.
 */
export async function GET() {
  const server = await createSupabaseServerClient();
  const { data: { user } } = await server.auth.getUser();
  if (!user) return NextResponse.json({ error: "Não autenticado" }, { status: 401 });

  const { data: profile } = await server.from("profiles").select("is_super_admin").eq("id", user.id).single();
  if (!profile?.is_super_admin) return NextResponse.json({ error: "Sem permissão" }, { status: 403 });

  const admin = getAdmin();

  // listUsers returns up to 1000 by default; paginate if needed
  const { data, error } = await admin.auth.admin.listUsers({ perPage: 1000 });
  if (error) return NextResponse.json({ error: error.message }, { status: 500 });

  const emails: Record<string, string> = {};
  for (const u of data.users) {
    if (u.email) emails[u.id] = u.email;
  }

  return NextResponse.json({ emails });
}
