#!/usr/bin/env python3
"""
Import Dr. Júlia's data into Zelus (Clínica Bonfanti)
Generates SQL to be executed via Supabase MCP
"""

import csv
import json
import uuid
import re
import sys
from datetime import datetime, date
from pathlib import Path

CLINIC_ID = "30a89c67-7497-457f-a887-a56d1d721f6d"
DOCTOR_ID = "a5f319bb-2c4e-4fb3-898e-6d1f66d522f7"  # Dr. Júlia Bonfanti
JULIA_PROFILE_ID = "8b1b148f-368b-4480-acdf-2236a593b2fb"
BASE = Path(__file__).parent

def esc(s):
    """Escape string for SQL"""
    if s is None or s == "":
        return "NULL"
    s = str(s).replace("'", "''")
    return f"'{s}'"

def esc_date(s):
    if not s or s.strip() == "":
        return "NULL"
    try:
        # Format: "1991-08-02 12:00:00" or "1991-08-02"
        d = s.strip().split(" ")[0]
        datetime.strptime(d, "%Y-%m-%d")
        return f"'{d}'"
    except:
        return "NULL"

def esc_datetime(s):
    if not s or s.strip() == "":
        return "NULL"
    try:
        s = s.strip()
        # Try various formats
        for fmt in ["%Y-%m-%d %H:%M:%S.%f", "%Y-%m-%d %H:%M:%S", "%Y-%m-%d"]:
            try:
                dt = datetime.strptime(s, fmt)
                return f"'{dt.isoformat()}'"
            except:
                continue
        return "NULL"
    except:
        return "NULL"

def clean_phone(p):
    if not p:
        return None
    p = re.sub(r'\D', '', str(p))
    if not p:
        return None
    return p

def map_gender(g):
    if not g:
        return "NULL"
    g = g.strip().upper()
    if g == "M":
        return "'male'"
    if g in ("F", "FEM"):
        return "'female'"
    return "NULL"

def map_appointment_status(s):
    mapping = {
        "FINALIZADA": "completed",
        "CANCELADA_SMS": "cancelled",
        "CANCELADA": "cancelled",
        "AGUARDANDO": "scheduled",
        "CONFIRMADA": "confirmed",
        "NAO_COMPARECEU": "no_show",
        "EM_ATENDIMENTO": "in_progress",
    }
    return mapping.get(s.strip().upper() if s else "", "scheduled")

# ─────────────────────────────────────────────
# 1. CONTACTS (pacientes)
# ─────────────────────────────────────────────
print("-- ============================================================")
print("-- 1. CONTACTS (pacientes → contacts)")
print("-- ============================================================")

# Map: id_paciente → contact UUID
patient_map = {}  # id_paciente -> new uuid

