INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6ccae4ce-2845-47f8-a3b6-7e5ee9a2cc2d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '33bdf4e4-cb8d-447c-b4e7-a3610e876b2f', 'Eric Araújo da Silva', '2026-03-25', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f2267be7-6da0-48d9-b4b3-d8fa844e3d3a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2026-03-26', '13:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7ff0281b-4451-4e09-a655-47961ac16d51', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e30d77a5-9999-4c48-814f-544f63ae7564', 'Pamela Souza Vieira', '2026-04-01', '20:00', '21:00', 'scheduled', 'limpeza e avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;