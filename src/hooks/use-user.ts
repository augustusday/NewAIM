"use client";

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";

interface UserProfile {
  id: string;
  full_name: string;
  is_super_admin: boolean;
  active_clinic_id: string | null;
  clinic_name: string | null;
  email: string | null;
}

export function useUser(): { user: UserProfile | null; loaded: boolean } {
  const [user, setUser] = useState<UserProfile | null>(null);
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    supabase.auth.getUser().then(async ({ data: { user: authUser } }) => {
      if (!authUser) { setLoaded(true); return; }

      const { data: profile } = await supabase
        .from("profiles")
        .select("id, full_name, is_super_admin, active_clinic_id")
        .eq("id", authUser.id)
        .single();

      let clinicName: string | null = null;
      if (profile?.active_clinic_id) {
        const { data: clinic } = await supabase
          .from("clinics")
          .select("name")
          .eq("id", profile.active_clinic_id)
          .single();
        clinicName = clinic?.name ?? null;
      }

      setUser({
        id: authUser.id,
        full_name: profile?.full_name ?? authUser.email ?? "Usuário",
        is_super_admin: profile?.is_super_admin ?? false,
        active_clinic_id: profile?.active_clinic_id ?? null,
        clinic_name: clinicName,
        email: authUser.email ?? null,
      });
      setLoaded(true);
    });
  }, []);

  return { user, loaded };
}
