INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e30a4cf0-5450-4f36-b787-3a56a907be85', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1ae38cda-9094-4afd-b137-ab1cc3b44441', 'Rodrigo Dziedicz', '2026-03-20', '17:00', '18:30', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('46170de9-2315-4c0f-92c1-1c5f80cf4794', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2026-03-05', '12:00', '13:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('53cce46e-5896-4c61-bba1-e05d06853363', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2026-03-05', '18:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5ded3d13-7b59-4d98-8a97-f81be7ad5993', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e916e68-5fec-4d59-bd67-1924603810cf', 'Ana Luiza dos Santos', '2026-03-11', '21:15', '22:15', 'completed', 'clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bdb8908b-0084-419e-923d-5b1b62774329', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2026-03-18', '13:00', '14:00', 'scheduled', 'Entrega da placa', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('147155af-250d-4bb9-99d1-c6ca9d149ab8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-03-11', '18:00', '19:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('41238c11-3b3d-4526-b858-e48fc42b3c4e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2026-03-11', '11:45', '12:45', 'completed', 'ZELUS', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f215991f-b309-4079-b23e-10807de22c37', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-03-11', '19:30', '21:00', 'completed', 'terceira sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('37163647-b57d-4c23-b4e8-dd62cb49bdd7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', 'Amanda Padilha Marques', '2026-03-12', '13:00', '14:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a37aa5b1-a853-4b2c-b1da-395e1d5a6680', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-07-15', '14:00', '15:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;