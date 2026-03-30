INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bc6ec605-2e01-4ac1-b3e4-822c633171d2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '969ef36b-e9b7-4513-830d-ed2610a7b4cd', 'Ramon Bonfanti', '2025-08-28', '20:00', '21:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('303b1dab-8a6f-446e-93ed-60126bd12abe', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '42f9c26f-7b14-4a93-b1ba-6e18cbd148c7', 'Olavo Henrique Uniseski', '2025-08-28', '18:30', '19:45', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8c3bd55e-4455-40d0-9550-704c55b2e3c5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-09-03', '12:00', '14:00', 'scheduled', 'avaliar fratura em 27', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f7ad0b7e-c865-4ffb-9f64-b84d0a1eacc6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-09-01', '21:00', '22:00', 'completed', 'Preparo + provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9d1c7dbf-8dc5-461d-9e59-a772b486845c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-09-11', '21:00', '22:00', 'scheduled', 'Começar as próteses', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0893af3a-8214-4df2-84b5-df41b0608555', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-09-11', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('58c16206-2b7b-4102-9c56-a447861460f9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-09-11', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('04ac3808-3a42-4f3c-8596-19cda0de11df', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '67ca0364-8c71-4aae-b79a-4a7a4417c286', 'Julia Bonfanti', '2024-10-30', '21:30', '22:50', 'scheduled', 'Restauração em incisivo e canino', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6ffa4241-5092-4ba0-878c-5cbc89888d4a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2024-10-31', '14:00', '14:30', 'scheduled', 'Observação da consulta | Retorno: 2024-11-30 14:00:00.566', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b793da04-9575-49b1-985a-88adf9e87b2e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2024-11-04', '21:00', '22:00', 'completed', 'Avaliação, limpeza e avaliar o refinamento do sorriso.', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;