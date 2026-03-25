-- ============================================================
-- Zelus Demo Seed Data
-- Run this in the Supabase SQL Editor for project pwsjyuhbkpthhmorkzfn
-- ============================================================

-- Appointment types
INSERT INTO appointment_types (id, clinic_id, name, color, duration_minutes, active)
VALUES
  ('t0000001-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Consulta Geral', '#019A67', 30, true),
  ('t0000002-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Retorno', '#f59e0b', 20, true),
  ('t0000003-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Exame', '#6366f1', 45, true),
  ('t0000004-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Procedimento', '#e05555', 60, true),
  ('t0000005-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Avaliação', '#01c47f', 40, true)
ON CONFLICT (id) DO NOTHING;

-- Availability templates – Dr. Rafael (Mon–Fri 08–17, 30min slots)
INSERT INTO availability_templates (id, clinic_id, doctor_id, day_of_week, start_time, end_time, slot_duration_min, active)
VALUES
  ('av000001-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000001', 1, '08:00', '17:00', 30, true),
  ('av000002-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000001', 2, '08:00', '17:00', 30, true),
  ('av000003-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000001', 3, '08:00', '17:00', 30, true),
  ('av000004-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000001', 4, '08:00', '17:00', 30, true),
  ('av000005-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000001-0000-0000-0000-000000000001', 5, '08:00', '17:00', 30, true)
ON CONFLICT (id) DO NOTHING;

-- Availability templates – Dra. Camila (Mon–Wed 09–16, 45min slots)
INSERT INTO availability_templates (id, clinic_id, doctor_id, day_of_week, start_time, end_time, slot_duration_min, active)
VALUES
  ('av000006-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000002-0000-0000-0000-000000000001', 1, '09:00', '16:00', 45, true),
  ('av000007-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000002-0000-0000-0000-000000000001', 2, '09:00', '16:00', 45, true),
  ('av000008-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000002-0000-0000-0000-000000000001', 3, '09:00', '16:00', 45, true)
ON CONFLICT (id) DO NOTHING;

