import { supabase } from "../supabase";
import type { DashboardStats, AppointmentsByDay, Doctor, Appointment } from "../database.types";

export async function getDashboardStats(clinicId: string): Promise<DashboardStats | null> {
  const { data } = await supabase
    .from("v_dashboard_stats")
    .select("*")
    .eq("clinic_id", clinicId)
    .single();
  return data;
}

export async function getAppointmentsByDay(
  clinicId: string,
  fromDate: string,
  toDate: string
): Promise<AppointmentsByDay[]> {
  const { data } = await supabase
    .from("v_appointments_by_day")
    .select("*")
    .eq("clinic_id", clinicId)
    .gte("scheduled_date", fromDate)
    .lte("scheduled_date", toDate)
    .order("scheduled_date");
  return data ?? [];
}

export type DoctorWithAppointments = Doctor & {
  appointments_count: number;
  completed_count: number;
};

export async function getTopDoctors(clinicId: string, limit = 5): Promise<DoctorWithAppointments[]> {
  const startOfMonth = new Date();
  startOfMonth.setDate(1);
  const startStr = startOfMonth.toISOString().split("T")[0];

  const { data: doctors } = await supabase
    .from("doctors")
    .select("*")
    .eq("clinic_id", clinicId)
    .eq("active", true);

  if (!doctors) return [];

  const { data: appointments } = await supabase
    .from("appointments")
    .select("doctor_id, status")
    .eq("clinic_id", clinicId)
    .gte("scheduled_date", startStr);

  const countMap: Record<string, { total: number; completed: number }> = {};
  for (const a of (appointments ?? []) as { doctor_id: string; status: string }[]) {
    if (!countMap[a.doctor_id]) countMap[a.doctor_id] = { total: 0, completed: 0 };
    countMap[a.doctor_id].total++;
    if (a.status === "completed") countMap[a.doctor_id].completed++;
  }

  return doctors
    .map((d) => ({
      ...d,
      appointments_count: countMap[d.id]?.total ?? 0,
      completed_count: countMap[d.id]?.completed ?? 0,
    }))
    .sort((a, b) => b.appointments_count - a.appointments_count)
    .slice(0, limit);
}

export type AppointmentWithDoctor = Appointment & {
  doctor: Pick<Doctor, "id" | "name" | "specialty" | "color"> | null;
};

export async function getTodayAppointments(clinicId: string): Promise<AppointmentWithDoctor[]> {
  const today = new Date().toISOString().split("T")[0];
  const { data } = await supabase
    .from("appointments")
    .select("*, doctor:doctors(id, name, specialty, color)")
    .eq("clinic_id", clinicId)
    .eq("scheduled_date", today)
    .order("start_time");
  return (data as unknown as AppointmentWithDoctor[]) ?? [];
}
