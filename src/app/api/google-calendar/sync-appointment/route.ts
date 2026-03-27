import { NextRequest, NextResponse } from "next/server";
import { createClient } from "@supabase/supabase-js";
import {
  syncAppointmentCreate,
  syncAppointmentUpdate,
  syncAppointmentDelete,
} from "@/lib/google-calendar";

function getAdmin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!.trim()
  );
}

export async function POST(req: NextRequest) {
  const { appointment_id, action } = await req.json() as {
    appointment_id: string;
    action: "create" | "update" | "delete";
  };

  if (!appointment_id || !action) {
    return NextResponse.json({ error: "appointment_id and action required" }, { status: 400 });
  }

  const admin = getAdmin();

  // Fetch appointment separately
  const { data: appt, error: apptError } = await admin
    .from("appointments")
    .select("*")
    .eq("id", appointment_id)
    .maybeSingle();

  if (apptError) {
    console.error("[GCal sync] appointments query error:", apptError);
    return NextResponse.json({ error: "DB error" }, { status: 500 });
  }
  if (!appt) {
    console.error("[GCal sync] appointment not found:", appointment_id);
    return NextResponse.json({ error: "Appointment not found" }, { status: 404 });
  }

  // Fetch clinic timezone separately
  const { data: clinic } = await admin
    .from("clinics")
    .select("timezone")
    .eq("id", appt.clinic_id)
    .maybeSingle();

  const doctorId: string = appt.doctor_id;
  const timezone: string = clinic?.timezone ?? "America/Sao_Paulo";

  const apptData = {
    id: appt.id,
    patient_name: appt.patient_name,
    scheduled_date: appt.scheduled_date,
    start_time: appt.start_time.slice(0, 5),
    end_time: appt.end_time.slice(0, 5),
    notes: appt.notes,
    type_name_snapshot: appt.type_name_snapshot,
    google_event_id: appt.google_event_id,
  };

  console.log(`[GCal sync] action=${action} doctor=${doctorId} tz=${timezone}`);

  if (action === "create") {
    const googleEventId = await syncAppointmentCreate(apptData, doctorId, timezone);
    console.log("[GCal sync] create result googleEventId:", googleEventId);
    if (googleEventId) {
      await admin
        .from("appointments")
        .update({ google_event_id: googleEventId })
        .eq("id", appointment_id);
    }
    return NextResponse.json({ google_event_id: googleEventId, skipped: !googleEventId });
  }

  if (action === "update") {
    if (!appt.google_event_id) return NextResponse.json({ skipped: true });
    await syncAppointmentUpdate(appt.google_event_id, apptData, doctorId, timezone);
    return NextResponse.json({ ok: true });
  }

  if (action === "delete") {
    if (!appt.google_event_id) return NextResponse.json({ skipped: true });
    await syncAppointmentDelete(appt.google_event_id, doctorId);
    await admin.from("appointments").update({ google_event_id: null }).eq("id", appointment_id);
    return NextResponse.json({ ok: true });
  }

  return NextResponse.json({ error: "Invalid action" }, { status: 400 });
}
