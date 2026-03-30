INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d6876b23-1551-49ef-8fad-ee0d40da0985', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1761f823-1b51-4461-bb66-c0ed6636c302', 'Cauê Bittencourt', '2026-02-02', '20:30', '21:30', 'cancelled', 'Segunda limpe', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('91c7c1fc-4da9-461c-8e48-a92dd421d2f6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd43621ae-8c82-47b0-88f8-0170352be0c4', 'José Victor Amorim', '2025-12-17', '13:00', '14:00', 'scheduled', 'Terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b1bbf847-ba9c-4fa3-b34e-8ea52f483aed', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd43621ae-8c82-47b0-88f8-0170352be0c4', 'José Victor Amorim', '2026-01-21', '13:00', '14:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e75aa037-8b69-4de6-a83f-e96c41d1137d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd5da232b-a80a-46bf-992f-4868b12b057f', 'Juliana Karin Carneiro de Ramos', '2025-12-17', '19:30', '20:30', 'scheduled', 'Botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ef866418-bd5a-4c84-9985-7db6a684256c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'dd379edb-22ba-4de4-9b96-e87997849d4f', 'Solange Dias Grezele', '2025-12-22', '12:30', '13:30', 'cancelled', 'Avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f70ab7d0-38ce-4f5f-aa8b-3e2d1cb4155d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ebd42346-e7f9-4483-99dc-97de4214d23c', 'Raquel Kampf', '2025-12-18', '15:30', '16:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8eea668d-ab26-4372-afd6-9d0138ba0e34', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', 'Alcione Uniseski', '2025-12-22', '12:00', '12:15', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('35e9a432-7094-439c-9f3a-95a9a68272f5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f8be0aa9-5615-442e-8bf9-9dacfd76ae7d', 'perícia judicial', '2026-02-25', '19:30', '20:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('88b5d47a-d48d-4ebb-a3e6-129fa5ee34a5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-02-04', '20:00', '21:00', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('89c6081c-ae8f-4a7d-93d5-44affbf27f51', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd5da232b-a80a-46bf-992f-4868b12b057f', 'Juliana Karin Carneiro de Ramos', '2025-12-26', '13:45', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;