with open(BASE / "1391668_pacientes_2026_03_25.csv", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    rows = list(reader)

print(f"-- {len(rows)} pacientes encontrados")
print()

for row in rows:
    id_pac = row.get("id_paciente", "").strip()
    if not id_pac:
        continue

    new_id = str(uuid.uuid4())
    patient_map[id_pac] = new_id

    nome = row.get("nome", "").strip()
    celular = clean_phone(row.get("celular"))
    telefone = clean_phone(row.get("telefone"))
    phone = celular or telefone
    email = row.get("email", "").strip() or None
    cpf = row.get("cpf", "").strip() or None
    birth = row.get("datanascimento") or row.get("data_nascimento") or ""
    gender = row.get("sexo", "")
    plano = row.get("plano", "").strip() or None
    obs = row.get("observacao", "").strip() or None
    excluido = row.get("excluido", "f").strip()

    # Store original ID and other fields in custom_fields
    custom = {
        "id_paciente_origem": id_pac,
        "numeroprontuario": row.get("numeroprontuario", "").strip(),
        "numeropaciente": row.get("numeropaciente", "").strip(),
    }
    for k in ["rg", "bairro", "cep", "cidade", "endereco", "uf", "complemento"]:
        v = row.get(k, "").strip()
        if v:
            custom[k] = v

    custom_json = json.dumps(custom, ensure_ascii=False).replace("'", "''")

    # Insurance
    insurance_type_sql = esc(plano) if plano else "NULL"
    insurance_name_sql = "NULL"

    # Status: if excluido='t', mark inactive
    status = "'inactive'" if excluido == "t" else "'active'"

    phone_sql = esc(phone) if phone else "NULL"
    email_sql = esc(email) if email else "NULL"
    cpf_sql = esc(cpf) if cpf else "NULL"
    obs_sql = esc(obs) if obs else "NULL"

    print(f"INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)")
    print(f"VALUES ('{new_id}', '{CLINIC_ID}', {esc(nome)}, {phone_sql}, {email_sql}, {cpf_sql}, {esc_date(birth)}, {map_gender(gender)}, {status}, {obs_sql}, '{custom_json}'::jsonb, {insurance_type_sql}, '{JULIA_PROFILE_ID}', NOW(), NOW())")
    print(f"ON CONFLICT DO NOTHING;")

print()

# ─────────────────────────────────────────────
# 2. APPOINTMENTS (consultas)
# ─────────────────────────────────────────────
print("-- ============================================================")
print("-- 2. APPOINTMENTS (consultas → appointments)")
print("-- ============================================================")

with open(BASE / "1391668_consultas_2026_03_25.csv", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    appt_rows = list(reader)

print(f"-- {len(appt_rows)} consultas encontradas")
print()

for row in appt_rows:
    id_pac = row.get("i_paciente", "").strip()
    contact_id = patient_map.get(id_pac)

    data_str = row.get("data", "").strip()
    if not data_str:
        continue

    # Parse date and time
    try:
        dt = None
        for fmt in ["%Y-%m-%d %H:%M:%S", "%Y-%m-%d %H:%M:%S.%f"]:
            try:
                dt = datetime.strptime(data_str, fmt)
                break
            except:
                continue
        if not dt:
            continue
    except:
        continue

    sched_date = dt.strftime("%Y-%m-%d")
    start_time = dt.strftime("%H:%M")

    # Duration
    duracao = row.get("tempoestimado", "30").strip()
    try:
        dur_min = int(float(duracao)) if duracao else 30
    except:
        dur_min = 30

    # End time
    end_dt = dt.replace(hour=dt.hour, minute=dt.minute)
    end_minutes = dt.hour * 60 + dt.minute + dur_min
    end_h = (end_minutes // 60) % 24
    end_m = end_minutes % 60
    end_time = f"{end_h:02d}:{end_m:02d}"

    status = map_appointment_status(row.get("status", ""))
    paciente_nome = row.get("paciente", "").strip()
    descricao = row.get("descricao", "").strip() or None
    data_retorno = row.get("data_retorno_alerta", "").strip() or None

    new_id = str(uuid.uuid4())
    contact_id_sql = f"'{contact_id}'" if contact_id else "NULL"

    notes_parts = []
    if descricao:
        notes_parts.append(descricao)
    if data_retorno:
        notes_parts.append(f"Retorno: {data_retorno}")
    notes_sql = esc(" | ".join(notes_parts)) if notes_parts else "NULL"

    print(f"INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)")
    print(f"VALUES ('{new_id}', '{CLINIC_ID}', '{DOCTOR_ID}', {contact_id_sql}, {esc(paciente_nome)}, '{sched_date}', '{start_time}', '{end_time}', '{status}', {notes_sql}, 'import', NOW(), NOW())")
    print(f"ON CONFLICT DO NOTHING;")

print()

# ─────────────────────────────────────────────
# 3. CONTACT NOTES (evolucoes)
# ─────────────────────────────────────────────
print("-- ============================================================")
print("-- 3. CONTACT NOTES (evolucoes)")
print("-- ============================================================")

with open(BASE / "1391668_evolucoes_2026_03_25.csv", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    evo_rows = list(reader)

print(f"-- {len(evo_rows)} evoluções encontradas")
print()

for row in evo_rows:
    id_pac = row.get("i_paciente", "").strip()
    contact_id = patient_map.get(id_pac)
    if not contact_id:
        continue  # skip if patient not in our contacts

    data_str = row.get("data", "").strip()
    descricao = row.get("descricao", "").strip()
    profissional = row.get("profissional", "").strip()

    if not descricao:
        continue

    # Strip HTML tags minimally
    descricao_clean = re.sub(r'<[^>]+>', '', descricao).strip()
    descricao_clean = re.sub(r'\s+', ' ', descricao_clean).strip()
    if not descricao_clean:
        continue

    body = f"[Evolução - {profissional}]\n{descricao_clean}"
    new_id = str(uuid.uuid4())
    created = esc_datetime(data_str) if data_str else "NOW()"

    print(f"INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)")
    print(f"VALUES ('{new_id}', '{CLINIC_ID}', '{contact_id}', '{JULIA_PROFILE_ID}', {esc(body)}, {created})")
    print(f"ON CONFLICT DO NOTHING;")

print()

# ─────────────────────────────────────────────
# 4. CONTACT NOTES (anamnese)
# ─────────────────────────────────────────────
print("-- ============================================================")
print("-- 4. CONTACT NOTES (anamnese)")
print("-- ============================================================")

with open(BASE / "1391668_anamnese_2026_03_25.csv", encoding="utf-8") as f:
    reader = csv.DictReader(f)
    ana_rows = list(reader)

print(f"-- {len(ana_rows)} anamneses encontradas")
print()

for row in ana_rows:
    id_pac = row.get("i_paciente", "").strip()
    contact_id = patient_map.get(id_pac)
    if not contact_id:
        continue

    nome_anamnese = row.get("nome", "").strip()
    data_str = row.get("data_emissao", "").strip()
    excluido = row.get("excluido", "f").strip()
    possui_alerta = row.get("possui_alerta", "f").strip()

    if excluido == "t":
        continue

    alerta = " ⚠️ POSSUI ALERTA" if possui_alerta == "t" else ""
    body = f"[Anamnese: {nome_anamnese}]{alerta}"

    new_id = str(uuid.uuid4())
    created = esc_datetime(data_str) if data_str else "NOW()"

    print(f"INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)")
    print(f"VALUES ('{new_id}', '{CLINIC_ID}', '{contact_id}', '{JULIA_PROFILE_ID}', {esc(body)}, {created})")
    print(f"ON CONFLICT DO NOTHING;")

print()
print("-- ============================================================")
print("-- IMPORT CONCLUÍDO")
print(f"-- Contatos: {len(patient_map)}")
print(f"-- Consultas: {len(appt_rows)}")
print(f"-- Evoluções: {len(evo_rows)}")
print(f"-- Anamneses: {len(ana_rows)}")
print("-- ============================================================")
