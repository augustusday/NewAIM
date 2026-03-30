INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a1d83956-30b2-4c7e-9ed6-f73e54915633', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'adc0e324-03d0-4a2f-bd12-1f64b3855bca', 'Fabíola Cristina Naressi', '2025-01-24', '18:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f158da8a-2e78-4549-92f3-446631a91eca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7aabeb0d-e695-415c-9ceb-c481281170b3', 'Gael Gomes Moret', '2025-06-18', '18:30', '19:30', 'scheduled', 'Nova limpeza para manutenção da saúde', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('73b1a244-9617-4e27-9b74-0da640bc6837', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e28d7f0c-0144-45a3-bb8c-2380a14d636e', 'Luciana Aguiar', '2025-01-24', '11:30', '12:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('948dcaa1-5cc2-4efe-9858-120aa88ddd9d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7aabeb0d-e695-415c-9ceb-c481281170b3', 'Gael Gomes Moret', '2025-01-21', '19:00', '20:00', 'completed', 'Avaliação e limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a4dfdd9e-bb70-4721-9260-3fc3847d9e67', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-01-21', '11:30', '13:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('25863ad4-db72-4281-ba80-d8c633c1413b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-01-27', '18:00', '19:00', 'completed', 'Instalação do alinhador', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('834bbc2e-c706-446d-a9e7-8362dc7c20ca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2025-02-14', '12:00', '13:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3e71bbba-1ad5-45dd-98a2-bfef54f6635f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e3c443c2-f81c-4335-b34a-cdafeb13bf7e', 'Maria Cantalicia Martins', '2025-02-20', '15:45', '16:45', 'cancelled', 'Implante', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8094b845-1178-42b1-88a5-ac06e542e3fa', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-02-03', '12:00', '12:30', 'scheduled', 'remoção de pontos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('76276381-9955-4f92-b5b3-f42a0b50c090', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-02-04', '14:00', '15:00', 'cancelled', 'Moldagem para placa de bruxismo', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;