import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import { syncAppointmentCreate } from "@/lib/google-calendar";

function getAdmin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!.trim()
  );
}

export async function POST(req: NextRequest) {
  const { doctor_id, clinic_id } = await req.json() as { doctor_id: string; clinic_id: string };
  if (!doctor_id || !clinic_id) {
    return NextResponse.json({ error: "doctor_id and clinic_id required" }, { status: 400 });
  }

  const admin = getAdmin();

  // Fetch clinic timezone
  const { data: clinic } = await admin
    .from("clinics")
    .select("timezone")
    .eq("id", clinic_id)
    .maybeSingle();
  const timezone = clinic?.timezone ?? "America/Sao_Paulo";

  // Fetch all future (or today) appointments for this doctor without google_event_id
  const today = new Date().toISOString().slice(0, 10);
  const { data: appointments, error } = await admin
    .from("appointments")
    .select("*")
    .eq("clinic_id", clinic_id)
    .eq("doctor_id", doctor_id)
    .is("google_event_id", null)
    .neq("status", "cancelled")
    .gte("scheduled_date", today)
    .order("scheduled_date");

  if (error) {
    console.error("[GCal sync-all] query error:", error);
    return NextResponse.json({ error: "DB error" }, { status: 500 });
  }

  const list = appointments ?? [];
  let synced = 0;

  for (const appt of list) {
    const googleEventId = await syncAppointmentCreate(
      {
        id: appt.id,
        patient_name: appt.patient_name,
        scheduled_date: appt.scheduled_date,
        start_time: appt.start_time.slice(0, 5),
        end_time: appt.end_time.slice(0, 5),
        notes: appt.notes,
        type_name_snapshot: appt.type_name_snapshot,
        google_event_id: appt.google_event_id,
      },
      doctor_id,
      timezone
    );
    if (googleEventId) {
      await admin.from("appointments").update({ google_event_id: googleEventId }).eq("id", appt.id);
      synced++;
    }
  }

  console.log(`[GCal sync-all] doctor=${doctor_id} total=${list.length} synced=${synced}`);
  return NextResponse.json({ total: list.length, synced });
}
