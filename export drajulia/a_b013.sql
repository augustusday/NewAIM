INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('adf76e21-6a96-4241-844d-33faf4be420a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2024-12-16', '14:10', '14:55', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('de139332-97fb-43c8-b3aa-742edf28b12f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2024-12-16', '21:30', '22:30', 'cancelled', '23 + 48', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6e8598a9-3da0-4a42-9640-24fea90c3d5d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-01-13', '11:30', '13:00', 'completed', '36 -- remoção de almálgama', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('83bb3e43-aced-46f2-9f44-352d078593ce', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2024-12-20', '19:30', '21:00', 'completed', 'Limpeza inicial', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('83801cbc-daa5-4fbc-8193-fdc3fe992326', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-03-13', '20:30', '21:30', 'scheduled', 'Segunda etapa do ALinhador', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8be50111-f49d-4b93-855e-c5efedd41d79', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2025-01-10', '17:00', '18:30', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('11f6d531-321e-4e56-a26e-5d754a776e7c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-01-28', '20:00', '22:00', 'scheduled', 'Limpeza, prepara para a peça', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0e230f3e-17e9-4967-838e-982a40db438c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '36fb7501-1117-4461-bec2-5fa83e2a2592', 'Lurdes Regina Correa Zampieri', '2024-12-20', '12:00', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fb011c1e-9513-496e-bf2d-a7946ce5c360', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '36fb7501-1117-4461-bec2-5fa83e2a2592', 'Lurdes Regina Correa Zampieri', '2025-01-21', '11:45', '13:45', 'cancelled', 'Última sessão de clareamento + limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a3225cc4-bcc2-4a30-bcac-43c6782520ba', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2024-12-20', '11:30', '12:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;