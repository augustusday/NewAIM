"use client";

import { useEffect, useState } from "react";
import { supabase } from "@/lib/supabase";
import { useClinic } from "./use-clinic";

export interface UazapiConfig {
  serverUrl: string;
  instanceToken: string;
}

/**
 * Loads and persists UAZAPI config for the current clinic.
 * Source of truth: clinic_settings in Supabase.
 * localStorage is used as a fast initial cache only.
 */
export function useUazapiConfig() {
  const { clinicId, loaded: clinicLoaded } = useClinic();

  const [config, setConfig] = useState<UazapiConfig>({
    serverUrl: "",
    instanceToken: "",
  });
  const [loaded, setLoaded] = useState(false);

  // Load from DB once clinic is known
  useEffect(() => {
    if (!clinicLoaded) return;

    supabase
      .from("clinic_settings")
      .select("uazapi_instance_token, uazapi_server_url")
      .eq("clinic_id", clinicId)
      .maybeSingle()
      .then(({ data }) => {
        if (data) {
          setConfig({
            serverUrl: data.uazapi_server_url ?? "",
            instanceToken: data.uazapi_instance_token ?? "",
          });
        }
        setLoaded(true);
      });
  }, [clinicId, clinicLoaded]);

  const save = async (next: UazapiConfig) => {
    setConfig(next);
    await supabase.from("clinic_settings").upsert({
      clinic_id: clinicId,
      uazapi_server_url: next.serverUrl || null,
      uazapi_instance_token: next.instanceToken || null,
      updated_at: new Date().toISOString(),
    });
  };

  const clear = async () => {
    setConfig({ serverUrl: "", instanceToken: "" });
    await supabase.from("clinic_settings").upsert({
      clinic_id: clinicId,
      uazapi_server_url: null,
      uazapi_instance_token: null,
      updated_at: new Date().toISOString(),
    });
  };

  const isConfigured = !!(config.serverUrl && config.instanceToken);

  return { config, save, clear, loaded, isConfigured };
}
