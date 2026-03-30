INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2f2fb9c4-b5a7-4d5b-a14f-10aa65ab6dc0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2025-07-21', '20:00', '21:00', 'scheduled', 'Uma quinta limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a9ab62c5-8cab-44c0-b2ef-b6d0832014f8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-06-16', '18:45', '20:15', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('14c60be3-913b-41f1-be06-9d77f9f9c4b8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7b385cdf-df15-46f7-a2fd-b6fb52569a3c', 'Valdemar Bonfanti', '2025-06-20', '14:00', '15:30', 'scheduled', 'dente 16', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('72d9eaf0-204e-4442-9770-62cdfaa23423', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd70a9c1f-bd34-422a-9079-95a950bad776', 'Lúcia Coutinho', '2025-06-23', '21:30', '22:30', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7e704b95-75e2-4088-afc1-e2a7f095afa2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3571dcf2-89f6-4ea5-a34d-828b25f83756', 'Matheus Wesley Correia da Silva', '2025-06-24', '18:00', '19:00', 'cancelled', 'canal dente 25', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4d9fa8d5-0d55-4984-88c7-6bf46143cccb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-06-25', '18:00', '19:00', 'completed', 'entrega da placa de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('de4a1c06-fd66-4616-9488-ff76631337ae', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-07-02', '17:00', '18:00', 'scheduled', 'Entrega da contenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('29f141fd-bf3b-441c-86a7-82a151142718', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-09-22', '12:40', '14:40', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5bb36d74-9e71-4829-889b-a22be39c4182', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-07-09', '21:00', '22:30', 'completed', 'Restauração 46', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('aa07a45a-3321-4388-82e6-b3d6f09e4db4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-04-30', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;