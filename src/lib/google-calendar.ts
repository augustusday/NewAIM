/**
 * Google Calendar integration — server-side only.
 * Never import this file from client components.
 */
import { google } from "googleapis";
import { createClient } from "@supabase/supabase-js";

function getAdmin() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!.trim()
  );
}

function createOAuth2Client() {
  return new google.auth.OAuth2(
    process.env.GOOGLE_CLIENT_ID!,
    process.env.GOOGLE_CLIENT_SECRET!,
    `${process.env.NEXT_PUBLIC_APP_URL}/api/google-calendar/callback`
  );
}

export function generateAuthUrl(state: string): string {
  const client = createOAuth2Client();
  return client.generateAuthUrl({
    access_type: "offline",
    prompt: "consent",
    scope: [
      "https://www.googleapis.com/auth/calendar.events",
      "https://www.googleapis.com/auth/userinfo.email",
    ],
    state,
  });
}

export async function exchangeCodeForTokens(code: string) {
  const client = createOAuth2Client();
  const { tokens } = await client.getToken(code);
  return tokens;
}

export async function getGoogleEmailFromTokens(accessToken: string): Promise<string | null> {
  const client = createOAuth2Client();
  client.setCredentials({ access_token: accessToken });
  const oauth2 = google.oauth2({ version: "v2", auth: client });
  try {
    const { data } = await oauth2.userinfo.get();
    return data.email ?? null;
  } catch {
    return null;
  }
}

/** Returns an authenticated OAuth2 client for a given doctor, or null if not connected. */
async function getGoogleAuthClient(doctorId: string) {
  const admin = getAdmin();
  const { data: tokenRow } = await admin
    .from("doctor_google_tokens")
    .select("access_token, refresh_token, expiry_date")
    .eq("doctor_id", doctorId)
    .maybeSingle();

  if (!tokenRow) return null;

  const client = createOAuth2Client();
  client.setCredentials({
    access_token: tokenRow.access_token,
    refresh_token: tokenRow.refresh_token,
    expiry_date: tokenRow.expiry_date,
  });

  // Persist refreshed tokens automatically
  client.on("tokens", async (newTokens) => {
    const patch: Record<string, unknown> = { updated_at: new Date().toISOString() };
    if (newTokens.access_token) patch.access_token = newTokens.access_token;
    if (newTokens.expiry_date) patch.expiry_date = newTokens.expiry_date;
    await admin.from("doctor_google_tokens").update(patch).eq("doctor_id", doctorId);
  });

  return client;
}

export async function getDoctorGoogleStatus(
  doctorId: string
): Promise<{ connected: boolean; email: string | null }> {
  const admin = getAdmin();
  const { data } = await admin
    .from("doctor_google_tokens")
    .select("google_email")
    .eq("doctor_id", doctorId)
    .maybeSingle();
  return { connected: !!data, email: data?.google_email ?? null };
}

interface AppointmentData {
  id: string;
  patient_name: string;
  scheduled_date: string; // YYYY-MM-DD
  start_time: string;     // HH:MM
  end_time: string;       // HH:MM
  notes: string | null;
  type_name_snapshot: string | null;
  google_event_id?: string | null;
}

function buildEventResource(appt: AppointmentData, timezone: string) {
  const typePart = appt.type_name_snapshot ? ` — ${appt.type_name_snapshot}` : "";
  return {
    summary: `${appt.patient_name}${typePart}`,
    description: appt.notes ?? "",
    start: {
      dateTime: `${appt.scheduled_date}T${appt.start_time}:00`,
      timeZone: timezone,
    },
    end: {
      dateTime: `${appt.scheduled_date}T${appt.end_time}:00`,
      timeZone: timezone,
    },
    reminders: {
      useDefault: false,
      overrides: [{ method: "popup", minutes: 30 }],
    },
  };
}

/** Creates a Google Calendar event. Returns the Google event ID or null. */
export async function syncAppointmentCreate(
  appt: AppointmentData,
  doctorId: string,
  timezone: string
): Promise<string | null> {
  const auth = await getGoogleAuthClient(doctorId);
  if (!auth) return null;
  try {
    const cal = google.calendar({ version: "v3", auth });
    const res = await cal.events.insert({
      calendarId: "primary",
      requestBody: buildEventResource(appt, timezone),
    });
    return res.data.id ?? null;
  } catch (err) {
    console.error("[GCal] create error:", err);
    return null;
  }
}

/** Updates an existing Google Calendar event. */
export async function syncAppointmentUpdate(
  googleEventId: string,
  appt: AppointmentData,
  doctorId: string,
  timezone: string
): Promise<void> {
  const auth = await getGoogleAuthClient(doctorId);
  if (!auth) return;
  try {
    const cal = google.calendar({ version: "v3", auth });
    await cal.events.patch({
      calendarId: "primary",
      eventId: googleEventId,
      requestBody: buildEventResource(appt, timezone),
    });
  } catch (err) {
    console.error("[GCal] update error:", err);
  }
}

/** Deletes a Google Calendar event. */
export async function syncAppointmentDelete(
  googleEventId: string,
  doctorId: string
): Promise<void> {
  const auth = await getGoogleAuthClient(doctorId);
  if (!auth) return;
  try {
    const cal = google.calendar({ version: "v3", auth });
    await cal.events.delete({
      calendarId: "primary",
      eventId: googleEventId,
      sendUpdates: "none",
    });
  } catch (err) {
    console.error("[GCal] delete error:", err);
  }
}
