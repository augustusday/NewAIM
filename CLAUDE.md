# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Critical: Next.js 16.2.1 Breaking Changes

**This is NOT the Next.js you know.** APIs and conventions differ from training data. Before writing any Next.js-specific code, read the relevant guide in `node_modules/next/dist/docs/`. Key differences already in use:

- **Middleware is `src/proxy.ts`** (not `middleware.ts`) — exports `proxy` function, not `middleware`
- **No `middleware.ts`** — using `proxy.ts` is the Next.js 16 convention; do NOT rename it
- **Tailwind v4** — config is in `globals.css` via `@theme inline {}`, not `tailwind.config.js`
- **React 19** — concurrent features available

## Commands

```bash
bun run dev       # Start dev server (Turbopack)
bun run build     # Production build — always run before finishing a task to catch TS errors
bun run lint      # ESLint
```

No test suite exists. Use `bun run build` to verify TypeScript correctness.

## Architecture Overview

### Multi-tenant SaaS for medical clinics

Every database query is scoped by `clinic_id`. The active clinic is resolved by `src/hooks/use-clinic.ts`, which reads `profiles.active_clinic_id` → falls back to `clinic_members` → falls back to `DEMO_CLINIC_ID` (`a0000000-0000-0000-0000-000000000001`).

### Auth Flow

1. **Client**: `src/lib/supabase.ts` exports a singleton `createBrowserClient` from `@supabase/ssr` — this syncs auth tokens to cookies (critical: NOT `createClient` from `@supabase/supabase-js`, which only uses localStorage)
2. **Server/Middleware**: `src/proxy.ts` uses `createServerClient` from `@supabase/ssr` reading those cookies to protect routes
3. **Route protection**: `/dashboard/*` requires auth; `/admin/*` requires `profiles.is_super_admin = true`
4. **After login**: `src/app/login/page.tsx` checks `is_super_admin` and links user to first available clinic if `active_clinic_id` is null

### Database Layer

All DB calls go through `src/lib/db/`:
- `dashboard.ts` — reads `v_dashboard_stats` and `v_appointments_by_day` views
- `agenda.ts` — appointments CRUD, doctor availability templates, slot generation
- `crm.ts` — contacts, notes, pipeline/kanban data
- `chats.ts` — WhatsApp chat sessions, UAZAPI sync
- `admin.ts` — platform-level: all clinics, all users, super_admin toggle

Supabase RLS is active on all tables. The anon key + user JWT enforces per-clinic data isolation.

### WhatsApp Integration (UAZAPI)

- Each clinic has its own UAZAPI instance token stored in `clinic_settings.uazapi_instance_token`
- The server URL is shared but each clinic has a separate instance on that server
- **CORS proxy**: client code calls `/api/uazapi` (route: `src/app/api/uazapi/route.ts`) which forwards to the external UAZAPI server — never call UAZAPI directly from client
- **Webhooks**: `src/app/api/webhooks/uazapi/route.ts` receives events; uses service role key (via `getAdmin()` lazy init) to bypass RLS
- **Config hook**: `src/hooks/use-uazapi-config.ts` reads/writes `clinic_settings` via Supabase

### Route Structure

```
/login              — public
/dashboard/*        — authenticated (any clinic member)
  /dashboard        — metrics (v_dashboard_stats, v_appointments_by_day views)
  /dashboard/agenda — calendar, appointments, doctor availability
  /dashboard/chats  — WhatsApp sessions
  /dashboard/crm    — contacts + pipeline kanban
  /dashboard/settings — clinic profile + UAZAPI connection
/admin/*            — super_admin only
  /admin            — platform overview
  /admin/clinicas   — clinic CRUD
  /admin/usuarios   — user management + super_admin toggle
```

### Styling Conventions

- **Design tokens** in `src/app/globals.css` — use CSS vars like `var(--z-text)`, `var(--surface-1)`, `var(--border)`, `var(--input)` instead of raw colors
- **Brand green**: `#019A67` (primary), `#01c47f` (lighter accent)
- **Error red**: `#e05555`
- **Warning amber**: `#f59e0b`
- All components use inline `style={{}}` for brand-colored elements rather than Tailwind utilities for colors
- `framer-motion` for all animations; `lucide-react` for all icons
- shadcn/ui components in `src/components/ui/` — use these before building custom primitives

### Key Hooks

- `useClinic()` — returns `{ clinicId, loaded }` — wait for `loaded` before querying DB
- `useUser()` — returns `{ user: { full_name, is_super_admin, clinic_name, ... }, loaded }`
- `useUazapiConfig()` — returns config + `save()` + `clear()` + `isConfigured`

### Supabase Project

- Project ID: `pwsjyuhbkpthhmorkzfn` (sa-east-1)
- Types file: `src/lib/database.types.ts` — keep in sync if schema changes (use `generate_typescript_types` MCP tool)
- Service role key is only used server-side in webhook handler and admin functions
