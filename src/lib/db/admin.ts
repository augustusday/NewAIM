import { supabase } from "../supabase";
import type { Database } from "../database.types";

type Clinic = Database["public"]["Tables"]["clinics"]["Row"];
type ClinicSettings = Database["public"]["Tables"]["clinic_settings"]["Row"];
type ClinicMember = Database["public"]["Tables"]["clinic_members"]["Row"];
type Profile = Database["public"]["Tables"]["profiles"]["Row"];

export type ClinicWithStats = Clinic & {
  member_count: number;
  doctor_count: number;
  contact_count: number;
  uazapi_status: string | null;
  uazapi_instance_token: string | null;
  uazapi_profile_name: string | null;
  uazapi_server_url: string | null;
};

export type UserWithClinics = Omit<Profile, "is_super_admin"> & {
  is_super_admin: boolean;
  email: string | null;
  clinics: { clinic_id: string; clinic_name: string; role: string }[];
};

// ── Platform settings ─────────────────────────────────────────────────────────
export async function getPlatformSettings(): Promise<Record<string, string>> {
  const { data } = await supabase.from("platform_settings").select("key, value");
  if (!data) return {};
  return Object.fromEntries(data.map((r) => [r.key, r.value ?? ""]));
}

export async function setPlatformSetting(key: string, value: string): Promise<void> {
  await supabase
    .from("platform_settings")
    .upsert({ key, value, updated_at: new Date().toISOString() });
}

// ── Clinics ───────────────────────────────────────────────────────────────────
export async function getAllClinics(): Promise<ClinicWithStats[]> {
  const { data: clinics } = await supabase
    .from("clinics")
    .select("*")
    .order("created_at", { ascending: false });

  if (!clinics) return [];

  const clinicIds = clinics.map((c) => c.id);

  const [membersRes, doctorsRes, contactsRes, settingsRes] = await Promise.all([
    supabase.from("clinic_members").select("clinic_id").in("clinic_id", clinicIds).eq("active", true),
    supabase.from("doctors").select("clinic_id").in("clinic_id", clinicIds).eq("active", true),
    supabase.from("contacts").select("clinic_id").in("clinic_id", clinicIds),
    supabase.from("clinic_settings").select("clinic_id, uazapi_status, uazapi_instance_token, uazapi_profile_name, uazapi_server_url").in("clinic_id", clinicIds),
  ]);

  const members  = membersRes.data ?? [];
  const doctors  = doctorsRes.data ?? [];
  const contacts = contactsRes.data ?? [];
  const settings = settingsRes.data ?? [];

  return clinics.map((clinic) => ({
    ...clinic,
    member_count:          members.filter((m) => m.clinic_id === clinic.id).length,
    doctor_count:          doctors.filter((d) => d.clinic_id === clinic.id).length,
    contact_count:         contacts.filter((c) => c.clinic_id === clinic.id).length,
    uazapi_status:         settings.find((s) => s.clinic_id === clinic.id)?.uazapi_status ?? null,
    uazapi_instance_token: settings.find((s) => s.clinic_id === clinic.id)?.uazapi_instance_token ?? null,
    uazapi_profile_name:   settings.find((s) => s.clinic_id === clinic.id)?.uazapi_profile_name ?? null,
    uazapi_server_url:     settings.find((s) => s.clinic_id === clinic.id)?.uazapi_server_url ?? null,
  }));
}

export async function createClinic(data: {
  name: string;
  slug: string;
  timezone?: string;
}): Promise<Clinic | null> {
  const { data: clinic, error } = await supabase
    .from("clinics")
    .insert({ plan: "pro", active: true, settings: {}, ...data })
    .select()
    .single();

  if (error) console.error("createClinic error:", error);

  if (clinic) {
    await supabase.from("clinic_settings").insert({
      clinic_id: clinic.id,
      uazapi_status: "disconnected",
      uazapi_is_business: false,
      ai_enabled: false,
      appointment_slot_min: 30,
      business_hours: {},
    });
  }

  return clinic;
}

