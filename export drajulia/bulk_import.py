#!/usr/bin/env python3
"""
Bulk import Dr. Júlia's data into Zelus via Supabase REST API
"""

import csv
import json
import uuid
import re
import sys
import urllib.request
import urllib.error
from datetime import datetime
from pathlib import Path

# ── Config ────────────────────────────────────────────────────────────────────
SUPABASE_URL = "https://pwsjyuhbkpthhmorkzfn.supabase.co"
SERVICE_ROLE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB3c2p5dWhia3B0aGhtb3JremZuIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NDEyNzcyNCwiZXhwIjoyMDg5NzAzNzI0fQ.wAn42_qAt5I-be18xsRVj8aJxb8hga0bRIDHHjf4-D0"

CLINIC_ID = "30a89c67-7497-457f-a887-a56d1d721f6d"
DOCTOR_ID = "a5f319bb-2c4e-4fb3-898e-6d1f66d522f7"
JULIA_PROFILE_ID = "8b1b148f-368b-4480-acdf-2236a593b2fb"
BASE = Path(__file__).parent

HEADERS = {
    "apikey": SERVICE_ROLE_KEY,
    "Authorization": f"Bearer {SERVICE_ROLE_KEY}",
    "Content-Type": "application/json",
    "Prefer": "return=minimal",
}

# ── Helpers ───────────────────────────────────────────────────────────────────
def normalize_batch(rows):
    """PostgREST requires all objects in a batch to have the same keys."""
    all_keys = set()
    for r in rows:
        all_keys.update(r.keys())
    return [{k: r.get(k, None) for k in all_keys} for r in rows]

def supabase_insert(table, rows, batch_size=100):
    """Insert rows into a Supabase table via REST API in batches."""
    total = len(rows)
    inserted = 0
    errors = 0
    for i in range(0, total, batch_size):
        batch = normalize_batch(rows[i:i+batch_size])
        data = json.dumps(batch).encode("utf-8")
        req = urllib.request.Request(
            f"{SUPABASE_URL}/rest/v1/{table}",
            data=data,
            headers={**HEADERS, "Content-Length": str(len(data))},
            method="POST",
        )
        try:
            with urllib.request.urlopen(req) as resp:
                inserted += len(batch)
                print(f"  ✓ batch {i//batch_size + 1}: {len(batch)} registros inseridos")
        except urllib.error.HTTPError as e:
            body = e.read().decode()
            print(f"  ✗ batch {i//batch_size + 1} ERROR {e.code}: {body[:300]}")
            errors += len(batch)
    return inserted, errors

def clean_phone(p):
    if not p: return None
    p = re.sub(r'\D', '', str(p))
    return p if p else None

def parse_date(s):
    if not s or not s.strip(): return None
    s = s.strip().split(" ")[0]
    try:
        datetime.strptime(s, "%Y-%m-%d")
        return s
    except: return None

def parse_dt(s):
    if not s or not s.strip(): return None
    s = s.strip()
    for fmt in ["%Y-%m-%d %H:%M:%S.%f", "%Y-%m-%d %H:%M:%S", "%Y-%m-%d"]:
        try:
            return datetime.strptime(s, fmt).isoformat()
        except: continue
    return None

def map_gender(g):
    if not g: return None
    g = g.strip().upper()
    return "male" if g == "M" else ("female" if g in ("F","FEM") else None)

def map_status(s):
    m = {"FINALIZADA":"completed","CANCELADA_SMS":"cancelled","CANCELADA":"cancelled",
         "AGUARDANDO":"scheduled","CONFIRMADA":"confirmed","NAO_COMPARECEU":"no_show",
         "EM_ATENDIMENTO":"in_progress"}
    return m.get((s or "").strip().upper(), "scheduled")

def strip_html(s):
    if not s: return ""
    s = re.sub(r'<[^>]+>', '', s)
    return re.sub(r'\s+', ' ', s).strip()

ONLY_APPOINTMENTS = True  # set False to re-run full import

