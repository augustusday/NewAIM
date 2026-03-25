import { createServerClient } from "@supabase/ssr";
import { NextResponse } from "next/server";
import type { NextRequest } from "next/server";

export async function proxy(request: NextRequest) {
  let response = NextResponse.next({ request });

  const supabase = createServerClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
    {
      cookies: {
        getAll() {
          return request.cookies.getAll();
        },
        setAll(cookiesToSet) {
          cookiesToSet.forEach(({ name, value }) =>
            request.cookies.set(name, value)
          );
          response = NextResponse.next({ request });
          cookiesToSet.forEach(({ name, value, options }) =>
            response.cookies.set(name, value, options)
          );
        },
      },
    }
  );

  const {
    data: { user },
  } = await supabase.auth.getUser();

  const pathname = request.nextUrl.pathname;
  const isLoginPage  = pathname === "/login";
  const isDashboard  = pathname.startsWith("/dashboard");
  const isAdminRoute = pathname.startsWith("/admin");

  // Not authenticated → redirect to login
  if (!user && (isDashboard || isAdminRoute)) {
    const loginUrl = new URL("/login", request.url);
    loginUrl.searchParams.set("redirect", pathname);
    return NextResponse.redirect(loginUrl);
  }

  // Authenticated on login page → redirect based on role
  if (user && isLoginPage) {
    const { data: profile } = await supabase
      .from("profiles")
      .select("is_super_admin")
      .eq("id", user.id)
      .single();
    const dest = profile?.is_super_admin ? "/admin" : "/dashboard";
    return NextResponse.redirect(new URL(dest, request.url));
  }

  // Admin routes → check super_admin flag
  if (user && isAdminRoute) {
    const { data: profile, error } = await supabase
      .from("profiles")
      .select("is_super_admin")
      .eq("id", user.id)
      .single();

    if (error) {
      console.error("[proxy] Profile query error:", error);
      return NextResponse.redirect(new URL("/dashboard", request.url));
    }

    if (!profile?.is_super_admin) {
      return NextResponse.redirect(new URL("/dashboard", request.url));
    }
  }

  return response;
}

export const config = {
  matcher: ["/dashboard/:path*", "/admin/:path*", "/login"],
};