export async function updateClinic(id: string, data: Partial<Pick<Clinic, "name" | "active" | "slug" | "timezone">>): Promise<void> {
  await supabase.from("clinics").update({ ...data, updated_at: new Date().toISOString() }).eq("id", id);
}

export async function getClinicSettings(clinicId: string): Promise<ClinicSettings | null> {
  const { data } = await supabase.from("clinic_settings").select("*").eq("clinic_id", clinicId).single();
  return data;
}

export async function updateClinicSettings(
  clinicId: string,
  data: Partial<ClinicSettings>
): Promise<void> {
  await supabase
    .from("clinic_settings")
    .upsert({ clinic_id: clinicId, ...data, updated_at: new Date().toISOString() });
}

// ── Users ─────────────────────────────────────────────────────────────────────
export async function getAllUsers(): Promise<UserWithClinics[]> {
  const [profilesRes, membersRes, clinicsRes, emailsRes] = await Promise.all([
    supabase.from("profiles").select("*"),
    supabase.from("clinic_members").select("user_id, clinic_id, role"),
    supabase.from("clinics").select("id, name"),
    fetch("/api/admin/user-emails").then((r) => r.ok ? r.json() as Promise<{ emails: Record<string, string> }> : { emails: {} }).catch(() => ({ emails: {} })),
  ]);

  const profiles = profilesRes.data ?? [];
  const members  = membersRes.data ?? [];
  const clinics  = clinicsRes.data ?? [];
  const emailMap = (emailsRes.emails ?? {}) as Record<string, string>;

  const clinicMap = Object.fromEntries(clinics.map((c) => [c.id, c.name]));

  return profiles.map((profile) => {
    const p = profile as Profile;
    const userMembers = members.filter((m) => m.user_id === p.id);
    return {
      ...p,
      is_super_admin: p.is_super_admin,
      email: emailMap[p.id] ?? null,
      clinics: userMembers.map((m) => ({
        clinic_id: m.clinic_id,
        clinic_name: clinicMap[m.clinic_id] ?? "—",
        role: m.role,
      })),
    } as UserWithClinics;
  });
}

export async function toggleSuperAdmin(userId: string, value: boolean): Promise<void> {
  await supabase.from("profiles").update({ is_super_admin: value }).eq("id", userId);
}

export async function addUserToClinic(userId: string, clinicId: string, role: string): Promise<void> {
  await Promise.all([
    supabase
      .from("clinic_members")
      .upsert({ user_id: userId, clinic_id: clinicId, role, active: true }, { onConflict: "user_id,clinic_id" }),
    supabase
      .from("profiles")
      .update({ active_clinic_id: clinicId })
      .eq("id", userId)
      .is("active_clinic_id", null),
  ]);
}

// ── Platform-level UAZAPI instance management ─────────────────────────────────
export async function getClinicsWithUazapi(): Promise<ClinicWithStats[]> {
  return getAllClinics();
}

export async function saveClinicUazapiToken(clinicId: string, instanceToken: string, serverUrl: string): Promise<void> {
  await supabase.from("clinic_settings").upsert({
    clinic_id:             clinicId,
    uazapi_instance_token: instanceToken,
    uazapi_server_url:     serverUrl,
    uazapi_status:         "disconnected",
    updated_at:            new Date().toISOString(),
  });
}

export async function clearClinicUazapi(clinicId: string): Promise<void> {
  await supabase.from("clinic_settings").update({
    uazapi_instance_token: null,
    uazapi_server_url:     null,
    uazapi_status:         "disconnected",
    uazapi_profile_name:   null,
    uazapi_profile_pic:    null,
    updated_at:            new Date().toISOString(),
  }).eq("clinic_id", clinicId);
}

// ── Clinic detail ─────────────────────────────────────────────────────────────
export async function getClinicById(id: string): Promise<Clinic | null> {
  const { data } = await supabase.from("clinics").select("*").eq("id", id).single();
  return data;
}

// ── Members ───────────────────────────────────────────────────────────────────
type MemberWithProfile = ClinicMember & { profile: Pick<Profile, "id" | "full_name"> | null };