# ── 1. CONTACTS ───────────────────────────────────────────────────────────────
print("\n═══════════════════════════════════════════")
print("1. CONTACTS (pacientes)")
print("═══════════════════════════════════════════")

patient_map = {}  # id_paciente -> new uuid

with open(BASE / "1391668_pacientes_2026_03_25.csv", encoding="utf-8") as f:
    rows_raw = list(csv.DictReader(f))

contact_rows = []
for row in rows_raw:
    id_pac = row.get("id_paciente", "").strip()
    if not id_pac: continue

    new_id = str(uuid.uuid4())
    patient_map[id_pac] = new_id

    celular = clean_phone(row.get("celular"))
    telefone = clean_phone(row.get("telefone"))

    custom = {"id_paciente_origem": id_pac}
    for k in ["numeroprontuario","numeropaciente","rg","bairro","cep","cidade","endereco","uf","complemento"]:
        v = row.get(k, "").strip()
        if v: custom[k] = v

    excluido = row.get("excluido","f").strip()
    plano = row.get("plano","").strip() or None
    obs = row.get("observacao","").strip() or None

    rec = {
        "id": new_id,
        "clinic_id": CLINIC_ID,
        "full_name": row.get("nome","").strip(),
        "phone": celular or telefone,
        "email": row.get("email","").strip() or None,
        "document": row.get("cpf","").strip() or None,
        "birth_date": parse_date(row.get("datanascimento") or row.get("data_nascimento")),
        "gender": map_gender(row.get("sexo")),
        "status": "inactive" if excluido == "t" else "patient",
        "notes": obs,
        "custom_fields": custom,
        "insurance_type": plano,
        "created_by": JULIA_PROFILE_ID,
    }
    # Remove None values to use DB defaults
    rec = {k: v for k, v in rec.items() if v is not None}
    contact_rows.append(rec)

if not ONLY_APPOINTMENTS:
    print(f"  Preparados: {len(contact_rows)} contatos")
    ins, err = supabase_insert("contacts", contact_rows, batch_size=50)
    print(f"  → Inseridos: {ins} | Erros: {err}")
else:
    # Rebuild patient_map from existing contacts in DB
    print("  Reconstruindo patient_map dos contatos existentes no DB...")
    req = urllib.request.Request(
        f"{SUPABASE_URL}/rest/v1/contacts?clinic_id=eq.{CLINIC_ID}&select=id,custom_fields",
        headers={**HEADERS, "Accept": "application/json"},
        method="GET",
    )
    with urllib.request.urlopen(req) as resp:
        existing = json.loads(resp.read())
    patient_map = {}
    for c in existing:
        cf = c.get("custom_fields") or {}
        orig_id = cf.get("id_paciente_origem")
        if orig_id:
            patient_map[orig_id] = c["id"]
    print(f"  → {len(patient_map)} contatos mapeados do DB")

# ── 2. APPOINTMENTS ───────────────────────────────────────────────────────────
print("\n═══════════════════════════════════════════")
print("2. APPOINTMENTS (consultas)")
print("═══════════════════════════════════════════")

with open(BASE / "1391668_consultas_2026_03_25.csv", encoding="utf-8") as f:
    appt_raw = list(csv.DictReader(f))

