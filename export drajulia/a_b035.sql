INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7b8dd28e-a8e0-4dd9-8640-e26b6dbb039e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '339d64a7-c351-4608-982b-c454b3d9da35', 'Isabelle Vitória Kusma Pyerl', '2025-07-21', '16:15', '17:15', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2b9bea9d-397b-435e-b38b-e25546944078', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-07-21', '17:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8cc65ef2-a6fb-4389-875c-cb593f4d1cac', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c81d4301-d1cb-4352-9614-42d2696cd165', 'Elivelton de Faria Santana', '2025-07-24', '18:00', '19:00', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8731c3a2-373e-44ce-b115-00093dae8c37', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-07-23', '19:00', '20:00', 'scheduled', 'restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a657c544-f7e9-4531-9fab-6a10b9429d78', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-07-28', '18:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('eda10511-4466-4d9b-baa8-11c4e6fb922c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-07-23', '17:00', '18:00', 'completed', 'segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d53573a2-1c56-457d-bcf0-80639e334cf8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-07-23', '20:30', '21:30', 'cancelled', 'quinta limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0d6d1670-3b41-4eae-8f15-10a000da6897', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-07-31', '17:00', '18:30', 'scheduled', 'remoção de attachments, remoção da resina do pré + entrega das seringas. requisição para o escaneamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('aae51597-5aa8-47f5-acac-c5ed19f52ef4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-08-06', '18:30', '19:30', 'scheduled', 'Remover o clareamento palatino e fechar de vez', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e539a41c-052b-48b0-aafe-874336c362a0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '84819211-94af-4341-9833-0e8fbe086421', 'Adriana Luz de Castro Carneiro', '2025-07-23', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;