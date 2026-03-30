INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e19c4d97-76be-4c83-b724-e54ce026254e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-03-19', '17:00', '19:30', 'scheduled', 'Terceira sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6efac5f1-ad0a-487a-8c75-f1ba7f0f7ded', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-03-12', '16:40', '18:10', 'completed', 'Cimentação da peça protética', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('83cd0e78-3a22-4425-8753-6c7764401ae4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '5bf43453-eace-46bc-ab99-e01c9b85aea2', 'Bruno Leme da Conceição', '2025-03-10', '22:00', '23:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9cc44499-0331-442a-a096-18d795e8cdda', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-03-14', '12:45', '13:45', 'scheduled', 'Entrega da placa de Bruxismo', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('86e4eb80-c2e6-4026-a9db-e32fdf61d4a7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-03-18', '18:15', '19:15', 'completed', 'Iniciar clareamento interno 21 e 22', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8d64c6f3-fda2-48cd-98dc-790662af73c1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-03-31', '12:00', '12:30', 'scheduled', 'LEMBRAR DA LIMPEZA', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7e4d45a2-71d0-4335-b6dd-61c9929c21a4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-03-14', '14:00', '15:00', 'scheduled', 'Entrega dos outros pares de alinhadores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('82622ccc-371b-4e0b-b999-34493411c311', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-03-18', '11:50', '12:50', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9b8c29a6-053c-4c83-94da-d051b9bcd9d5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-05-12', '12:45', '14:00', 'cancelled', 'Reembasar placa de bruxismo com resina acrilica translúcida + ajuste oclusal no 26 e 16', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e20411fb-e116-4220-9634-b2439965aaeb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e10df8f6-5082-4b43-841f-163e041c3390', 'Edelvita de Souza Lopes', '2025-09-11', '18:40', '19:40', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;