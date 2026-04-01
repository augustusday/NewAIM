export const CLINIC_MEMBER_ROLE_OPTIONS = [
  { value: "receptionist", label: "Recepcionista" },
  { value: "doctor", label: "Médico" },
  { value: "admin", label: "Admin" },
  { value: "owner", label: "Proprietário" },
] as const;

export type ClinicMemberRole = (typeof CLINIC_MEMBER_ROLE_OPTIONS)[number]["value"];

export const DEFAULT_CLINIC_MEMBER_ROLE: ClinicMemberRole = "receptionist";

export function isClinicMemberRole(value: unknown): value is ClinicMemberRole {
  return CLINIC_MEMBER_ROLE_OPTIONS.some((option) => option.value === value);
}
