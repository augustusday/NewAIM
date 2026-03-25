import { NextRequest, NextResponse } from "next/server";

export async function POST(req: NextRequest) {
  try {
    const { serverUrl, instanceToken, method, path, body } = await req.json();

    if (!serverUrl || !instanceToken || !method || !path) {
      return NextResponse.json({ error: "Missing required fields" }, { status: 400 });
    }

    // Normalize server URL
    const base = serverUrl.replace(/\/$/, "");
    const url = `${base}${path}`;

    const headers: Record<string, string> = {
      "Content-Type": "application/json",
      token: instanceToken,
    };

    const fetchInit: RequestInit = {
      method,
      headers,
    };

    if (method !== "GET" && body !== undefined) {
      fetchInit.body = JSON.stringify(body);
    }

    const upstream = await fetch(url, fetchInit);
    const data = await upstream.json().catch(() => ({}));

    return NextResponse.json(data, { status: upstream.status });
  } catch (err: unknown) {
    const message = err instanceof Error ? err.message : "Internal error";
    return NextResponse.json({ error: message }, { status: 500 });
  }
}
