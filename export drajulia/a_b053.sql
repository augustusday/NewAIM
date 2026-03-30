INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1c14569e-1053-4b82-9acf-d567a8bf0bdf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-21', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9147090f-1c75-48a6-a083-f9c3b2cc721a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-16', '18:00', '19:00', 'scheduled', 'prova das facetas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4a83ce66-9262-4b95-b357-208f75c7693c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-01-14', '22:00', '23:00', 'scheduled', 'finalização dos dentes de cima', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ae246150-811c-4c3a-8701-7f1f149ad1fc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-01-23', '19:00', '20:00', 'scheduled', 'Ajustes', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('67f6dd4a-c853-4602-9bba-3e59ed0a1086', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2026-01-15', '12:50', '14:05', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ae815b7d-743d-4794-88f9-c0686230ecee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2026-01-16', '13:00', '14:00', 'cancelled', 'segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('96ec9cf0-a395-46d9-bb64-d9fe22dc29e0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2026-02-25', '18:15', '19:15', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c63ece95-7d5a-43e3-afff-91d893e44179', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2026-02-26', '14:00', '15:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f28071b4-099d-4043-afc2-6e349d5201aa', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2026-01-22', '13:30', '14:30', 'cancelled', 'rest 26 palavrinha', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c743b32e-7788-4a32-a3ad-47242da8e84b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-19', '16:00', '18:00', 'scheduled', 'prova caso precise', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;