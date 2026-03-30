INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9b434bcb-9a13-46c5-af5e-ecc23b7b505e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-09-24', '15:30', '16:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d532a7a5-dae6-4dcc-a02a-7c65014f1d9b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '61813a3c-7407-4dd3-8e9a-2127be0f0490', 'Julia Saad', '2025-09-24', '17:00', '18:00', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2f019843-099b-4c52-a1f4-f745f8b73be4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-09-24', '19:00', '20:30', 'completed', 'microagulhamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6700d604-14b4-4247-809d-edf9ba1e0478', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-09-25', '18:30', '20:30', 'completed', 'Parte superior', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ecd32615-3230-4ff5-976a-251ef1490bbf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '79d7c4d5-56f7-47da-8b6c-c68ea8d17246', 'Patricia Lourenço da Silva', '2025-09-25', '21:00', '22:00', 'scheduled', 'avaliação inicial', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('943ffa3c-744f-4554-a663-586a04426d18', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-10-09', '11:00', '12:00', 'completed', 'Remoção da contenção + duas restaurações 14/15', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('63ff7c7e-7a3e-42a8-b144-143aae42ce6e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-12-11', '11:00', '12:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d6339aad-be74-4e62-8793-3c9be8e73dca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e6facbe7-e197-429e-af83-380eaf9654a6', 'Alanis Matzembacher', '2025-11-05', '13:00', '14:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0d975411-f146-445e-9739-a981627d034e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3983dfeb-8056-4694-897f-0cc35b43743d', 'Caroline Kerscher', '2025-10-13', '14:00', '15:00', 'scheduled', 'restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bb8ba63c-5725-4468-a020-c68b718ad246', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd90aad48-e084-446b-8297-1846acde64e1', 'Vó Antônia', '2025-10-10', '17:00', '19:00', 'scheduled', 'rest 42 e 43', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;