export async function getClinicMembers(clinicId: string): Promise<MemberWithProfile[]> {
  const { data } = await supabase
    .from("clinic_members")
    .select("*, profile:profiles(id, full_name)")
    .eq("clinic_id", clinicId)
    .eq("active", true)
    .order("invited_at");
  return (data as unknown as MemberWithProfile[]) ?? [];
}

export async function removeClinicMember(userId: string, clinicId: string): Promise<void> {
  await supabase
    .from("clinic_members")
    .update({ active: false })
    .eq("user_id", userId)
    .eq("clinic_id", clinicId);
}

export async function updateMemberRole(userId: string, clinicId: string, role: string): Promise<void> {
  await supabase
    .from("clinic_members")
    .update({ role })
    .eq("user_id", userId)
    .eq("clinic_id", clinicId);
}

// ── Doctors ───────────────────────────────────────────────────────────────────
type Doctor = Database["public"]["Tables"]["doctors"]["Row"];

export async function getAllDoctors(clinicId: string): Promise<Doctor[]> {
  const { data } = await supabase
    .from("doctors")
    .select("*")
    .eq("clinic_id", clinicId)
    .order("name");
  return data ?? [];
}

export async function createDoctor(clinicId: string, data: {
  name: string;
  specialty?: string;
  crm_number?: string;
  color?: string;
}): Promise<Doctor | null> {
  const { data: doctor } = await supabase
    .from("doctors")
    .insert({ clinic_id: clinicId, active: true, color: "#1DB6A0", ...data })
    .select()
    .single();
  return doctor;
}

export async function updateDoctor(id: string, data: Partial<Pick<Doctor, "name" | "specialty" | "crm_number" | "color">>): Promise<void> {
  await supabase.from("doctors").update({ ...data, updated_at: new Date().toISOString() }).eq("id", id);
}

export async function toggleDoctor(id: string, active: boolean): Promise<void> {
  await supabase.from("doctors").update({ active, updated_at: new Date().toISOString() }).eq("id", id);
}

// ── Availability templates ────────────────────────────────────────────────────
type AvailTemplate = Database["public"]["Tables"]["availability_templates"]["Row"];

export async function getAvailabilityTemplates(doctorId: string): Promise<AvailTemplate[]> {
  const { data } = await supabase
    .from("availability_templates")
    .select("*")
    .eq("doctor_id", doctorId)
    .order("day_of_week");
  return data ?? [];
}

export async function upsertAvailabilityTemplate(data: {
  id?: string;
  clinic_id: string;
  doctor_id: string;
  day_of_week: number;
  start_time: string;
  end_time: string;
  slot_duration_min?: number;
  active?: boolean;
  time_periods?: { start: string; end: string }[] | null;
}): Promise<void> {
  const payload = {
    ...data,
    time_periods: data.time_periods && data.time_periods.length > 1 ? data.time_periods : null,
  };
  await supabase.from("availability_templates").upsert(payload);
}

export async function deleteAvailabilityTemplate(id: string): Promise<void> {
  await supabase.from("availability_templates").delete().eq("id", id);
}

// ── Appointment types ─────────────────────────────────────────────────────────
type AppointmentType = Database["public"]["Tables"]["appointment_types"]["Row"];

export async function getAllAppointmentTypes(clinicId: string): Promise<AppointmentType[]> {
  const { data } = await supabase
    .from("appointment_types")
    .select("*")
    .eq("clinic_id", clinicId)
    .order("name");
  return data ?? [];
}

export async function createAppointmentType(clinicId: string, data: {
  name: string;
  duration_minutes?: number;
  color?: string;
}): Promise<AppointmentType | null> {
  const { data: at } = await supabase
    .from("appointment_types")
    .insert({ clinic_id: clinicId, active: true, color: "#1DB6A0", duration_minutes: 30, ...data })
    .select()
    .single();
  return at;
}

export async function updateAppointmentType(id: string, data: Partial<Pick<AppointmentType, "name" | "duration_minutes" | "color" | "active">>): Promise<void> {
  await supabase.from("appointment_types").update(data).eq("id", id);
}