-- Availability templates – Dr. Bruno (Thu–Fri 08–14, 30min slots)
INSERT INTO availability_templates (id, clinic_id, doctor_id, day_of_week, start_time, end_time, slot_duration_min, active)
VALUES
  ('av000009-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000003-0000-0000-0000-000000000001', 4, '08:00', '14:00', 30, true),
  ('av000010-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'd0000003-0000-0000-0000-000000000001', 5, '08:00', '14:00', 30, true)
ON CONFLICT (id) DO NOTHING;

-- Contacts
INSERT INTO contacts (id, clinic_id, full_name, phone, email, status, tags, custom_fields, created_at, updated_at)
VALUES
  ('c0000001-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Ana Paula Ferreira',      '+55 11 99234-5678', 'ana.ferreira@email.com',     'patient',  ARRAY['vip'],           '{}', NOW()-INTERVAL'90 days', NOW()-INTERVAL'2 days'),
  ('c0000002-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Carlos Eduardo Santos',   '+55 11 98765-4321', 'carlos.santos@email.com',    'patient',  ARRAY[]::text[],        '{}', NOW()-INTERVAL'60 days', NOW()-INTERVAL'5 days'),
  ('c0000003-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Mariana Costa Lima',      '+55 21 97654-3210', 'mariana.lima@email.com',     'lead',     ARRAY['indicação'],     '{}', NOW()-INTERVAL'10 days', NOW()-INTERVAL'1 day'),
  ('c0000004-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Roberto Oliveira Neto',   '+55 11 96543-2109', 'roberto.oliveira@email.com', 'return',   ARRAY[]::text[],        '{}', NOW()-INTERVAL'120 days',NOW()-INTERVAL'30 days'),
  ('c0000005-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Fernanda Alves Souza',    '+55 21 95432-1098', 'fernanda.souza@email.com',   'patient',  ARRAY['plano_saude'],   '{}', NOW()-INTERVAL'45 days', NOW()-INTERVAL'3 days'),
  ('c0000006-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Paulo Henrique Batista',  '+55 11 94321-0987', 'paulo.batista@email.com',    'inactive', ARRAY[]::text[],        '{}', NOW()-INTERVAL'200 days',NOW()-INTERVAL'90 days'),
  ('c0000007-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Juliana Martins Silva',   '+55 11 93210-9876', 'juliana.martins@email.com',  'lead',     ARRAY['site'],          '{}', NOW()-INTERVAL'5 days',  NOW()-INTERVAL'5 days'),
  ('c0000008-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Diego Rezende Costa',     '+55 21 92109-8765', 'diego.rezende@email.com',    'patient',  ARRAY[]::text[],        '{}', NOW()-INTERVAL'75 days', NOW()-INTERVAL'7 days'),
  ('c0000009-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Beatriz Carvalho Melo',   '+55 11 91098-7654', 'beatriz.carvalho@email.com', 'return',   ARRAY['indicação'],     '{}', NOW()-INTERVAL'180 days',NOW()-INTERVAL'14 days'),
  ('c0000010-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Thiago Nascimento Pires', '+55 11 90987-6543', 'thiago.pires@email.com',     'lead',     ARRAY[]::text[],        '{}', NOW()-INTERVAL'2 days',  NOW()-INTERVAL'2 days')
ON CONFLICT (id) DO NOTHING;

-- Contact notes
INSERT INTO contact_notes (id, clinic_id, contact_id, body, created_at)
VALUES
  ('n0000001-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000001', 'Paciente relatou melhora significativa após o último tratamento. Recomendado retorno em 3 meses.', NOW()-INTERVAL'2 days'),
  ('n0000002-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'c0000001-0000-0000-0000-000000000001', 'Exames de sangue solicitados na última consulta. Aguardando resultados.', NOW()-INTERVAL'10 days'),
  ('n0000003-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'c0000002-0000-0000-0000-000000000001', 'Preferência por horários no período da tarde. Contato pelo WhatsApp.', NOW()-INTERVAL'5 days'),
  ('n0000004-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'c0000003-0000-0000-0000-000000000001', 'Lead chegou por indicação da Dra. Camila. Interessada em avaliação dermatológica.', NOW()-INTERVAL'1 day'),
  ('n0000005-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'c0000005-0000-0000-0000-000000000001', 'Plano de saúde: Unimed Premium. Verificar cobertura para procedimento.', NOW()-INTERVAL'3 days')
ON CONFLICT (id) DO NOTHING;

-- Today's appointments
INSERT INTO appointments (id, clinic_id, doctor_id, patient_name, patient_phone, contact_id, type_id, type_name_snapshot, scheduled_date, start_time, end_time, status, source, notes)
VALUES
  ('a1000001-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Ana Paula Ferreira',    '+55 11 99234-5678','c0000001-0000-0000-0000-000000000001','t0000001-0000-0000-0000-000000000001','Consulta Geral', CURRENT_DATE,'08:30','09:00','confirmed','manual',null),
  ('a1000002-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Carlos Eduardo Santos', '+55 11 98765-4321','c0000002-0000-0000-0000-000000000001','t0000002-0000-0000-0000-000000000001','Retorno',       CURRENT_DATE,'09:30','09:50','scheduled','manual',null),
  ('a1000003-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000002-0000-0000-0000-000000000001','Fernanda Alves Souza',  '+55 21 95432-1098','c0000005-0000-0000-0000-000000000001','t0000003-0000-0000-0000-000000000001','Exame',         CURRENT_DATE,'10:00','10:45','confirmed','manual','Exame de rotina anual'),
  ('a1000004-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Roberto Oliveira Neto', '+55 11 96543-2109','c0000004-0000-0000-0000-000000000001','t0000002-0000-0000-0000-000000000001','Retorno',       CURRENT_DATE,'11:00','11:20','scheduled','manual',null),
  ('a1000005-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000003-0000-0000-0000-000000000001','Diego Rezende Costa',   '+55 21 92109-8765','c0000008-0000-0000-0000-000000000001','t0000004-0000-0000-0000-000000000001','Procedimento',  CURRENT_DATE,'14:00','15:00','confirmed','manual','Procedimento ambulatorial'),
  ('a1000006-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000002-0000-0000-0000-000000000001','Beatriz Carvalho Melo', '+55 11 91098-7654','c0000009-0000-0000-0000-000000000001','t0000005-0000-0000-0000-000000000001','Avaliação',     CURRENT_DATE,'15:00','15:40','scheduled','whatsapp',null)
ON CONFLICT (id) DO NOTHING;

-- Past appointments (for history)
INSERT INTO appointments (id, clinic_id, doctor_id, patient_name, patient_phone, contact_id, type_id, type_name_snapshot, scheduled_date, start_time, end_time, status, source)
VALUES
  ('a2000001-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Ana Paula Ferreira',    '+55 11 99234-5678','c0000001-0000-0000-0000-000000000001','t0000001-0000-0000-0000-000000000001','Consulta Geral',CURRENT_DATE-30,'09:00','09:30','completed','manual'),
  ('a2000002-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Ana Paula Ferreira',    '+55 11 99234-5678','c0000001-0000-0000-0000-000000000001','t0000002-0000-0000-0000-000000000001','Retorno',       CURRENT_DATE-60,'10:00','10:20','completed','manual'),
  ('a2000003-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000002-0000-0000-0000-000000000001','Carlos Eduardo Santos', '+55 11 98765-4321','c0000002-0000-0000-0000-000000000001','t0000003-0000-0000-0000-000000000001','Exame',         CURRENT_DATE-45,'14:00','14:45','completed','manual'),
  ('a2000004-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Fernanda Alves Souza',  '+55 21 95432-1098','c0000005-0000-0000-0000-000000000001','t0000001-0000-0000-0000-000000000001','Consulta Geral',CURRENT_DATE-15,'09:30','10:00','completed','whatsapp'),
  ('a2000005-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Roberto Oliveira Neto', '+55 11 96543-2109','c0000004-0000-0000-0000-000000000001','t0000001-0000-0000-0000-000000000001','Consulta Geral',CURRENT_DATE-90,'11:00','11:30','completed','manual'),
  ('a2000006-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000003-0000-0000-0000-000000000001','Diego Rezende Costa',   '+55 21 92109-8765','c0000008-0000-0000-0000-000000000001','t0000004-0000-0000-0000-000000000001','Procedimento',  CURRENT_DATE-20,'13:00','14:00','completed','manual')
ON CONFLICT (id) DO NOTHING;

-- Tomorrow's appointments
INSERT INTO appointments (id, clinic_id, doctor_id, patient_name, patient_phone, contact_id, type_id, type_name_snapshot, scheduled_date, start_time, end_time, status, source)
VALUES
  ('a3000001-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Juliana Martins Silva',   '+55 11 93210-9876','c0000007-0000-0000-0000-000000000001','t0000005-0000-0000-0000-000000000001','Avaliação',     CURRENT_DATE+1,'09:00','09:40','scheduled','manual'),
  ('a3000002-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000002-0000-0000-0000-000000000001','Thiago Nascimento Pires', '+55 11 90987-6543','c0000010-0000-0000-0000-000000000001','t0000001-0000-0000-0000-000000000001','Consulta Geral',CURRENT_DATE+1,'10:00','10:30','scheduled','whatsapp'),
  ('a3000003-0000-0000-0000-000000000001','a0000000-0000-0000-0000-000000000001','d0000001-0000-0000-0000-000000000001','Beatriz Carvalho Melo',   '+55 11 91098-7654','c0000009-0000-0000-0000-000000000001','t0000002-0000-0000-0000-000000000001','Retorno',       CURRENT_DATE+1,'14:30','14:50','scheduled','manual')
ON CONFLICT (id) DO NOTHING;