appt_rows = []
for row in appt_raw:
    data_str = row.get("data","").strip()
    if not data_str: continue

    dt = None
    for fmt in ["%Y-%m-%d %H:%M:%S", "%Y-%m-%d %H:%M:%S.%f"]:
        try:
            dt = datetime.strptime(data_str, fmt)
            break
        except: continue
    if not dt: continue

    dur = 30
    try: dur = int(float(row.get("tempoestimado","30") or 30))
    except: pass

    end_min = dt.hour * 60 + dt.minute + dur
    end_h, end_m = (end_min // 60) % 24, end_min % 60

    id_pac = row.get("i_paciente","").strip()
    contact_id = patient_map.get(id_pac)

    descricao = row.get("descricao","").strip()
    data_retorno = row.get("data_retorno_alerta","").strip()
    notes_parts = [x for x in [descricao, f"Retorno: {data_retorno}" if data_retorno else ""] if x]

    rec = {
        "id": str(uuid.uuid4()),
        "clinic_id": CLINIC_ID,
        "doctor_id": DOCTOR_ID,
        "patient_name": row.get("paciente","").strip(),
        "scheduled_date": dt.strftime("%Y-%m-%d"),
        "start_time": dt.strftime("%H:%M"),
        "end_time": f"{end_h:02d}:{end_m:02d}",
        "status": map_status(row.get("status","")),
        "source": "manual",
    }
    if contact_id: rec["contact_id"] = contact_id
    if notes_parts: rec["notes"] = " | ".join(notes_parts)
    appt_rows.append(rec)

print(f"  Preparados: {len(appt_rows)} consultas")
ins, err = supabase_insert("appointments", appt_rows, batch_size=50)
print(f"  → Inseridos: {ins} | Erros: {err}")

# ── 3. CONTACT NOTES (evoluções) ──────────────────────────────────────────────
print("\n═══════════════════════════════════════════")
print("3. CONTACT NOTES (evoluções)")
print("═══════════════════════════════════════════")

with open(BASE / "1391668_evolucoes_2026_03_25.csv", encoding="utf-8") as f:
    evo_raw = list(csv.DictReader(f))

note_rows = []
for row in evo_raw:
    id_pac = row.get("i_paciente","").strip()
    contact_id = patient_map.get(id_pac)
    if not contact_id: continue

    descricao = strip_html(row.get("descricao",""))
    if not descricao: continue

    profissional = row.get("profissional","").strip()
    body = f"[Evolução - {profissional}]\n{descricao}" if profissional else descricao

    rec = {
        "id": str(uuid.uuid4()),
        "clinic_id": CLINIC_ID,
        "contact_id": contact_id,
        "author_id": JULIA_PROFILE_ID,
        "body": body,
    }
    dt_str = parse_dt(row.get("data",""))
    if dt_str: rec["created_at"] = dt_str
    note_rows.append(rec)

if not ONLY_APPOINTMENTS:
    print(f"  Preparadas: {len(note_rows)} evoluções")
    ins, err = supabase_insert("contact_notes", note_rows, batch_size=50)
    print(f"  → Inseridos: {ins} | Erros: {err}")
else:
    print(f"  Pulando (já inserido)")

# ── 4. CONTACT NOTES (anamnese) ───────────────────────────────────────────────
print("\n═══════════════════════════════════════════")
print("4. CONTACT NOTES (anamneses)")
print("═══════════════════════════════════════════")

with open(BASE / "1391668_anamnese_2026_03_25.csv", encoding="utf-8") as f:
    ana_raw = list(csv.DictReader(f))

ana_rows = []
for row in ana_raw:
    if row.get("excluido","f").strip() == "t": continue
    id_pac = row.get("i_paciente","").strip()
    contact_id = patient_map.get(id_pac)
    if not contact_id: continue

    nome_ana = row.get("nome","").strip()
    alerta = " ⚠️ POSSUI ALERTA" if row.get("possui_alerta","f").strip() == "t" else ""
    body = f"[Anamnese: {nome_ana}]{alerta}"

    rec = {
        "id": str(uuid.uuid4()),
        "clinic_id": CLINIC_ID,
        "contact_id": contact_id,
        "author_id": JULIA_PROFILE_ID,
        "body": body,
    }
    dt_str = parse_dt(row.get("data_emissao",""))
    if dt_str: rec["created_at"] = dt_str
    ana_rows.append(rec)

if not ONLY_APPOINTMENTS:
    print(f"  Preparadas: {len(ana_rows)} anamneses")
    ins, err = supabase_insert("contact_notes", ana_rows, batch_size=50)
    print(f"  → Inseridos: {ins} | Erros: {err}")
else:
    print(f"  Pulando (já inserido)")

print("\n═══════════════════════════════════════════")
print("IMPORT CONCLUÍDO ✓")
print("═══════════════════════════════════════════")
