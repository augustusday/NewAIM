"use client";

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";

interface ClinicContext {
  clinicId: string;
  loaded: boolean;
}

/**
 * Returns the active clinic ID for the current user.
 * Reads `profiles.active_clinic_id`, falls back to first `clinic_members` entry.
 * Never falls back to a demo/hardcoded ID.
 */
export function useClinic(): ClinicContext {
  const [clinicId, setClinicId] = useState("");
  const [loaded, setLoaded] = useState(false);

  useEffect(() => {
    supabase.auth.getUser().then(async ({ data: { user } }) => {
      if (!user) { setLoaded(true); return; }

      const { data: profile } = await supabase
        .from("profiles")
        .select("active_clinic_id")
        .eq("id", user.id)
        .single();

      if (profile?.active_clinic_id) {
        setClinicId(profile.active_clinic_id);
        setLoaded(true);
        return;
      }

      // Fallback: find first clinic from membership
      const { data: member } = await supabase
        .from("clinic_members")
        .select("clinic_id")
        .eq("user_id", user.id)
        .eq("active", true)
        .limit(1)
        .maybeSingle();

      if (member?.clinic_id) {
        setClinicId(member.clinic_id);
        // Persist to profile for next login
        await supabase
          .from("profiles")
          .update({ active_clinic_id: member.clinic_id })
          .eq("id", user.id);
      }

      setLoaded(true);
    });
  }, []);

  return { clinicId, loaded };
}
