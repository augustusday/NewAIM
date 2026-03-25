import { supabase } from "../supabase";
import type { Appointment, AppointmentType, Doctor } from "../database.types";

export type AppointmentFull = Appointment & {
  doctor: Pick<Doctor, "id" | "name" | "specialty" | "color"> | null;
  appointment_type: Pick<AppointmentType, "id" | "name" | "color" | "duration_minutes"> | null;
};

export async function getAppointmentsForDate(
  clinicId: string,
  date: string
): Promise<AppointmentFull[]> {
  const { data } = await supabase
    .from("appointments")
    .select(
      "*, doctor:doctors(id, name, specialty, color), appointment_type:appointment_types(id, name, color, duration_minutes)"
    )
    .eq("clinic_id", clinicId)
    .eq("scheduled_date", date)
    .order("start_time");
  return (data as unknown as AppointmentFull[]) ?? [];
}

export async function getAppointmentsForWeek(
  clinicId: string,
  startDate: string,
  endDate: string
): Promise<AppointmentFull[]> {
  const { data } = await supabase
    .from("appointments")
    .select(
      "*, doctor:doctors(id, name, specialty, color), appointment_type:appointment_types(id, name, color, duration_minutes)"
    )
    .eq("clinic_id", clinicId)
    .gte("scheduled_date", startDate)
    .lte("scheduled_date", endDate)
    .order("scheduled_date")
    .order("start_time");
  return (data as unknown as AppointmentFull[]) ?? [];
}

export async function getDoctors(clinicId: string): Promise<Doctor[]> {
  const { data } = await supabase
    .from("doctors")
    .select("*")
    .eq("clinic_id", clinicId)
    .eq("active", true)
    .order("name");
  return data ?? [];
}

export async function getAppointmentTypes(clinicId: string): Promise<AppointmentType[]> {
  const { data } = await supabase
    .from("appointment_types")
    .select("*")
    .eq("clinic_id", clinicId)
    .eq("active", true)
    .order("name");
  return data ?? [];
}

export async function createAppointment(
  clinicId: string,
  data: {
    doctor_id: string;
    patient_name: string;
    patient_phone?: string;
    contact_id?: string;
    type_id?: string;
    type_name_snapshot?: string;
    scheduled_date: string;
    start_time: string;
    end_time: string;
    notes?: string;
  }
): Promise<Appointment | null> {
  const { data: appt } = await supabase
    .from("appointments")
    .insert({ clinic_id: clinicId, ...data })
    .select()
    .single();
  return appt;
}

export async function updateAppointmentStatus(
  id: string,
  status: string
): Promise<void> {
  await supabase.from("appointments").update({ status }).eq("id", id);
}

export async function createAppointmentType(
  clinicId: string,
  data: { name: string; color?: string; duration_minutes?: number }
): Promise<AppointmentType | null> {
  const { data: type } = await supabase
    .from("appointment_types")
    .insert({ clinic_id: clinicId, ...data })
    .select()
    .single();
  return type;
}

export async function updateAppointmentType(
  id: string,
  data: { name?: string; color?: string; duration_minutes?: number; active?: boolean }
): Promise<void> {
  await supabase.from("appointment_types").update(data).eq("id", id);
}

export async function deleteAppointmentType(id: string): Promise<void> {
  await supabase.from("appointment_types").update({ active: false }).eq("id", id);
}

/** Returns available time slots for a doctor on a given date, excluding already booked appointments. */
export async function getAvailableSlots(
  clinicId: string,
  doctorId: string,
  date: string
): Promise<string[]> {
  const dayOfWeek = new Date(date + "T12:00:00").getDay(); // use noon to avoid TZ shift

  const { data: template } = await supabase
    .from("availability_templates")
    .select("start_time, end_time, slot_duration_min")
    .eq("clinic_id", clinicId)
    .eq("doctor_id", doctorId)
    .eq("day_of_week", dayOfWeek)
    .eq("active", true)
    .maybeSingle();

  if (!template) return [];

  const { data: booked } = await supabase
    .from("appointments")
    .select("start_time")
    .eq("clinic_id", clinicId)
    .eq("doctor_id", doctorId)
    .eq("scheduled_date", date)
    .not("status", "eq", "cancelled");

  const bookedSet = new Set((booked ?? []).map((a) => a.start_time.slice(0, 5)));

  const slots: string[] = [];
  const [startH, startM] = template.start_time.split(":").map(Number);
  const [endH, endM] = template.end_time.split(":").map(Number);
  const startMins = startH * 60 + startM;
  const endMins = endH * 60 + endM;
  const step = template.slot_duration_min ?? 30;

  for (let m = startMins; m + step <= endMins; m += step) {
    const hh = String(Math.floor(m / 60)).padStart(2, "0");
    const mm = String(m % 60).padStart(2, "0");
    const slot = `${hh}:${mm}`;
    if (!bookedSet.has(slot)) slots.push(slot);
  }

  return slots;
}

// ─── Availability Templates ────────────────────────────────────────────────────

import type { AvailabilityTemplate } from "../database.types";

export async function getAvailabilityTemplates(
  clinicId: string,
  doctorId: string
): Promise<AvailabilityTemplate[]> {
  const { data } = await supabase
    .from("availability_templates")
    .select("*")
    .eq("clinic_id", clinicId)
    .eq("doctor_id", doctorId)
    .order("day_of_week");
  return data ?? [];
}

export async function upsertAvailabilityTemplate(
  clinicId: string,
  doctorId: string,
  dayOfWeek: number,
  params: { start_time: string; end_time: string; slot_duration_min?: number; active?: boolean }
): Promise<void> {
  await supabase.from("availability_templates").upsert(
    {
      clinic_id: clinicId,
      doctor_id: doctorId,
      day_of_week: dayOfWeek,
      start_time: params.start_time,
      end_time: params.end_time,
      slot_duration_min: params.slot_duration_min ?? 30,
      active: params.active ?? true,
    },
    { onConflict: "doctor_id,day_of_week" }
  );
}

export async function deleteAvailabilityTemplate(id: string): Promise<void> {
  await supabase.from("availability_templates").delete().eq("id", id);
}
