INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('af3d4fb3-0f3e-447e-9942-e470cec8b2b4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-11-26', '13:30', '14:30', 'cancelled', '36 ou 47', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9ee87c56-710f-4804-8165-e4a102babb5e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', 'Cauan Ribeiro Oliveira', '2024-12-03', '16:30', '18:30', 'scheduled', '21 + limpeza e avaliar o 47', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('38a57064-bec0-4fe7-b7f2-ae1ed7818c6b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6d78a343-ac08-4c3c-ae1c-d792d9fb0679', 'Bruna Sprea Carrijo', '2024-12-10', '16:30', '18:30', 'completed', 'Limpeza mais correção do botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7c4a121c-51d1-4445-8b3d-5086b4ae77bc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2025-01-27', '21:30', '22:30', 'scheduled', 'Terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1a14a6d4-6401-4759-8f97-4f38a07dba8f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2024-12-03', '21:30', '22:30', 'scheduled', '3 limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('311c2ed0-bf8a-4c70-865d-c09217221f98', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2024-11-22', '17:30', '19:00', 'scheduled', 'Ajuste de lasca em resina', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b75d2cd6-4dc5-4da8-9b10-a9263c36ba7c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3aeebec7-ce34-4832-9c05-64fd26aa0b3b', 'Cristiane Maria e Souza', '2024-11-22', '21:40', '22:40', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a707a4b7-f5ba-4aa6-9fd1-df2a60a1bc94', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3aeebec7-ce34-4832-9c05-64fd26aa0b3b', 'Cristiane Maria e Souza', '2024-11-22', '16:30', '17:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('652cfffa-3fee-461c-aabf-572a6a84f7ab', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2024-11-25', '16:30', '17:45', 'completed', 'Ajuste de cor, apresentação do valor dos alinhadores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f0637791-1746-45e9-adef-acb4378a9f9d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f290e416-e6d1-4ba6-b3ef-baa273472602', 'Samuel Patussi', '2024-12-20', '13:30', '15:00', 'completed', 'Restaurações do 13 e 13', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;