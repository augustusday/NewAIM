-- ============================================================
-- 1. CONTACTS (pacientes → contacts)
-- ============================================================
-- 202 pacientes encontrados

INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('1ae38cda-9094-4afd-b137-ab1cc3b44441', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rodrigo Dziedicz', '47996715964', NULL, '04389488902', '1991-08-02', 'male', 'active', NULL, '{"id_paciente_origem": "71161695", "numeroprontuario": "", "numeropaciente": "189"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('dd619242-6f83-4bf1-9b4e-57426a38d0ae', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Claudinei Pereira Peal', '41991427564', NULL, '10334795605', '1989-05-10', 'male', 'active', NULL, '{"id_paciente_origem": "54524587", "numeroprontuario": "", "numeropaciente": "23"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e10df8f6-5082-4b43-841f-163e041c3390', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Edelvita de Souza Lopes', '41996426393', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "65268910", "numeroprontuario": "", "numeropaciente": "144"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('998494b0-fb09-4886-acad-afe50338fa80', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Naiara Amorim', '41999359055', NULL, '04338205512', '1989-05-20', 'female', 'active', NULL, '{"id_paciente_origem": "65560410", "numeroprontuario": "", "numeropaciente": "145"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d43621ae-8c82-47b0-88f8-0170352be0c4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'José Victor Amorim', '41997135570', NULL, '04966431506', '1991-01-31', 'male', 'active', NULL, '{"id_paciente_origem": "65560414", "numeroprontuario": "", "numeropaciente": "146", "bairro": "Vila Izabel", "cep": "80320070", "cidade": "Curitiba", "endereco": "Rua Professor Sebastião Paraná", "uf": "PR", "complemento": "18"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('79d7c4d5-56f7-47da-8b6c-c68ea8d17246', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Patricia Lourenço da Silva', '41998465487', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "65747192", "numeroprontuario": "", "numeropaciente": "147"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('61813a3c-7407-4dd3-8e9a-2127be0f0490', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Julia Saad', '41991597919', NULL, '12083541910', '1999-11-04', 'female', 'active', NULL, '{"id_paciente_origem": "65828625", "numeroprontuario": "", "numeropaciente": "148", "bairro": "São Lourenço", "cep": "82200180", "cidade": "Curitiba", "endereco": "Rua Evaldo Wendler", "uf": "PR", "complemento": "casa 35"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('3983dfeb-8056-4694-897f-0cc35b43743d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Caroline Kerscher', '47991150935', NULL, '00603715958', '1982-02-17', 'female', 'active', NULL, '{"id_paciente_origem": "66178644", "numeroprontuario": "", "numeropaciente": "149", "bairro": "Progresso", "cep": "89281093", "cidade": "São Bento do Sul", "endereco": "Rua Elizabeth Bayerl", "uf": "SC", "complemento": "apto 52"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d90aad48-e084-446b-8297-1846acde64e1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Vó Antônia', '47999249345', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "66192446", "numeroprontuario": "", "numeropaciente": "150"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e6facbe7-e197-429e-af83-380eaf9654a6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Alanis Matzembacher', '47996452962', NULL, NULL, '1997-08-25', 'female', 'active', NULL, '{"id_paciente_origem": "66200880", "numeroprontuario": "", "numeropaciente": "151", "bairro": "Centro", "cep": "89280451", "cidade": "São Bento do Sul", "endereco": "Rua Professor Egon Hussmann", "uf": "SC", "complemento": "apto 24"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Alcione Uniseski', '47984777106', NULL, '00391518917', '1980-06-17', 'male', 'active', NULL, '{"id_paciente_origem": "66206888", "numeroprontuario": "", "numeropaciente": "152", "bairro": "Progresso", "cep": "89281252", "cidade": "São Bento do Sul", "endereco": "Rua Alvim Moreti", "uf": "SC"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Evaristo Miguel Blaskovski Junior', '47996629772', NULL, '03306702986', '1981-10-10', 'male', 'active', NULL, '{"id_paciente_origem": "66284372", "numeroprontuario": "", "numeropaciente": "153", "bairro": "Centenário", "cep": "89283192", "cidade": "São Bento do Sul", "endereco": "Rua Augusto Wunderwald", "uf": "SC", "complemento": "casa 83"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4da0b4ea-bd76-48dd-94ab-693e5f7cc3e1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Sidnei José Souza', '41997087293', NULL, '87597209991', '1973-05-25', 'male', 'active', NULL, '{"id_paciente_origem": "71510525", "numeroprontuario": "", "numeropaciente": "190", "rg": "62321709", "bairro": "São Dimas", "cep": "83411390", "cidade": "Colombo", "endereco": "Rua das Avencas", "uf": "PR", "complemento": "casa B"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('3571dcf2-89f6-4ea5-a34d-828b25f83756', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Matheus Wesley Correia da Silva', '41988542549', NULL, '11714466914', '1999-07-19', 'male', 'active', NULL, '{"id_paciente_origem": "54526071", "numeroprontuario": "", "numeropaciente": "30", "bairro": "Centro", "cep": "80410230", "cidade": "Curitiba", "endereco": "Rua Desembargador Ermelino de Leão", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4ddf8ded-3a53-4c0a-b0d9-e87cf1a81192', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rafaela Vieira', NULL, NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "66929867", "numeroprontuario": "", "numeropaciente": "155"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Renan Felipe Camargo', '41992642117', 'renanfcamargo@hotmail.com', NULL, '1996-06-24', 'male', 'active', NULL, '{"id_paciente_origem": "54399554", "numeroprontuario": "", "numeropaciente": "1", "rg": "130593852", "bairro": "Bigorrilho", "cep": "80730070", "cidade": "Curitiba", "endereco": "Alameda Júlia da Costa, 2448", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('67ca0364-8c71-4aae-b79a-4a7a4417c286', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Julia Bonfanti', '41998406165', 'drajuliabonfanti@gmail.com', '09692992900', '1999-08-25', 'female', 'active', NULL, '{"id_paciente_origem": "54399649", "numeroprontuario": "001", "numeropaciente": "2", "bairro": "Portão", "cep": "81070000", "cidade": "Curitiba", "endereco": "Rua João Bettega", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('1e4dde0f-6814-494d-b74d-96d654738039', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Mércia Mendonça Borges Paulino', '41984318020', 'paulinomercia@yahoo.com.br', '26896354372', '1966-03-16', 'female', 'active', NULL, '{"id_paciente_origem": "54434740", "numeroprontuario": "", "numeropaciente": "4", "bairro": "Mauá", "cep": "83413646", "cidade": "Colombo", "endereco": "Rua Antônio Silvério da Veiga, 490", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b4ab2ee8-3020-4788-9a19-a5221db66c04', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cristiano Correia Rebouças', '41996833033', 'cristiano4861@gmail.com', '06998995911', '1996-07-14', 'male', 'active', NULL, '{"id_paciente_origem": "54440519", "numeroprontuario": "", "numeropaciente": "5", "bairro": "Bigorrilho", "cep": "80730001", "cidade": "Curitiba", "endereco": "Rua Padre Anchieta, 2636, apto1203 A", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('62c6c756-46e0-4138-a451-a84f22c24775', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Israel Francisco Acunha de Vargas', '41992855792', NULL, '07372496500', '1994-03-04', 'male', 'active', NULL, '{"id_paciente_origem": "54527855", "numeroprontuario": "", "numeropaciente": "35", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Padre Anchieta, 2454", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('a91d2816-d10a-430a-a0c8-d141ee7746d5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Salete Aparecida dos Santos de Oliveira', '41997322504', NULL, NULL, '1976-01-30', 'female', 'active', NULL, '{"id_paciente_origem": "54523736", "numeroprontuario": "", "numeropaciente": "19", "rg": "67248473"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d07b416a-84c1-4639-8600-d1d2426c97e1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thaís Isabelle Martins', '41996335862', NULL, '11208480910', '1997-04-23', 'female', 'active', NULL, '{"id_paciente_origem": "54524431", "numeroprontuario": "", "numeropaciente": "22", "bairro": "Campina do Siqueira", "cep": "80740620", "cidade": "Curitiba", "endereco": "Rua Tito Calderari", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('92e5bc70-44f2-453a-b4bb-ab9464c465f8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Mylena Maria Milchesky', '15996593349', NULL, '07557218965', '2004-01-26', 'female', 'active', NULL, '{"id_paciente_origem": "54528870", "numeroprontuario": "", "numeropaciente": "39"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('77772554-ecd1-45b9-98d4-c4dfc4226388', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lucas Gonçalves Januário', '41988383057', NULL, '08962777983', '1994-10-08', 'male', 'active', NULL, '{"id_paciente_origem": "54523225", "numeroprontuario": "", "numeropaciente": "18", "bairro": "Biogorrilho", "cidade": "Curitiba", "endereco": "Mário Burigo, 39", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ef9abe37-1faa-43c4-82b6-960d3403d370', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Alice Oliveira Lima', '81993907996', NULL, NULL, '1996-10-31', NULL, 'active', NULL, '{"id_paciente_origem": "54527043", "numeroprontuario": "", "numeropaciente": "32", "rg": "9262789", "bairro": "Seminário", "cidade": "Curitiba", "endereco": "Antônio Rodrigues, 120", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('bcc82287-f376-4261-82f7-fe42f71a3009', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gerusa Ribeiro Conceição Oliveira', '41999998205', NULL, '01008660930', '1988-03-10', 'female', 'active', NULL, '{"id_paciente_origem": "54529590", "numeroprontuario": "", "numeropaciente": "45"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('0317a7d4-e362-4b21-8a3f-aa1262a133c5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Romena Macedo Ferro Costa', '41992294144', 'romenacosta@yahoo.com.br', '04954508983', '1984-02-07', 'female', 'active', NULL, '{"id_paciente_origem": "54525429", "numeroprontuario": "", "numeropaciente": "27", "cidade": "Curitiba", "endereco": "Coronel Joaquim Ignácio Taborda Ribas, 859", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('28d78055-d332-40c4-91a6-802809dc6944', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Henrique Rohneilt', '41987535353', NULL, '78120241991', '1970-02-27', 'male', 'active', NULL, '{"id_paciente_origem": "54529123", "numeroprontuario": "", "numeropaciente": "41", "cidade": "Curitiba", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9c580499-c111-46f4-94c7-df83d0f6d536', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Marlon Elizeu Wasen', '47997672257', NULL, '04595614993', '1984-11-21', 'male', 'active', NULL, '{"id_paciente_origem": "54528319", "numeroprontuario": "", "numeropaciente": "37", "bairro": "São José", "cidade": "Curitiba", "endereco": "Antonina, 556", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('f4eaa10e-a58b-4b8e-b492-277abd7b5b5e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Fernando Bianco da Costa', '41996771016', NULL, '08156243951', '1994-05-19', 'male', 'active', NULL, '{"id_paciente_origem": "54529539", "numeroprontuario": "", "numeropaciente": "44", "bairro": "Centro", "cidade": "Curitiba", "endereco": "Desembargador Motta, 1648", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d74230ec-e105-4795-9ff2-46b91a4bcafe', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Raul Afonso Monteiro de Castro', '41998474694', NULL, '08140741973', '1990-07-06', 'male', 'active', NULL, '{"id_paciente_origem": "54530125", "numeroprontuario": "", "numeropaciente": "50", "cidade": "Curitiba", "endereco": "Calixto Razoline, 310", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('856191f5-8367-43cc-bc39-a413baf8db05', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Shanti Oliveira Lima', NULL, NULL, NULL, '2012-09-13', 'female', 'active', NULL, '{"id_paciente_origem": "54529966", "numeroprontuario": "", "numeropaciente": "49", "rg": "159164", "bairro": "Seminário", "cidade": "Curitiba", "endereco": "Antônio Rodrigues, 120", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('70b5e785-9cbe-446e-9363-69976344424a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Sérgio Bonani', '18996136465', 'sergiobonani@gmail.com', '04070114122', '1992-05-20', 'male', 'active', NULL, '{"id_paciente_origem": "57472288", "numeroprontuario": "", "numeropaciente": "94", "rg": "202627", "bairro": "Bigorrilho", "cep": "80730001", "cidade": "Curitiba", "endereco": "Rua Padre Anchieta, 2204, 408", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('0456e372-4c9c-4fb4-af1b-2cbcbde45d81', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Felipe Barbosa de Oliveira', '11952755770', 'felipe.selecao@gmail.com', '34885937892', '1987-09-17', 'male', 'active', NULL, '{"id_paciente_origem": "54584167", "numeroprontuario": "", "numeropaciente": "53", "bairro": "Mossunguê", "cep": "81200100", "cidade": "Curitiba", "endereco": "Rua Professor Pedro Viriato Parigot de Souza", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('867dbf1d-49aa-4983-a74e-645a86deb407', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cristiano Alencar', '41991848118', NULL, '00513111190', '1984-03-17', 'male', 'active', NULL, '{"id_paciente_origem": "54525163", "numeroprontuario": "", "numeropaciente": "26", "cidade": "Curitiba", "endereco": "Luís Leitn", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('06e94d65-867a-4f07-934e-3431dac5e9bf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Anna Laura Rasi', '41984260166', NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "54440801", "numeroprontuario": "", "numeropaciente": "7"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9eee0fbd-2b61-4c85-a592-29f5dfe2ae5d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Daniela Ramos da Silva', '11974431297', NULL, NULL, '1977-04-26', 'female', 'active', NULL, '{"id_paciente_origem": "54440898", "numeroprontuario": "", "numeropaciente": "8", "rg": "285740453", "bairro": "Bigorrilho", "cep": "80730320", "cidade": "Curitiba", "endereco": "Rua Dona Alice Tibiriçá", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ebd42346-e7f9-4483-99dc-97de4214d23c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Raquel Kampf', '41996669480', NULL, '88780112900', '1972-12-13', 'female', 'active', NULL, '{"id_paciente_origem": "54529726", "numeroprontuario": "", "numeropaciente": "46"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('1f3011ca-679e-4cfa-be37-eda40d8957bf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Celia Melo', NULL, NULL, NULL, '1962-07-05', 'female', 'active', NULL, '{"id_paciente_origem": "54808702", "numeroprontuario": "", "numeropaciente": "57", "rg": "940.885.1", "bairro": "Bigorrilho", "cep": "80730001", "cidade": "Curitiba", "endereco": "Rua Padre Anchieta", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('2362e0e6-3c18-46b9-9cf6-94269583b681', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rada Vilsek', NULL, NULL, NULL, '1993-08-30', NULL, 'inactive', NULL, '{"id_paciente_origem": "54806399", "numeroprontuario": "", "numeropaciente": "56", "rg": "124493072", "cidade": "Campo largo", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('87a9aba8-7d0e-463d-8026-38637e3e425b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Kátia Gardenha Gomes de Oliveira', '41987895607', 'katia_gardenha@hotmail.com', '64447855291', '1979-08-14', 'female', 'active', NULL, '{"id_paciente_origem": "54847090", "numeroprontuario": "", "numeropaciente": "59", "rg": "133540", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Gastao Camara", "uf": "Parana"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ecf91d1b-5774-40e2-b5da-4d2b63e83cad', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cauan Ribeiro Oliveira', '41995977444', NULL, NULL, '2013-04-03', 'male', 'active', NULL, '{"id_paciente_origem": "54526461", "numeroprontuario": "", "numeropaciente": "31", "rg": "141.915.410", "cidade": "Curitiba", "endereco": "Soldado Alfredo Gonçalves, 147", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('cb336620-5a2d-4598-99b1-8f59cf765b32', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gabriella Cecília Candatten', '47996427585', NULL, NULL, '1999-06-28', 'female', 'active', NULL, '{"id_paciente_origem": "54529295", "numeroprontuario": "", "numeropaciente": "42", "cidade": "Curitiba", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e7aee980-901f-468f-bdd6-dd9db93c25d4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruna Pauluk', '41991921227', NULL, '08589060900', '1996-12-27', 'female', 'active', NULL, '{"id_paciente_origem": "54522008", "numeroprontuario": "", "numeropaciente": "12", "cidade": "Curitiba", "endereco": "Mosenhor Ivo São Lourence, 5170", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('70266a95-c517-4a62-aa63-9a6642fb4305', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Victor Gabriel Martire Sanches', NULL, NULL, NULL, '2019-03-14', 'male', 'active', NULL, '{"id_paciente_origem": "54928775", "numeroprontuario": "", "numeropaciente": "61"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9f3d2e91-6154-4903-ba0c-9f9433d2d819', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Victor Rusky', NULL, NULL, '04306178951', '1996-10-10', 'male', 'active', NULL, '{"id_paciente_origem": "54929548", "numeroprontuario": "", "numeropaciente": "62", "cidade": "Curitiba", "endereco": "Silva Jardim 1762", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ececa12a-7ebf-4741-8dc1-2da654c5762b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Éverton Santos Oliveira', '41998999978', NULL, NULL, '1986-03-21', 'male', 'active', NULL, '{"id_paciente_origem": "54525793", "numeroprontuario": "", "numeropaciente": "29", "cidade": "Curitiba", "endereco": "Soldado Alfredo Gonçalves", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e03385ee-a8bb-48f1-8e5d-912d8cb341b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Douglas Rafael de Souza Garcia', '47999912837', NULL, '12732627941', '2005-08-24', 'male', 'active', NULL, '{"id_paciente_origem": "54524879", "numeroprontuario": "", "numeropaciente": "25", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Padre Anchieta, 2690", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('08aed8d0-f25c-4470-ab83-e56dd78fc6fa', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Jessica da Silva Cavanha Sarubi Lobo', '67996293859', 'jessicacavanha1@gmail.com', '04792290155', '1996-01-06', 'female', 'active', NULL, '{"id_paciente_origem": "54527629", "numeroprontuario": "", "numeropaciente": "34", "bairro": "Vista alegre", "cidade": "Curitiba", "endereco": "Avenida Manoel Ribas", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('21b7eac8-6195-43cc-b6a3-e2ebfff555cd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Aline Hornning Frate', '15997708992', NULL, '04481129905', '1985-06-12', 'female', 'active', NULL, '{"id_paciente_origem": "54521759", "numeroprontuario": "", "numeropaciente": "11", "cidade": "Curitiba"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('55ffdef5-af94-4693-895c-352ef43c4139', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Camilly Joly Costa', '41996828538', NULL, '08679293911', '1989-09-19', 'female', 'active', NULL, '{"id_paciente_origem": "54527304", "numeroprontuario": "", "numeropaciente": "33", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Martim Afonso, 2425", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9c5c662c-fd50-4935-8bf2-0463f5558f74', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cássio Dalbem Barth', '41988495240', 'cassiobarth@gmail.com', '95774700097', '1979-12-31', 'male', 'active', NULL, '{"id_paciente_origem": "54522963", "numeroprontuario": "", "numeropaciente": "16", "cidade": "Estados Unidos", "endereco": "EUA 1454, 1102"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4083d3b1-f04f-45aa-ac60-f2352fb175ac', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Danielly Michelutti', '47997596502', NULL, NULL, '1986-03-16', 'female', 'active', NULL, '{"id_paciente_origem": "54524721", "numeroprontuario": "", "numeropaciente": "24", "rg": "4218140"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('3aeebec7-ce34-4832-9c05-64fd26aa0b3b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cristiane Maria e Souza', '41999282372', 'cris.souza@anchietaviagens.tur.br', '05764958911', NULL, 'female', 'active', NULL, '{"id_paciente_origem": "54971351", "numeroprontuario": "", "numeropaciente": "65", "rg": "89910889", "bairro": "Cidade Industrial", "cep": "81170120", "cidade": "Curitiba", "endereco": "Rua Hugo Miró, 451", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Fionn Francis Machugh', '272518176', 'fmachugh@hotmail.com', '01156202906', '1971-01-31', 'male', 'active', NULL, '{"id_paciente_origem": "55124873", "numeroprontuario": "", "numeropaciente": "69"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c2eb0b64-cb45-4a8a-8a3b-489d3ac494be', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Anne Martins Bittencourt', '272513419', 'annemarbitt@hotmail.com', '93884354000', '1977-05-04', 'female', 'active', NULL, '{"id_paciente_origem": "55124813", "numeroprontuario": "", "numeropaciente": "68"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('f430e5f9-62e4-4c37-adf8-71bfe166264e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thais Santa Rosa Santos', '24981132119', 'thaissrs@hotmail.com', '11211397793', '1988-02-11', 'female', 'active', NULL, '{"id_paciente_origem": "55296637", "numeroprontuario": "", "numeropaciente": "72", "bairro": "Bigorrilho", "cep": "80730380", "cidade": "Curitiba", "endereco": "Rua Bruno Filgueira, 2001, apto 231", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6dbe39bc-235e-4dbd-b69b-a7b753328a06', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Flávia Orlandine Capristo', '41998395558', 'flacapristo@yahoo.com.br', '04373586900', '1983-12-23', 'female', 'active', NULL, '{"id_paciente_origem": "55279038", "numeroprontuario": "", "numeropaciente": "71", "bairro": "Mossunguê", "cep": "81210000", "cidade": "Curitiba", "endereco": "Rua Monsenhor Ivo Zanlorenzi, 1233, ap 32", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('7ee21cd5-adfb-4bb4-9933-23c1601f7905', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Adriana Demeterco', '41999730060', NULL, '91088577920', NULL, 'female', 'active', NULL, '{"id_paciente_origem": "55456396", "numeroprontuario": "", "numeropaciente": "75"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b2739707-3ac6-4bfd-98ed-801826c50565', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Deividi', '41987160533', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "55455938", "numeroprontuario": "", "numeropaciente": "74"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6d78a343-ac08-4c3c-ae1c-d792d9fb0679', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruna Sprea Carrijo', '41997333333', 'brusprea@gmail.com', '08382031919', '1999-10-13', 'female', 'active', NULL, '{"id_paciente_origem": "55464641", "numeroprontuario": "", "numeropaciente": "76", "bairro": "Mercês", "cep": "80430110", "cidade": "Curitiba", "endereco": "Alameda Júlia da Costa, 753,apto 91", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('12d1dc10-faf8-471f-9d7b-e6e2f2322fcc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Benicio Bittencourt Machugh', NULL, NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "56266090", "numeroprontuario": "", "numeropaciente": "84"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('5c083b47-e02c-4948-8e0b-30b23ff5dda5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Benício Machugh', NULL, NULL, NULL, '2012-01-27', 'male', 'inactive', NULL, '{"id_paciente_origem": "56547832", "numeroprontuario": "", "numeropaciente": "85"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('31ee48c4-5967-4c3c-be06-2a5dd11c893a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Amanda Karen Costa de Araujo', '92991285500', NULL, '02202819207', '1994-09-27', 'female', 'active', NULL, '{"id_paciente_origem": "56607726", "numeroprontuario": "", "numeropaciente": "87"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('de12deac-03ab-4363-8122-46c9873a30b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lorenna Maia', '31975316705', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "56608535", "numeroprontuario": "", "numeropaciente": "88"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('73b01fa8-458c-493a-9a37-10f10530b25c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruna Bru', NULL, NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "56622858", "numeroprontuario": "", "numeropaciente": "89"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('aed06d4e-467c-45db-b1bc-c824f45db998', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Marcelo Boscolo Fonzaghi', '41991347696', 'marcelofonzaghi@gmail.com', '01912190966', '1976-05-11', 'male', 'active', NULL, '{"id_paciente_origem": "56704332", "numeroprontuario": "", "numeropaciente": "90", "rg": "46508955", "bairro": "Bigorrilho", "cep": "80730290", "cidade": "Curitiba", "endereco": "Rua Jerônimo Durski, 1411, apto 22", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e3c443c2-f81c-4335-b34a-cdafeb13bf7e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Maria Cantalicia Martins', '41988128986', NULL, '06115870682', '1942-05-10', 'female', 'active', NULL, '{"id_paciente_origem": "56604727", "numeroprontuario": "", "numeropaciente": "86", "bairro": "Seminário", "cep": "80740510", "cidade": "Curitiba", "endereco": "Rua Deputado Nilson Ribas, 591", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('adc0e324-03d0-4a2f-bd12-1f64b3855bca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Fabíola Cristina Naressi', '41997652387', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "56776010", "numeroprontuario": "", "numeropaciente": "91"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('7aabeb0d-e695-415c-9ceb-c481281170b3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gael Gomes Moret', '41999612344', NULL, '21954982771', '2019-12-07', 'male', 'active', NULL, '{"id_paciente_origem": "56805507", "numeroprontuario": "", "numeropaciente": "92", "bairro": "Santo Inácio", "cep": "82010000", "cidade": "Curitiba", "endereco": "Avenida Cândido Hartmann, 3530, ap 319", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e28d7f0c-0144-45a3-bb8c-2380a14d636e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Luciana Aguiar', '41988325531', NULL, '76592421991', '1971-12-09', 'female', 'active', NULL, '{"id_paciente_origem": "56808145", "numeroprontuario": "", "numeropaciente": "93"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9b4c082b-00c5-479b-99d1-401b1382a441', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gabriel Scrupa Lopes', '41998449898', 'gabrielscrupa@gmail.com', '11689690933', '2000-05-22', 'male', 'active', NULL, '{"id_paciente_origem": "71928292", "numeroprontuario": "", "numeropaciente": "191", "bairro": "Boqueirão", "cep": "81770360", "cidade": "Curitiba", "endereco": "Rua Reverendo Augusto Paes de Ávila", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9f024036-b223-48f2-b685-56bb1ed29e89', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rafael Walax', '69992369215', 'rafaelwalax9@gmail.com', NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "57575041", "numeroprontuario": "", "numeropaciente": "95", "rg": "1189337", "bairro": "Barra Funda", "cep": "01135020", "cidade": "São Paulo", "endereco": "Rua Cônego Vicente Miguel Marino, 179, apto 31A", "uf": "SP"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('7bf77835-1526-4196-88cd-9090a6434e59', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Leonardo Gabriel de Lima Prado', '41996563456', NULL, '09295507908', '1997-02-14', 'male', 'active', NULL, '{"id_paciente_origem": "54523089", "numeroprontuario": "", "numeropaciente": "17", "cidade": "Curitiba", "endereco": "Octávio Primo Stocchero, 41", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('74764bac-ce24-44c4-81b3-9a3a10ff49f4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thiago Zirondi de Abreu', '34988992001', 'thiagozirondi@gmail.com', '10680595678', '2002-07-19', 'male', 'active', NULL, '{"id_paciente_origem": "57767850", "numeroprontuario": "", "numeropaciente": "97", "bairro": "Campina do Siqueira", "cep": "80730090", "cidade": "Curitiba", "endereco": "Rua Ferdinando Darif, 620, apto 04", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4dfb2b9f-e0c8-4611-84e4-d38239beb089', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Tiago Marques', '41992791291', NULL, '11863247670', '1994-09-12', 'male', 'active', NULL, '{"id_paciente_origem": "57989650", "numeroprontuario": "", "numeropaciente": "99", "bairro": "Mossunguê", "cep": "81200100", "cidade": "Curitiba", "endereco": "Rua Professor Pedro Viriato Parigot de Souza, 1100, apto 502", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b9f19869-a48b-444a-8204-ae1d45c1d362', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Melani Silva Noivais', '41998492445', NULL, '11422827917', '1999-05-08', 'female', 'active', NULL, '{"id_paciente_origem": "58097867", "numeroprontuario": "", "numeropaciente": "100", "bairro": "Capão Raso", "cep": "81130020", "cidade": "Curitiba", "endereco": "Rua José Clementino Bettega, 120, apto 177 bloco yellow", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Elza Sofia Ott', '41999208461', NULL, '28748930997', '1954-11-30', 'female', 'active', NULL, '{"id_paciente_origem": "58354192", "numeroprontuario": "", "numeropaciente": "101", "bairro": "Bigorrilho", "cep": "80730080", "cidade": "Curitiba", "endereco": "Alameda Princesa Izabel, 2630, apto 33", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('5bf43453-eace-46bc-ab99-e01c9b85aea2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruno Leme da Conceição', NULL, NULL, NULL, NULL, 'male', 'inactive', NULL, '{"id_paciente_origem": "58581846", "numeroprontuario": "", "numeropaciente": "102"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Amanda Padilha Marques', '41999898260', 'amanda10.258marques@gmail.com', '01996534297', '2000-03-16', 'female', 'active', NULL, '{"id_paciente_origem": "71961751", "numeroprontuario": "", "numeropaciente": "192", "bairro": "Vila Izabel", "cep": "80320320", "cidade": "Curitiba", "endereco": "Rua Pedro Collere", "uf": "PR", "complemento": "apto 801"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('3ed700e8-0d0a-4118-af57-026524750418', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Samuel de Marqui Marques', NULL, NULL, NULL, '2025-04-30', 'male', 'active', NULL, '{"id_paciente_origem": "71961769", "numeroprontuario": "", "numeropaciente": "193"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6fa83595-8c88-42f4-be3f-0e251949bc9c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Marco Antônio de Freitas', '41999312268', NULL, NULL, '1967-11-06', 'male', 'active', NULL, '{"id_paciente_origem": "71977166", "numeroprontuario": "", "numeropaciente": "194"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d4116ae3-bc89-42ef-828d-28eb7f85d483', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Josephine Tannouri', '41999070841', NULL, '91484430930', '1957-04-15', 'female', 'active', NULL, '{"id_paciente_origem": "59118162", "numeroprontuario": "", "numeropaciente": "103"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('f290e416-e6d1-4ba6-b3ef-baa273472602', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Samuel Patussi', '44988063188', 'samupatussi@hotmail.com', NULL, '1996-07-31', 'male', 'active', NULL, '{"id_paciente_origem": "55124506", "numeroprontuario": "", "numeropaciente": "67", "bairro": "Bigorrilho", "cep": "80730001", "cidade": "Curitiba", "endereco": "Rua Padre Anchieta, 2454, ap 903", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('31359c08-5375-475f-bf57-b7a9c10c4410', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Giovanna Armacolo Andretta', '41999226141', NULL, '12078515906', '2006-07-24', 'female', 'active', NULL, '{"id_paciente_origem": "59567865", "numeroprontuario": "", "numeropaciente": "104"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('73b9563e-97bb-4975-b136-4a2985068ec5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Giulli Andretta', '41992165320', 'giu.andretta@hotmail.com', '09143660924', '2000-02-24', 'female', 'active', NULL, '{"id_paciente_origem": "59620264", "numeroprontuario": "", "numeropaciente": "105", "bairro": "Alto da Rua XV", "cep": "80045125", "cidade": "Curitiba", "endereco": "Rua XV de Novembro", "uf": "PR", "complemento": "14"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d5da232b-a80a-46bf-992f-4868b12b057f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Juliana Karin Carneiro de Ramos', '41987982418', 'julianakarin17@gmail.com', '09120258917', '2005-05-04', 'female', 'active', NULL, '{"id_paciente_origem": "59896946", "numeroprontuario": "", "numeropaciente": "107", "bairro": "Uberaba", "cep": "81570160", "cidade": "Curitiba", "endereco": "Rua Coronel José Carvalho de Oliveira", "uf": "PR", "complemento": "Sobrado 02"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4cf398df-1cda-4227-8dba-48c24c90ecb0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Miguel Ribeiro Oliveira', NULL, NULL, NULL, '2017-04-03', 'male', 'active', NULL, '{"id_paciente_origem": "59916037", "numeroprontuario": "", "numeropaciente": "108"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('8e1f5ca3-673e-4850-8ab3-41ed5b01213e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Alfredo Parodi Neto', '41999174494', 'alfredoparodi369@gmail.com', '56738048904', '1961-04-12', 'male', 'active', NULL, '{"id_paciente_origem": "59932373", "numeroprontuario": "", "numeropaciente": "109", "bairro": "Centro", "cep": "80020250", "cidade": "Curitiba", "endereco": "Rua Riachuelo", "uf": "PR", "complemento": "apto 412"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('317cc99b-403a-4bca-98d7-654511590c0a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Nataly Brenda Cieslinski', '41984324981', NULL, '11695444957', '2025-04-24', 'female', 'active', NULL, '{"id_paciente_origem": "60479632", "numeroprontuario": "", "numeropaciente": "110", "bairro": "Santo Antônio", "cep": "83020650", "cidade": "São José dos Pinhais", "endereco": "Rua Maria Max", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('661c1452-b95b-4087-9954-b4920884a36d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Helena Farias da Silva', '91984178075', 'hellfarias94@gmail.com', '01275266258', '1984-10-31', 'female', 'active', NULL, '{"id_paciente_origem": "61204807", "numeroprontuario": "", "numeropaciente": "112", "bairro": "Cajuru", "cep": "82930040", "cidade": "Curitiba", "endereco": "Rua Pedro Violani", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('df9c56f4-8854-48a0-ab6a-9deaf88b431e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cláudia Fernanda Barboza Girardon', '48988248614', 'girardonclaudia@gmail.com', '02877115011', '1992-11-08', 'female', 'active', NULL, '{"id_paciente_origem": "61731615", "numeroprontuario": "", "numeropaciente": "113"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('8326366a-4ad0-43a4-b7fb-27bcadcc0928', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Denilson Bonfanti', '41999249344', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "61774041", "numeroprontuario": "", "numeropaciente": "114"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d16be994-37a2-4efd-93a9-68eae6db8cce', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Luciana Martins de Souza Mache', '41988128986', NULL, '03551298920', '1982-10-03', 'female', 'active', NULL, '{"id_paciente_origem": "61805853", "numeroprontuario": "", "numeropaciente": "116", "bairro": "Seminário", "cep": "80740510", "cidade": "Curitiba", "endereco": "Rua Deputado Nilson Ribas", "uf": "PR", "complemento": "casa"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('7b385cdf-df15-46f7-a2fd-b6fb52569a3c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Valdemar Bonfanti', NULL, NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "61948794", "numeroprontuario": "", "numeropaciente": "117"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('969ef36b-e9b7-4513-830d-ed2610a7b4cd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Ramon Bonfanti', NULL, NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "61948799", "numeroprontuario": "", "numeropaciente": "118"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('66522905-8b81-47d2-b5bd-d0a3f677ba4a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruna de Oliveira', '41997302675', NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "61774090", "numeroprontuario": "", "numeropaciente": "115"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('479ccaa2-11ad-4db8-bda6-fa8b7e58386a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cassius Bonfanti', NULL, NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "62017143", "numeroprontuario": "", "numeropaciente": "120"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9147d424-d4a0-493a-a448-f7230c1c6437', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Sheila Maria kaspchak', '41999328931', NULL, '62637266953', '1967-04-02', 'female', 'active', NULL, '{"id_paciente_origem": "62371601", "numeroprontuario": "", "numeropaciente": "121"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('89e1ec75-976b-420f-84bb-ed6a50c37940', '30a89c67-7497-457f-a887-a56d1d721f6d', 'pedro cic', NULL, NULL, NULL, NULL, NULL, 'inactive', NULL, '{"id_paciente_origem": "62408893", "numeroprontuario": "", "numeropaciente": "122"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ebfa85aa-245b-421c-b809-ef5ca6544336', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Pedro Henrique Pio de Souza Pinto', '41992673213', NULL, '09205081973', '1992-06-29', 'male', 'active', NULL, '{"id_paciente_origem": "62457877", "numeroprontuario": "", "numeropaciente": "123"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('64995bb8-820f-4a27-b24d-359b87d8c6bc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lúcia de Medeiros Coutinho', '43999295620', NULL, '04842064943', '1999-06-16', 'female', 'active', NULL, '{"id_paciente_origem": "62460430", "numeroprontuario": "", "numeropaciente": "124", "bairro": "Centro", "cep": "80430160", "cidade": "Curitiba", "endereco": "Rua Saldanha Marinho", "uf": "PR", "complemento": "apto 21 torre 1"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c39ed232-c153-47f0-9964-f2b66e909271', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Matheus Susko', '41988727746', 'matheususko@gmail.com', '11940729920', '1999-10-16', 'male', 'active', NULL, '{"id_paciente_origem": "61969824", "numeroprontuario": "", "numeropaciente": "119"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('2e4cd49a-c974-424b-9d29-fc62d8284d85', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Celía de Fatima Susko', '41987117409', NULL, '40489019900', '1957-09-08', 'female', 'active', NULL, '{"id_paciente_origem": "62908742", "numeroprontuario": "", "numeropaciente": "126", "bairro": "Cidade Industrial", "cep": "81450026", "cidade": "Curitiba", "endereco": "Rua Irmgard Wagner de França", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('a1bf1cb5-63ce-4714-b182-8c3fe1369c74', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Neodir Maciel IOA', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "62956826", "numeroprontuario": "", "numeropaciente": "127"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('339d64a7-c351-4608-982b-c454b3d9da35', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Isabelle Vitória Kusma Pyerl', '41984164886', NULL, '13251469940', '2003-10-13', 'female', 'active', NULL, '{"id_paciente_origem": "63103823", "numeroprontuario": "", "numeropaciente": "130"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b8578ce5-7a78-4833-a06d-5f5a7270a1f4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rosemeri do Santos Ferreira', '41991695084', NULL, '06562509920', '1989-01-21', 'female', 'active', NULL, '{"id_paciente_origem": "63245177", "numeroprontuario": "", "numeropaciente": "131", "bairro": "Capela Velha", "cep": "83706000", "cidade": "Araucária", "endereco": "Rua Sônia Bodziak", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('84819211-94af-4341-9833-0e8fbe086421', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Adriana Luz de Castro Carneiro', '41988592800', NULL, '00496963007', '1984-12-31', 'female', 'active', NULL, '{"id_paciente_origem": "63531145", "numeroprontuario": "", "numeropaciente": "132", "bairro": "Rebouças", "cep": "80230050", "cidade": "Curitiba", "endereco": "Rua Brasílio Itiberê", "uf": "PR", "complemento": "apto 33 B"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6b8cf555-be3d-4543-97ad-81469c5b7a15', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Abner Emereciano da Silve', '41999102911', 'emerencianoabner@gmail.com', '12514371929', '2003-03-24', 'male', 'active', NULL, '{"id_paciente_origem": "63563203", "numeroprontuario": "", "numeropaciente": "133", "bairro": "Sítio Cercado", "cep": "81920080", "cidade": "Curitiba", "endereco": "Rua David Tows", "uf": "PR", "complemento": "Sobrado"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c17cf794-d778-4724-a5af-e0ab3eaae24d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Giovana Dubiginski', '41996663825', 'dubiginskigiovana@hotmail.com', '12224922965', '2006-02-11', 'female', 'active', NULL, '{"id_paciente_origem": "63566011", "numeroprontuario": "", "numeropaciente": "134", "bairro": "Capão Raso", "cep": "81150150", "cidade": "Curitiba", "endereco": "Rua Doutor Waldemiro Pereira", "uf": "PR", "complemento": "casa"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('82d36231-6824-45b9-94ab-f8522bb162b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Eliani Maxmiano', '47997427377', 'maxmianoeliane@gmail.com', '04696756912', '1986-01-02', 'female', 'active', NULL, '{"id_paciente_origem": "63601278", "numeroprontuario": "", "numeropaciente": "135", "bairro": "Centro", "cidade": "São Bento do Sul", "endereco": "Rua getulio vargas", "uf": "SC", "complemento": "casa"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c1f8fee3-062d-478d-80f9-385959c98e29', '30a89c67-7497-457f-a887-a56d1d721f6d', 'André Pereira da Silva', '41995086378', NULL, '08469798960', '1996-05-07', 'male', 'active', NULL, '{"id_paciente_origem": "63616480", "numeroprontuario": "", "numeropaciente": "136", "bairro": "Santo Antônio", "cep": "83025318", "cidade": "São José dos Pinhais", "endereco": "Rua Terezinha Venancio", "uf": "PR", "complemento": "bloco 58 ap 302"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c81d4301-d1cb-4352-9614-42d2696cd165', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Elivelton de Faria Santana', '41998153398', NULL, '09628623982', '1995-11-20', 'male', 'active', 'Cirurgia', '{"id_paciente_origem": "62481518", "numeroprontuario": "", "numeropaciente": "125", "cidade": "Itaperuçu", "endereco": "Av. Industrial", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('d70a9c1f-bd34-422a-9079-95a950bad776', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lúcia Coutinho', '43999295620', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "60803279", "numeroprontuario": "", "numeropaciente": "111"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('19b5ede7-9a9b-482f-8357-503d9bd22f02', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thiago Vinicius Lopes de Moraes', '27999992999', 'thgdemor@gmail.com', '05872541732', '1988-02-01', 'male', 'active', NULL, '{"id_paciente_origem": "63047023", "numeroprontuario": "", "numeropaciente": "129", "bairro": "Boa Vista", "cep": "82560480", "cidade": "Curitiba", "endereco": "Rua Alberto Potier", "uf": "PR", "complemento": "apto 906"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('48444d61-53e5-4d33-a400-d7c175839294', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Andre Castrianni', '41987272632', NULL, '07329159964', '1992-04-16', 'male', 'active', NULL, '{"id_paciente_origem": "64344685", "numeroprontuario": "", "numeropaciente": "137", "bairro": "Mossunguê", "cep": "81200110", "cidade": "Curitiba", "endereco": "Rua Deputado Heitor Alencar Furtado", "uf": "PR", "complemento": "apto 1104 bloco A"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('aae9a5b0-c99e-412e-b319-0fbc9d1d7c19', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Allan dos Santos Gonçalves', '41999843198', NULL, '07282341907', '1990-12-08', 'male', 'active', NULL, '{"id_paciente_origem": "64412254", "numeroprontuario": "", "numeropaciente": "138", "bairro": "Cidade Industrial", "cep": "81170040", "cidade": "Curitiba", "endereco": "Rua Sebastião Scolaro. - 32", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ef9505a4-2278-4337-b77d-e5c3e34d00d1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Naira', NULL, NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "64456564", "numeroprontuario": "", "numeropaciente": "140"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b98c7e22-2e16-402b-8bc1-bbd48c31e561', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Joyce Amanda Barbosa', '41991914717', NULL, '05575888983', '1987-06-10', 'female', 'active', NULL, '{"id_paciente_origem": "64432661", "numeroprontuario": "", "numeropaciente": "139", "bairro": "Portão", "cep": "80610001", "cidade": "Curitiba", "endereco": "Rua Maranhão", "uf": "PR", "complemento": "1304 apto"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ff582bde-36f0-46a4-990b-ac14e22dcb5d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Maria Paula S C Oliveira', '41998947810', NULL, '62215850582', '1971-07-10', 'female', 'active', NULL, '{"id_paciente_origem": "64588399", "numeroprontuario": "", "numeropaciente": "141"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ec07e624-5568-4066-b901-1d4df9727744', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gilmar Dias Feliciano de Oliveira', '41988924397', NULL, '51904551572', '1969-09-08', 'male', 'active', NULL, '{"id_paciente_origem": "64588450", "numeroprontuario": "", "numeropaciente": "142"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('42f9c26f-7b14-4a93-b1ba-6e18cbd148c7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Olavo Henrique Uniseski', '47997100046', NULL, '08871214978', NULL, 'male', 'active', NULL, '{"id_paciente_origem": "64690262", "numeroprontuario": "", "numeropaciente": "143", "bairro": "Progresso", "cep": "89281252", "cidade": "São Bento do Sul", "endereco": "Rua Alvim Moreti, 387", "uf": "SC"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('f76f1eee-aab3-4026-b1bd-60428cf85ce1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rose Eickhoff', NULL, NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "66959139", "numeroprontuario": "", "numeropaciente": "156"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('32a577db-8974-4752-959c-c876d2d72163', '30a89c67-7497-457f-a887-a56d1d721f6d', 'REUNIÃO MKT', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "67145441", "numeroprontuario": "", "numeropaciente": "157"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('560be938-7906-4c3a-9e00-072c38340dde', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Jorge Barouk jr', '47991001000', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "66767962", "numeroprontuario": "", "numeropaciente": "154"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('7deadc27-488c-41f7-8d9f-9b37736f8b78', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Oldemar Antonio Brighente', '41992212819', 'odemarbriga@gmail.com', '05661781920', '1948-07-23', 'male', 'active', NULL, '{"id_paciente_origem": "67433680", "numeroprontuario": "", "numeropaciente": "158", "bairro": "Portão", "cep": "81070160", "cidade": "Curitiba", "endereco": "Rua João Borsato", "uf": "PR", "complemento": "casa"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c64e15b2-fedb-435a-90cc-f433d3b647b0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Giovanna Gonzales Dalmora', '41992640023', 'giovannadalmora00@gmail.com', '08483688948', '1999-08-28', 'female', 'active', NULL, '{"id_paciente_origem": "59645778", "numeroprontuario": "", "numeropaciente": "106", "rg": "126656912", "bairro": "Juvevê", "cep": "80030001", "cidade": "Curitiba", "endereco": "Avenida João Gualberto", "uf": "PR", "complemento": "apro 1001"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('cd898351-8afa-4038-a1d0-7f57c6182240', '30a89c67-7497-457f-a887-a56d1d721f6d', 'unhas e sombrancelho', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "67468733", "numeroprontuario": "", "numeropaciente": "159"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c6d60903-c3ee-4dbf-a1e9-b90fbd3ed91a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rosiéli Raymundo Plaster', '27997741299', 'rosi9925@hotmail.com', '12976787700', '1990-06-24', 'female', 'active', NULL, '{"id_paciente_origem": "67616392", "numeroprontuario": "", "numeropaciente": "160", "bairro": "Cruzeiro", "cep": "83570000", "cidade": "Cerro Azul", "endereco": "Rua Júlia da Costa", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('07ebb0a5-b88d-495d-a208-aec6f773ab6d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Paola Borges Fajardo', '47999378200', 'paolaborgesfajardo@gmail.com', '04397990905', '2000-02-13', 'female', 'active', NULL, '{"id_paciente_origem": "67616737", "numeroprontuario": "", "numeropaciente": "161", "bairro": "Zona Industrial Norte", "cep": "89219710", "cidade": "Joinville", "endereco": "Rua Paulo Malschitzki", "uf": "SC", "complemento": "apto 105"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('5187bcf1-8726-4cad-b287-d707d8702dee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Giovanna Gonzales Dalmora', '41992640023', 'giovannadalmora00@gmail.com', '08483688948', '1999-08-28', 'female', 'inactive', NULL, '{"id_paciente_origem": "55779287", "numeroprontuario": "", "numeropaciente": "80", "bairro": "Juvevê", "cep": "80030001", "cidade": "Curitiba", "endereco": "Avenida João Gualberto, 2000, apto 1001", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('92a87080-6802-4569-beec-3cc2bf304f4a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Luciano Favilla Bastos', '41988118886', 'belgrado@gmail.com', '05138853740', '1982-01-12', 'male', 'active', NULL, '{"id_paciente_origem": "67797355", "numeroprontuario": "", "numeropaciente": "162", "bairro": "Bigorrilho", "cep": "80730030", "cidade": "Curitiba", "endereco": "Rua Martim Afonso", "uf": "PR", "complemento": "apto 44"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('81aa26ae-ee03-43bb-a583-902db2ab0b92', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Tatiane Armacolo', '41987159560', NULL, '02828736946', '1980-01-17', 'female', 'active', NULL, '{"id_paciente_origem": "54594005", "numeroprontuario": "", "numeropaciente": "54", "rg": "66247589", "bairro": "Seminário", "cep": "80240330", "cidade": "Curitiba", "endereco": "Rua Lindolfo Pessoa, 179", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('660e1073-20af-4942-8262-7383cf1b3a61', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Flávia Dalbem Barth', '41996906106', NULL, '16902688087', '1950-12-19', 'female', 'active', NULL, '{"id_paciente_origem": "54524108", "numeroprontuario": "", "numeropaciente": "21", "cidade": "Estados Unidos", "endereco": "EUA 1454, 1102"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('5aec8e64-ee48-4c22-a8b3-cdafebf200a9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Dinah', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "68142284", "numeroprontuario": "", "numeropaciente": "163"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('0ab9f064-4ba4-4603-8a91-15622bbe7e17', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Maritza Muniz dos Santos', '41996305507', NULL, NULL, '1988-04-05', 'female', 'active', NULL, '{"id_paciente_origem": "54523954", "numeroprontuario": "", "numeropaciente": "20", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Martim Afonso, 301", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6f362ff1-4d4c-4d6a-b3bf-41d62a33d258', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Simone Denise Bianco', '47984562280', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "68228686", "numeroprontuario": "", "numeropaciente": "164"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('31357e7b-267f-4f2d-a795-4e41899dc040', '30a89c67-7497-457f-a887-a56d1d721f6d', 'podologia Silmara', NULL, NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "68254193", "numeroprontuario": "", "numeropaciente": "165"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('0cd5b5dd-2c41-476f-8d68-9fefee581fe4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'unha do pé Jana', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "68254313", "numeroprontuario": "", "numeropaciente": "166"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('bb9e4474-cf4e-458b-aa03-1b14b3d79c94', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thayane Camargo Porcel', '41988408686', 'camargathayane@outlook.com', '40532206886', '1996-03-30', 'female', 'active', NULL, '{"id_paciente_origem": "54978679", "numeroprontuario": "", "numeropaciente": "66", "rg": "40532206886", "bairro": "Vila Izabel", "cep": "80320270", "cidade": "Curitiba", "endereco": "Rua Parintins, 972, apto 31B", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('a1f7ee50-addb-4ee2-bdae-25e7e34e7005', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Ana Bertina Correa da Silva', '21989186006', NULL, '29665841220', '1971-09-24', 'female', 'active', NULL, '{"id_paciente_origem": "54522753", "numeroprontuario": "", "numeropaciente": "15", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Padre Anchieta, 2454", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('479d339e-80e4-4930-8e02-708629653d80', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruna Beatriz Nunes', NULL, NULL, NULL, '1996-08-20', 'female', 'active', NULL, '{"id_paciente_origem": "54522291", "numeroprontuario": "", "numeropaciente": "13", "rg": "19350138"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6cd890d6-ab9e-4c46-b46d-49de6f90e4b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Mariana Miguel Presidente', '41999709496', 'mari.presidente@gmail.com', '07659401912', '1989-08-08', 'female', 'active', NULL, '{"id_paciente_origem": "54937138", "numeroprontuario": "", "numeropaciente": "63", "bairro": "Portão", "cep": "81070000", "cidade": "Curitiba", "endereco": "Rua João Bettega,644", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('af84440e-9f9c-4117-82a6-f25614565983', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Yasmin Jansen Hanysz', '47999636568', NULL, '08261441954', '2004-09-09', 'female', 'active', NULL, '{"id_paciente_origem": "68509702", "numeroprontuario": "", "numeropaciente": "167", "bairro": "Centro", "cep": "89280502", "cidade": "São Bento do Sul", "endereco": "Rua Eugenio Fuckner", "uf": "SC", "complemento": "casa"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ab0d8504-dae1-4a15-92c2-87d43f855277', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Djenifer Lilian Prestes', '47999918855', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "68539531", "numeroprontuario": "", "numeropaciente": "168"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e416c02e-a859-4b50-8ab2-8e94e49c4c5e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rada Vilsek', '41992772741', NULL, NULL, '1993-08-30', 'female', 'active', NULL, '{"id_paciente_origem": "54529777", "numeroprontuario": "", "numeropaciente": "47", "rg": "114493072"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b7b1ca75-e35d-46ad-aefd-f6f21e0ad7ca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Giovanna Rohnelt', '41992513230', NULL, '08175746971', '2001-12-18', 'female', 'active', NULL, '{"id_paciente_origem": "54529404", "numeroprontuario": "", "numeropaciente": "43", "bairro": "Vista Alegre", "cidade": "Curitiba", "endereco": "Amapa, 161", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e17fd542-482c-47f9-8244-43b13b079825', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Mariana Reichmann', '42988622992', NULL, '07862902939', '1995-12-21', 'female', 'active', NULL, '{"id_paciente_origem": "54783414", "numeroprontuario": "", "numeropaciente": "55", "rg": "109307351", "bairro": "Bigorrilho", "cep": "80730001", "cidade": "Curitiba", "endereco": "Rua Padre Anchieta", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('c29d267c-5cd8-4d08-8f05-a70ed2ab08d3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruno Woicik Rodrigues', '41995982235', NULL, '06148734958', '1998-06-03', 'male', 'active', NULL, '{"id_paciente_origem": "54522477", "numeroprontuario": "", "numeropaciente": "14"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4d84bd70-53ff-4cf7-ac12-03ab33e64c94', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Roberta Yukie Hasegawa', '41998221400', NULL, '08482421905', '1993-06-09', 'female', 'active', NULL, '{"id_paciente_origem": "54529843", "numeroprontuario": "", "numeropaciente": "48", "bairro": "Centro", "cidade": "Curitiba", "endereco": "Desembargador Motta, 1648", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4a1150e2-250a-447a-907f-b38ef20bd546', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rafaela Kozlovski Cassu', '41998206498', 'rcassu@hotmail.com', '07022647925', '1992-06-11', 'female', 'active', NULL, '{"id_paciente_origem": "54937146", "numeroprontuario": "", "numeropaciente": "64", "bairro": "Guaíra", "cep": "81010030", "cidade": "Curitiba", "endereco": "Rua Alexandre Salata, 12", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b36c4474-79a9-4cf3-a3ec-510d689fc6ce', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rogério Voichiski Paiva', '41999355897', NULL, '08211197960', '1989-04-02', 'male', 'active', NULL, '{"id_paciente_origem": "54530215", "numeroprontuario": "", "numeropaciente": "51", "cidade": "Curitiba", "endereco": "Ezsltino Dias Ferras, 51", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e06161b2-207e-406b-99ab-4af1bb3eee1d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Leticia Pailo', '910407992', 'leticiapailo22@gmail.com', '09126351935', '1999-06-22', 'female', 'active', NULL, '{"id_paciente_origem": "68625924", "numeroprontuario": "", "numeropaciente": "169"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('8033f705-f288-48c3-b3ab-f23919147316', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Ronei Sachs', '41999174751', 'roneisachs@gmail.com', NULL, '1981-06-16', 'male', 'inactive', NULL, '{"id_paciente_origem": "68800852", "numeroprontuario": "", "numeropaciente": "170"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('707a38bd-54f2-4c2a-a3d9-6d6feae689c7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Priscila Lobemeyer', '47996243808', NULL, NULL, NULL, 'female', 'inactive', NULL, '{"id_paciente_origem": "68826874", "numeroprontuario": "", "numeropaciente": "172"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4e81f2c6-a92a-4a3d-8c0e-17600a61a6a8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Priscila Lobemeyer', '47996243808', 'pri.sbs2008@gmail.com', '07552708948', '1990-10-31', 'female', 'active', 'numero 234', '{"id_paciente_origem": "68826851", "numeroprontuario": "", "numeropaciente": "171", "bairro": "Rio Negro", "cep": "89287115", "cidade": "São Bento do Sul", "endereco": "Rua Alexandre Frankemberger", "uf": "SC"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6f149b9f-26c3-40f2-b718-11ce50f77e4f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Reunião ONLINE', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "68861464", "numeroprontuario": "", "numeropaciente": "174"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('77e6d0fd-c67d-48bb-b0c1-0902da5807db', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Josiane Tannouri Armacolo', '41992030330', NULL, NULL, '1978-11-01', 'female', 'active', NULL, '{"id_paciente_origem": "54528994", "numeroprontuario": "", "numeropaciente": "40", "rg": "72400488"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('bd5e73b6-4802-4fb6-95d0-08f1ba97a492', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Estela Bonfanti', NULL, NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "68861391", "numeroprontuario": "", "numeropaciente": "173"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('731093fd-45cb-42df-8ae4-a57e4308a523', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thamires Soares Figueiredo', '41992909698', 'thamiressf7@gmail.com', '07243296920', '1992-04-07', 'female', 'active', NULL, '{"id_paciente_origem": "54827686", "numeroprontuario": "", "numeropaciente": "58", "bairro": "Guaíra", "cep": "80630050", "cidade": "Curitiba", "endereco": "Rua Alagoas, 2515", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('436e6f97-a149-402b-96c6-42eddfcf5646', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Luís Gustavo Eickhoff', '41998422828', 'luisctba@hotmail.com', '02323195964', '1977-08-10', 'male', 'active', NULL, '{"id_paciente_origem": "54434710", "numeroprontuario": "", "numeropaciente": "3", "bairro": "Bigorrilho", "cep": "80730070", "cidade": "Curitiba", "endereco": "Alameda Júlia da Costa, 2448", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e84ecb55-50fa-497f-9313-2492fa9c9c60', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gabriela Silva Prado', '44998782247', NULL, '09580543984', '1993-11-23', 'female', 'active', NULL, '{"id_paciente_origem": "68983749", "numeroprontuario": "", "numeropaciente": "175", "bairro": "São Braz", "cep": "82315000", "cidade": "Curitiba", "endereco": "Rua Ângelo Massignan", "uf": "PR", "complemento": "bloco 06 apto 31"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('1cd22015-cb1b-4555-9cbb-f6e066d79205', '30a89c67-7497-457f-a887-a56d1d721f6d', 'José Carlos Inês', '41999152232', NULL, '80150837968', '1971-08-01', 'male', 'active', NULL, '{"id_paciente_origem": "69112701", "numeroprontuario": "", "numeropaciente": "176", "bairro": "Sítio Cercado", "cep": "81925230", "cidade": "Curitiba", "endereco": "Rua Luiz Gurgel do Amaral Valente", "uf": "PR", "complemento": "bloc 03 apto 404"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('1761f823-1b51-4461-bb66-c0ed6636c302', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Cauê Bittencourt', '41991063462', 'cauee_b@hotmail.com', '07791118939', '1988-10-10', 'male', 'active', NULL, '{"id_paciente_origem": "69153006", "numeroprontuario": "", "numeropaciente": "177", "bairro": "Centro", "cep": "80060050", "cidade": "Curitiba", "endereco": "Rua Nilo Cairo", "uf": "PR", "complemento": "1104"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('622a582d-4019-4358-a8ed-17be22988625', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Bruna Lutz Ferber Pereira', '41992895505', 'brunalutzz7@gmail.com', '06366596581', '1994-11-10', 'female', 'active', NULL, '{"id_paciente_origem": "54440547", "numeroprontuario": "", "numeropaciente": "6", "bairro": "Bigorrilho", "cep": "80710370", "cidade": "Curitiba", "endereco": "Rua Otelo Queirolo, 39", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('0362a595-189d-4403-85d1-053861a7c74c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Roberto Quintana', '41999777882', 'fisioquintana@gmail.com', '54420750944', '1964-10-05', 'male', 'active', NULL, '{"id_paciente_origem": "55825703", "numeroprontuario": "", "numeropaciente": "81", "bairro": "São Francisco", "cep": "80510090", "cidade": "Curitiba", "endereco": "Rua Desembargador Vieira Cavalcanti, 833", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('cdee6000-3f7b-4e90-9db3-a38c01e4ebbc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lisa Isabella Fischer', '47984212244', NULL, '10988929929', '1998-09-24', 'female', 'active', NULL, '{"id_paciente_origem": "54528420", "numeroprontuario": "", "numeropaciente": "38", "cidade": "Curitiba", "endereco": "Visconde de Guarapuava, 3806", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('f8be0aa9-5615-442e-8bf9-9dacfd76ae7d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'perícia judicial', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "69210426", "numeroprontuario": "", "numeropaciente": "179"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('dd379edb-22ba-4de4-9b96-e87997849d4f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Solange Dias Grezele', '47996298338', NULL, '00341043990', NULL, 'female', 'active', NULL, '{"id_paciente_origem": "69205425", "numeroprontuario": "", "numeropaciente": "178"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b00c905d-700e-4da6-b9e7-58c1372c9836', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Fernanda Castro', '41991050842', NULL, '03671354933', '1981-11-22', 'female', 'active', NULL, '{"id_paciente_origem": "69212528", "numeroprontuario": "", "numeropaciente": "180", "bairro": "Loteamento Montparnasse", "cep": "83508180", "cidade": "Almirante Tamandaré", "endereco": "Rua das Andorinhas", "uf": "PR", "complemento": "casa"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('ddc4d99d-6e9a-4244-b9ff-eda9a20fa9bc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Mayara Adam', '41999087026', NULL, '11940497965', '2000-12-12', 'female', 'active', NULL, '{"id_paciente_origem": "69243645", "numeroprontuario": "", "numeropaciente": "181", "bairro": "Portão", "cep": "81070000", "cidade": "Curitiba", "endereco": "Rua João Bettega", "uf": "PR", "complemento": "304"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('6b02133d-82f2-4805-83ad-f4cbe277fcc1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Daniele Giovanelli Jorge', '41999163475', 'dany_dany_g@hotmail.com', '06625548928', '1989-01-27', 'female', 'active', NULL, '{"id_paciente_origem": "55888754", "numeroprontuario": "", "numeropaciente": "82", "bairro": "Cristo Rei", "cep": "80050380", "cidade": "Curitiba", "endereco": "Rua Sanito Rocha, 225, apto 1601", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('348541b4-f655-406b-9b20-e229be3a9155', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Aline Spricigo Mesquita', '41991922465', 'spricigoaline@gmail.com', '11704965985', NULL, 'female', 'active', NULL, '{"id_paciente_origem": "55159463", "numeroprontuario": "", "numeropaciente": "70", "bairro": "Mercês", "cep": "80810070", "cidade": "Curitiba", "endereco": "Rua Solimões, 1487", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('000b97eb-e244-4d41-a648-ae55a95f8e9f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Marines Brito', '41999623229', NULL, NULL, '1970-10-04', 'female', 'active', NULL, '{"id_paciente_origem": "54525580", "numeroprontuario": "", "numeropaciente": "28", "rg": "46193458", "bairro": "Bigorrilho", "cidade": "Curitiba", "endereco": "Martim Afonso, 1801", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9e7be956-a04c-480d-9a14-204457236b6c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Priscila Bertholdo', '41988480082', 'pbertholdo@hotmail.com', '03615095960', '1982-03-25', 'female', 'active', NULL, '{"id_paciente_origem": "55609143", "numeroprontuario": "", "numeropaciente": "78", "bairro": "Batel", "cep": "80240000", "cidade": "Curitiba", "endereco": "Avenida Sete de Setembro, 5170, ap 201", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('01ac73a4-bbda-43c2-9a10-16e634244aa8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Daniel Godoy', '41996760009', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "72536754", "numeroprontuario": "", "numeropaciente": "196"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('608e06f2-4047-466d-8fef-14215606c72e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Floriano José Guerios', '41997724567', NULL, '07690835953', '1952-07-10', 'male', 'active', NULL, '{"id_paciente_origem": "56110882", "numeroprontuario": "", "numeropaciente": "83", "bairro": "Bigorrilho", "cep": "80730380", "cidade": "Curitiba", "endereco": "Rua Bruno Filgueira, 2045", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('22198903-8a6f-42b3-81c5-1c77807a7241', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rafaella Reinhold', '41984061506', 'rafareinhold00@gmail.com', '10897643917', '2000-03-19', 'female', 'active', NULL, '{"id_paciente_origem": "72536723", "numeroprontuario": "", "numeropaciente": "195", "bairro": "Campo Comprido", "cep": "81200525", "cidade": "Curitiba", "endereco": "Rua Rosa Kaint Nadolny", "uf": "PR", "complemento": "apto 201 - bloco 01"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('2e916e68-5fec-4d59-bd67-1924603810cf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Ana Luiza dos Santos', '55981110722', 'analuiza1508@hotmail.com', '00730387925', '1978-08-15', 'female', 'active', NULL, '{"id_paciente_origem": "70437935", "numeroprontuario": "", "numeropaciente": "182", "bairro": "Juvevê", "cep": "80040120", "cidade": "Curitiba", "endereco": "Rua Sete de Abril", "uf": "PR", "complemento": "31"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('3341da60-6d82-4c06-8cbe-b9209ac93919', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Thayna Klaumann dos Santos', '41985051802', 'thaynaklaumann@hotmail.com', '11251391966', '1999-11-06', 'female', 'active', NULL, '{"id_paciente_origem": "70519199", "numeroprontuario": "", "numeropaciente": "183", "bairro": "Centro", "cep": "80250220", "cidade": "Curitiba", "endereco": "Avenida Visconde de Guarapuava", "uf": "PR", "complemento": "apto 2401 B"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('73401fb7-c682-4da7-9352-06f591c47fad', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Gustavo Grossl', '47996093834', NULL, '06738271948', '1995-02-06', 'male', 'active', NULL, '{"id_paciente_origem": "70526783", "numeroprontuario": "", "numeropaciente": "184"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('2462a256-7ae6-4b62-a418-b3704d6e9f22', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Diego José Dziedicz', '47997416551', NULL, NULL, '2018-03-20', 'male', 'active', NULL, '{"id_paciente_origem": "70555632", "numeroprontuario": "", "numeropaciente": "185", "cep": "89294000", "cidade": "Campo Alegre", "endereco": "Rua principal do salto", "uf": "SC"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('63fd95fb-a940-4b8b-b551-019baf5547d7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'PERSONAL', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '{"id_paciente_origem": "70903388", "numeroprontuario": "", "numeropaciente": "186"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('7f82556e-7d66-464a-be4e-de4370c1ab44', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Edir Rodrigues', '47999923289', NULL, '00443800979', '1981-03-10', 'female', 'active', NULL, '{"id_paciente_origem": "71098747", "numeroprontuario": "", "numeropaciente": "187"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('250bcb2e-1891-442a-8dfd-9c55b7790792', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Luciane Nogueira Dziedcz', '47997416551', NULL, '08686322956', '1992-12-15', 'female', 'active', NULL, '{"id_paciente_origem": "71135704", "numeroprontuario": "", "numeropaciente": "188"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('a5ead29a-1318-4ee3-960c-d25443748337', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lucas Carvalho', '31985188161', 'carvalho.lucasjosue@gmail.com', '14380770680', '1999-11-25', 'male', 'active', NULL, '{"id_paciente_origem": "54474373", "numeroprontuario": "", "numeropaciente": "9", "rg": "20829434", "bairro": "Cardoso", "cep": "35455130", "cidade": "Itabirito", "endereco": "Rua Ana Maria Teixeira, 830", "uf": "MG"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('36fb7501-1117-4461-bec2-5fa83e2a2592', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Lurdes Regina Correa Zampieri', '41999750649', 'l.rcz@hotmail.com', '87740974900', '1970-06-13', 'female', 'active', NULL, '{"id_paciente_origem": "55626061", "numeroprontuario": "", "numeropaciente": "79", "bairro": "Cascatinha", "cep": "82025255", "cidade": "Curitiba", "endereco": "Rua Ângelo Trevisan, 390", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('789e8e0a-0ceb-487a-b0cc-6f1d77c1e604', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Joyce Nogueira Santuchi', NULL, 'santuchi.joyce@gmai.com', '10580672735', '1985-03-10', 'female', 'active', NULL, '{"id_paciente_origem": "72971142", "numeroprontuario": "", "numeropaciente": "197"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('9e8c528f-2d25-4ec5-a790-47f866d3aa49', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Luisa Eduarda Valim', NULL, NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "73004616", "numeroprontuario": "", "numeropaciente": "198"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('226f0e17-7ad5-4e45-92f3-8d44293722e0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Hevilin Caroline Souza da Silva', '41999617119', NULL, '07503774967', '2001-08-30', 'female', 'active', NULL, '{"id_paciente_origem": "54521495", "numeroprontuario": "", "numeropaciente": "10", "cidade": "Curitiba", "endereco": "Joaquim da Costa Ribeiro 1230", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('0802e1be-51d6-4fce-9865-5df35019a2d6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Igor Minami Suyama', '41995994016', 'igor_my@hotmail.com', '08795930914', '1995-06-01', 'male', 'active', NULL, '{"id_paciente_origem": "57698953", "numeroprontuario": "", "numeropaciente": "96", "bairro": "Bigorrilho", "cep": "80730001", "cidade": "Curitiba", "endereco": "Rua Padre Anchieta, 2636, apto 1101 bloco B", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('30ae2ffd-097d-465b-a3ff-66f09ec869c0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Isabela Rafael Botelho Brizola', '41987248427', 'isabrizola@hotmail.com', '44613179866', '1993-09-30', 'female', 'active', NULL, '{"id_paciente_origem": "57864658", "numeroprontuario": "", "numeropaciente": "98", "bairro": "Vila Izabel", "cep": "80320270", "cidade": "Curitiba", "endereco": "Rua Parintins, 972, apto 31 bloco B", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('de501c73-6b00-4f57-842c-cb8db2665125', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Karine Pacheco', '41991349552', 'karinne.pacheco@hotmail.com', '04652250983', '1995-09-20', 'female', 'active', NULL, '{"id_paciente_origem": "55473759", "numeroprontuario": "", "numeropaciente": "77", "bairro": "Centro", "cep": "80010060", "cidade": "Curitiba", "endereco": "Travessa Jesuíno Marcondes, 73, apto 05", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('32771ae6-045b-4178-b107-fdb2da1fa700', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Rosângela Moreira', '41991041140', NULL, NULL, NULL, 'female', 'inactive', NULL, '{"id_paciente_origem": "62989846", "numeroprontuario": "", "numeropaciente": "128"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('25d84b99-e3a3-4301-9a88-b47e74fff232', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Virginia Elaine Ferreira Lima', '41999924771', 'vlimamicro@hotmail.com', '73979589234', '1983-09-08', 'female', 'active', NULL, '{"id_paciente_origem": "55311200", "numeroprontuario": "", "numeropaciente": "73", "bairro": "Cajuru", "cep": "82970015", "cidade": "Curitiba", "endereco": "Rua Ayrton Turra, 51, Bcoo 01 apto 102", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('de4f8ead-3e4b-494c-a00e-e9cc84990f12', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Yumi Sagaura Gouveia', '47991998727', NULL, NULL, '1999-09-13', 'female', 'active', NULL, '{"id_paciente_origem": "54530282", "numeroprontuario": "", "numeropaciente": "52", "bairro": "Centro", "cidade": "Curitiba", "endereco": "Brigadeiro Franco, 1190", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('b0fb3904-d922-41a1-874a-e8529d6ffc29', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Nathalia Oliveira de Castro', '41988577382', NULL, NULL, '1993-04-30', 'female', 'active', NULL, '{"id_paciente_origem": "54528105", "numeroprontuario": "", "numeropaciente": "36", "rg": "109049724"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('29ab2041-77a6-4ee3-aa6d-39c8a442efc7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Priscilla Cavalcante Martins Pierin', '41999843608', NULL, '05777865631', '1984-02-16', 'female', 'active', NULL, '{"id_paciente_origem": "54909065", "numeroprontuario": "", "numeropaciente": "60", "rg": "139301013", "bairro": "Bigorrilho", "cep": "80710000", "cidade": "Curitiba", "endereco": "Padre Agostinho 1615", "uf": "PR"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('4b1b8d0d-5cfa-4f97-a80b-29f54f4b601a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Natanael Silva de Menezes', '47996066795', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "73024117", "numeroprontuario": "", "numeropaciente": "199"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('5aab6d3e-7302-4fb4-aa2c-9ad1148b712e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Guilherme Kubrusly Bezerra', '41996159607', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "73093225", "numeroprontuario": "", "numeropaciente": "200"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('33bdf4e4-cb8d-447c-b4e7-a3610e876b2f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Eric Araújo da Silva', '3496786286', NULL, NULL, NULL, 'male', 'active', NULL, '{"id_paciente_origem": "73093568", "numeroprontuario": "", "numeropaciente": "201"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO contacts (id, clinic_id, full_name, phone, email, document, birth_date, gender, status, notes, custom_fields, insurance_type, created_by, created_at, updated_at)
VALUES ('e30d77a5-9999-4c48-814f-544f63ae7564', '30a89c67-7497-457f-a887-a56d1d721f6d', 'Pamela Souza Vieira', '41995618883', NULL, NULL, NULL, 'female', 'active', NULL, '{"id_paciente_origem": "73149243", "numeroprontuario": "", "numeropaciente": "202"}'::jsonb, 'Particular', '8b1b148f-368b-4480-acdf-2236a593b2fb', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- ============================================================
-- 2. APPOINTMENTS (consultas → appointments)
-- ============================================================
-- 623 consultas encontradas

INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7b5d3349-f37d-4c47-91cd-2480710df9cb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-09-22', '19:30', '21:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0aa187ae-5c3a-45db-a6f3-4fc78eff1249', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ebfa85aa-245b-421c-b809-ef5ca6544336', 'Pedro Henrique Pio de Souza Pinto', '2026-01-16', '12:00', '13:00', 'cancelled', 'Rest. 37O', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('835ddc22-59e6-43e5-af3d-0f99b75075a0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2025-10-10', '19:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6ec98283-c909-4e29-991c-260e6b6bcf68', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8033f705-f288-48c3-b3ab-f23919147316', 'Ronei Sachs', '2025-12-08', '21:00', '22:00', 'cancelled', 'linpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('20fac3f7-0b0a-471a-b537-c4680dcb154e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd90aad48-e084-446b-8297-1846acde64e1', 'Vó Antônia', '2025-10-17', '17:00', '20:00', 'scheduled', 'restauração do 15 e estéticas inferiores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9013dc21-16e2-44de-b526-7ed8d5c3e263', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '89e1ec75-976b-420f-84bb-ed6a50c37940', 'pedro cic', '2025-06-23', '20:15', '21:15', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ef7f0fd7-0933-45f8-a981-da384ef3f548', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-10-15', '12:00', '13:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('14d45e8f-6d26-4390-ac0b-138e1194e247', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-10-01', '19:00', '20:00', 'cancelled', 'Ultima limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4666fc31-8070-4337-8f4c-7678d974680c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-09-15', '19:00', '20:00', 'scheduled', 'Peeling', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8a942af1-efbe-4c63-b49b-b94294c9dc98', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-09-01', '19:30', '20:45', 'scheduled', 'segunda sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c3d65539-3903-4b02-9baf-5a75ad330ae5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-11-05', '12:30', '14:50', 'completed', 'Início das restaurações estéticas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b256c630-7e24-49a6-a433-64e8a7660412', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b4ab2ee8-3020-4788-9a19-a5221db66c04', 'Cristiano Correia Rebouças', '2024-11-04', '16:30', '17:30', 'completed', 'Avaliação e Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d63ecb91-dbfd-4b36-ae9d-0c25b7fa4031', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '06e94d65-867a-4f07-934e-3431dac5e9bf', 'Anna Laura Rasi', '2024-11-05', '16:30', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('64f60ae7-c108-4935-9b63-ebc54422da5e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9eee0fbd-2b61-4c85-a592-29f5dfe2ae5d', 'Daniela Ramos da Silva', '2024-11-05', '21:00', '22:00', 'completed', 'Avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d104a8cc-3e9d-4a64-a5b0-bde8be31b01a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2024-11-04', '12:30', '14:50', 'cancelled', '15V Recessão 
14 OV Recessão + reparo na oclusal
16 OM Troca de resina antiga
se der tem 12 - 11 - 21 remoção de amálgama Palatina e substituição por resina', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('11a1bab0-a9eb-4cd4-b731-e39938cca870', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2024-11-05', '22:00', '23:00', 'completed', 'Primeira Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1ac49bf0-7a61-49fb-a98b-a85909b89456', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2024-11-05', '14:30', '15:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d7352fa8-716d-44eb-a0d9-f420871a3438', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2024-11-19', '14:45', '15:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c9e3d9ed-ea39-4855-82cd-91ba289afe21', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2024-11-11', '12:00', '14:00', 'completed', '26 e 27', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b90417e1-6b68-45ad-a1fe-793914e13760', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-11-12', '11:30', '13:30', 'completed', '1 Sessão de clareamento de consultório,  ajuste da placa de bruxismo, alinhamento dentes inferiores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c6e6f3ae-22cd-4eef-943c-81fe5fb4ff0b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2024-11-11', '17:00', '18:00', 'completed', 'Avaliação e limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2431f0e6-630f-4610-a409-4496075511f4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2024-11-12', '21:00', '22:00', 'scheduled', 'Segunda limpeza + remoção de cárie 24 OD', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8e38e986-8cc2-4bc2-ba67-e9b07783cdfd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2024-11-25', '21:30', '22:30', 'scheduled', '16 OM Remoção de cárie', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('25d6fb0e-c6b7-405a-abd4-828a6fd33583', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ebd42346-e7f9-4483-99dc-97de4214d23c', 'Raquel Kampf', '2024-11-12', '14:00', '15:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('102986b0-4602-49f6-80c6-791de7a82755', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2024-11-18', '12:00', '14:00', 'completed', '17 e 16, avaliar o 37 OD.... | Retorno: 2024-11-18 03:00:00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('87272b50-ae65-488b-bcc0-a4bbd0c96189', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2024-11-18', '10:40', '11:40', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1f832479-f838-43e5-8cb4-defe953a46fd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '06e94d65-867a-4f07-934e-3431dac5e9bf', 'Anna Laura Rasi', '2024-11-12', '17:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a73bcfcc-daa6-4688-893d-da948953f59c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0456e372-4c9c-4fb4-af1b-2cbcbde45d81', 'Felipe Barbosa de Oliveira', '2024-11-11', '21:00', '22:00', 'scheduled', 'Iniciar restaurações Cl V G2 quadrante 2  ---- 24, 25, 26', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ed7518d9-402c-4bdc-8f66-e15098ebd6b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2024-11-25', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f55beb9e-0ecf-46ae-ba5e-ce9b50c14ad6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2024-11-25', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4656ce0b-e95a-4648-8503-7e4a6028977c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e17fd542-482c-47f9-8244-43b13b079825', 'Mariana Reichmann', '2024-11-12', '19:00', '20:00', 'confirmed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('eeb7c9f6-d1ac-4c64-8456-5370e5e0af27', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-11-19', '12:00', '13:00', 'completed', '16 OD Remoção da RC antiga e troca de RC', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cbd472e9-604b-4aec-bc7e-5e2f30364ae6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '06e94d65-867a-4f07-934e-3431dac5e9bf', 'Anna Laura Rasi', '2024-11-19', '16:40', '18:40', 'completed', 'Prova das próteses, guia canina, ajuste oclusal dos molares', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0bf6b418-1d34-4c22-842e-2ea438838258', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2024-12-03', '20:00', '21:00', 'scheduled', '14 e 15 remoção de cária', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('38d71724-add6-4098-8faf-9a85454c1db0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2024-12-17', '21:00', '22:00', 'cancelled', '3 limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('96244c3f-1b90-4639-92dc-1c04b804ae20', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', 'Cauan Ribeiro Oliveira', '2024-11-19', '13:30', '14:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('26b44eeb-9ec5-4e3f-9d73-929018e9df95', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e17fd542-482c-47f9-8244-43b13b079825', 'Mariana Reichmann', '2024-11-26', '21:00', '22:00', 'scheduled', 'Botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('432bb1f8-3429-47a6-8bd1-f542fe556569', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '87a9aba8-7d0e-463d-8026-38637e3e425b', 'Kátia Gardenha Gomes de Oliveira', '2024-11-18', '21:00', '22:00', 'completed', 'Avaliação, não sei do que se trata', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('98d5a96a-253a-4292-b1c3-7d003804eb30', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9eee0fbd-2b61-4c85-a592-29f5dfe2ae5d', 'Daniela Ramos da Silva', '2024-11-25', '17:00', '18:30', 'scheduled', 'BOTOX masseter, tempora + PRIMEIRA limpeza | Retorno: 2024-12-02 03:00:00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('caebb966-dc97-4b33-95de-1d127ec2523b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2024-11-26', '17:00', '19:00', 'scheduled', '45 e 11', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('242e5e75-6fec-48d4-baff-f2b3cf53905c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '29ab2041-77a6-4ee3-aa6d-39c8a442efc7', 'Priscilla Cavalcante Martins Pierin', '2024-12-09', '11:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3458d407-6ef2-4ef0-be05-abc9d742daa9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '29ab2041-77a6-4ee3-aa6d-39c8a442efc7', 'Priscilla Cavalcante Martins Pierin', '2024-11-25', '11:30', '14:30', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('211536a1-7ca5-4606-9005-093afb43f160', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '29ab2041-77a6-4ee3-aa6d-39c8a442efc7', 'Priscilla Cavalcante Martins Pierin', '2024-12-23', '11:30', '13:15', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('084b4453-b7ed-41ab-8a39-a591d8dd6fe2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '29ab2041-77a6-4ee3-aa6d-39c8a442efc7', 'Priscilla Cavalcante Martins Pierin', '2024-12-16', '11:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('27c1b189-ddbb-486a-81f3-734cf24f99a5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-12-02', '13:35', '14:35', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('008b75ff-92e3-45b5-b8f7-64bbcff9d87a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '29ab2041-77a6-4ee3-aa6d-39c8a442efc7', 'Priscilla Cavalcante Martins Pierin', '2024-11-18', '14:00', '15:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ea2270da-5a29-4781-b4ec-7021d9bf2c85', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6cd890d6-ab9e-4c46-b46d-49de6f90e4b1', 'Mariana Miguel Presidente', '2024-11-26', '20:00', '21:00', 'completed', 'Botox na testa | Retorno: 2024-12-09 03:00:00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bb8648b0-583b-4c5a-861f-f624ffc6d9b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2024-12-16', '18:00', '19:30', 'completed', 'Entrega do Alinhador', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c9a68e7b-4ad1-41c7-b7d8-7ac1eebdffd6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4a1150e2-250a-447a-907f-b38ef20bd546', 'Rafaela Kozlovski Cassu', '2024-11-26', '20:00', '21:00', 'completed', 'Retorno: 2024-12-10 03:00:00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('34f053e8-48b3-45aa-bd5a-9f909c8b172c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '06e94d65-867a-4f07-934e-3431dac5e9bf', 'Anna Laura Rasi', '2024-11-22', '19:00', '21:45', 'scheduled', 'Prova das Facetas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bf44e992-e610-47a2-99c7-49dccbf189c8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', 'Fionn Francis Machugh', '2024-12-23', '14:30', '15:30', 'scheduled', 'Limpeza 180,00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6489fe8e-0cdb-4ec3-93e1-13e63e7f80d6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c2eb0b64-cb45-4a8a-8a3b-489d3ac494be', 'Anne Martins Bittencourt', '2024-12-23', '13:30', '14:30', 'scheduled', 'Limpeza 180,00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('feafb7ce-5f5f-4f18-bbc6-0d9006a2cd5f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '06e94d65-867a-4f07-934e-3431dac5e9bf', 'Anna Laura Rasi', '2024-12-02', '17:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('370a875c-528b-4789-83c9-2e93abf31e5a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2024-12-06', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8933694c-9cdb-4dae-bd25-079b8e159b08', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2024-12-06', '16:30', '17:30', 'scheduled', 'Entrega da placa', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2c7b3b78-c3e8-40ac-a3c1-6c0fe5afbb0b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2024-12-09', '21:30', '22:30', 'completed', '22 + 12 aumentar borda incial  + 48 polir a oclusal', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('333a1c20-3dc9-498e-91f1-9e12b04772c3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '62c6c756-46e0-4138-a451-a84f22c24775', 'Israel Francisco Acunha de Vargas', '2024-11-26', '12:30', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dbb819c6-892a-4fbc-b89a-17dfa4593adf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '62c6c756-46e0-4138-a451-a84f22c24775', 'Israel Francisco Acunha de Vargas', '2024-12-03', '12:00', '13:00', 'scheduled', 'segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b078c4ba-b698-4cdf-ad7b-08b9265d9b28', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4a1150e2-250a-447a-907f-b38ef20bd546', 'Rafaela Kozlovski Cassu', '2024-12-09', '20:30', '21:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('07342245-715e-4955-abf2-f9bbfa51edd9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6cd890d6-ab9e-4c46-b46d-49de6f90e4b1', 'Mariana Miguel Presidente', '2024-12-09', '20:30', '21:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a087cd95-76aa-4dca-adae-c305366dfae4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2024-12-03', '18:30', '20:00', 'scheduled', 'Avaliação inicial, mais restaurações provisórias', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('15cb6a0a-6c01-49f6-9d69-c2d3a46793b4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2024-12-02', '11:00', '14:00', 'completed', 'Classe V 14/15 + troca de amalgamas palatina anteriores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1666cf71-d093-4ebb-8ad5-bc5dc363a66c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2024-12-06', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7c8cd084-6d11-45e8-b83d-471ba88d34c5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '731093fd-45cb-42df-8ae4-a57e4308a523', 'Thamires Soares Figueiredo', '2024-12-10', '14:30', '15:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a4f1a3b8-2b71-422f-8b80-1cfd7b811369', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '731093fd-45cb-42df-8ae4-a57e4308a523', 'Thamires Soares Figueiredo', '2024-12-06', '15:00', '16:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c3cf1a57-d35b-403c-bf46-de53570335e2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '25d84b99-e3a3-4301-9a88-b47e74fff232', 'Virginia Elaine Ferreira Lima', '2024-12-10', '11:30', '13:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('18dc8d79-1d33-41fb-af0b-885d946e1eb5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2024-12-02', '20:00', '21:00', 'completed', '2 limpeza, paciente gravida', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d13c3e3a-8e63-4504-b98b-6fe6092ecc90', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2024-12-02', '16:30', '17:30', 'completed', 'entrega da placa miorrelaxante', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7652248e-4df6-4e11-94f8-af3cd5b18dad', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f430e5f9-62e4-4c37-adf8-71bfe166264e', 'Thais Santa Rosa Santos', '2024-12-02', '17:45', '18:45', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7b1453ae-a121-4403-be39-fe77d69854d5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2024-12-16', '12:00', '14:00', 'completed', '46,47 e 36 oclusal', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ff29f5da-b4bc-42ee-b098-69e314637a76', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f430e5f9-62e4-4c37-adf8-71bfe166264e', 'Thais Santa Rosa Santos', '2024-12-06', '18:00', '19:00', 'scheduled', 'Avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5afe8cfb-8e7e-4805-b26d-83c100828532', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-01-20', '20:00', '21:00', 'completed', 'Terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c6dd4873-42f4-43e7-b09d-e18d7609b07c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-12-10', '11:30', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b0bed379-7fd6-4166-ab31-26dcb9378acf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2024-12-13', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('17d49416-6138-4de1-9045-829cda0bf9c9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e17fd542-482c-47f9-8244-43b13b079825', 'Mariana Reichmann', '2024-12-06', '20:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4e394020-a850-46f3-a706-0f176c67e1d6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2024-12-13', '20:00', '22:30', 'completed', '24 e 25 remoção de cárie', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cc9b2987-4380-4673-a4f9-fbcc516adb5c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b7b1ca75-e35d-46ad-aefd-f6f21e0ad7ca', 'Giovanna Rohnelt', '2024-12-06', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6b4bf459-b598-4f74-99bc-e15d5750ea7a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2024-12-17', '20:00', '21:00', 'completed', 'Cimentação de peça protética', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2b582782-4891-430f-8149-00fdb8fbdcad', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'de501c73-6b00-4f57-842c-cb8db2665125', 'Karine Pacheco', '2024-12-06', '20:30', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4a6f7761-8479-4a3e-8f9c-33c4baa1cc9d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6d78a343-ac08-4c3c-ae1c-d792d9fb0679', 'Bruna Sprea Carrijo', '2024-12-06', '12:00', '13:00', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('03e90918-189c-4185-9f20-ae4382d226f9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2024-12-09', '13:30', '15:00', 'scheduled', '17 e 16, remoção de cárie e troca de restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3ee8b44d-34e7-4d60-8254-b201e3d38845', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2024-12-06', '11:30', '13:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7cadc363-0d50-41d0-aa42-137bb165ed36', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6d78a343-ac08-4c3c-ae1c-d792d9fb0679', 'Bruna Sprea Carrijo', '2024-12-06', '21:30', '22:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8f26fa15-64b8-40bb-ab21-514a78216106', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2024-12-09', '18:30', '20:00', 'completed', 'Moldagem e envio para o lab', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('80e082f7-ebfe-4123-8fc8-2a4ba8643c82', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2024-12-09', '19:00', '19:30', 'scheduled', 'REUNIÃO COM A SOU', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8498f7d3-1b0c-4051-8d8e-f420f18bc592', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9e7be956-a04c-480d-9a14-204457236b6c', 'Priscila Bertholdo', '2024-12-09', '10:30', '12:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('23cc6c00-5769-4a41-b151-b03977ce9ddc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2024-12-09', '16:30', '18:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d725c603-9047-4794-b98e-c6fad212e556', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2024-12-16', '20:00', '21:30', 'completed', 'Corrigir tom do provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1436f3b2-ccac-4779-8c66-5ecc5437fbd7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '36fb7501-1117-4461-bec2-5fa83e2a2592', 'Lurdes Regina Correa Zampieri', '2024-12-17', '12:00', '14:00', 'completed', 'Segunda sessão,  limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('58766d18-08be-439b-a372-56f86ce689ad', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2024-12-13', '18:30', '20:00', 'completed', 'Rest 11 e 45', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a7e777fd-4e86-4e68-a376-be2ebefad50a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '87a9aba8-7d0e-463d-8026-38637e3e425b', 'Kátia Gardenha Gomes de Oliveira', '2024-12-10', '13:00', '14:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('21638ac4-1d55-4127-acd2-7d044bc09bdc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '25d84b99-e3a3-4301-9a88-b47e74fff232', 'Virginia Elaine Ferreira Lima', '2024-12-23', '11:30', '12:30', 'completed', 'Retoque', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7102fa22-94f5-48bf-b323-cc5283296470', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '731093fd-45cb-42df-8ae4-a57e4308a523', 'Thamires Soares Figueiredo', '2024-12-23', '13:00', '13:30', 'completed', 'Retorno do botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8609dd03-3e2e-4c4f-bd49-1ff7d77764bf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-09-15', '13:30', '14:30', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b4ba98ee-b1a1-46ba-8414-78ec3cc77c42', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-09-15', '12:30', '13:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('739407ac-b367-4086-a2c8-abcdb51e6f5f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2024-12-17', '14:00', '15:00', 'completed', 'Terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b15bebb4-24d0-44bc-b588-65d73d7030e6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2024-12-17', '18:30', '19:45', 'completed', 'Priva ckria', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0d6cefb7-cfaa-46cb-89d3-9c61de81acc5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2024-12-20', '16:30', '18:00', 'completed', 'Restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('887c9ec8-9a06-41d7-954b-ce808ddeda2f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2024-12-17', '16:30', '18:15', 'completed', '44 e 45 rest,', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('517148dd-62ab-44ef-817d-139dd7cbf3b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2024-12-20', '18:00', '19:30', 'completed', '22, restauracão', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0a989efe-febc-43ca-9cb4-5d2af00e4e32', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e17fd542-482c-47f9-8244-43b13b079825', 'Mariana Reichmann', '2024-12-20', '15:00', '15:30', 'completed', 'Retorno do botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5343145c-f24f-488d-b587-1c124dfc900f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2024-12-20', '11:30', '12:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0a791ab3-6561-4d1c-8e7e-09bc5e0d8c31', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'de501c73-6b00-4f57-842c-cb8db2665125', 'Karine Pacheco', '2024-12-20', '15:00', '15:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('72241ba3-bba0-4523-a90a-4849107b629f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2024-12-20', '12:50', '13:20', 'completed', 'Ajuste de restauracao do alinhador', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('63b3d327-1761-4ab0-9da8-df6129ff2870', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f290e416-e6d1-4ba6-b3ef-baa273472602', 'Samuel Patussi', '2025-01-13', '21:00', '22:45', 'completed', 'Moldagem para placa ou resina no 22 VD', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('991ebd0c-43e8-40a6-94d2-a14898f8c7e9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-01-13', '13:10', '14:10', 'completed', 'Rest 16OD', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bc7edaf9-700d-454a-a3c2-e2b2173ffcca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-01-13', '19:00', '21:00', 'completed', 'Rest classe 5', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('df231cc8-1b43-466a-8269-886eb437f25e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2024-12-23', '18:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1ed55fcd-f57a-4743-8c7c-9a84e532546b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-09-08', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f1a97449-606e-4017-819e-ec84fd90d31f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '62c6c756-46e0-4138-a451-a84f22c24775', 'Israel Francisco Acunha de Vargas', '2025-01-14', '11:45', '13:15', 'completed', 'Terceira limpeza e restauração do dente 16', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bb7570f7-0eab-4b91-9af5-edd38c0d657b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '12d1dc10-faf8-471f-9d7b-e6e2f2322fcc', 'Benicio Bittencourt Machugh', '2025-01-14', '13:30', '14:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('42965645-b38d-44e8-abb8-bc5f6fac2708', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-01-17', '13:30', '15:00', 'completed', 'Preparo e moldagem da prótese', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('86ac774f-392f-40de-8be0-32c56822263a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2025-01-14', '20:00', '21:00', 'completed', 'Prova/ cimentação da prótese', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5b8840db-f96a-4dc3-b374-827f2de94ffe', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-01-27', '12:00', '14:00', 'completed', 'Remoção da prótese do 15 OD + confecção de provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ab993797-dca9-45de-b7c6-60720791da83', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-01-28', '12:00', '13:30', 'completed', 'Reparo oclusal 47 O ) 46 O', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('eb4a6ca4-ef0f-4bea-9eeb-acbb56d80863', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', 'Fionn Francis Machugh', '2025-01-17', '16:40', '18:40', 'completed', '24 e 25', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6ce1fe31-3fe8-400f-80a8-be1b71d1c40b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', 'Fionn Francis Machugh', '2025-01-13', '16:40', '18:40', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ab85390e-4f43-4a8b-87a8-56a93504ecd6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-01-20', '18:30', '20:00', 'completed', '35 e 34 restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0494d60b-2169-4bfc-9ee2-d230a8feccc4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-01-17', '11:40', '13:25', 'completed', '34 e 35 rest!', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8313ad71-84a9-4a71-9dbf-fb855370b496', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f290e416-e6d1-4ba6-b3ef-baa273472602', 'Samuel Patussi', '2025-01-27', '21:30', '22:30', 'completed', 'Entrega da placa', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c257a1df-9ce2-41b8-9a3f-6280662cecbd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2025-01-31', '17:00', '18:00', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e0944046-7d73-4fec-82db-c84cb7477b85', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e3c443c2-f81c-4335-b34a-cdafeb13bf7e', 'Maria Cantalicia Martins', '2025-01-20', '14:00', '15:15', 'completed', 'Avaliação inicial', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('05249897-83e3-408e-bd27-6465062ebe7e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '31ee48c4-5967-4c3c-be06-2a5dd11c893a', 'Amanda Karen Costa de Araujo', '2025-01-21', '20:30', '21:30', 'scheduled', 'Limpeza e avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4c20f314-9990-41c4-89bd-1dfd65cacb1a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'de12deac-03ab-4363-8122-46c9873a30b5', 'Lorenna Maia', '2025-01-17', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6a062c2b-f84e-44fe-bab1-e026425a309e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '73b01fa8-458c-493a-9a37-10f10530b25c', 'Bruna Bru', '2025-01-14', '16:45', '17:45', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('31348287-5170-42fe-9eb8-f114100b90cc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-01-21', '14:00', '15:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('324b17a1-8fe2-46a6-ab53-c5e49c2d5375', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-01-20', '12:00', '14:00', 'completed', 'Preparo e moldagem', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('620e171f-c0b1-4a92-9460-8bfedf8bf0bf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-01-31', '13:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8e3ce1bb-c43a-4a05-b1cf-919cdf9d0179', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e3c443c2-f81c-4335-b34a-cdafeb13bf7e', 'Maria Cantalicia Martins', '2025-01-24', '13:00', '15:00', 'scheduled', 'Limpeza+restaurações', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d091e933-b321-4fbc-9866-c654e3fd2790', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-03-28', '18:30', '19:30', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('82a89d0b-489c-4e33-85a1-e711a3f1c3f0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-02-04', '21:30', '22:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7eea590e-4b6f-44fc-a9a2-010cbf650348', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2025-02-04', '20:00', '21:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('51a7aa25-c0e7-4f30-82c7-ffea7efd0834', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-02-17', '17:00', '18:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('688fce23-aa1c-4e31-9c76-77b3c891483e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1e4dde0f-6814-494d-b74d-96d654738039', 'Mércia Mendonça Borges Paulino', '2025-02-10', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('47060261-11fd-4c6a-973a-3aea42364e36', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9f024036-b223-48f2-b685-56bb1ed29e89', 'Rafael Walax', '2025-02-10', '13:30', '14:30', 'completed', 'Reparo em resina composta 180,00', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7c1584a5-23ac-4c56-b839-d77ee622ef06', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-02-21', '17:00', '18:30', 'scheduled', 'EXO 38 e 48!', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a11c60e5-817b-4bfe-95c5-83a44d68a124', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2025-03-18', '20:00', '21:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b2e4baf8-5227-4a5c-99d0-0cc2490e8453', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-02-28', '14:00', '15:00', 'scheduled', 'instalação da prótese', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a8011914-23f2-44f2-9fe5-7f229a7083ee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '74764bac-ce24-44c4-81b3-9a3a10ff49f4', 'Thiago Zirondi de Abreu', '2025-02-14', '17:00', '18:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2d9f797b-81a1-41ee-bf2d-1af3ce2a7fb9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2025-02-24', '13:30', '14:30', 'scheduled', 'Quarta Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('46343f65-52df-4f56-a805-9bbeff4d623a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c5c662c-fd50-4935-8bf2-0463f5558f74', 'Cássio Dalbem Barth', '2025-02-17', '18:10', '19:10', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a9a6395c-404e-4c75-b7a6-300f7c815472', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-02-18', '19:00', '21:00', 'scheduled', 'Reparo em resina compostas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8ddc2a82-acf9-49b2-a71d-b9a88767ff51', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2025-02-21', '19:30', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f5b79099-7050-4435-9238-fb8df3aee392', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-02-24', '12:00', '13:00', 'scheduled', 'Prova da coroa', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5eeb655d-1bdd-4f5d-a42b-6ee57f391434', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c5c662c-fd50-4935-8bf2-0463f5558f74', 'Cássio Dalbem Barth', '2025-03-17', '17:00', '18:30', 'completed', 'Terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7626c50b-ba1c-482f-91db-8eedd34f07d5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-02-24', '17:00', '18:00', 'scheduled', 'Provar os componentes para escolher qual comprar', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('212c0444-8243-4042-9d87-9bcf6a733bc4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-03-14', '19:30', '21:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c24b7227-35f0-475e-82c4-e7295aec87e7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ff582bde-36f0-46a4-990b-ac14e22dcb5d', 'Maria Paula S C Oliveira', '2025-09-10', '13:00', '14:00', 'scheduled', 'Moldagem coroa', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b7ea2bb2-344f-4d39-8fb1-328419f06db9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-02-21', '21:00', '22:30', 'scheduled', 'Limpeza +
 Avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9c0cc664-0853-44ad-bdee-99ad8f3477b6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-09-10', '12:00', '13:00', 'scheduled', 'segunda sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a319a306-cecd-4456-b7b9-bf8b42aaae77', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-09-15', '20:00', '21:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f4a4aa5b-0741-4244-bd92-b30b2fc1556c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-02-28', '13:30', '14:00', 'completed', 'Remoção de pontos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('859439eb-a8fa-49ad-bbaa-a8aa7c551530', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3571dcf2-89f6-4ea5-a34d-828b25f83756', 'Matheus Wesley Correia da Silva', '2025-02-28', '12:00', '13:00', 'completed', 'Troca do curativo!', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4b80a977-5904-4925-be5b-165835725489', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-03-28', '21:00', '22:00', 'scheduled', 'Segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('255be333-25b1-47ae-bd2c-c67ec297a520', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '62c6c756-46e0-4138-a451-a84f22c24775', 'Israel Francisco Acunha de Vargas', '2025-02-25', '12:00', '13:30', 'completed', 'Quarta e última limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f0b98c8c-37e5-40e0-af3a-c221c3e3bb28', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-02-28', '13:20', '14:20', 'scheduled', 'Moldagem', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f91b7ab1-4408-45cf-a66d-bbada95ce8d7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-02-25', '11:15', '12:15', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('140f97ce-abcd-4ab9-a5af-e905b0b3e576', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-09-10', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1914c659-ceac-4c5b-9b7c-a77c2a8ca00c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-09-09', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6175065d-2719-488d-9bf3-ca0d65ad8e28', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-09-10', '13:00', '15:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5a847107-e6d1-47b5-ad84-c90063c00f9e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '62c6c756-46e0-4138-a451-a84f22c24775', 'Israel Francisco Acunha de Vargas', '2025-05-28', '12:00', '13:00', 'scheduled', 'Retorno para avaliações!! Possível limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7107781b-6957-468c-bc13-cd689f3cb03d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', 'Adriana Demeterco', '2025-03-10', '21:00', '22:00', 'scheduled', 'Prova e come ração de peça cerâmica', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('911d4453-4e8f-45d5-a938-db9eadfee93c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3571dcf2-89f6-4ea5-a34d-828b25f83756', 'Matheus Wesley Correia da Silva', '2025-04-18', '20:30', '21:30', 'scheduled', 'LImpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cd22331f-c366-4c7c-85b8-3e9466ab5401', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-03-14', '16:30', '18:30', 'scheduled', 'Moldagem para estudo + 2 sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fbcf4205-e2c1-4bd4-b24e-bb6bc2355897', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-09-24', '21:00', '22:30', 'completed', 'Preparo + provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ff31307f-ce9c-4a99-9bf4-79557546513e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2025-03-14', '18:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7c9e7933-a592-4466-ad64-b6aac34f71f4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-03-10', '18:00', '21:00', 'completed', 'Ultima limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ade7841b-7220-4ca4-9e35-cdf390b6d722', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-03-18', '13:00', '15:00', 'confirmed', 'Moldagem, finalização dos preparos, moldagem com aquela tecnica da resina acrilica para a gengiva', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('065f3a6c-30df-4da9-953e-8dfe84338d2a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-04-16', '17:00', '20:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6f45f9f3-872f-491e-8554-adb34699d99d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-03-11', '18:30', '21:00', 'completed', 'Limpeza + selamento das dentinas + prova da plaquinha 
AVALIAR: distal 25. Oclusal / Distal 26. Oclusal/ Distal 24', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bf1ae20b-688c-4368-a21d-eb8247cefb8b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-03-17', '18:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ef322413-6f97-42ea-b7fc-04d75235a1f9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c5c662c-fd50-4935-8bf2-0463f5558f74', 'Cássio Dalbem Barth', '2025-04-22', '12:00', '14:00', 'scheduled', 'última limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('99c606b7-12a6-48bd-879c-b32bbfd496ab', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9f024036-b223-48f2-b685-56bb1ed29e89', 'Rafael Walax', '2025-03-20', '12:30', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8bc71e39-0ba1-41d1-b15e-d45acc2374a4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-03-25', '13:30', '14:30', 'scheduled', 'Troca de clareamento interno', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('acdfa200-e53d-46f1-8cdb-9e58db1d7b18', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2025-05-07', '20:15', '21:45', 'scheduled', 'terceira limpeza.... avaliação do uso do fio dental + sondagem da gengiva', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a860c4db-1b11-46c4-a0c0-59cc1229eda6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-03-20', '13:30', '15:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('35e9af79-d4ab-4270-990f-f945e8d3ef67', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-03-28', '17:00', '18:30', 'scheduled', 'quarta sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9cc50cfc-990e-4117-8acf-57bd35253df3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-03-27', '17:15', '18:15', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('efa942c3-8de1-41ad-99e8-e0d92a2560a2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-04-10', '17:30', '21:00', 'completed', 'Retorno do Botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ec2355bd-b280-4767-b2df-526f1a2c222c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-05-06', '21:00', '22:00', 'completed', 'Terceira limpeza 3/6', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5b682d6a-50b8-4d4e-b35e-7495f6bfb102', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-04-07', '17:00', '18:30', 'completed', 'Restauração dente 15 classe II', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('66f63c56-7972-4d7c-83a1-a9134b2ca8d7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-04-01', '12:00', '13:30', 'scheduled', 'Limpeza + Avaliação da placa de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b4c9d652-648c-40ac-bed0-0dd720c9ab8d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-09-16', '16:30', '18:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2a39de3d-067a-45f8-935e-af96869cf396', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '73b9563e-97bb-4975-b136-4a2985068ec5', 'Giulli Andretta', '2025-04-09', '17:00', '18:00', 'completed', 'clareamento Giulli', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f2208595-4905-43da-a165-13ade372a670', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3571dcf2-89f6-4ea5-a34d-828b25f83756', 'Matheus Wesley Correia da Silva', '2025-04-07', '12:00', '13:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2236abb9-574d-4ebc-9bd3-84e2bbb373b4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-05-14', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('35af897c-a1cd-429e-b787-d7c4342b0d41', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-07-16', '17:00', '18:00', 'completed', 'Limpeza de acompanhamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('28b59be0-4205-4a28-a156-17259f473336', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-04-11', '18:45', '19:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4c459175-bb97-4861-a0cf-504b01d094cb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-04-11', '12:30', '15:00', 'scheduled', 'Troca das restaurações!! Iniciar pelo 12/ 11/ 21', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('67dee64f-7b32-4072-84de-3f774c32f1a7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-04-14', '12:30', '15:00', 'completed', '21, 22, 23', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('132f65e1-7a3f-410f-b3e2-f782017d23cb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd5da232b-a80a-46bf-992f-4868b12b057f', 'Juliana Karin Carneiro de Ramos', '2025-04-14', '17:00', '18:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1a495992-ee92-4fd9-bc2f-e9c571602b82', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-04-14', '19:00', '20:00', 'completed', 'Troca de curativo! clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6a634977-4d14-41ab-9530-abc9904004a2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-04-25', '17:00', '18:30', 'scheduled', 'LIMPEZA + BORDA INCISAL DO 23', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('96de308a-ad82-4c0e-ae42-c6475570263d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', 'Cauan Ribeiro Oliveira', '2025-04-25', '18:30', '20:00', 'scheduled', 'ajustar cor do central + avaliar o 46', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d3d62fca-5a38-47bb-bae5-e24f2bc704f6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4cf398df-1cda-4227-8dba-48c24c90ecb0', 'Miguel Ribeiro Oliveira', '2025-04-25', '20:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3643a136-0d67-4c22-a655-827903b4455d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-04-22', '17:30', '19:00', 'scheduled', 'BOTOX + troca dos alinhadores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('77b6c941-a4eb-413c-9237-a173d6e12011', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-04-16', '20:08', '21:53', 'scheduled', 'Avaliação para clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('790cc4c6-9cbd-45fd-8c22-3cb9b7c4e5b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd5da232b-a80a-46bf-992f-4868b12b057f', 'Juliana Karin Carneiro de Ramos', '2025-04-24', '14:00', '15:00', 'scheduled', 'ENTREGAR IDEIA SOBRE O APARELHO', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1090159b-f89c-4b44-994a-dc6425a5add1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-04-24', '13:00', '14:00', 'scheduled', 'Raio X do 36 + segunda sessão do clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('34405539-6bfa-4086-9d75-faf95c4069b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-04-28', '13:00', '15:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('509dc804-c078-460a-b9b4-4c3099e567cc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-09-18', '11:00', '12:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('54a5dee2-7f8a-40b7-9a3a-19662b32d77e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-04-22', '20:30', '21:30', 'scheduled', 'Reavaliação das gengivas e retoque aumentar a borda incisal do 22', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('31f5e005-7409-42b8-98b0-93dd5fcad209', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-05-06', '14:00', '15:00', 'completed', 'Retorno do Botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e04fdf8d-699f-45b9-bddc-876033d64835', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-04-28', '17:00', '18:00', 'completed', 'Entrega do aparelho!!', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d4ea3d6a-64a9-4e42-ad7c-4df1428ea8ee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-04-29', '20:00', '21:00', 'scheduled', 'Quarta e ultima sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('37d377cc-b8fb-415e-a1b8-0dd5962bb3af', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c5c662c-fd50-4935-8bf2-0463f5558f74', 'Cássio Dalbem Barth', '2025-04-29', '18:20', '19:20', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('805a44db-d2b2-4781-85f6-ac19c14219e1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-04-29', '10:30', '12:00', 'cancelled', 'consulta!', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('78e3cb28-4763-491e-a68c-0fd7a40dbb90', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '36fb7501-1117-4461-bec2-5fa83e2a2592', 'Lurdes Regina Correa Zampieri', '2025-04-28', '18:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3683dd29-9aad-4f5d-9039-8e5b36b49c98', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-04-29', '16:25', '18:25', 'completed', 'Retorno do preenchimento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('21c634c1-a705-4120-9012-89168315ce6b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '36fb7501-1117-4461-bec2-5fa83e2a2592', 'Lurdes Regina Correa Zampieri', '2025-05-06', '17:30', '18:45', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e148a47d-8e12-4a67-93d1-908942ebab9f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-04-30', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d68b9561-3655-428c-a774-19dc026f1540', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-05-09', '17:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e6b27519-a30b-45b5-a094-da7944201114', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-05-09', '12:30', '14:00', 'scheduled', 'Segunda sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7cc3741c-2e0b-4009-9786-35b7ec3a751e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-05-12', '21:00', '22:30', 'cancelled', 'RESTAURAÇÃO, 46', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3115f17b-d484-4e34-8862-31d4be89f7be', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-05-06', '11:30', '14:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('097f2746-e355-4613-a080-eacb8fb4195e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-05-07', '17:30', '19:00', 'scheduled', 'RESTAURAÇÃO E PRIMEIRA SESSÃO DE CLAREAMENTO', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ba0793a9-8449-492c-b1c6-231ee49fa32c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-05-06', '18:45', '21:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7851578c-84d7-4dae-91f3-b1478f821f6f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-06-16', '20:30', '21:30', 'completed', 'quarta limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('175722ad-b2dd-4ed4-ab29-b05078f1c244', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-05-16', '10:30', '12:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5e3f590a-786b-4d67-86cd-43d49e04c30d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-05-19', '17:00', '18:15', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('36a301a8-2367-4c57-af85-a03962aad416', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-05-07', '19:00', '20:15', 'confirmed', 'ajustes finais facetas e gengivoplastia', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4e17c5e9-d4aa-4724-a60f-5f8a570ae5b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-05-16', '12:00', '13:00', 'completed', 'Moldagem para placa de bruxismo + fotos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ac891566-ef32-47fa-a782-88d25a83f69e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd43621ae-8c82-47b0-88f8-0170352be0c4', 'José Victor Amorim', '2025-09-12', '22:00', '23:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fa1d696d-e56b-4408-a829-57ba967769ef', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '998494b0-fb09-4886-acad-afe50338fa80', 'Naiara Amorim', '2025-09-12', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2ffcab71-edd9-4c76-9e37-fb5fc7ec0795', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2025-05-12', '17:00', '18:00', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ba276a5a-5721-4332-b3b9-ceb8ea3377c8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2025-05-12', '18:20', '19:20', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2fe79a10-ea04-4dff-8705-f59644eede50', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-05-14', '17:00', '19:00', 'scheduled', 'CIRURGIA', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('762e9ba3-c567-4ca5-88d0-43168a1fee55', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd70a9c1f-bd34-422a-9079-95a950bad776', 'Lúcia Coutinho', '2025-05-15', '14:00', '15:00', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bd44071b-d0f5-4480-af1b-08e97d2d71bb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-05-12', '18:15', '18:25', 'completed', 'fotos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3e789ff3-71cb-4262-a800-2c399b79acb8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-05-14', '19:15', '20:30', 'scheduled', 'Terceira sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c02a45cf-c003-49dd-bda8-844c8d2eb665', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9c580499-c111-46f4-94c7-df83d0f6d536', 'Marlon Elizeu Wasen', '2025-06-16', '17:00', '18:00', 'cancelled', 'Segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4a0d17cc-3d36-42df-ba87-f9b96ea20980', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2025-05-22', '14:15', '15:15', 'completed', 'Entrega do clareamento -- acertar valores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c4989df5-b52e-49b1-9a18-3066d498b52a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-05-16', '13:00', '14:00', 'completed', 'Quarta Sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1b8b1494-cbb5-438e-a03f-72c08685596f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-05-23', '13:00', '14:00', 'completed', 'Entrega da placa', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cada0a8a-0b9b-48d8-b053-1bfc4679274b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-05-19', '18:30', '20:00', 'scheduled', 'Última sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('35ff8447-af77-478d-a9c8-fec747fa6b10', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-05-23', '20:00', '21:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6cb8a867-96fb-40ca-acd4-ff583c9c4bd0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-05-21', '18:15', '20:00', 'completed', 'bioestimulador', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c5f15d79-08e4-4505-8a6f-a129a06bc58b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '661c1452-b95b-4087-9954-b4920884a36d', 'Helena Farias da Silva', '2025-05-21', '20:00', '21:00', 'completed', 'Avaliação para Sou Smile', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d01ab50f-8ce3-41a0-a327-b74a15bef35c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', 'Éverton Santos Oliveira', '2025-05-22', '12:45', '14:15', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4f875f61-fcac-4296-850e-9c2e6d053884', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '661c1452-b95b-4087-9954-b4920884a36d', 'Helena Farias da Silva', '2025-05-23', '18:00', '19:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('efaae5eb-3d1e-49bb-8301-2bec829c27f5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-05-23', '18:30', '19:30', 'completed', 'ultima sessão do clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8c9b76e8-628c-40cb-98fb-ae9436574125', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-06-18', '16:30', '17:30', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('49a773a5-24d4-4465-b343-439def8ad4ce', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-06-09', '12:40', '14:40', 'completed', 'RESINAS 12 e 21', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('242c4546-4ead-4280-84d6-7f887acc8a91', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-06-11', '21:00', '22:00', 'scheduled', 'planejamento Gi e  noivo', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('865d80df-f245-4bac-b211-f5c6d681bc7a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2025-09-16', '20:00', '22:00', 'scheduled', 'Dente fraturado', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ae85ee59-af6e-420b-a904-c89961fb1201', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ff582bde-36f0-46a4-990b-ac14e22dcb5d', 'Maria Paula S C Oliveira', '2025-09-17', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('04b99876-e213-4967-8a3b-36ee1b694c4a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-06-11', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7bc6af92-863e-42ae-bbf5-eb08b46eaac4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8326366a-4ad0-43a4-b7fb-27bcadcc0928', 'Denilson Bonfanti', '2025-06-06', '18:00', '19:00', 'scheduled', 'primeira limpeza e botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3b2e881d-c5ba-447a-951d-aeac82d5cda2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '66522905-8b81-47d2-b5bd-d0a3f677ba4a', 'Bruna de Oliveira', '2025-06-06', '19:00', '20:00', 'scheduled', 'Botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3d6ad765-601c-4b3a-ba6c-5bc3756fd152', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd16be994-37a2-4efd-93a9-68eae6db8cce', 'Luciana Martins de Souza Mache', '2025-06-25', '17:00', '18:00', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9968cf7f-7880-49e2-b055-6bac72e65bc6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd16be994-37a2-4efd-93a9-68eae6db8cce', 'Luciana Martins de Souza Mache', '2025-06-04', '17:45', '18:45', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('250045ae-217f-4df2-92a2-dd16762e5407', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3571dcf2-89f6-4ea5-a34d-828b25f83756', 'Matheus Wesley Correia da Silva', '2025-06-06', '11:30', '12:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5a811479-7201-4cfa-91d0-7a3e3c2bfef9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '969ef36b-e9b7-4513-830d-ed2610a7b4cd', 'Ramon Bonfanti', '2025-06-13', '18:30', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1325f350-55db-4f4e-be1b-034c7481b7a8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7b385cdf-df15-46f7-a2fd-b6fb52569a3c', 'Valdemar Bonfanti', '2025-06-13', '14:00', '15:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('52b435f3-62f2-4401-b4a0-c97589d3b97b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-06-12', '17:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ed380c50-7022-4110-8682-f33583d31b43', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8326366a-4ad0-43a4-b7fb-27bcadcc0928', 'Denilson Bonfanti', '2025-06-13', '20:30', '21:30', 'scheduled', 'segunda sessão de clareamento e ver o botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('766c15aa-5461-444e-868c-44be5fbe1d0a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c39ed232-c153-47f0-9964-f2b66e909271', 'Matheus Susko', '2025-06-25', '19:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b6f840fd-28f6-4045-bad5-11c4812a7c6c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'df9c56f4-8854-48a0-ab6a-9deaf88b431e', 'Cláudia Fernanda Barboza Girardon', '2025-06-02', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5071a003-05c0-473c-8183-e84a8c699165', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '66522905-8b81-47d2-b5bd-d0a3f677ba4a', 'Bruna de Oliveira', '2025-06-13', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('64ced6a8-6856-44da-9a1e-ebe3cb76a77d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2025-06-11', '20:00', '21:00', 'completed', 'quarta limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4deb65bb-19eb-4673-a764-645052bd642d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c81d4301-d1cb-4352-9614-42d2696cd165', 'Elivelton de Faria Santana', '2025-06-26', '11:30', '13:00', 'completed', 'Exatração dos Sisos 38 e 48', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f39e30ee-7506-4714-ac54-c7dd9ef3759a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c39ed232-c153-47f0-9964-f2b66e909271', 'Matheus Susko', '2025-07-07', '19:00', '21:20', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8ce45847-3173-456b-9cfc-f30296117e6f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '317cc99b-403a-4bca-98d7-654511590c0a', 'Nataly Brenda Cieslinski', '2025-06-25', '17:00', '18:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('801d965f-3962-4023-8b30-0a74254c8d0e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7b385cdf-df15-46f7-a2fd-b6fb52569a3c', 'Valdemar Bonfanti', '2025-07-04', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d6876963-3f51-4f88-af1c-be35a3e14e3e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-07-10', '20:30', '22:30', 'scheduled', 'avaliação dela é do marido', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b1d04493-c539-4abe-bdb1-81ef46066678', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-06-30', '20:00', '22:00', 'completed', 'SEGUNDA LIMPEZA', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('aac27098-e902-4e22-ba6a-f976bcb41e6c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-08-04', '20:00', '21:30', 'scheduled', 'terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9d458ad6-eacf-49eb-85eb-edf2ca216461', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-10-22', '19:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('13ced5a2-6af9-44f5-89bb-fa6ab51a6b80', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c81d4301-d1cb-4352-9614-42d2696cd165', 'Elivelton de Faria Santana', '2025-07-07', '18:00', '19:00', 'completed', 'remoção de pontos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('57a3b213-dd97-4f9e-aa20-ff2d248e3506', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-07-21', '19:00', '20:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dfe2f949-dc54-4fdb-8fe7-1cef30e9a34a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c81d4301-d1cb-4352-9614-42d2696cd165', 'Elivelton de Faria Santana', '2025-07-16', '18:00', '19:00', 'completed', 'Remoção de pontos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('83e1b62c-aa20-45f2-993f-f1c24db5fe81', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e4cd49a-c974-424b-9d29-fc62d8284d85', 'Celía de Fatima Susko', '2025-07-23', '18:00', '19:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f72050fd-d38b-43db-9ca9-96d2f6286a18', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-09-16', '18:00', '20:00', 'completed', 'segunda sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('10a1eab7-f0c8-4a7c-a6dd-6e665f7711e0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2025-07-17', '12:00', '14:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fdc5bc4e-bf43-4d4b-b984-e889b60e3ea4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b8578ce5-7a78-4833-a06d-5f5a7270a1f4', 'Rosemeri do Santos Ferreira', '2025-07-17', '17:15', '18:00', 'completed', 'RaioX', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('176db152-8290-45fb-87c7-56f1b5f7aac0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-07-16', '21:00', '23:00', 'completed', 'Limpeza e clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1e6bc909-9cd8-41c5-bcd4-3d194366f460', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-07-16', '19:00', '20:30', 'completed', 'troca do clareamento ou fechar o acesso', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('99275ca7-35f8-41f0-af2d-fc080e6a2646', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-07-18', '11:30', '13:00', 'scheduled', 'Segunda sessão, de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5a802dbb-a34c-4a0d-b359-a12e238f9d8d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-07-16', '14:00', '15:00', 'completed', 'última limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('14b7227a-1a41-48cf-a909-83d5c3ecdefe', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'df9c56f4-8854-48a0-ab6a-9deaf88b431e', 'Cláudia Fernanda Barboza Girardon', '2025-07-14', '21:00', '22:00', 'cancelled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7b8dd28e-a8e0-4dd9-8640-e26b6dbb039e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '339d64a7-c351-4608-982b-c454b3d9da35', 'Isabelle Vitória Kusma Pyerl', '2025-07-21', '16:15', '17:15', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2b9bea9d-397b-435e-b38b-e25546944078', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-07-21', '17:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8cc65ef2-a6fb-4389-875c-cb593f4d1cac', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c81d4301-d1cb-4352-9614-42d2696cd165', 'Elivelton de Faria Santana', '2025-07-24', '18:00', '19:00', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8731c3a2-373e-44ce-b115-00093dae8c37', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-07-23', '19:00', '20:00', 'scheduled', 'restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a657c544-f7e9-4531-9fab-6a10b9429d78', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-07-28', '18:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('eda10511-4466-4d9b-baa8-11c4e6fb922c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-07-23', '17:00', '18:00', 'completed', 'segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d53573a2-1c56-457d-bcf0-80639e334cf8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', 'Tiago Marques', '2025-07-23', '20:30', '21:30', 'cancelled', 'quinta limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0d6d1670-3b41-4eae-8f15-10a000da6897', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-07-31', '17:00', '18:30', 'scheduled', 'remoção de attachments, remoção da resina do pré + entrega das seringas. requisição para o escaneamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('aae51597-5aa8-47f5-acac-c5ed19f52ef4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2025-08-06', '18:30', '19:30', 'scheduled', 'Remover o clareamento palatino e fechar de vez', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e539a41c-052b-48b0-aafe-874336c362a0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '84819211-94af-4341-9833-0e8fbe086421', 'Adriana Luz de Castro Carneiro', '2025-07-23', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('72116d66-a56b-4fd1-9f12-f60d6d419842', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6b8cf555-be3d-4543-97ad-81469c5b7a15', 'Abner Emereciano da Silve', '2025-09-17', '18:00', '19:00', 'scheduled', 'Retorno do clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('75b0b0e0-834e-480b-a40b-3eeb0e97f114', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c17cf794-d778-4724-a5af-e0ab3eaae24d', 'Giovana Dubiginski', '2025-07-24', '19:30', '20:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3eb21ab2-200c-4161-8077-5fd154ff8b5a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '82d36231-6824-45b9-94ab-f8522bb162b5', 'Eliani Maxmiano', '2025-08-01', '19:00', '20:00', 'scheduled', 'Colocação do provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dbad6903-7f15-4d7c-ad7e-ed8dde48f025', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a91d2816-d10a-430a-a0c8-d141ee7746d5', 'Salete Aparecida dos Santos de Oliveira', '2025-07-30', '18:00', '19:00', 'scheduled', 'limpeza e reavaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('87bff6e7-3eb1-4d9f-ad9b-e21eed248335', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2025-07-28', '15:30', '16:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('381bda7d-965c-451a-89ef-f93ba5e4a6af', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2025-08-04', '15:20', '16:50', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('77db3fca-baf7-444c-9151-797f469e58ff', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-08-12', '18:00', '19:00', 'scheduled', 'Retorno Botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('874b1bbc-de85-42cc-926e-204bef35d118', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-08-27', '17:00', '18:00', 'completed', 'Terceira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8a748543-da6e-40c7-b2e1-6c268e79b60d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '84819211-94af-4341-9833-0e8fbe086421', 'Adriana Luz de Castro Carneiro', '2025-07-30', '21:00', '23:00', 'cancelled', 'Limpeza e restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4c02bd0b-d381-4cb1-8721-cdb967040a83', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2025-08-14', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('85407c24-8350-49e0-8f9a-8347a40669ee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2025-08-12', '17:00', '18:00', 'scheduled', 'Refazer o clareamento interno', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7329acd0-9d07-4c9f-954a-d486b38c8aa7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-10-13', '20:00', '21:00', 'scheduled', 'Quarta e última limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cc07a068-d34d-4bb5-a326-a39d87037cd8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', 'Elza Sofia Ott', '2026-04-15', '17:45', '18:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fb4089d5-1fdb-432a-b9b9-b8b275d541cc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2025-08-12', '18:50', '19:50', 'scheduled', 'Andre', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('57f6f475-0ac7-4e54-909c-c86eb9ecb9a2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '48444d61-53e5-4d33-a400-d7c175839294', 'Andre Castrianni', '2025-08-20', '13:00', '15:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5cac96a9-955b-41fa-94ae-451d0aeff3bd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aae9a5b0-c99e-412e-b319-0fbc9d1d7c19', 'Allan dos Santos Gonçalves', '2025-08-18', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fe78beaa-71eb-453c-bda9-917f5ecc4d74', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b98c7e22-2e16-402b-8bc1-bbd48c31e561', 'Joyce Amanda Barbosa', '2025-08-18', '20:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('74ff76e6-3894-4960-aa92-ecc545ebec32', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-09-26', '11:00', '12:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2323e137-6fe1-40b2-9770-3bd324b288ef', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-09-22', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('07d312b9-794b-4c85-a970-d2f396235f3b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ef9505a4-2278-4337-b77d-e5c3e34d00d1', 'Naira', '2025-08-25', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('62544920-6199-4b68-a3c9-554817bd13b2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b98c7e22-2e16-402b-8bc1-bbd48c31e561', 'Joyce Amanda Barbosa', '2025-08-27', '18:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('487871bf-d37b-489c-bbfc-1ee2da8fe225', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ebd42346-e7f9-4483-99dc-97de4214d23c', 'Raquel Kampf', '2025-09-11', '20:00', '21:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2c3e24cf-ab8d-42ae-9811-fcdf09c5b88e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-08-27', '18:00', '20:00', 'completed', 'limpeza e clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('11cbd1d5-c812-4915-a816-c8c1e477c637', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ff582bde-36f0-46a4-990b-ac14e22dcb5d', 'Maria Paula S C Oliveira', '2025-08-21', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('682a258e-0689-4fc5-b2f7-de978eabb63d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-08-25', '21:00', '22:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5b1e24c7-1d3a-4b4b-9168-86939b58fea0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ff582bde-36f0-46a4-990b-ac14e22dcb5d', 'Maria Paula S C Oliveira', '2025-08-27', '11:00', '13:00', 'completed', 'Provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('06ab8848-d130-4d2c-ac5a-4eb51f3db551', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2025-09-08', '19:00', '20:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c7ed6d60-17aa-4a0b-ae28-bb151bc1386a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3571dcf2-89f6-4ea5-a34d-828b25f83756', 'Matheus Wesley Correia da Silva', '2025-08-27', '20:45', '21:45', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cd48d8c6-1e66-4dfe-9f8c-56cde8d5d738', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '48444d61-53e5-4d33-a400-d7c175839294', 'Andre Castrianni', '2025-08-27', '13:00', '15:40', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('58bb603a-4d09-4bdf-9c91-d00ab480f132', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2025-09-25', '12:00', '14:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9b434bcb-9a13-46c5-af5e-ecc23b7b505e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-09-24', '15:30', '16:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d532a7a5-dae6-4dcc-a02a-7c65014f1d9b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '61813a3c-7407-4dd3-8e9a-2127be0f0490', 'Julia Saad', '2025-09-24', '17:00', '18:00', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2f019843-099b-4c52-a1f4-f745f8b73be4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-09-24', '19:00', '20:30', 'completed', 'microagulhamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6700d604-14b4-4247-809d-edf9ba1e0478', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-09-25', '18:30', '20:30', 'completed', 'Parte superior', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ecd32615-3230-4ff5-976a-251ef1490bbf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '79d7c4d5-56f7-47da-8b6c-c68ea8d17246', 'Patricia Lourenço da Silva', '2025-09-25', '21:00', '22:00', 'scheduled', 'avaliação inicial', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('943ffa3c-744f-4554-a663-586a04426d18', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-10-09', '11:00', '12:00', 'completed', 'Remoção da contenção + duas restaurações 14/15', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('63ff7c7e-7a3e-42a8-b144-143aae42ce6e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2025-12-11', '11:00', '12:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d6339aad-be74-4e62-8793-3c9be8e73dca', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e6facbe7-e197-429e-af83-380eaf9654a6', 'Alanis Matzembacher', '2025-11-05', '13:00', '14:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0d975411-f146-445e-9739-a981627d034e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3983dfeb-8056-4694-897f-0cc35b43743d', 'Caroline Kerscher', '2025-10-13', '14:00', '15:00', 'scheduled', 'restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bb8ba63c-5725-4468-a020-c68b718ad246', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd90aad48-e084-446b-8297-1846acde64e1', 'Vó Antônia', '2025-10-10', '17:00', '19:00', 'scheduled', 'rest 42 e 43', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e5dea0eb-6484-4de3-8433-41d8a5e4984e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', 'Alcione Uniseski', '2025-10-13', '12:00', '14:00', 'scheduled', 'Proteses e restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c0939e89-cbfb-4b37-8b31-7e2e59946949', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2025-10-09', '12:30', '13:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5f4ea0f1-6c33-44a2-89ec-2ac2addf1302', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-10-02', '13:00', '14:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('322edcdf-9f49-47e3-a0e5-2e16f9128a55', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-10-06', '18:00', '19:00', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f52bb61f-14d8-4967-af97-2e40b45159bc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2025-10-01', '20:00', '21:00', 'completed', 'Limpeza -- avaliação de como ele está indo sem mim', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('72905862-c870-4320-b468-90a94d72dd26', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-10-01', '21:00', '22:00', 'completed', 'preparo e provisório', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a0271325-0afa-48ff-937e-d6ef0110a15b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-10-06', '13:00', '14:30', 'completed', 'rest.', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b1a5a867-614a-45fb-81e9-608f10aa6b08', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2025-10-09', '13:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b19fbf9c-a83e-49fb-a526-33eeef5cd175', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2025-10-08', '11:30', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9efcb9d3-a9b5-4ced-848d-44717fbedf80', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2025-10-30', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('abdfc0c5-f205-46b8-a660-209f807ec431', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-10-06', '19:00', '20:30', 'completed', '4 e última sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('673962ad-2490-4d52-8d6a-096ad374a247', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2025-10-09', '15:00', '16:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f15af937-1aeb-41d1-a1cf-bf7da9018cb1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2026-02-04', '13:00', '14:00', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('31abb940-3848-4a34-a272-f6ada5d93521', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-11-17', '20:30', '21:30', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a12c735f-79cc-4853-858e-50cacd990664', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-10-22', '19:00', '21:00', 'scheduled', 'Restauração = peeling', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e59c4e5c-7529-4718-9c4a-16de2aa6479a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-10-16', '12:30', '14:30', 'scheduled', 'amigo careca', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8b539089-1362-4c1f-8219-7ed91eaed20c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', 'Flávia Orlandine Capristo', '2025-10-15', '18:00', '19:00', 'scheduled', 'fechar o 22 de uma vez por todas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3730f1fc-2e49-4de9-b13d-883dcf4fcce3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2025-10-15', '13:00', '14:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ff50e089-0803-4dd0-bd30-322dad91bbab', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2025-11-20', '13:00', '14:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('250c9e52-2af4-454b-8f54-9ae2febbdcf3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2025-11-21', '13:00', '14:00', 'scheduled', 'Segunda Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f6d6390b-b60b-4a0a-bc13-1fc82a904201', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-10-20', '19:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5143fabb-a320-4262-97ea-3364d8fbc755', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', 'Alcione Uniseski', '2025-10-17', '20:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d6bd6063-4698-4c50-a5fc-180b5cc9db2e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2025-11-21', '19:00', '21:00', 'scheduled', 'caninos', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2eb6e6c4-dcda-43b8-b975-dd3fa236623f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', 'Isabela Rafael Botelho Brizola', '2026-03-13', '20:00', '21:30', 'cancelled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d55cddd8-bdb4-4d4c-81a2-ef5db67f13db', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2025-10-22', '13:00', '14:00', 'cancelled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('502b40bc-1188-4384-ac51-34df1ef1691c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2025-10-15', '17:00', '18:00', 'scheduled', 'avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c4a688d3-bdb1-4890-a297-82fa761cc1cf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-10-16', '18:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7dfc11f3-37f4-4eee-8e55-573ad577fdd8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2025-10-24', '19:00', '20:00', 'scheduled', 'terceira sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('de6e9cc8-8d33-4bdb-a9a6-ba8d41a3644c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2025-10-20', '21:00', '22:00', 'scheduled', 'Rest. 44 + contenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6a57d261-7442-4c8f-917e-f1250c0acffd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', 'Alcione Uniseski', '2025-10-24', '17:00', '19:00', 'scheduled', 'restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('10c697ba-0526-4c3d-acac-adae5ee8ee5b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4ddf8ded-3a53-4c0a-b0d9-e87cf1a81192', 'Rafaela Vieira', '2025-10-20', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3449e664-89a4-464f-8dd8-b78b324db711', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-10-03', '13:00', '14:00', 'completed', 'Primeira limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('85225224-1d5f-407d-ac07-8be41a76028a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-10-07', '21:00', '22:00', 'completed', 'Terceira sessão dde clareamnto', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('80cd5ace-e921-4f9e-bc2e-d41a64cf558e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'f76f1eee-aab3-4026-b1bd-60428cf85ce1', 'Rose Eickhoff', '2025-10-23', '12:30', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d40f4bc7-b42c-4c34-b741-10a1dddfca4b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '436e6f97-a149-402b-96c6-42eddfcf5646', 'Luís Gustavo Eickhoff', '2025-10-20', '12:00', '13:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7d8502d9-8457-431f-90b9-e969c6f0e5f3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'cdee6000-3f7b-4e90-9db3-a38c01e4ebbc', 'Lisa Isabella Fischer', '2025-10-23', '13:40', '14:40', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4552ed84-aa7c-4ef7-9cb5-306fac2a0d4a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ec07e624-5568-4066-b901-1d4df9727744', 'Gilmar Dias Feliciano de Oliveira', '2025-10-22', '12:00', '13:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('791a2b07-8176-4a78-87f8-b3adda0d599f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '73b9563e-97bb-4975-b136-4a2985068ec5', 'Giulli Andretta', '2025-10-27', '20:30', '21:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dd505e93-2e4b-4829-b02d-1588f8d75cbb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2025-12-01', '12:15', '13:15', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('702bdf60-ddd9-435e-9c7e-21fd7cbbff77', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd43621ae-8c82-47b0-88f8-0170352be0c4', 'José Victor Amorim', '2025-10-22', '13:30', '14:30', 'completed', 'segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0152dd65-80ee-431f-98da-c4838b37105c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2025-10-29', '13:30', '14:30', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('33faea58-463e-4bf6-8dfa-f9f68d8f42b2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2025-10-29', '18:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('df26455a-7c00-476f-b436-0d230a5a10f1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'cdee6000-3f7b-4e90-9db3-a38c01e4ebbc', 'Lisa Isabella Fischer', '2026-02-25', '14:00', '15:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cdfe7a34-2397-441b-9032-afdbff833e6a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-10-27', '19:00', '20:30', 'scheduled', 'clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('68d16484-877b-4742-a6f1-564fedc7bb96', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', 'Alcione Uniseski', '2025-11-03', '13:45', '15:15', 'scheduled', '14 + limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8cb991ad-e869-44ed-9cc8-ab33272fce0c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '62c6c756-46e0-4138-a451-a84f22c24775', 'Israel Francisco Acunha de Vargas', '2025-11-03', '11:30', '12:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5f88d4ea-9914-4219-a6c8-ed60c4cc03f0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '32a577db-8974-4752-959c-c876d2d72163', 'REUNIÃO MKT', '2025-10-29', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a63ba708-9d55-4b04-8549-002e7174144a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '73b9563e-97bb-4975-b136-4a2985068ec5', 'Giulli Andretta', '2026-08-12', '13:00', '14:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a91b47d5-1b30-472f-b32d-47f79b7baa10', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2025-11-26', '12:00', '13:00', 'completed', 'rest. 26', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c123fba2-ce03-4ca9-bf57-15dc00ed760b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-10-31', '13:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6989b374-926d-4bd8-9567-08353c45ac8c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2025-11-03', '12:00', '13:45', 'scheduled', 'último clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('23f17225-d702-4863-995b-81552de1acea', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-11-10', '14:00', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('edb44d80-d3bd-435f-8beb-8e9fe8ecf662', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7deadc27-488c-41f7-8d9f-9b37736f8b78', 'Oldemar Antonio Brighente', '2025-10-31', '18:00', '19:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f473b5a4-90e1-4eb7-8da3-026fcf415efc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-11-03', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('29940c48-7a84-4125-b8f8-11ef3b4fbfb3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2025-11-05', '18:30', '21:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('72da69b5-f0bc-47ee-82c4-3e3800c82dec', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'cd898351-8afa-4038-a1d0-7f57c6182240', 'unhas e sombrancelho', '2025-12-18', '19:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1c557121-ea0f-439e-aceb-32f6b44f17f0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2025-11-27', '19:00', '21:30', 'scheduled', 'Inicio das facetas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a5cf81c0-5175-4bed-93a4-d7635581b8f7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2025-11-28', '17:00', '19:00', 'scheduled', 'Ajustes', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c82d82a4-aa38-43e8-8e0a-604e2831dd09', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-12-10', '13:30', '15:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e084562e-c84e-45da-b6c9-bc9156ba5396', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '5187bcf1-8726-4cad-b287-d707d8702dee', 'Giovanna Gonzales Dalmora', '2025-11-10', '20:30', '21:30', 'scheduled', 'restauração + clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f3a18c60-40bc-431b-b38b-45fef957dc44', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2025-11-10', '19:30', '20:30', 'scheduled', 'limpeza Luciano', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2cb99ec9-ef5d-4111-957d-ba3264bcd7b6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c6d60903-c3ee-4dbf-a1e9-b90fbd3ed91a', 'Rosiéli Raymundo Plaster', '2025-11-17', '18:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f3b4e946-d591-43a4-b8f5-2b75404a69b3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '5187bcf1-8726-4cad-b287-d707d8702dee', 'Giovanna Gonzales Dalmora', '2024-12-13', '11:30', '12:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('42d2c360-562a-40e1-ac4a-e858b0b025fa', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2025-11-27', '12:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('89631b2c-4d1b-4829-9efa-983836de66ac', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2025-11-26', '19:00', '21:00', 'scheduled', 'Sessao de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('04d746d2-a35f-46a9-8501-9cf0ebb80248', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-11-10', '20:30', '21:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5f35a6c7-f7a8-4cc5-930c-ceb60f917426', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2025-11-12', '14:00', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ee9a83e4-ba6c-4a7d-88f1-a4ce57593ba5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2025-11-21', '18:00', '19:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e754639e-44b8-45b7-9eeb-5a95dcffaf3a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2025-11-10', '19:30', '20:30', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0782ea5d-c36d-472c-8864-4ae959217915', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2025-12-17', '18:00', '19:00', 'scheduled', 'LImpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2ab61556-d343-4993-bdcf-2137009a9ee2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-11-20', '14:00', '15:00', 'scheduled', 'Segunda sessão', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('903aed2e-a6d6-4553-9906-dd7427d8aba6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7deadc27-488c-41f7-8d9f-9b37736f8b78', 'Oldemar Antonio Brighente', '2025-11-12', '13:30', '14:00', 'scheduled', 'apresentar planejamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dde59e18-d6fa-4d2f-a158-99a761c65252', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-11-17', '13:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('be1b3b4a-314c-4671-b7ae-41ec4d025440', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '61813a3c-7407-4dd3-8e9a-2127be0f0490', 'Julia Saad', '2025-11-17', '19:00', '20:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9692bd1d-c256-4e95-a569-8bed132a8bea', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'cd898351-8afa-4038-a1d0-7f57c6182240', 'unhas e sombrancelho', '2025-11-21', '16:00', '18:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('191c7ef8-75a4-427d-83a0-fea6873da721', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-12-01', '14:30', '15:00', 'scheduled', 'RETORNO DO BOTOX', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('adcedaec-eb9d-4efb-bbdd-36075343bd49', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '61813a3c-7407-4dd3-8e9a-2127be0f0490', 'Julia Saad', '2026-02-02', '18:30', '20:00', 'scheduled', 'Terceira limpeza --- remover as resinas 42 e 43 palatina e dente da frente', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b3b6f0ef-5998-4ac5-88fe-67802fcdef14', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2026-01-21', '19:00', '20:00', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('af96c1c4-9b7a-43e3-9da2-8c44f302a4fb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '5aec8e64-ee48-4c22-a8b3-cdafebf200a9', 'Dinah', '2025-12-12', '11:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('af07cf07-0a3e-4b4b-996a-6e9b5fb5174e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2025-11-26', '13:30', '14:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c84f03ab-dae9-4777-892b-86006d5a0c40', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-11-27', '14:00', '15:00', 'scheduled', 'clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9501b66d-c09e-4ffb-86b2-a826c1134839', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2025-12-05', '12:00', '13:30', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('76fdc13c-aa71-43a6-b951-bd15cc52bf17', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f362ff1-4d4c-4d6a-b3bf-41d62a33d258', 'Simone Denise Bianco', '2025-11-28', '19:00', '20:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('242c59e4-8a87-4044-a0e5-6dc2e07fbf0f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0cd5b5dd-2c41-476f-8d68-9fefee581fe4', 'unha do pé Jana', '2025-12-18', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a7fbbcfe-f11a-46df-a1e9-8c15f6fafa3a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '31357e7b-267f-4f2d-a795-4e41899dc040', 'podologia Silmara', '2025-12-18', '13:00', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('efa7b97d-f152-4cea-97e1-464f0c26c6f2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2025-11-27', '11:00', '12:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('62c07a49-cbe6-4b04-9b8e-2085da85fac2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2026-01-15', '14:00', '15:00', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('61db42e7-9381-4cd9-8110-72b6d9520479', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2025-12-04', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a60b0665-b26d-4135-b13c-4859e7318f29', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'af84440e-9f9c-4117-82a6-f25614565983', 'Yasmin Jansen Hanysz', '2025-12-05', '20:00', '20:30', 'scheduled', 'entrega do clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3a5d49a6-9e7d-4573-bcc9-baa242a3ca20', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ab0d8504-dae1-4a15-92c2-87d43f855277', 'Djenifer Lilian Prestes', '2025-12-05', '19:00', '20:00', 'completed', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ffead0d3-9b48-4b50-879e-ac69e9a34f4d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2025-12-05', '18:00', '19:00', 'scheduled', 'ajustes', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bfe5c51d-8229-4395-a04f-f9ed787592e6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '07ebb0a5-b88d-495d-a208-aec6f773ab6d', 'Paola Borges Fajardo', '2025-12-12', '10:15', '11:15', 'scheduled', 'Retorno botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f6a092c8-ba45-40f0-a9c7-53bf09b66cc6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', 'Renan Felipe Camargo', '2026-06-29', '13:00', '14:00', 'scheduled', 'Limperza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e1daf156-aa17-4e36-9205-bc51d225d9d2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2025-12-08', '19:00', '19:30', 'completed', 'Retorno botox', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a019afc4-e338-4fde-ad0d-ebeefcd49f22', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e06161b2-207e-406b-99ab-4af1bb3eee1d', 'Leticia Pailo', '2025-12-08', '12:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8c43b96c-aef6-4090-9b24-fa120d02ee41', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f362ff1-4d4c-4d6a-b3bf-41d62a33d258', 'Simone Denise Bianco', '2025-12-05', '20:30', '21:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('29c9fb2a-2f14-43f0-b76e-78167325cca6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', 'Evaristo Miguel Blaskovski Junior', '2026-04-24', '12:00', '13:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('12ae14d4-a147-4794-88d7-96cff5237a13', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ab0d8504-dae1-4a15-92c2-87d43f855277', 'Djenifer Lilian Prestes', '2026-01-09', '19:00', '20:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('fc9fa041-c083-47b8-b3e1-2741edb3944e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'af84440e-9f9c-4117-82a6-f25614565983', 'Yasmin Jansen Hanysz', '2026-01-23', '20:00', '20:30', 'scheduled', 'avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('02b17223-c737-46de-9f07-ee106dc13a7b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '707a38bd-54f2-4c2a-a3d9-6d6feae689c7', 'Priscila Lobemeyer', '2025-12-19', '21:00', '22:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('45786518-b04a-49b2-8b24-dc47a55df94f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-12-10', '19:30', '20:30', 'scheduled', 'clareament0\o', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('afbfdc36-7854-4ce1-85e7-07633a429d62', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2025-12-10', '18:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f2c5de67-b76f-4793-a22e-5537f1b89eab', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2025-12-10', '12:30', '13:30', 'cancelled', 'restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4773d81e-ed99-4198-8dd0-1f92e5912a79', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-29', '14:00', '15:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7868b922-41cd-4b72-b92e-722cb683e164', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2025-12-15', '21:30', '22:30', 'scheduled', 'clareAmento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1ec8dafe-aefb-410b-b525-9b8072023a41', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2025-12-26', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e6ac2df1-c4c5-4c1c-bcd7-06655d4bda76', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2026-01-21', '18:15', '18:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('bf6e4979-ca16-4b19-8b7e-3b4691ae3b79', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '867dbf1d-49aa-4983-a74e-645a86deb407', 'Cristiano Alencar', '2026-03-26', '11:00', '12:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4b261bef-8200-48a1-b2a1-ca83aa3ebc52', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2026-02-04', '12:00', '13:00', 'scheduled', 'LImpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f543e132-5baf-4523-adbc-2f77553fbcde', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1cd22015-cb1b-4555-9cbb-f6e066d79205', 'José Carlos Inês', '2025-12-18', '16:30', '17:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('17628bb2-1f68-4a0c-853d-b2102b6cc6f0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2025-12-18', '11:45', '12:45', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('a92e185f-df8b-45b3-ad18-ff51e39e9ef7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0362a595-189d-4403-85d1-053861a7c74c', 'Roberto Quintana', '2026-06-17', '12:00', '13:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b05704e6-7068-4c39-944c-5b4f0d9dd318', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1cd22015-cb1b-4555-9cbb-f6e066d79205', 'José Carlos Inês', '2026-01-21', '17:00', '18:00', 'cancelled', 'Clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cc7aac9f-2099-4111-9e98-052bfc216d3c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'ddc4d99d-6e9a-4244-b9ff-eda9a20fa9bc', 'Mayara Adam', '2026-02-04', '18:00', '19:00', 'cancelled', 'Segunda Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7cc2522a-d24b-44ec-8ebd-52efe60f4036', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '89e1ec75-976b-420f-84bb-ed6a50c37940', 'pedro cic', '2025-12-26', '21:30', '22:30', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('de58ac7a-0bf2-48d9-8a83-7fa02fa641b5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-01-12', '18:00', '20:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('47f8734a-625b-4eba-b8a0-b1684d87a895', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-13', '17:00', '19:00', 'completed', 'preparos e escaneamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('88b3bb66-23a2-418a-9fc9-bbacff68d887', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2026-01-16', '16:00', '18:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('28acbcf6-7097-4058-adf7-7e3ef7905c90', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '560be938-7906-4c3a-9e00-072c38340dde', 'Jorge Barouk jr', '2026-01-15', '19:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7dbe1258-e135-432e-ab34-f5cbc8f293d5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2026-01-19', '20:00', '22:00', 'scheduled', 'EXO DOS SISOS', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1c14569e-1053-4b82-9acf-d567a8bf0bdf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-21', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9147090f-1c75-48a6-a083-f9c3b2cc721a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-16', '18:00', '19:00', 'scheduled', 'prova das facetas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4a83ce66-9262-4b95-b357-208f75c7693c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-01-14', '22:00', '23:00', 'scheduled', 'finalização dos dentes de cima', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ae246150-811c-4c3a-8701-7f1f149ad1fc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-01-23', '19:00', '20:00', 'scheduled', 'Ajustes', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('67f6dd4a-c853-4602-9bba-3e59ed0a1086', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2026-01-15', '12:50', '14:05', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ae815b7d-743d-4794-88f9-c0686230ecee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2026-01-16', '13:00', '14:00', 'cancelled', 'segunda limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('96ec9cf0-a395-46d9-bb64-d9fe22dc29e0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2026-02-25', '18:15', '19:15', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c63ece95-7d5a-43e3-afff-91d893e44179', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', 'Maritza Muniz dos Santos', '2026-02-26', '14:00', '15:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f28071b4-099d-4043-afc2-6e349d5201aa', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2026-01-22', '13:30', '14:30', 'cancelled', 'rest 26 palavrinha', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c743b32e-7788-4a32-a3ad-47242da8e84b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-19', '16:00', '18:00', 'scheduled', 'prova caso precise', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('effbb57a-3230-4a0f-ba44-640b33a1839e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2026-02-04', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9125495f-ad43-48ad-9283-afb5e6d68dd6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-01-28', '11:30', '12:30', 'scheduled', 'prova', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c8758aa3-c95c-462a-9d69-711b1f1554f7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2026-01-21', '20:00', '21:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dba56c5e-d24f-4474-949e-88380ba1cd7d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2026-01-26', '21:00', '22:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('06b22210-708b-470d-9fb2-e8bd985bf98c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e916e68-5fec-4d59-bd67-1924603810cf', 'Ana Luiza dos Santos', '2026-02-04', '21:30', '23:00', 'scheduled', 'Restaurações', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('56aef91c-c74a-4c84-8d6c-72741707d7e0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-03-13', '18:00', '20:00', 'scheduled', 'resina', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('668c60e6-f04b-451e-969b-5ace4ced2c0c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3341da60-6d82-4c06-8cbe-b9209ac93919', 'Thayna Klaumann dos Santos', '2026-01-28', '20:00', '21:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('504791f3-73a6-489c-9c1b-d16c71118515', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'af84440e-9f9c-4117-82a6-f25614565983', 'Yasmin Jansen Hanysz', '2026-08-21', '20:00', '21:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d9e54886-1daa-449a-a0bc-706061f7131a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '73401fb7-c682-4da7-9352-06f591c47fad', 'Gustavo Grossl', '2026-02-06', '17:30', '18:30', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4d11eeca-8ac2-4c32-8311-eddb9f2e986a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2462a256-7ae6-4b62-a418-b3704d6e9f22', 'Diego José Dziedicz', '2026-02-16', '13:30', '14:30', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9edb2771-ee0b-40ee-9041-246b009a5dd7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', 'Alfredo Parodi Neto', '2026-03-18', '12:00', '13:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('aaae16fd-c8d1-48f0-921f-68b8bbb8103e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-06-17', '14:00', '15:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b4dcb21f-b811-40bf-86a5-84ca397cf98c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f362ff1-4d4c-4d6a-b3bf-41d62a33d258', 'Simone Denise Bianco', '2026-02-05', '13:00', '14:00', 'scheduled', 'CIrurgia', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('85fecb5d-e1fa-4d30-98cc-ded33fd25b11', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2026-02-05', '17:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('594f104a-30dd-4eba-8fb3-81cfb77a87b9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3341da60-6d82-4c06-8cbe-b9209ac93919', 'Thayna Klaumann dos Santos', '2026-02-18', '20:15', '21:55', 'cancelled', 'limepza + remover as resinas 23-22-21 e 131211 se tiver --- + mpoldagem do clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('421fdd50-0726-44c3-a2b9-b85396f7e7cc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', 'Thayane Camargo Porcel', '2026-02-20', '16:00', '17:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('39f300fe-2433-4d3a-93b1-ad130333639f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2026-02-19', '11:00', '12:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0ffeae07-40a2-402d-8c15-f49c9b411d7f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1cd22015-cb1b-4555-9cbb-f6e066d79205', 'José Carlos Inês', '2026-02-02', '17:00', '18:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d143383f-3fe8-4a0b-9eab-73cc3b817bce', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '61813a3c-7407-4dd3-8e9a-2127be0f0490', 'Julia Saad', '2026-02-05', '20:00', '21:00', 'completed', 'limpeza e remover o resto das restaurações', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('acc29d87-faca-4fa1-8ab2-8cfb575851f8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '63fd95fb-a940-4b8b-b551-019baf5547d7', 'PERSONAL', '2026-02-04', '23:00', '00:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f65d88ba-f681-44dd-bcd8-4a162cb1854e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1cd22015-cb1b-4555-9cbb-f6e066d79205', 'José Carlos Inês', '2026-02-04', '17:00', '18:00', 'completed', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c4044664-9674-4edd-934d-9d1b9bc56dc0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-02-05', '10:30', '11:30', 'scheduled', 'Prova das lentes', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cacfa2aa-628f-4c7c-84fb-c1f462ee45f8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2026-02-09', '18:00', '19:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('cf0bf370-6d60-495d-a509-2ed7dcfc129f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1cd22015-cb1b-4555-9cbb-f6e066d79205', 'José Carlos Inês', '2026-03-04', '17:00', '18:00', 'cancelled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('696a9633-b21d-4fa5-a163-0713374c1b6e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-04-01', '13:00', '14:00', 'scheduled', 'limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d321995d-337a-4a65-9d56-67b6921cffb3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-02-19', '19:00', '20:00', 'scheduled', 'primeria sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('67ec1540-819c-42eb-9f4b-8c9e4b698c5b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '61813a3c-7407-4dd3-8e9a-2127be0f0490', 'Julia Saad', '2026-05-20', '20:00', '21:00', 'scheduled', 'LImpeza manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('47176079-0a96-46f7-b996-fb09dd0404d0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '73401fb7-c682-4da7-9352-06f591c47fad', 'Gustavo Grossl', '2026-08-07', '17:00', '18:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('256e4013-8a68-401b-9711-eca9e55adc8b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e916e68-5fec-4d59-bd67-1924603810cf', 'Ana Luiza dos Santos', '2026-02-06', '12:00', '13:30', 'completed', 'Restauração', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('82079a71-6dce-4ede-9193-05fba3657fa2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '7f82556e-7d66-464a-be4e-de4370c1ab44', 'Edir Rodrigues', '2026-02-06', '17:00', '17:30', 'completed', 'avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7b68d089-4d3e-49b0-a54c-ca56841c234e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2462a256-7ae6-4b62-a418-b3704d6e9f22', 'Diego José Dziedicz', '2026-02-06', '18:30', '21:15', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c1f6ceda-ad3f-4c40-a6fd-8f8e54f37df6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1ae38cda-9094-4afd-b137-ab1cc3b44441', 'Rodrigo Dziedicz', '2026-02-27', '17:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5984c0e7-578b-4279-a362-44a551c97c6d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2026-02-09', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('414f2fc7-d9dc-453a-b56d-d7cbd91035fc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2026-02-18', '11:45', '13:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6592a676-c2bb-413a-acd6-5ad38e7abe46', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '81aa26ae-ee03-43bb-a583-902db2ab0b92', 'Tatiane Armacolo', '2026-04-01', '19:00', '20:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e4001be5-b633-44ad-a71f-52506e156ebe', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', 'Romena Macedo Ferro Costa', '2026-03-26', '12:00', '13:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('879c7964-2013-4ad7-88ae-47603207d848', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-04-02', '13:00', '14:30', 'scheduled', 'clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('54989908-a9c5-41d5-9e8b-54c0b971ee13', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4da0b4ea-bd76-48dd-94ab-693e5f7cc3e1', 'Sidnei José Souza', '2026-02-18', '14:45', '15:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dd97f8c1-17ef-49db-9157-b2165daff456', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-02-19', '12:00', '13:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6b03502a-bffd-4c06-9a03-07e485756b58', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', 'Alcione Uniseski', '2026-02-27', '20:15', '21:15', 'scheduled', 'troca de alinhadores', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1cc1a2ec-42bd-4cbc-8368-9a30b205cf1e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2026-02-19', '18:00', '19:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1c6cdd21-9df9-4c73-85b7-9b618f06701c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4da0b4ea-bd76-48dd-94ab-693e5f7cc3e1', 'Sidnei José Souza', '2026-02-19', '20:00', '21:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('d91560cc-0d2d-460a-ae2b-fe00507cb5de', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2026-02-20', '13:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f63d1663-85fa-4a6b-8a84-327502546f04', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', 'Giovanna Gonzales Dalmora', '2026-02-20', '15:00', '16:30', 'scheduled', 'COLAGEM DAS FACETAS', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4a45c972-a02a-4771-bf88-9989cd9711a8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '660e1073-20af-4942-8262-7383cf1b3a61', 'Flávia Dalbem Barth', '2026-04-01', '14:00', '15:00', 'scheduled', 'marcar consulta pra começar a mexer no molar dela', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2e366bbc-a780-465e-b688-8f8028fdf55d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2026-02-26', '19:00', '20:30', 'scheduled', 'Clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7f5b9bf0-ef8c-4362-b862-52ba6d49aa31', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2026-02-23', '19:00', '20:00', 'scheduled', 'Lucas site', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2f67cb9b-a2b1-4ad0-b0bc-87212444b4b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '3341da60-6d82-4c06-8cbe-b9209ac93919', 'Thayna Klaumann dos Santos', '2026-03-26', '20:00', '21:00', 'scheduled', 'moldagem + remoção de resinas', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('de6970ed-9a51-4d99-9560-be4b74ab6742', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2026-03-25', '14:00', '15:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('9b6bc3f0-d54f-4a7a-bd04-686c7cdfed0d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', 'Josephine Tannouri', '2026-06-03', '19:00', '20:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7f8fab58-9208-4b02-ae77-e0137cc1cbcf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-03-04', '19:00', '20:30', 'completed', 'Segunda sessão de clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('3f73d4ce-ab6b-47f5-a9dc-24a3056dd054', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4da0b4ea-bd76-48dd-94ab-693e5f7cc3e1', 'Sidnei José Souza', '2026-02-26', '16:45', '17:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7bbfc791-18bc-4548-a166-58aa105df423', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e916e68-5fec-4d59-bd67-1924603810cf', 'Ana Luiza dos Santos', '2026-02-25', '21:29', '22:29', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('dce74512-1799-4013-ad25-6dd448ed9ce8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '19b5ede7-9a9b-482f-8357-503d9bd22f02', 'Thiago Vinicius Lopes de Moraes', '2026-03-06', '13:00', '14:30', 'scheduled', 'Dentes de baixo', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('8bfd43a7-e125-4edd-877f-cc5a03f704e2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e916e68-5fec-4d59-bd67-1924603810cf', 'Ana Luiza dos Santos', '2026-02-20', '16:35', '17:35', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('30822cb1-dfc7-469b-ac61-80ca55fbb9b4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2026-02-26', '20:45', '21:45', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0451e5bb-af7d-4d74-9c3f-ee83f20cd705', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2026-02-23', '21:00', '22:30', 'scheduled', 'restauração indireta', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('21927a5d-197b-450f-a62e-5ba2b0e668da', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2462a256-7ae6-4b62-a418-b3704d6e9f22', 'Diego José Dziedicz', '2026-07-24', '18:00', '19:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('4b685093-5407-48a1-9a31-bf11fab0319a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '250bcb2e-1891-442a-8dfd-9c55b7790792', 'Luciane Nogueira Dziedcz', '2026-07-24', '17:00', '18:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('580b2317-8aa7-469b-b7d9-2167f20c2ce0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '1ae38cda-9094-4afd-b137-ab1cc3b44441', 'Rodrigo Dziedicz', '2026-03-06', '20:30', '22:00', 'scheduled', 'Rest. 40S', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('53186bb2-7eca-43b7-8f81-64bf106e8717', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', 'Neodir Maciel IOA', '2026-02-25', '17:00', '18:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('2e65531f-9a19-4223-9f09-671ec099a37c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '55ffdef5-af94-4693-895c-352ef43c4139', 'Camilly Joly Costa', '2026-04-08', '19:00', '20:00', 'scheduled', 'Limpeza', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('13d96dac-758c-47b1-84af-3ea9fb338191', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '9b4c082b-00c5-479b-99d1-401b1382a441', 'Gabriel Scrupa Lopes', '2026-04-08', '21:00', '22:00', 'scheduled', 'Limpeza 2', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b8915793-7416-4865-bb26-e87227e7cbf1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', 'Josiane Tannouri Armacolo', '2026-03-02', '19:00', '21:00', 'completed', 'clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('1d82763b-efd2-45af-a426-de382c14a82e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2026-03-20', '10:30', '11:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('42abf339-0f37-41b8-9ed3-9a6d418b7f91', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', 'Amanda Padilha Marques', '2026-03-05', '16:30', '17:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('28fd7275-e83d-4d01-963b-f57fd58893af', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6fa83595-8c88-42f4-be3f-0e251949bc9c', 'Marco Antônio de Freitas', '2026-02-27', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0949c669-44f2-46d0-a045-0788160d334b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '2e916e68-5fec-4d59-bd67-1924603810cf', 'Ana Luiza dos Santos', '2026-03-05', '21:30', '22:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('c8777a38-009b-4426-b800-b1d9700c2402', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '0802e1be-51d6-4fce-9865-5df35019a2d6', 'Igor Minami Suyama', '2026-05-27', '20:00', '21:00', 'scheduled', 'Limpeza de manutenção', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('b380a0ae-d408-42a9-9fd7-5156fbea115c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aed06d4e-467c-45db-b1bc-c824f45db998', 'Marcelo Boscolo Fonzaghi', '2026-03-02', '21:00', '23:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
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
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6c735465-ea8a-4107-88fe-ece0c356722b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '01ac73a4-bbda-43c2-9a10-16e634244aa8', 'Daniel Godoy', '2026-03-12', '14:15', '15:15', 'completed', 'paciente com dor', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('ab8ef6a2-38b5-424b-b4ea-e5512ded97a7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '22198903-8a6f-42b3-81c5-1c77807a7241', 'Rafaella Reinhold', '2026-03-12', '11:30', '12:30', 'completed', 'clareamento', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0b22ea49-98cf-4618-9960-17b88e4a0b42', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '92a87080-6802-4569-beec-3cc2bf304f4a', 'Luciano Favilla Bastos', '2026-03-19', '13:00', '14:30', 'scheduled', 'Quarta sessão', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6be3bd1e-0ec6-4828-b959-46dea97a0d7c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'c1f8fee3-062d-478d-80f9-385959c98e29', 'André Pereira da Silva', '2026-04-20', '17:00', '19:30', 'scheduled', 'resinas inferior', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0d7b7d7d-80a5-4e23-a5c2-73c0fe3274bd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'cd898351-8afa-4038-a1d0-7f57c6182240', 'unhas e sombrancelho', '2026-03-27', '14:00', '16:40', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('e8af7049-da26-4022-a53a-b9b120deee3a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '4b1b8d0d-5cfa-4f97-a80b-29f54f4b601a', 'Natanael Silva de Menezes', '2026-04-27', '13:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0c116323-34f2-4f98-b5cd-cf5d12d0e511', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '622a582d-4019-4358-a8ed-17be22988625', 'Bruna Lutz Ferber Pereira', '2026-03-25', '17:30', '18:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('5fa69561-2f8b-4d97-ba10-cef60976faa2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '66522905-8b81-47d2-b5bd-d0a3f677ba4a', 'Bruna de Oliveira', '2026-03-23', '12:00', '13:00', 'completed', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7ffa2805-7fc0-46d6-9709-8493ef2cd10e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'aae9a5b0-c99e-412e-b319-0fbc9d1d7c19', 'Allan dos Santos Gonçalves', '2026-03-25', '18:30', '19:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('0537815f-ee22-44d2-a67d-640f9f431f8e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '5aab6d3e-7302-4fb4-aa2c-9ad1148b712e', 'Guilherme Kubrusly Bezerra', '2026-03-26', '21:00', '22:00', 'scheduled', 'avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('6ccae4ce-2845-47f8-a3b6-7e5ee9a2cc2d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '33bdf4e4-cb8d-447c-b4e7-a3610e876b2f', 'Eric Araújo da Silva', '2026-03-25', '13:00', '14:00', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('f2267be7-6da0-48d9-b4b3-d8fa844e3d3a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', '6f149b9f-26c3-40f2-b718-11ce50f77e4f', 'Reunião ONLINE', '2026-03-26', '13:30', '14:30', 'scheduled', NULL, 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;
INSERT INTO appointments (id, clinic_id, doctor_id, contact_id, patient_name, scheduled_date, start_time, end_time, status, notes, source, created_at, updated_at)
VALUES ('7ff0281b-4451-4e09-a655-47961ac16d51', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5f319bb-2c4e-4fb3-898e-6d1f66d522f7', 'e30d77a5-9999-4c48-814f-544f63ae7564', 'Pamela Souza Vieira', '2026-04-01', '20:00', '21:00', 'scheduled', 'limpeza e avaliação', 'import', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- ============================================================
-- 3. CONTACT NOTES (evolucoes)
-- ============================================================
-- 453 evoluções encontradas

INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2a4282a5-8061-4e38-9aa6-b1c3198c33be', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G2 do dente 14, Rest. RC Classe V G2 do dente 15, Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 14, Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 24, Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 44, Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 45 foram finalizados Vittra unique e DA1 vittra', '2024-12-02T13:54:21.390000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fe2cb643-8ec6-4241-95d1-0088896ed702', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na palatina do dente 11, Restauração em Resina Fotopolimerizável 1 face na palatina do dente 12, Restauração em Resina Fotopolimerizável 1 face na palatina do dente 21 foram finalizados Vittra unique e DA1 VITTRA', '2024-12-02T13:55:15.352000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7555ea55-0d1f-479c-b3ec-db9824a438e0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-12-02T13:56:16.769000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('015ffe46-f92b-4469-a54e-962117f33213', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G3 na oclusal/incisal do dente 46, Rest. RC Classe I G3 na oclusal/incisal do dente 47 foram finalizadosDa2 vittra e AE2 ivoclar', '2024-12-16T13:44:22.039000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('56566db7-6be8-41e3-bea9-3eb16e987007', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G3 na oclusal/incisal do dente 36 foi finalizado DA2 e EA1 vitttra', '2025-01-13T12:28:18.019000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8fba37d4-bc34-4ad0-828e-9470a3e9b29b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção da prótese cerâmica OD do elemento 15. Foi necessário remover um milimetro de osso ao redor do fundo da cavidade para evitar a formação de gegivite cronica ao redor da nova prótese. A osteotomia foi realizada com broca diamantada esférica e trococonica. Um ponto simples foi realizado no local. E confecção de provisório em resina acrilica e cimentação com provicol. Orientação para passagem do fio com cautela e evitar utilizar o fio nos primeiros 3 dias, somente massagear com a escova!Receita de antibiotico amoxi 875mg por 7 dias &#43; tramadol caso haja dor por 3 dias', '2025-01-27T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ce1c844d-a5b9-4e15-8dcf-8f9ce07d9714', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
O que incomoda é um que esgta com prótese fica inflaamando Escovação duas vezes ao dia e o fio umas duas vezes na prótese, mas certexa que um vez de noite SENSIBULIDADE em um de baixo ---- parou faz um mês -----NÃO SANGRA SAI CHEIRO RUIM NO FIO DENTAL Escova de dente elétrica macia Usa o bochecho listerine whitnening', '2025-12-01T12:31:06.768000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ec34c56b-5334-4b32-9813-0b030df26495', '30a89c67-7497-457f-a887-a56d1d721f6d', '67ca0364-8c71-4aae-b79a-4a7a4417c286', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na mesial do dente 16 foi finalizado', '2024-10-30T21:39:35.723000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('81d3686a-ceaf-4960-aa76-d18fb8fed308', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G1 do dente 11, Rest. RC Classe IV G1 do dente 12, Rest. RC Classe IV G1 do dente 21, Rest. RC Classe IV G1 do dente 22 foram finalizados COR palatina trans vittra Da1 vittra mamelos trans apl a1 gradia &#43; wt gradia camada final', '2024-11-07T00:21:30.300000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('21a70a56-74f4-4af3-b417-9326097d1c04', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Alinhamento dentes inferiores na oclusal/incisal do dente 42, Alinhamento dentes inferiores na oclusal/incisal do dente 41, Alinhamento dentes inferiores na oclusal/incisal do dente 32, Alinhamento dentes inferiores na oclusal/incisal do dente 31 foram finalizados COR WT gradia', '2024-11-12T13:49:06.632000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0179a674-1112-4b92-ae14-121227eb103e', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Gel Clareador &#43; avaliação de placa de clareamento foi finalizado', '2024-11-12T13:49:45.934000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('18b9f941-6c17-4736-acba-af93956de75b', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; Raspagem Supra e Subgengival &#43; Polimento foi finalizado', '2024-11-12T13:49:58.611000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fd07d384-9090-4f96-9f21-487abda75c75', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste Placa de Bruxismo foi finalizado', '2024-11-19T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3240af06-aef1-4287-9dbe-c4b1c9e35a6e', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reparo Em RC Antiga na oclusal/incisal do dente 36 foi finalizado REPARO O36, Vittra Unique', '2024-12-20T17:20:31.664000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a015a464-4dc9-4dde-81fc-d2f4e30c2818', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na oclusal/incisal e distal do dente 16 foi finalizadoEA1 vittra &#43; reparo oclusal no 17', '2025-01-13T14:12:52.513000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7d76d377-e7ed-49a0-b682-08eafe21249f', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reparo Em RC Antiga na oclusal/incisal do dente 47 foi finalizadoFIz também um reparo na oclusal do 46 sem custo Isolamento absoluto, anestesia da gengiva para suportar o grampo 26 &#43; remoção parcial da resina oclusal, ataque ácido, e confecção de escultura em RC vittra uniqque', '2025-01-29T22:43:43.119000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8f6ed790-91a1-4561-9345-5aacfe0e1fb2', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Placa de mordida miorelaxante foi finalizado Moldagem!!', '2025-02-25T12:00:20.699000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f8a07d47-65ff-44a7-8a79-991bb519173c', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste e entraga da placa de bruxismo, &#43; entrega placa clareamento', '2025-03-14T16:02:45.297000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ee00181a-2e88-4b0f-8c69-942f05c19a5b', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Todas as noites.... Mas de manhã não escova.... só às vezesTem alguma coisa incomodando no 14/15 Todos os meses ele passa o fio.... quando ele passa e ve que ta sangrando aí ele cuida... aí quando ele ve que ta com sangue ele cuida de novo eo depois deixa de usar... A lingua ele sempre escova.... Usando a placa todas as noites as noites... ta sentindo bastante conforto... As resinas... ajustar o 11,,,,, mas está tudo perfeito.', '2025-09-15T12:32:45.145000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('913a9991-38ff-4fe7-b337-76c1f18d8ca4', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Sangramento em alguns pontos, mas nenhuma sondagem maior que 5mm.', '2025-09-15T13:44:25.620000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7569bbd8-2853-4655-a5ad-c543bbd3b70c', '30a89c67-7497-457f-a887-a56d1d721f6d', '1e4dde0f-6814-494d-b74d-96d654738039', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Primeira Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado.', '2024-11-05T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7f549b0e-2bdd-4b72-bb5e-4eb83948c028', '30a89c67-7497-457f-a887-a56d1d721f6d', '1e4dde0f-6814-494d-b74d-96d654738039', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na mesial e oclusal/incisal do dente 16, Restauração em Resina Fotopolimerizável 3 faces na mesial, vestibular e palatina do dente 13, Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal, vestibular e palatina do dente 12 foram finalizadosAO3 gradia, AO2, A1, AZ ivoclar, A3 ivoclar', '2024-11-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('40f7887e-ad0a-4ee8-b989-55ab530f449c', '30a89c67-7497-457f-a887-a56d1d721f6d', '1e4dde0f-6814-494d-b74d-96d654738039', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na mesial, vestibular e palatina do dente 22 foi finalizado AO2 Gradia a2 ivoclar', '2024-12-09T23:11:12.033000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ed78abe7-02a3-4a4b-8d51-35cef9b461ae', '30a89c67-7497-457f-a887-a56d1d721f6d', '1e4dde0f-6814-494d-b74d-96d654738039', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Esta com dor e abscesso com pus na região do 14, onde tem uma raiz residual vizivel no raiox. Receita de amoxicilina 875mg &#43; toragesic sublinguel', '2025-02-10T22:23:33.250000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7107fcc3-b43e-4f6d-84d8-53aac999fdbd', '30a89c67-7497-457f-a887-a56d1d721f6d', '1e4dde0f-6814-494d-b74d-96d654738039', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2025-02-10T22:24:46.426000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('196b66e7-0c2a-438a-adb6-f583c2478ef0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b4ab2ee8-3020-4788-9a19-a5221db66c04', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-11-04T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('46e993d5-5681-4330-9434-e15ca227bf7e', '30a89c67-7497-457f-a887-a56d1d721f6d', '622a582d-4019-4358-a8ed-17be22988625', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; Raspagem Supra e Subgengival &#43; Polimento , Rest. RC Classe II G2 na mesial e oclusal/incisal do dente 46 foram finalizadosClasse II difícil, paciente foi avisada que se sentir que ainda entra alimente a gente vai tentar fazer de novo a parede mesio vestibular, pois ficou com um espaço grande na ameia', '2024-11-07T02:25:15.289000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a2c8f856-e134-46f1-8210-3161e33ec090', '30a89c67-7497-457f-a887-a56d1d721f6d', '622a582d-4019-4358-a8ed-17be22988625', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Entrega dos alinhadores 01 até ao 06 e attachments', '2024-12-16T19:59:12.805000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('175bdef8-f98b-4bb0-840c-b784f1b64abc', '30a89c67-7497-457f-a887-a56d1d721f6d', '622a582d-4019-4358-a8ed-17be22988625', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Entrega da segunda metade dos alinhadores!! Fotos e envio para o site,', '2025-03-17T21:35:27.117000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7807ba8f-132e-46b8-8081-9bebe123b6ce', '30a89c67-7497-457f-a887-a56d1d721f6d', '622a582d-4019-4358-a8ed-17be22988625', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza Está gravida de 6 meses -- Estava com gengivite generalizada -- Entre 44 e 45 com um cálculo subgengival', '2025-06-18T17:49:49.957000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e2a277ee-8195-4083-b66a-8347ef8204d5', '30a89c67-7497-457f-a887-a56d1d721f6d', '622a582d-4019-4358-a8ed-17be22988625', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2025-06-18T17:54:42.061000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('64dbc1c0-2738-4a31-a28a-2f61085c4af4', '30a89c67-7497-457f-a887-a56d1d721f6d', '226f0e17-7ad5-4e45-92f3-8d44293722e0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face do dente 11 foi finalizado', '2024-10-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d10fde84-9adb-4c3a-817a-241da0ecb08b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e7aee980-901f-468f-bdd6-dd9db93c25d4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-09-03T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('79cf2da9-dc52-4ad9-8aa4-f816f14e3d3a', '30a89c67-7497-457f-a887-a56d1d721f6d', '479d339e-80e4-4930-8e02-708629653d80', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza, Polimento de Resina Composta foram finalizados', '2024-02-06T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9eff7d96-f0c9-4459-ad18-481755203bb9', '30a89c67-7497-457f-a887-a56d1d721f6d', '479d339e-80e4-4930-8e02-708629653d80', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G4 na oclusal/incisal e vestibular do dente 27 foi finalizadoRemoção de cárie &#43; RC D2 e EA3', '2024-02-26T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f175e526-35bf-4cd7-b4f2-de35ee87bc74', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 48 foi finalizadoA2 T-tric DA2 Vittra', '2024-10-01T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('51b76777-3b5c-40d1-a090-e182a984aa7a', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 48 foi finalizadoA2 T-tric Da2 vittra', '2024-10-01T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0484b6a0-c0e9-4f24-9b54-35271618c674', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na mesial do dente 16 foi finalizado AO2 gradia A2 ivoclar', '2024-10-07T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0a51119a-255d-4514-ae50-b658355697f8', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na mesial do dente 16 foi finalizadoAO2 Gradia A2 ivoclar', '2024-10-07T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9b367afc-c81e-4261-96c3-28b84b4492ee', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2024-10-08T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('481b4c55-3de4-405c-9589-6fa6f260a7e9', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 17 foi finalizado', '2024-10-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f23e7929-5480-46f6-b521-2bc7577d30bc', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face do dente 17 foi finalizado', '2024-10-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d72072a6-a1d2-44c6-9b10-e6e1cc49474e', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 45 foi finalizadoVittra Unique', '2024-10-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8edf56dd-5b28-4a9d-93d6-66be7a70359a', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na distal do dente 38 foi finalizado', '2024-10-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fd490c69-d57f-4763-acad-2067b00a3602', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado Raspagem com ultrassom, jato de bicarbonato, profilaxia, fio dental. Ele melhorou muito a limpeza dental. esta depressivo por causa do filho, mas esta tentando buscar a felicidade de novo.', '2025-02-17T19:54:10.235000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ada035f7-241b-41f9-8386-5cc99332cc7c', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Terceira limpeza, esta com gengivite, mas a limpeza já esta bem melhor, inclusive o halito melhorou muito', '2025-03-17T21:34:52.991000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f33b27d6-21a5-46e2-b411-fd04f3af09bb', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Quarta e última limpeza do protocolo de saúde gengival!! Como estava? não estava bom porque ele teve uma recaida na vida pessoal Sangrando SimCom placa? SIm', '2025-04-29T18:33:04.397000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('25c17b03-ef13-4e50-ae4f-9a304c4fe1e4', '30a89c67-7497-457f-a887-a56d1d721f6d', '7bf77835-1526-4196-88cd-9090a6434e59', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2022-07-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e31e30af-2ad8-4ec3-ba4a-9187b9d0dc9c', '30a89c67-7497-457f-a887-a56d1d721f6d', '77772554-ecd1-45b9-98d4-c4dfc4226388', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado&#43; remoção de resina', '2024-08-27T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9691bb4e-fd7a-4ba5-8ad4-1dfab6142ed2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a91d2816-d10a-430a-a0c8-d141ee7746d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-07-29T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('660feb50-da6c-4743-98a4-e04b6cb5129e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a91d2816-d10a-430a-a0c8-d141ee7746d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-07-29T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('02d8caf7-1127-4c10-9b55-af2ed9e9d72d', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação &#43; Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-09-17T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('696ab442-4ac8-49b3-a68f-dab1c70a1c11', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
PRIMEIRA Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-11-06T14:15:36.506000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a9807bf1-3720-4db1-9096-ff73f76e1942', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na distal e palatina do dente 23 foi finalizado', '2024-11-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('49724fdd-a55a-4a18-98c2-f0ed23e93b03', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 24 foi finalizado', '2024-11-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7ee7406b-10f3-4a98-bc7f-f6c3eeb017a8', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-12-03T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('da77798e-13a6-46b6-a8fa-c7543d928795', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na oclusal/incisal, distal e vestibular do dente 14, Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal e distal do dente 15 foram finalizados vittra unique e floww', '2024-12-03T21:31:18.961000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e3a0190b-312b-49f0-9642-92b4b027e270', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Fio dental -- tenta passar todos os dias --- gengiva não está sangrando ---- não sai cheiro ruim no fio dental só um pouco ----- umas 3 a 4 vezes por semana ----- passa normalmente a noite Escovação ---- 2x por dia ---- ela comprou uma nova da Colgate', '2025-10-09T12:51:00.416000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d7ba8721-c5e7-4895-8970-0782225fc9a6', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival , Contenção Fixa foram finalizadosBolsas de 6,5mm entre os molares superiores', '2025-10-09T13:54:16.235000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('78d9b0c3-ca63-4f3f-8984-c085fe680592', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G2 do dente 44 foi finalizado Vittra unique-- evicárie --', '2025-10-20T22:04:04.511000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8ccc1f33-6fe7-4aad-a185-dd770b2aeb62', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G2 do dente 14, Limpeza de Protocolo de Saúde Gengival foram finalizadosBastante bolsa, menos sangramento. suspender o periogard e agora só no bluem anestesia &#43; vitra uique 14', '2025-11-26T14:28:34.402000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e67a3a94-680b-43d8-925b-4cf3b4ae8d81', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Penultima limpeza a principioso tem bolsa de 5mm nos ultiimso de cima, ela ta usando bluem m e a escova que eu pedi e usando o fio uma vez por dia de noite. Pedi pra dar uma melhorada na limpeza da lingual do 40s Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-01-15T14:50:59.349000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ce9c7f58-f49d-44ee-badd-e5ed35e489d0', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 4 faces na mesial, oclusal/incisal e distal do dente 21 foi finalizado', '2024-10-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d9c9b2ee-c301-4e54-8fbb-3ca1caf9d46d', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 4 faces na mesial, oclusal/incisal, distal e vestibular do dente 24, Restauração em Resina Fotopolimerizável 4 faces na mesial, oclusal/incisal, distal e vestibular do dente 26, Restauração em Resina Fotopolimerizável 3 faces na distal, vestibular e palatina do dente 23 foram finalizadosFALTOU A FACE VESTIBULAR DO 23, 24 e 26COR AO3 gradia A3 IVOCLAR A3 Bulk FIll Flow', '2024-10-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5515bbef-7320-46fa-a75b-253a7f41b5d3', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 4 faces na mesial, oclusal/incisal, distal e vestibular do dente 25, Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal e distal do dente 27 foram finalizados A3 ivoclar Finalizei a Classe V 24, 23 e 26', '2024-11-11T15:15:44.955000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7f8ef2ec-075c-46c9-bcdf-6cd809317f1a', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na distal, vestibular e palatina do dente 11 foi finalizado Remoção de rest vest/distal/ palatina antiga e troca por nova cor Ao3 gradia, da3 vittra, ae3 vittra', '2024-12-13T19:52:31.870000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('72637693-ad1c-48fc-a1e4-b2a8f3559e6a', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal e vestibular do dente 45 foi finalizado Da3 &#43; a3 vittra &#43; B! charisma na incisal', '2024-12-17T17:52:34.728000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('798716e9-7f5a-4022-afaf-beefc9ffab39', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Quebrou um dente. Em baixo do lado esquerdo, acredito que o 35... Sensibilidade entre o 27/26.', '2025-10-15T13:20:15.652000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9f33f77d-3a39-4883-b146-23ab4eca5c2b', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na oclusal/incisal, distal e palatina do dente 35 foi finalizadoTecnica de tunelizacão. Isolamento total.machuquei o lábio dela com a broca.', '2025-10-15T14:54:23.329000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('46e502b8-f115-4a07-9ad2-1165df5031f3', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na oclusal/incisal, distal e palatina do dente 35 foi finalizado Machuquei o labio dela coma broca. Isolamento total. Removi toda o amálgama. fiz uma tecnica de tunelização', '2025-10-15T14:59:15.166000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ffca3dda-04e7-4ddc-89b2-63d200efffb2', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoLimpeza rap &#43; jato &#43; prof &#43; orientação de higieneEu descobri o que era o que ela reclamava da dorzinha... cervical palatina do 26', '2025-10-29T14:32:24.081000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0ea78f68-d466-4bd2-84fd-4a5481634117', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração provisória do dente 26 foi finalizadoRemoção de gengiva com bisturi 15 &#43; anestesia &#43; civ no local Cárie profunda na palatina, remoção com broca de baixa rotação , e orietação para tomar um ibuprofeno a cada 8 horas, durante 3 vezes. e depois avaliar se o dente fica sensível .', '2025-11-26T13:04:40.781000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b7d7e0b0-0f24-400d-a339-de4a23defb01', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Depois que a gente mexeu no dente 26 ela sentiu muita dor na região da bochecha, em cima e em baixo. inchou um pouco o rosto. Não dói com água gelada. Ficava doendo sempre, e depois passou. Agora não dói mais nada. Eu acredito que era o céu da boca que doia', '2026-02-04T14:01:44.594000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b7ab74f8-9d8d-4aa0-a5f7-48e439316ce5', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G4 na palatina do dente 26 foi finalizadoREmoção parcial do Civ da palatina e reselamento da margem do dente.', '2026-02-04T14:44:04.631000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6c5440be-9288-4025-9b8d-71a35ee78ff9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd07b416a-84c1-4639-8600-d1d2426c97e1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abertura &#43; Medicação Intracanal do dente 28 foi finalizado', '2024-09-17T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('68650a41-3b0f-4fde-b0f8-cf93a034328d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'dd619242-6f83-4bf1-9b4e-57426a38d0ae', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal e distal, Limpeza &#43; Raspagem Supra e Subgengival &#43; Polimento foram finalizados', '2024-10-01T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('60bdf8ec-9656-4fe5-97fe-f307edc4665f', '30a89c67-7497-457f-a887-a56d1d721f6d', '4083d3b1-f04f-45aa-ac60-f2352fb175ac', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-08-05T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a6054290-2189-4d7e-b392-fa4643438b0b', '30a89c67-7497-457f-a887-a56d1d721f6d', '4083d3b1-f04f-45aa-ac60-f2352fb175ac', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-08-05T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('12b26825-ee81-40c1-b6d9-2c2e5246ccaf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e03385ee-a8bb-48f1-8e5d-912d8cb341b1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face do dente 32 3 tubetes mepivacaina A2 &#43; A02, Restauração em Resina Fotopolimerizável 1 face do dente 33, Abertura &#43; Medicação Intracanal do dente 32 foram finalizados A2 &#43; A02 GRADIA', '2024-05-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b47f1fc7-1c97-4e23-9a53-72414773bd99', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado Cálculo nos incisivos inferiores, sangramento entre 17/16 e 26/27, gengiva saudável em um geral', '2024-11-18T12:15:59.112000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fe364c23-fa4c-4f65-b0b0-d00e20ed5f7e', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Bem ficou um bom tempo sem vir mas deu certo Comprou o water peak --- o jato é mega forte Sensibilidade -- no dente que a gente sentia eu consegui resolver a sensibilidade ---- provavelmente na lateralidade - fio dental ----- no banho ele usa (a noite) fita dental Sangra em cima do do lado direito em cima --- Na escovação não sangra --- cerdas macias --- curaprox--- quando vai trocar ela ta toda descabelada --- Com uns cinco seis meses', '2025-05-16T10:36:18.277000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('17326325-d4a2-49d6-a72e-bf43d6e3468f', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizadoEle ficou super feliz que o 45 parou completamente de does, a gente tinha um grande problema com sensibilidade nesse dente e agora sumiiu completamente. A última tentativa de recidiva de dor que eu fiz foi ajustar o dente para não ter contato na lateralidade e foi perfeito, aconteceu exatamente assim.', '2025-05-16T11:35:51.742000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3e4ef40c-8b7b-4eb7-a765-dede9f1ef58d', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-09-26T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('135dab57-1143-4c35-b921-9a65081221d4', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Faz tempo que não passa o fio dental ---- indiquei a o fio dental com haste. ---- Parou de passar ---- passava no banho e agora ele não consegue passar pq o Samuel esta junto com ele --- faz mais de mes que não passa o fio dental --- ELE USAVA a fita da Johnson. ---- Escovação --- 3x por dia ---- gengiva não sangra na escovação. ---- Sensibilidade passou 100%. calculo nos incisivos inferiores ---- e gengivite no resto tudo bem', '2025-09-26T11:11:26.703000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('252649d5-ae6a-4e3e-86d8-ecc7b0c62cd5', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção da Contenção Fixa &#43; foto para controle de movimentação dos dentes. Rest. RC Classe V G1 do dente 16, Rest. RC Classe V G1 do dente 15 foram finalizados -- rest. com resina que não lembro a cor.', '2025-10-09T12:39:39.771000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a44b219d-208c-4913-8de7-409649e818f9', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Esta conseguindo limpara bem melhor melhorou --- mas ainda falta, dia sim dia não. sangramento NÃO... sem um dente em cima do lado direito e sempre incoda. parece ue tem alguma coisa presa em cima do lado direito ELe não está usando o fio dental de haste.', '2025-12-11T11:01:39.665000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1b1a0419-797c-4d1b-8225-c8929514bfdf', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Ele juntou bastante cálculo ali em baixo. Peguei uma escovinha descartável e mostrei como que eu quero que ele escove. Cobrei de escovar a língua também. E falei que se ele voltar com a língua suja semana que vem, ele vai ter que fazer a escovação comigo', '2025-12-11T12:50:42.653000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('dc9622c9-fdb5-4936-b19b-9aa8388f42a3', '30a89c67-7497-457f-a887-a56d1d721f6d', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Romena quebrou o dente.... classe 4, 11 Frequência do fio dental --- usa mais a noite Ela esta muito ocupada.... Perdeu o celular, caos, filho vai fazer um teste de alergia', '2025-09-16T20:28:04.672000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('22507242-ee39-4a20-a5d2-520c7f1cf687', '30a89c67-7497-457f-a887-a56d1d721f6d', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético na oclusal/incisal do dente 11 foi finalizadoA1 palatina,,,,, ao2 mamelo,,, corante azul,,,, a1. vestibularr,,,, ajuste e polimento.', '2025-09-16T21:37:03.709000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9abef720-f77a-44b6-af4c-931b1f468fcb', '30a89c67-7497-457f-a887-a56d1d721f6d', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Protocolo de Saúde Gengival foi finalizadoLimpeza com afastador gengivalSangrou abundante. Indiquei o bluem', '2025-10-09T14:57:56.264000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c2f2afb5-a538-4e07-923f-b075eafbb7ba', '30a89c67-7497-457f-a887-a56d1d721f6d', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Protocolo de Saúde Gengival foi finalizadosangramento -generalizado basntante bolsa, mas melhorou muuuito o aspecto gengival por causa do Bluem', '2025-11-27T11:57:36.309000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0791e081-20d3-49d0-9874-32a5edb4139b', '30a89c67-7497-457f-a887-a56d1d721f6d', '000b97eb-e244-4d41-a648-ae55a95f8e9f', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recimentação de prótese fixa do dente 12 foi finalizado', '2024-10-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fae96761-8933-4dba-878c-8f587f6a03bb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste de provisório, melhorei a cor com a OL charisma &#43; a2 ivoclar e bastante corante pq ficou mt claro!!Aumentei na cervical para dar mais corpo para a gengiva também', '2024-12-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7d5be895-15eb-4b4b-a897-4e1e6e9faab7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção da coroa metalocerâmica do 15 &#43; preparo &#43; confecção de provisório', '2025-01-21T20:47:23.830000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4aae8aae-8384-4ad8-8786-107f7d013b1d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abri a prótese do 14 como se fosse uma prótese parafusada e dei o torque de novo, vamos rezar para deus que essa porcaria fique de boa e nunca mais solte, amem!! Deu me free!! Fiz um limpeza também... deixei ele com restauração provisória no 14 e no 36 de novo pra ver se vai soltar a peça, pq o 36 soltou de novo. ://', '2025-05-06T19:57:20.660000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('16523c8e-8300-4d3f-a1ee-6441d4e8c311', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
EU dei mais torque no implante que soltou, e pasme. ele provavelmente vai soltar novamente, que odioooooooo não sei porqueee :///// ele tava com basicamente 10N quando eu fui dar torque final de novo... não sei o que deu nele o de baixo que era problema eu fii dar torque de novo para fechar ele com resina composta e ele tava paradinho com 32N ainda. Só Deus na causa. o que eu fiz também foi colocar mais ponta de cuspide no 23 e tirar um pouco da ponta que eutinha feito no 13 aquele dia, achei que ele tinha ficado muito caninudo. Achei um sarro que ele disse que as pessoas acham que ele é dentista agora hahah imaginaa!! Bizarro... Usei a OL na ponta de cuspide', '2025-05-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6ea0264c-eb70-4d69-b5a9-fd006c57788c', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal e distal do dente 25 foi finalizado', '2024-07-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('142fee48-dd21-42c8-8738-10b570350578', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na mesial e oclusal/incisal do dente 16 foi finalizado', '2024-07-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ef77cfb0-a287-49cb-b074-68a9c1d7995f', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abertura &#43; Medicação Intracanal do dente 16 foi finalizado', '2024-07-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('44e09549-a4cd-4af8-8fc9-8f3511789b60', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abertura &#43; Medicação Intracanal do dente 25 foi finalizado', '2024-08-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('79b7fbe6-d48f-4a22-bd9a-f6bc15295e1a', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 15 foi finalizado Resina Vittra unique', '2024-08-26T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0e19b1d1-2972-4fc2-8561-c940509e214f', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 24 foi finalizado Vittra Unique', '2024-09-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0ad8f1ea-8889-4515-9de2-24580f71f59d', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 36 foi finalizado Vittra Unique', '2024-09-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('15f6ffcc-88cc-48a3-906a-e49dd4960cb0', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; Raspagem Supra e Subgengival &#43; Polimento foi finalizado', '2024-10-07T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4fc695d7-597e-43f3-98c8-02f745d132cb', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na mesial e oclusal/incisal do dente 26 foi finalizado', '2024-10-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('886b6e89-478b-493d-848c-7aa1c8494379', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção do curativo &#43; nova medicação paramono &#43; coltosol &#43; biplic em ambos', '2025-02-28T12:37:08.022000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9f913375-f930-444f-94f8-4fa69baa26c4', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Estava no cinema e acha que quebrou o dente. Não corta a língua quando passa, sente que tem buraco.', '2025-04-07T11:58:17.948000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('25c8c821-136a-4654-ade2-7a9caa42c838', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Troca do curativo do dente 16. Anestesia. isolamento, hipoclorito nos três canais &#43; exploração com a lima 15 para limpar os canais. Estava sangrando o disto palatino. Paramono &#43; coltosol &#43; bioplic.', '2025-06-06T12:19:31.761000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fac427b8-8ad1-4768-86e1-fa39b87ac0c8', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tratamento endodôntico Pré-molar do dente 25, Tratamento endodôntico Molar do dente 16 foram finalizadosFeitos pela Ana Paula, anotado na ficha dele', '2025-08-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6cc7f3f6-bcf2-471e-9829-336756abc1e5', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G1 do dente 16, Rest. RC Classe I G1 do dente 25 foram finalizados Finalizados. Desobturação do canal 1,5mm abaixo da coroa clinica Selamento dos canais com coltosol &#43; resina a2 tetric e ad2 vittra', '2025-08-27T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3474323c-1d6f-4930-aed4-429bd3cffa4e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abertura &#43; Medicação Intracanal do dente 46 foi finalizado', '2023-11-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('46098192-59de-4469-81e7-f90ef3864219', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 84, Limpeza &#43; Raspagem Supra e Subgengival &#43; Polimento foram finalizados', '2023-12-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e355bb46-36db-4920-b057-46830ce0928b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G3 do dente 21 foi finalizadoResinas utilizadas, Trans Vittra, DA2, DA1 incisal, Corante branco, A1 empress', '2024-12-03T20:37:13.546000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('59d21002-6780-4027-a830-9bb61ebf8aef', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste da cor e forma do 21 fraturador. Dessa vez eu só desgastei um pouco a vestibular do 21 e asperizei o 11 pq tinham umas irregularidades. Aí no 11 eu só corrigi borda incisal e uma falha na vestibular que ele tinha. com da1 vittra &#43; corante branco e A1 gradia na vestibular aí no 21 eu só coloquei mais borda incisal com DA1 vittra, AO2 gradia, corante branco e fechei tudo com CT da gradia', '2025-05-06T19:58:50.018000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9aee5f6f-ace3-4c60-8901-473cdbd36292', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ef9abe37-1faa-43c4-82b6-960d3403d370', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na vestibular do dente 33 foi finalizadoResina Vittra D1- D2- A2', '2023-08-29T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bb858002-50f3-4f90-b922-e5e4021e9be4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ef9abe37-1faa-43c4-82b6-960d3403d370', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na vestibular do dente 43, Reparo Em RC Antiga do dente 44, Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário, Contenção Fixa, Restauração em Resina Fotopolimerizável 1 face do dente 45 foram finalizados', '2023-09-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4f2b1e19-2158-4987-ad85-952feaa42e11', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ef9abe37-1faa-43c4-82b6-960d3403d370', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face do dente 17 foi finalizadoVittra A2 DA', '2023-10-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6cd51256-ca79-435b-be93-c08bc49030eb', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-10-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f58cbb63-867b-4cdb-a4a1-d98c55bb197e', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-12-02T21:21:04.737000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1ea2a8b6-2a3b-4c75-a03c-e5cdea5b0ddd', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
- Ela deu uma parada com o fio dental -------- parou com enxaguante Sentiu que a gengivite voltou Na escovação,, não sangra, o fio voltou a passar ha uns dois três dias e voltou a sangrar bastante', '2025-01-20T19:59:09.943000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b4ae0300-a2ad-4f36-a4fb-e3315a9ff6b6', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2025-01-20T21:08:30.397000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('83d7cb9c-d87f-45d6-bc53-b760fd5b87c5', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Exodontia de Terceiro Molar Semi-Incluso do dente 38, Exodontia de Terceiro Molar Semi-Incluso do dente 48 foram finalizados', '2025-03-10T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('87efe294-2dd9-49fa-9bb2-5601b503ea80', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza, Clareamento em Consultório foram finalizadosÚltima limpeza do protocolo, vi muita evolução, porem tem gengiva com fibrose no 16/17 -- 22/21 --- 22/23 ---- 23/24 ---- 36/37 ---- 44/45Veremos na próxima sessão como será iniciei o clareamento de consultório dela também! ela sentiu dor com 8 minutos da segunda aplicação, não gostei do topdam que eu usei também. Da proxima quero proteger mais o dentes dela e tentar remover a colca do pararelho que tem em alguns dentes.', '2025-03-10T20:16:49.339000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('57f7c33b-fa11-4579-a396-7e5f3b62bbb2', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração provisória do dente 11, Restauração provisória do dente 12, Restauração provisória do dente 21, Restauração provisória do dente 23, Restauração provisória do dente 22, Restauração provisória do dente 24, Restauração provisória do dente 25 foram finalizados', '2025-03-19T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5294e086-2b9b-4325-9172-47c10b8b0eb9', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Gostou do resultado, gostou que as notaram a diferença mas não sabiam exatamente o que era. Para comer foi tudo bem, não fraturou nada, não lascou nada. Roe pelinha, e abre o saquinho do mel.', '2025-03-28T17:14:49.696000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ffbe5d3f-bb52-4aeb-a91d-2b460fdacd57', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tem alguma coisa que não gostou? Sim o 21 poderia ter ficado um pouco mais longo Cor deixar um pouco mais branco', '2025-04-11T12:35:28.893000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bd324f93-2e2a-44ef-8cbc-2d2c0c68b750', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 12, Recontorno Cosmético do dente 11, Rest. Ponta de Cúspide do dente 13 foram finalizadosB! charismaAO2 gradia dentina somente no 12 cervical medio incisal Wt camada vestibular do 11 A1 preta anna no 12B! palatina mais A1 no 13BAstante corante em todos, teve um pouco de sangramento cervical no 12 e no 11, talvez manche', '2025-04-11T14:40:22.567000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9536344d-922f-4685-82d8-f3af96206fc6', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Amiga marina treta, Nunca mais se falaram e sempre posta indireta pra ela, tá gravida de uma menina. Vamos deixar mais branquinho que os outros o 12 e o 13, COM WT', '2025-04-16T17:05:48.799000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c1fe8801-53af-4799-93d5-a5a1fddf9709', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 22, Recontorno Cosmético do dente 21, Rest. Ponta de Cúspide do dente 23 foram finalizados', '2025-04-16T17:23:37.940000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('42c2f431-6d7d-47e6-a876-2160f188428d', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Gengivectomia do dente 15, Gengivectomia do dente 14, Gengivectomia do dente 13, Gengivectomia do dente 12 foram finalizados', '2025-04-16T19:53:50.539000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d51a7673-91c1-4ac6-83cf-96a994ff2acd', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ela vai ter o primeiro dia das mãesTentar diminuir mais a gengiva, colocar mais dente no lateral. Arredondar a crista marginal.Arrumei essas coisas.', '2025-05-07T19:05:45.172000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2ab9d8bf-feca-4f81-8be4-e369e58fdad3', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Moldamos ela e fizemos fotos e vídeos para ter de registro do caso!! PLACA ROSA com GLITTERMais para frente quando eu tiver o ultraformer de novo e tal eu tenho que oferecer pra ela ss2', '2025-05-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('77d44d0b-6c34-467d-94c4-db4815102272', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Depois dos ultimos ajustes ficou tudo certo, nada que enroscando Gengiva ficou normal dente não ficou sensível depois da gente cortar Fio dental não todos os dias -- 2 a 3 vezes por semana.', '2025-05-16T12:01:10.760000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('200e92e5-de5e-4c3e-8bc5-5a83c02d84a3', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Placa de mordida miorelaxante foi finalizadoEntrega da placa mais ajuste de mordida', '2025-05-23T13:36:06.765000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bdd37188-78de-40b1-90aa-b6c285ae54d2', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Fio dental --- 1x por dia --- sangra de vez em quando Não está usando o periogard sempre, usa uma vez por semanaTa sentido a boca assada, acha que é a pasta de dente - sensodyne Ela ta sentindo os dentes mais sensíveis, quando vem gelado/quente. Vem em um dia e depois acaba. Ela tem uma dor na gengiva do lado esquerdo em cima. Parece sensibilidade. uma fisgada repentina sem estimulo nenhum. Tem notado mais depois de escovar os dentes. Ela tem sentido isso faz uns dois três meses.Nada na rotina mudou.', '2025-11-26T19:07:59.396000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ecab50e4-00de-47a5-b94f-9ef61cfcae0c', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
bastante bolsas fundas ainda --- VAMOS TROCAR DE ESCOVAHigiene está bem melhor... está usando o fio dental umas 5x por semana Não está usando o bochecho, esqueceu até hoje', '2026-01-15T13:05:12.946000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f8f63c58-8223-4060-91ad-da9e25b7b6a0', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-01-15T13:54:06.545000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a21f50f0-c159-475d-a99d-f335435fa0ca', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tem passado o fio dental normal. Mas o Blue M tá cozinhando a boca dela. Não sangra nada --- Sensibilidade continua sentindo', '2026-02-25T18:10:37.419000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d5cea6ac-43be-4bb4-9072-31993bb71be0', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Sangramento geral, bolsas superiores mas a sondagem inferior não passou de 4mm', '2026-02-25T19:09:55.965000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5170ba77-bd74-468e-bd59-d8e9e7f02b29', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-02-25T19:11:44.586000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ae869c95-17a0-4348-8aa6-0a3a1237ed3e', '30a89c67-7497-457f-a887-a56d1d721f6d', '08aed8d0-f25c-4470-ab83-e56dd78fc6fa', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-09-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('87a3bb91-815f-403f-b01f-452a446260d1', '30a89c67-7497-457f-a887-a56d1d721f6d', '08aed8d0-f25c-4470-ab83-e56dd78fc6fa', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 36 foi finalizadoVittra Unique', '2024-10-08T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c88e0a1d-9e73-42f0-a56a-a7ebe0ac7ddf', '30a89c67-7497-457f-a887-a56d1d721f6d', '62c6c756-46e0-4138-a451-a84f22c24775', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na vestibular do dente 11, Restauração em Resina Fotopolimerizável 1 face na vestibular do dente 21, Aplicação Tópica de Flúor na vestibular do dente 22 foram finalizadosA03 gradia A2 tetric', '2024-10-08T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a98c5d4d-96f9-4270-9aab-bc042a3b9a54', '30a89c67-7497-457f-a887-a56d1d721f6d', '62c6c756-46e0-4138-a451-a84f22c24775', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2024-10-15T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('94c64f68-56e5-437c-b21c-5439799ec824', '30a89c67-7497-457f-a887-a56d1d721f6d', '62c6c756-46e0-4138-a451-a84f22c24775', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 24, Restauração em Resina Fotopolimerizável 1 face na mesial do dente 25, Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 25, Restauração em Resina Fotopolimerizável 1 face na mesial do dente 26 foram finalizados', '2024-10-15T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d5dbeea9-73b0-4c53-b4b3-aeef37903d53', '30a89c67-7497-457f-a887-a56d1d721f6d', '62c6c756-46e0-4138-a451-a84f22c24775', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 16 foi finalizado&#43; TERCEIRA LIMPEZA Da2 e unique', '2025-01-14T13:14:58.651000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2c6aecc8-2358-4cba-858c-228ddb9b5b10', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b0fb3904-d922-41a1-874a-e8529d6ffc29', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Dentário Caseiro foi finalizado', '2023-11-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('31027feb-3f72-4379-972b-dbaf0b53de5f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b0fb3904-d922-41a1-874a-e8529d6ffc29', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado &#43; moldagem para clareamento', '2023-12-05T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b653a9eb-5b7a-4ea2-9610-075614233a00', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b0fb3904-d922-41a1-874a-e8529d6ffc29', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Aplicação de Selante de Fóssulas e Fissuras na oclusal/incisal do dente 17, Aplicação de Selante de Fóssulas e Fissuras do dente 27 foram finalizados', '2023-12-17T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4dd596af-9955-4f41-b0c1-ca93c315f023', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na mesial e oclusal/incisal do dente 27, Rest. RC Classe V G2 do dente 25 foram finalizados25 Remoção de cárie &#43; RC A1 e DA227 Reparo A1', '2024-06-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a3b7fc00-9ddd-41d3-bcde-145f583ca4dc', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 3 faces na distal, vestibular e palatina do dente 11, Restauração em Resina Fotopolimerizável 3 faces na mesial, vestibular e palatina do dente 12, Reparo Em RC Antiga na mesial, oclusal/incisal e distal do dente 14, Restauração em Resina Fotopolimerizável 2 faces na distal, vestibular e palatina do dente 13 foram finalizados', '2024-06-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5a5099a7-d5f5-4a43-ac06-bb3ca61ab823', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; Raspagem Supra e Subgengival &#43; Polimento , Restauração em Resina Fotopolimerizável 3 faces na distal, vestibular e palatina do dente 21, Restauração em Resina Fotopolimerizável 1 face do dente 24, Restauração em Resina Fotopolimerizável 2 faces na mesial e palatina do dente 22 foram finalizados21 DPV RC troca 22 MP RC troca 24 OD remoção de cárie', '2024-07-08T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9c016074-f07a-48c7-b1b9-dd34c942c620', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reparo Em RC Antiga na oclusal/incisal do dente 24, Restauração em Resina Fotopolimerizável 3 faces na distal, vestibular e palatina do dente 23 foram finalizadosResina Unique', '2024-07-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('62263300-e86d-4bb8-97ce-3368077e27ed', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Gel Clareador &#43; avaliação de placa de clareamento foi finalizado', '2024-10-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bfda0f44-d813-4464-b965-0af8781e831b', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na mesial e oclusal/incisal do dente 17, Reparo Em RC Antiga na mesial, oclusal/incisal e distal do dente 16 foram finalizadosVittra Unique', '2024-10-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('954a610d-0bfd-4131-b65e-4f9840d37e2e', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reparo Em RC Antiga na oclusal/incisal e distal do dente 35 foi finalizadoe fechamento do diastema', '2024-11-19T18:50:16.769000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('328af71b-e454-4d86-bfba-0cb38277dec3', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
PRIMEIRA Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-05-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('764f2f4e-3c07-4c49-af65-055d447f7716', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ele sentiu que está com mau halito Sente de maneira geral. Ele esta sangrando na gengiva do dente que a gente fez. . Uma vez por dia, em todos dentes. Cerdas, duras. Nunca usou cerdas, macias. A gente fez a limpeza esse dia e sangrou bastante em diferentes locais. Mas correu tudo bem. Eu vendi pra ele a opcão da gente fazer 4 limpezas por 350 casda e tudo certo. naquele dente da prótese teve sangramento mas la tem uma bolsa bem rpfunda também, enão não tem nada a ver com a prótese que fizemos.', '2025-05-12T16:56:12.931000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0b42c894-6c5e-4954-a664-ed41bde0ddf7', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Marlon está ficando louco.Acabou de despedir o irmão. Dirigindo usando o fio-dental ---- Sangrando a gengiva Às vezes sim e as vezes não -----', '2025-08-07T16:40:00.403000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c634fc9e-0817-4bac-81d6-31fcda6199e4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'cdee6000-3f7b-4e90-9db3-a38c01e4ebbc', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ela viaja dia 02/02 ---- frequência de escovação. 4 a 5 vezes ---- fio dental -- uma vez por dia de noite --- não sangra ---- nada de bochecho ----- ela não esta usando outras escovas---- estava sangrando e dei orientações novamente', '2026-01-26T16:48:30.204000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a18a9146-3788-4a51-bec5-ca42418fce26', '30a89c67-7497-457f-a887-a56d1d721f6d', '92e5bc70-44f2-453a-b4bb-ab9464c465f8', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reparo Em RC Antiga do dente 11, Reparo Em RC Antiga do dente 21 foram finalizadosOB oppolis e WT gradia', '2024-08-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('541eafbb-a913-4dc1-aaf1-f862e247f762', '30a89c67-7497-457f-a887-a56d1d721f6d', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-05-06T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7be250f7-0b3b-4fd4-907b-2ad8efcaa340', '30a89c67-7497-457f-a887-a56d1d721f6d', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado sangramento generalizado. bolsa de 5/6mm entre 25/26 &#43; primeira sessão de clareamento', '2025-08-27T19:29:15.830000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8f1b781c-adb9-41b6-b224-1592516e385e', '30a89c67-7497-457f-a887-a56d1d721f6d', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda sessão de clareamento -- consegui fazer 3 sessões, pq ela tava com senssibilidade', '2025-09-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9ae67d39-9b63-4d70-8fc7-a065732b1560', '30a89c67-7497-457f-a887-a56d1d721f6d', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Terceira sessão de clareamento. EU não estou vendo evolução significativa da coloração evoluir. Só se ela estiver vendo.... eu vejo MUITO POUCO.', '2025-09-22T21:09:42.924000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a3a50f05-b5f5-438b-ab43-4d7e23c7b905', '30a89c67-7497-457f-a887-a56d1d721f6d', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório foi finalizado quarta e última sessão de clareamento ---- total de ZERO evolução. comprei agora outro produto para usar nela. Deus ajude que de certo. deveria ter trocado já desde a segunda sessão. Se com o outro clareamento der certo eu vou fazer todas as sessões novamente de graça.', '2025-10-06T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e5ca1a96-8ea5-4569-aa78-8e8d96a2afe8', '30a89c67-7497-457f-a887-a56d1d721f6d', '28d78055-d332-40c4-91a6-802809dc6944', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório foi finalizado', '2024-06-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('15a6a575-8b26-40a9-9d5e-134a4a3231e7', '30a89c67-7497-457f-a887-a56d1d721f6d', '28d78055-d332-40c4-91a6-802809dc6944', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2024-07-01T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b43e0035-f6a8-4f9b-8253-256bbd5a608c', '30a89c67-7497-457f-a887-a56d1d721f6d', '28d78055-d332-40c4-91a6-802809dc6944', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Faceta em Resina Fotopolimerizável do dente 13, Faceta em Resina Fotopolimerizável do dente 12, Faceta em Resina Fotopolimerizável do dente 11, Faceta em Resina Fotopolimerizável do dente 21, Faceta em Resina Fotopolimerizável do dente 22, Faceta em Resina Fotopolimerizável do dente 23, Planejamento digital foram finalizados', '2024-07-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1d752e07-a2a9-406d-a7d8-3256532b0bb8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f4eaa10e-a58b-4b8e-b492-277abd7b5b5e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizadoEntrega de clareamento bisnaga 16%', '2023-12-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4e06c87c-95bc-4290-9c22-d1a49a2f4016', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f4eaa10e-a58b-4b8e-b492-277abd7b5b5e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Dentário Caseiro foi finalizadoBisnaga 10% por causa da sensibilidade', '2024-01-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7f5f97d1-319b-4856-b15f-9da9b325dec3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebd42346-e7f9-4483-99dc-97de4214d23c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reparo Em RC Antiga na oclusal/incisal do dente 17 foi finalizado', '2024-07-02T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a5615c90-baf9-40c4-80d5-8a3e1dcdce2b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebd42346-e7f9-4483-99dc-97de4214d23c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na mesial e oclusal/incisal do dente 36 foi finalizado', '2024-09-24T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0da69e52-cd4c-467d-8388-b78897b88071', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebd42346-e7f9-4483-99dc-97de4214d23c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na mesial e oclusal/incisal do dente 27 foi finalizado A2 ivoclar e unique vittra', '2024-11-12T15:07:20.322000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9c32c777-f268-4694-96d9-fdf7973dd727', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebd42346-e7f9-4483-99dc-97de4214d23c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Os reparos estão em ordem. Ela acha que está com gengivite por dentro dos dentes... sangra não sangra. Fio dental --- raramente --- 1x semana -- não sangra quando usa o fio Escovação --- 3x por dia --- cerdas bem macias --- dói quando escova ali no lugar que esta inchado. Toma -- cintroid -- toma hormonio para reposição hormonal --- e para enxaqueca', '2025-09-11T20:02:22.981000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('57c0eb1a-1b25-44e0-a8e8-be1a5f25c6e5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebd42346-e7f9-4483-99dc-97de4214d23c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoEla estava com uma gengiva inflamada em cima. Mas estava tudo bem, saiu no máximo dois mini cálculos. Se não melhorar precisamos ver o que fazer. e de resto estava tudo bem também. Nada de mais .Uma ou outra sondagem com 5mm. mas aquela coisa que é super controlável', '2025-09-11T21:10:42.211000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ef940794-b50d-43a4-9864-5e32d1ab974d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebd42346-e7f9-4483-99dc-97de4214d23c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G1 do dente 31, Rest. RC Classe IV G1 do dente 41 foram finalizadosDA1 --- vittra', '2025-12-18T16:44:50.447000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9f0bb52d-6494-4e4f-b614-0190facc119b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e416c02e-a859-4b50-8ab2-8e94e49c4c5e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e distal do dente 37 foi finalizado', '2024-03-19T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b2a1a479-8e15-4c8a-a91c-9074f3426d5a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e416c02e-a859-4b50-8ab2-8e94e49c4c5e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2024-03-26T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('265353fd-8c90-41ae-baa1-5b894bf3de7e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e416c02e-a859-4b50-8ab2-8e94e49c4c5e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 27 foi finalizado', '2024-07-17T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('87faf8cf-f6cb-44a3-96c8-e26bb2c6f9fe', '30a89c67-7497-457f-a887-a56d1d721f6d', '4d84bd70-53ff-4cf7-ac12-03ab33e64c94', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário, Clareamento Dentário Caseiro foram finalizados', '2024-11-07T01:30:14.459000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('677fd288-1560-41f5-9102-51ba74b4333b', '30a89c67-7497-457f-a887-a56d1d721f6d', '856191f5-8367-43cc-bc39-a413baf8db05', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza, Restauração em Resina Fotopolimerizável 1 face do dente 53 foram finalizados', '2023-08-29T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e4d07d97-8eed-4688-8b96-73375eef5b85', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd74230ec-e105-4795-9ff2-46b91a4bcafe', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Dentário Caseiro foi finalizado', '2024-01-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('93d3316a-03e2-455d-b30b-0359da672e02', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd74230ec-e105-4795-9ff2-46b91a4bcafe', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2024-01-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5735d246-fedc-4ed6-b27b-8fa2efcbde0a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'de4f8ead-3e4b-494c-a00e-e9cc84990f12', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2023-08-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('eba1e1ca-6b01-4b10-bbc7-e4dcc363f8c1', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-11-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8c6bb5e3-2338-42fe-901a-f3355dc61bc8', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-11-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f429563d-42d4-4377-8eee-f77c4d3dcc5b', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-11-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c8795471-8786-4456-a294-22e38d62cf1e', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Instalação dos attachments do alinhador SouSmile. Mais confecção dos IPRS 0,1 13-14 0,2 12-13 0,1 24-25 0,2 42-43 0,1 42-41orientações sobre o aplicativo, higiene, remoção correta e colocação dos alinhadores, tempo de troca.', '2025-01-27T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e5064776-350b-4d54-abcb-24578406dd74', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Textura melhorou, os contornos ficaram melhores. Os poros estão menos dilatados. A papada esta mais grudada com a pele. Não pigmenta nada com a plaquinha nem o vinho não pigmenta a plaquinha', '2025-04-22T17:21:21.691000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('288546a2-d24d-48a3-9202-809eef1c8d8a', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Levantou a sobrancelha!!! e ficou levemente roxinho Alívio de 0,1 entre o 23 e o 24 E entrega dos ultimos pares de alinhadores', '2025-04-28T16:57:01.184000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8aa090e9-2c0e-4b8a-9284-ed35cf0cf68e', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
retorno do botox, tive que dar mais 20U de retoque :oo3 unidades em cada corrugador3 U em cada olho e2U em cada lado do nariz, na proxima já sei tambem que de jeito nenhum eu posso fazer o pontinho pra baixar a sobrancelha dela ://', '2025-05-06T14:39:34.777000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5c1a6059-7048-46b2-ac41-e0020e323a71', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Fiz as ultimas fotos dela nesse dia. Muito bom o resultado. Nem fiquei tão mal de ter feito &#34;cagada&#34; na sombrancelha dela, pq deu uma boooooa melhorada no olhar dela.', '2025-05-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c06072aa-a019-4ab5-97fe-76f0f586c1ce', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Acha que quebrou um dente, nem sabe onde que ela quebrou ou quando. Não dói quando come, e junta coisa quando come. dente quebrado 24 OD', '2025-07-21T18:50:18.125000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9026fac6-40fc-4adb-81a5-5835f7912423', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na oclusal/incisal e distal do dente 24 foi finalizado', '2025-07-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5b82b58a-2d8a-4363-83c7-f60411464cc3', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na mesial e oclusal/incisal do dente 28 foi finalizado', '2025-07-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('512d6064-1c06-4c2d-b93e-5adb4ea0760c', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado sondagem... nao fiz. mas tinha bastante sangramento entre o 17/18 e 27/28 gengivite meio geral. pouco calculo, mas bastante mancha d e cigarro ultrassom &#43; jato &#43; profixlaxia &#43; fio dental..... encobtrei um dente quebrado palatina 38', '2025-09-15T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3a114f30-dc2b-414f-9275-7806e033a87c', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tati, esta com resquícios da conjutivite. Está Se sentindo bem com o resultado do alinhador.', '2025-09-15T19:48:49.661000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4749dcf5-cb97-43c1-b82d-c07ef2e3cd3c', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 41, Recontorno Cosmético do dente 31, Recontorno Cosmético do dente 32, Contenção Fixa foram finalizadosFiz um pouco de borda incisal do 42 tambémTudo com OL da Charisma e por cima a1 da gradia. Achei que pode ter ficado meio translúcido demais no começi, mas pode ser que era por estar desidratado ainda. A contenção foi feita com isolamento total, assim como as restaurações inferiores', '2025-09-22T19:37:04.565000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('75ce56cc-5e92-4a9b-b2ec-f62e435b7a29', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 13, Recontorno Cosmético do dente 12, Recontorno Cosmético do dente 11, Recontorno Cosmético do dente 21, Recontorno Cosmético do dente 22, Recontorno Cosmético do dente 23, Contenção Fixa foram finalizadosCor OL charisma &#43; Ct gradia Mas deveria ter só usado OL dente bem leitoso. Usei corante branco nos laterias e nos incisivos também', '2025-09-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('be5292c1-6176-4e35-9c99-b08c7e862cad', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
quebrou a conteção inferior comendo cenoura crua. fiz como garantia, mas da próxima eu cobro', '2025-10-02T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ee8aa750-238f-4256-b160-8fbcb00e0adf', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G2 na oclusal/incisal e palatina do dente 38 foi finalizado Isolamento total. Remoção parcial da resina, exposição total de esmalte nas margens. evicárie para ter certeza que está tudo limpo. Acho que eu usei só o vitra unique para fechar', '2025-10-06T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9cccc33e-1844-4c73-990c-ce8fb17a9f7e', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
60 UNIDADES DYSPORT. FOTOS DO PLANEJAMENTO NAS IMAGENS &#43; 3 SERINGAS DE CLAREAMENTO', '2025-11-17T14:29:03.327000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3deeb4c1-2ede-4783-9372-7dbfd3b7a186', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox), Seringas de Clareamento &#43; avaliação da plaquinha antiga foram finalizados', '2025-11-17T14:30:48.782000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('779faa9e-f707-4ed0-a88c-0bcb65e3244a', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tudo okEla não sabe se não esta enxugando gelo com a contenção ----- Ela ta sem conseguir passar o passa fio em cima --- Sangrou em cima quando tirava a placa nos últimos de cima. não sai cheiro ruim ----', '2026-02-09T18:05:43.923000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4fe34dfd-af01-414f-a430-f7217330b2ac', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoGengivite gengeralizada. sangrou em varios lugares e teve profundidade 4mm entre molar superior e inferior. 40 dias outra limpeza para melhorar a saúdegengival .', '2026-02-09T18:53:38.621000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('462ff8e1-c888-4456-a597-d144087bb2f9', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-02-09T18:56:53.713000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('41135b9e-ddfb-4030-8e44-1eac1ade4370', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e17fd542-482c-47f9-8244-43b13b079825', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-11-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('844d6a97-6402-4baa-abc5-051fced4b348', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e17fd542-482c-47f9-8244-43b13b079825', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado Testa, glabela, canto da sobrancela, bravo', '2024-12-06T20:40:24.418000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fa05f35c-37d9-4087-af0f-30f94d5e3fd4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e17fd542-482c-47f9-8244-43b13b079825', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retoque botox (dysport) 1,5 U tempora direita', '2024-12-20T21:33:55.961000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2deee0f4-1f4f-410c-b097-a8376539bb9e', '30a89c67-7497-457f-a887-a56d1d721f6d', '731093fd-45cb-42df-8ae4-a57e4308a523', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado Fronte, Glabela, Olhos, NAriz', '2024-12-11T15:13:56.389000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6c92e4f3-0343-46e1-83b4-e641232349f4', '30a89c67-7497-457f-a887-a56d1d721f6d', '731093fd-45cb-42df-8ae4-a57e4308a523', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
retorno do botox, não necessitou de nenhum retoque, vamos acomapnhar e manter o resultado', '2024-12-23T13:05:33.962000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2a002ca2-8a0d-41cd-bf52-82c7fb9656f1', '30a89c67-7497-457f-a887-a56d1d721f6d', '87a9aba8-7d0e-463d-8026-38637e3e425b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-12-10T14:12:41.527000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('011f97c5-da26-4bb0-bea2-0e9c8234aff9', '30a89c67-7497-457f-a887-a56d1d721f6d', '70266a95-c517-4a62-aa63-9a6642fb4305', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 74, Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 84 foram finalizados', '2024-04-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9f94cdf7-a2b9-4846-9184-a2768540bfa8', '30a89c67-7497-457f-a887-a56d1d721f6d', '70266a95-c517-4a62-aa63-9a6642fb4305', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na oclusal/incisal do dente 85 foi finalizado &#43; 75O', '2024-04-29T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4fce40eb-7b44-4f78-8dfa-ca156ad5c41b', '30a89c67-7497-457f-a887-a56d1d721f6d', '9f3d2e91-6154-4903-ba0c-9f9433d2d819', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizado', '2023-12-19T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('23345362-e8ae-4c63-be1e-d23f07ed292f', '30a89c67-7497-457f-a887-a56d1d721f6d', '6cd890d6-ab9e-4c46-b46d-49de6f90e4b1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado Dysport Fronte, lateral de olhos, nariz, glabela, procero', '2024-11-29T18:41:45.367000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('502416c6-3daf-45f2-9619-12d662f1ba05', '30a89c67-7497-457f-a887-a56d1d721f6d', '6cd890d6-ab9e-4c46-b46d-49de6f90e4b1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retorno da TXB, fotos, e sem nenhum retoque', '2024-12-09T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('98dd7e02-2fe3-436b-a961-d2535b6709d3', '30a89c67-7497-457f-a887-a56d1d721f6d', '4a1150e2-250a-447a-907f-b38ef20bd546', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado Fronte, lateral de olhos, nariz, procero e corrugador', '2024-11-29T18:43:45.898000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6f8f0032-7866-42ee-adaa-fea6058487ff', '30a89c67-7497-457f-a887-a56d1d721f6d', '4a1150e2-250a-447a-907f-b38ef20bd546', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado fronte, lateral de olhos, nariz, procero e corrugadores', '2024-11-29T18:46:16.766000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a50c7548-82b0-464a-8b64-de80a5c5b215', '30a89c67-7497-457f-a887-a56d1d721f6d', '4a1150e2-250a-447a-907f-b38ef20bd546', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retorno no botox!! fizemos mais um pontinho na sobrancelha esquerda de 1,5U PARA IGUALAR AS FORÇAS', '2024-12-13T18:06:55.168000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('00207d44-6996-4b4a-85cc-f028c54432cd', '30a89c67-7497-457f-a887-a56d1d721f6d', '3aeebec7-ce34-4832-9c05-64fd26aa0b3b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado &#43; avaliação', '2024-11-22T17:39:43.916000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('be48c5db-551c-4900-b3fe-eda53f23feb2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G3 do dente 21, Rest. RC Classe IV G3 do dente 11 foram finalizados Trans OPL palatinaAO2 gradia a2 ivoclar e ct interproximais mais camada fina final', '2024-11-22T19:49:56.099000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ce6f1831-345b-4925-b274-3d713e6c625c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Placa Miorrelaxante Acrílica, Clareamento Dentário Caseiro foram finalizados', '2024-12-02T16:36:51.550000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2f7cd8f4-7a4c-41ab-8d0b-91fb81b3fa19', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Vida corrida - repondo paciente Ta usando pasta sensodyne para sensibilidade --- Tem dentes sensíveis em baixo --- sente com coisas geladas ---- sensibilidade 3 a 4 vezes --- fio dental uma vez por dia --- não sangra, só quando machuca --- não sai cheiro ruim ----', '2025-12-05T12:21:37.580000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5aa02cbc-9d5a-43a2-8a66-3e609cbc1fee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f290e416-e6d1-4ba6-b3ef-baa273472602', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Dentário Caseiro foi finalizado', '2024-10-15T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b010e7f6-5a08-49c4-970d-1588cd114d48', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f290e416-e6d1-4ba6-b3ef-baa273472602', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste Placa de Bruxismo foi finalizado', '2024-10-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('abbe57af-1f1e-4cf8-9a04-93ad344aa80b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f290e416-e6d1-4ba6-b3ef-baa273472602', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Aumento de Guia Canina do dente 13, Aumento de Guia Canina do dente 23 foram finalizados', '2024-12-20T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6b0bdea9-eb96-4710-8c4f-93d7a818d837', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f290e416-e6d1-4ba6-b3ef-baa273472602', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
REstauração de caninos com a cor A1 vittra &#43; mooldagem com silicone por adição para ter um molde dos caninos', '2024-12-20T15:03:50.714000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('51eda7b5-5a93-4d70-9094-d7668d625937', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f290e416-e6d1-4ba6-b3ef-baa273472602', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Moldagem para placara miorelaxante!!', '2025-01-13T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c589e09b-75d1-44ab-a60b-b7bc9314887f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f290e416-e6d1-4ba6-b3ef-baa273472602', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste oclusal da placa, deixando os contatos equilibrados e com guias corretas, polimento e orientações de higiene!', '2025-01-27T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('25b6d522-da25-4ab5-aa9f-c34dc5158d41', '30a89c67-7497-457f-a887-a56d1d721f6d', '60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza, avaliação e requisição de exames RX', '2024-12-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9ada97e6-cc63-4fba-b9c5-e0c19953d0a3', '30a89c67-7497-457f-a887-a56d1d721f6d', '60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na distal e vestibular do dente 15, Rest. RC Classe II G4 na oclusal/incisal e distal do dente 14 foram finalizadosCor EA3 DA3', '2025-01-13T18:00:08.792000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('edb9bba5-1c5a-4477-80b0-b5394a5662a1', '30a89c67-7497-457f-a887-a56d1d721f6d', '348541b4-f655-406b-9b20-e229be3a9155', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado &#43; AValiação', '2024-11-25T20:56:21.974000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('da680637-80f4-4eba-9e62-294e0c6a97b7', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na mesial e oclusal/incisal do dente 17, Restauração em Resina Fotopolimerizável 3 faces na mesial, oclusal/incisal e distal do dente 16 foram finalizados Vittra unique e bluck fill flow', '2024-12-09T18:09:35.861000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1a474ab8-5d3c-4a6f-b1a8-75a4e6fc72f7', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 1 face na vestibular do dente 24, Restauração em Resina Fotopolimerizável 3 faces do dente 25 foram finalizados', '2024-12-13T22:23:57.760000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b3e9eab3-ab30-4405-adfe-c6b4236a930b', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração em Resina Fotopolimerizável 2 faces na oclusal/incisal e palatina do dente 22, Clareamento de Dente Desvitalizado Escurecido do dente 22 foram finalizados', '2024-12-20T19:35:59.758000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4826ea59-98ba-4432-8665-af4a0dd9c99b', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
ela foi para fazer a moldagem para o clareamento, ofereci também uma placa miorelaxante mas ela preferiu esperar um pouco e ver se faz com o botox. Preciso oferecer o botox pra ela mais para frente.', '2025-05-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6bff490e-c4da-41c3-9fe5-67f0026391ac', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Dentário Caseiro foi finalizadoentregue e explicado', '2025-05-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('41772d45-dcca-48ad-8bdf-588d3bd1e1b4', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
hoje eu entreguei o clareamento dela e dei as orientações, preciso que ela volte em um mes e meio depois que o claremento terminar. Aí eu vou oferecer 3 facetas de ceramica po 2100,00 cada uma ou 3 facetas de resina por 850,00 cada uma, pq assim, vai ficar uma coisa linda de jesus mas eu não quero fazer em resina, porem existe um agrande chance dela querer.', '2025-05-22T20:26:13.773000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('55964f14-2a3e-44ef-9acc-9beefa588b68', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ela não está conseguindo manter a frequência. 3 a 4x na semana o fio dental Cheiro ruim em baixo.', '2025-10-15T18:10:55.587000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f51935a7-f66e-4d64-a689-94f5c3c7ff7c', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Fechei a palatina do 22 &#43; limpezasondagem nada de mais, mas tinha sangramento em alguns dentes. temos que finalizar o tratamento dela.Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-10-15T19:38:39.590000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b5b52b0b-2f2e-43bb-9a52-01c7fa2c9020', '30a89c67-7497-457f-a887-a56d1d721f6d', '25d84b99-e3a3-4301-9a88-b47e74fff232', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado Fronte, olhos, nariz, glabela,', '2024-12-11T15:12:22.397000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8d4df091-0921-45c1-9a63-463b1cfb0a1d', '30a89c67-7497-457f-a887-a56d1d721f6d', '25d84b99-e3a3-4301-9a88-b47e74fff232', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retorno do Botox, avaliação com foto, e acordo de não ajustar com mais retoque de TXB', '2024-12-23T11:50:28.386000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('adb76364-a46d-4cef-b121-b027cc21ab83', '30a89c67-7497-457f-a887-a56d1d721f6d', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na mesial e oclusal/incisal do dente 37, Rest. RC Classe II G2 na oclusal/incisal e distal do dente 36 foram finalizados 37, reparo em cerâmica, com ácido fluoridrico e resina composta', '2024-12-20T11:35:41.304000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ac7c4117-3daf-4644-a044-84d2e3304848', '30a89c67-7497-457f-a887-a56d1d721f6d', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Preparo e provisório, semana que vem a gente faz limpeza e moldagem!', '2025-01-17T18:20:41.024000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c5781110-c6ce-45e4-a6de-22896cedcba6', '30a89c67-7497-457f-a887-a56d1d721f6d', '7ee21cd5-adfb-4bb4-9933-23c1601f7905', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Paciente perdeu o provisório na hora de passar o fio dental! Nessa consulta nós realizamos um novo provisório, refinamento de preparo, moldagem, escolha de cor A2cervical e A1incisal, registro oclusal e moldagem superior com alginato. E envio para o laboratório. Alex', '2025-01-20T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6e5001ed-6155-475e-b738-29e93bab8ac6', '30a89c67-7497-457f-a887-a56d1d721f6d', '6d78a343-ac08-4c3c-ae1c-d792d9fb0679', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-12-10T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d0b7561a-7360-4738-9af8-ff61e38f2312', '30a89c67-7497-457f-a887-a56d1d721f6d', 'de501c73-6b00-4f57-842c-cb8db2665125', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retoque, 2u corrugador direito 1,5u corrugador esquerdo 1U lateral de orbita direita', '2024-12-20T21:32:59.604000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cb6574da-9657-4854-ac20-1e4bfe34146e', '30a89c67-7497-457f-a887-a56d1d721f6d', '9e7be956-a04c-480d-9a14-204457236b6c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta odontológica foi finalizado Conserto de borda incisal 21 &#43; pré elaboração de planejamento', '2024-12-09T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('66071c4e-cb1b-47dc-bdb7-906f75cedf18', '30a89c67-7497-457f-a887-a56d1d721f6d', '36fb7501-1117-4461-bec2-5fa83e2a2592', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Vamos fechar o diastema, do 12.Vamos terminar o clareamento em casa. Tem um último dente em cima do lado direito que ta enroscando o fio, provavelmente está com excesso, HOJE EU FECHEI O DIASTEMA DO 12 CORES: gradia CT e A1 e vittra Dae3 palatina ct, cervical medio da3, incisal ct &#43; corante branco na ponta, a1 de cobertura bem fininha. e teve MOLDAGEM PARA O CLAREAMENTO CASEIRO', '2025-04-28T18:02:12.910000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7c14c9a9-cc92-4594-bd5b-53d27247f614', '30a89c67-7497-457f-a887-a56d1d721f6d', '36fb7501-1117-4461-bec2-5fa83e2a2592', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Entrega do clareamento de consultório &#43; explicação de como usarlimpeza com ultrassom e avaliação se tinha alguma coisa incomodando a gengiva, eu tentei tirar um pouco o enrosco que ela tem de uma restauração OD16 mas só diminuiu, não ajudou muito...', '2025-05-06T19:54:44.532000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('31188678-63a3-4c67-9f15-2396c8d9a13d', '30a89c67-7497-457f-a887-a56d1d721f6d', '36fb7501-1117-4461-bec2-5fa83e2a2592', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório, Rest. RC Classe III G4 do dente 12, Raspagem Supra-gengival (RAP) - Limpeza, Clareamento Dentário Caseiro foram finalizados', '2025-05-06T19:56:44.332000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e2a1f36b-b016-4e6c-8109-da62644a7069', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta odontológica foi finalizado', '2024-12-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0d41b44a-ddf4-4056-8070-127b7f0f781d', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Primeira avaliação, fotos e requisição de exames radiograficos!! O paciente necessitará passar por limpezas e por restaurações cervicais, através dos exames iremos observar se ha alguma cáries!', '2024-12-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e7005701-2f3f-4733-aaf4-328067e6c985', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2024-12-20T21:01:27.886000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3633803e-db46-42f1-b6d6-e2495d7b4916', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G3 do dente 26, Rest. RC Classe V G2 do dente 25, Rest. RC Classe V G2 do dente 24, Rest. RC Classe V G2 do dente 23 foram finalizadosCor AO2 gradia', '2025-01-13T20:36:17.574000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7d2a2daf-14b3-47fe-892d-50249f888b2d', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G3 do dente 14, Rest. RC Classe V G3 do dente 15, Rest. RC Classe V G2 do dente 13 foram finalizadosNA VDD FOI O 16 ao inves do 15', '2025-01-17T12:57:36.758000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('522a26b2-a2da-47d9-96b4-dfada608921c', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G3 do dente 34, Rest. RC Classe V G3 do dente 35 foram finalizadosAo2 e AO3 gradia', '2025-01-20T19:27:26.337000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('18e4b408-44db-4f13-81a3-dfb07cf39fe5', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-03-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ed4c1d5c-2798-48f4-9d63-513c5863dee6', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Escovando com a gengiva therapy, somrepre com a mesma, fio dental. Escova interdental. Não está sangrando a gengiva!. Ttem usado palito de dente para limpar todo o dente. depois de escovar os dentes pq ainda sai sujeira como palito. Escova com a escova e com o dedo Sequencia fio dental escova interdental palitoescova de dentededo - escovação da língua, e com raspador raspa bem a lingua.', '2025-03-28T18:46:02.493000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('55edae54-4601-41d1-aa07-e9fbff56c7cd', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Melhorou a escovacão, mas ainda é possivel identificar gengivite e placa em 90% dos dentes na cervical. Fiz uma orientação escrita sobre a higiene bucal ( palito de dente, escova interdental, fio dental, escovação vai e vem em direção a gengiva, e escovação vassourinha, língua) nessa ordem... Vamos ver em Julho como ele vai estar.', '2025-04-07T19:02:33.661000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2115c3aa-d83b-4df3-adc9-8f4ac9561bd3', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na mesial e oclusal/incisal do dente 15 foi finalizado', '2025-04-07T19:07:17.845000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('40875fcb-30e4-4e0d-ab67-e60954cdf1ca', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadopraticamente zero gengivite, dentes limpor, pouco calculo entre os incisivos inferiores', '2025-07-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e01daa5d-f367-4251-9ef1-69befc39c974', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tem usando o palito de dentes, ele primeiro vai limpando tudo com o palito de dente, depois vem com a escova interdental, depois fio dental, depois vem a escovação, vai e vem, frente atras, e depois vassourinha, e depois a lingua. NÃO SANGRA A GENGIVA, não dói também. Passa raspador na lingual. Os dentes dele estão mais brancos por natureza, ele esta usando uma colgate normal.Estava perfeito', '2025-07-16T16:56:15.677000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bfeec831-d326-439f-9eb1-67664412666e', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
1. Ele está usando o SOFT PICKS DA GUM ----- ele é flexivel e tem umas hastes que ajudam a limpar 2. escova interdental 3. fio dental 4. escovação vai e vem 5. escovação vassourinha 6. depois a lingua ---- ele faz tudo isso de manhÃ e de noite Não sangra a gengiva Não tem nada sensível', '2025-12-18T11:06:37.791000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3cf9ff1e-70d3-4b93-8242-28a9db845a63', '30a89c67-7497-457f-a887-a56d1d721f6d', '608e06f2-4047-466d-8fef-14215606c72e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizadoPaciente chegou a clinica relatando sentir uma &#34;bolinha&#34; em baixo da lingua, que doia quando eles comia ou incomodava quando colocava a lingua. Na avaliação foi visto que o que causava o incomodo eram os cálculos que envolviam o 41 e31 e estavam causando esse inchaço!! Uma raspagem foi realizada &#43; inidicação de Bochecho (blue M ou periogard) &#43; a troca da escova dental para a Gengiva Therapy da Colgate, pois o paciente usa escova dura.', '2024-12-30T20:09:04.891000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('66fd7970-4d93-425b-affe-225624971c07', '30a89c67-7497-457f-a887-a56d1d721f6d', '12d1dc10-faf8-471f-9d7b-e6e2f2322fcc', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2025-01-14T14:04:05.560000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('abe4bac5-5fcc-400b-87c2-5f4d97316a7b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e3c443c2-f81c-4335-b34a-cdafeb13bf7e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta odontológica foi finalizado Consulta de avaliação realizada &#43; anamnese &#43; orçamentos para sanar problemas da paciente!!', '2025-01-20T18:25:39.514000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('884b4039-05af-4238-b5b1-2a41be967c5c', '30a89c67-7497-457f-a887-a56d1d721f6d', '73b01fa8-458c-493a-9a37-10f10530b25c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta odontológica foi finalizadoReparo em Rc dente 21 classe 4 somente com a cor B1', '2025-01-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('204b3dcc-3876-4fdb-a0c7-6e17d570c5ac', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Limpeza e orientações de higiene,. paciente foi orientado a melhorar a higiene com o fio dental e com a escovação, e também a fazer o protocolo de saúde gengival, porem deciidiu fazer somente uma limpeza, apesar da queixa de mau halito persistente.', '2025-01-21T20:48:21.439000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('95da6c16-fb8a-4f53-9985-e852c570ee5a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na oclusal/incisal e distal do dente 36 foi finalizado ISOLAMENTO &#43; condicionamento ácido &#43; remoção da cárie &#43; Rest OD com matriz e bulk fill flow', '2025-04-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('526553dc-0d97-48e8-bd7e-1bd99f7c77a5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tem dias que ele sente qeu o hálito vem do estomago. Ele sempre usava o fio dental,Ele sentiu que melhorou para passar o fio dental do lado esquerdo em baixo. Esta lascado, ele enrosca o fio dental, e da um choque no final do dente FAZ um mês e pouco que começou a sentir que o dente. VAi passar fio dental nos dentes de trás,', '2025-04-30T21:11:34.663000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b2ac2e37-6b1f-466c-b796-8c1b1a3ee9f0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G4 na oclusal/incisal, distal e vestibular do dente 46 foi finalizadoFinalizado, usei isolamento e tecnica incremental, não tem como ter bolha nessa restauração. Demorei mais para fazer ajuste do que pra fazer a restauração. socorro. a2 ivoclarAd2 vittra Flow nas margens Ele sentiu que ficou um pouco estrnaho mas que ia se acostumar, falei pra voltar caso sentisse que estava estranho', '2025-07-09T23:16:42.601000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6d49106a-3cf6-4c9c-ad80-d9d377d43431', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Paciente continua relatando que entra carne entra o 46/47. Isolamento absoluto, tentativa de fechar as ameias com resina composta (vestibular e lingual) Não sei se vai funcionar... na próxima caso não de certo eu vou remover tudo e fazer uma resina sem-direta.', '2025-09-10T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3b0e31a9-62f8-415e-bf97-dbbf011e529c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Lascou comendo. Sempre juntava carne, e agora que soltou a lasca melhrou a reten;cão de alimento só poli e olhei a rest. não tinha nada de mais acontecendo, parece que saiu uma lasca de dentro da restauração... Fiz um work shop de escovação de lingua', '2026-03-02T21:16:23.498000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a994b4c3-502e-4204-a223-a17ede85f948', '30a89c67-7497-457f-a887-a56d1d721f6d', '7aabeb0d-e695-415c-9ceb-c481281170b3', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizadoocorreu tudo bem ele se comportou depois de fazer um miniescandalo, mas agora já esta tudo bem!! Ele não tem nenhum dente permanente e nenhum dente amolecido também!! Escovação ótima limpeza em casa', '2025-01-21T19:43:47.317000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('73160e2c-212d-4044-a28f-19fd379612a2', '30a89c67-7497-457f-a887-a56d1d721f6d', '70b5e785-9cbe-446e-9363-69976344424a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizadoBolsas generalizadas entre molares e prés.', '2025-02-05T19:26:31.900000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4f9237d6-6862-4a7f-91ee-e4193107c0d1', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ele começou a passar o fio dental uma vez a cada dois dias, sangrava no começo mas agora parou. Está usando o fio dental fita, mais grossinho. Escovação da língua ainda não virou hábito. Sente ansia? Um pouco, mas. a memória não deixa lembrar. Escova continua a preta da colgate, slim soft.', '2025-03-18T19:48:35.447000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('398e3d84-9545-4456-a4cf-94db4575c176', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
O fio dental: tava indo bem, mas aí os feriados, e daí deu uma piorada. O fio que ele estava usando o fio normal. SANGRA? não 6x por semana... e depois do feriado deu uma desandada LINGUA: Estava escovando uma vez por dia, ainda não virou habito, ele lembra de escovar a lingua uma vez por dia, sente ansia.', '2025-05-07T20:13:46.928000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('90619ec8-5c8e-4a46-9f10-1bb0e8f4b368', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Raspagem Supra-gengival (RAP) - Limpeza foi finalizado', '2025-05-07T20:58:40.341000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d33d58ba-1ff4-4c99-ac03-72b84388e9cf', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Tranquilo fio dental? 28 dias consecutivos com fio dental Não sangrou Escovação da lingua: precario 3x/semana --- sente ansia? sente, mas não é questão da ansia é questão de esquecer. Escovação esta em 3x por dia --- ele vai uma vez por semana no trabalho e não escova três vezes quadrante 1 estava com 4 mm de profundidade mas o 2 estava com 5 em todo o comprimento , em baixo estava basicamente entre 3 e 4 entao foi otimo.', '2025-06-11T19:52:49.274000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8e90d178-4b16-4545-8c0c-3bd5b1d4bdd2', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Corrido. Foi pior que a última vez. Frequência de fio dental ---- intervalo de dois dias conscutivos sem fio dental SANGRANDO? Nãoevolução, manteve 4/5 mm no quadrante 2 e alguns pontos perdidos quase 6 24/23', '2025-07-21T19:58:30.442000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1d4b70bc-cb21-40f6-a52b-1cfbc1ad5062', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Frequência de fio dental. Quando viajou um tempo ele ficou no final de semana sem usar---- TODOS OS DIAS ultimamente ---- enxaguante ele usou o BLUEm e daí troucou pelo periogard. -&gt; achou o gosto do bluem RUIM!!!!! parecia água oxigenada -&gt; achou o periogard mais gostoso do que o blueM ----- não tem sangramento ---- sangrou quando teve um acidente com uma batata palha. ------- esta tomando menos café ultimamente. sentiu melhora no estômago.', '2025-10-01T19:58:11.787000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e7986c00-2848-46e1-94e0-aad5b4d2d60d', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Bolsa de 7 mm no 27/26 bolsa entre o 24/23', '2025-10-01T20:41:58.788000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b19d5085-d2c3-46bb-bf74-68918c22753a', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
A vida anda corrida. Final de ano foi sofrido --- escovou mais a lingua --- não usou tanto o fio dental quando viaja esquece de tudo ------------- 2x por dia 3 a 5 vezes', '2026-02-26T20:05:34.212000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2ab95d78-a78e-4b2c-ba90-d8b885c056a7', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadosangramento generalizado mas não muito. bolsas rasas de 4/5 milimentros espalhadas pela boca', '2026-02-26T20:51:55.723000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('99375196-d0e1-480f-8ac7-db0f1881a824', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G2 foi finalizado', '2025-03-18T11:55:46.787000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0b07893c-4383-4b9c-aa94-3455cf1856fa', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Caos na terra.', '2025-05-19T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('196f2f02-4feb-4a7c-88a2-124c50160f23', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Dia Sim e dia Não --- sangramento? menos sangue atras em cima e em baixo Na escovação não sangra. A água gelada da uma ardência na sua gengiva. Na TPM da uma ardida maior. O dente está intacto ainda. Estava apertando bastante nos ultimos tempos mas deu uma melhorada. Antes estava mais espaçado', '2025-05-23T20:19:17.763000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0af588b4-b563-4648-8b42-3d87fb12b682', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadomenso caotico, mas ainda assim complicado de lidas. muitas anestesiasEu usei anestésico com e sem vaso nela, mas não vi diferença entre os dois', '2025-06-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d6072ab4-23a2-4aff-b399-729fcab52a00', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ela ta passando fio dental todos os dias o bochecho ela ta fazendo dia sim dia não.ELA TA USANDO O FIO DE HASTE.PASTA DA ELMEXBOHECHO DA PERIOGARD ---- quando usa no almoco esquece na janta e assim vai. Ela ta sentindo sensibilidade em um dente de ciam 17 quando escovae ta com dor com água também sente que a gengiva ta inchada ali Doi onde morde Questão de sangramento --- reduziu bastante -- sangra bem de leve nas vezes que passa o fio --- ant4es saia como um coagulo Cheiro ruim --- reduziu bastante -- o cheiro antes era 10 e agora esta com uns 5fizemos a limpeza 4,5 tubetes --- 3 de arti e 2 de mepi sem vaso. quase não tinha mais bolsa e ela evoluiu suuuper bem.', '2025-06-30T20:06:35.225000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8838ffbb-1121-4cc2-9aa5-a15778a6b532', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G1 na oclusal/incisal do dente 21, Contenção Fixa foram finalizados21 -- isolamento relativo com optragate &#43; ct palatina &#43; ao2 gradia mamelos &#43; Corante azul e branco &#43; a1 gradia &#43; polimento e acabamentoContenção -- a parte que soltou estava no 33, quando fui arrumar ela quebrou completamente. Removi a resina que ficava no 33 de dei polimento em tudo. Resolvemos deixar assim sem nada, já que a possibilidade de voltar é minima.', '2025-09-10T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('47c71d45-b64c-4c9b-baab-8d3835723583', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival , Rest. RC Classe III G1 na mesial e vestibular do dente 22 foram finalizados Última limpeza do protocolo. Com todas as condagens com no maximo 4mm em lugares expecificos. 26/27 16/17 mas não sangrou na sondagem e o resto estava com 3 ou nem isso. fiz a restauração do 22 classiii hoje também. Dificil. usei a vittra unique &#43; a1 gradia. talvez ficou um micro enrrosco ali ainda', '2025-10-13T22:13:43.809000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1e2bf95c-dae0-4837-bb3c-f6d09ea3f7c3', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Fio dental --- DESAFIO --- esta demorando mais na escovação e está levando em consideração tudo que foi dito para ele Dente to escovando a maioria dos dias --- ESTA USANDO O FIO DENTAL normal -- NÃO SANGROU USANDO O FIO DENTALCOMPROU A SLIM SOFT --- gostou da escovaSaia sangue quando escovava e agora parou de sair sangue No dia seguinte da limpeza ficou com sensibilidade pós operatória.', '2025-03-28T20:56:34.937000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9b07c30e-d444-4f75-a0a5-f157a656bb0b', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Foi visitar a familia na Pascoa, Habbit tracker, tava 81 quando ele me madnou mas na pascoa, mas nos feriados deu uma zoada, Não sangrou mais a gengiva Fio dental com a haste bem melhor, Slim soft não esta descabelada. Falei sobre o clareamentoTEVE BOLSA QUE DIMINUIU a maioria agora ta coom 5 mm Teve sangramento em alguns pontos na sondagem, mas no ultrassom ssangrou mais, mas normal pq eu machuei.usei a lixa de poliester e for dificil de colocar', '2025-05-06T20:50:36.574000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9652ed65-57ff-4494-9ccd-0157ce1b3525', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-05-06T21:44:13.649000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5e74be61-dad1-4ea3-bb82-3ba1eac0cbe1', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Em média esta com 4/5 mm mas tem locais com 6mm (27/26 -- 17/16 -- 24/23)Fio dental nos 80% e foi issoNão sangra a gengiva. reclamou da recessoes gengivaisVamos agora escova 3 vezes por dia e colocar o fio dental depois do almoçoColoquei o bocheco com periogard depois do alomo;co e depois da janta Na ultima eu quero dar um bochecho com flúor.', '2025-06-16T20:28:07.718000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0edc9660-5d49-433f-93dd-4279a71d309b', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-06-16T21:35:15.201000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a83b6255-db12-4055-883f-085c45615e6e', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ultima consulta, Uma semana e meia sem fio dental deu uma desleixada por causa da mudançaVai precisar voltar Vai se mudar para Tijucas Do Sul', '2025-07-16T13:57:00.936000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('448259c1-0c6e-4bd0-b87c-ebac6a13f31f', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-07-16T14:43:10.583000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('78d4b7f2-9862-4d84-b5cc-ff5a063e5460', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-07-16T16:01:32.598000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6d885bfb-96ec-4476-9123-fdb45964fb50', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G1 do dente 15, Rest. RC Classe V G1 do dente 14, Rest. RC Classe V G1 do dente 13, Rest. RC Classe V G1 do dente 44, Rest. RC Classe V G1 do dente 33, Rest. RC Classe V G1 do dente 32, Seringas de Clareamento &#43; avaliação da plaquinha antiga, Raspagem Supra-gengival (RAP) - Limpeza foram finalizados', '2025-03-11T21:10:14.824000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ff8c8873-3b08-4103-8a62-45d851cd9969', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento de Dente Desvitalizado Escurecido do dente 21, Clareamento de Dente Desvitalizado Escurecido do dente 22 foram finalizadosAbertura, &#43; peroxido de hidrogenipo', '2025-03-18T19:05:53.438000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8e478e11-5d2e-456a-bef5-a99909beb346', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Três guarda roupas e tudo esta na sala BIanca esta aqui no brasil, dazem uns 15 dias e esta fazendo um trabalho de pesquisa em santa catarina, a amiga descobriu uma planta que elas estão pesquisandoSUECIAAS filhas que rem que fique tudo legal mas tudo fica fica para a elzaPra finalizar vai mais CLAREAMENTO: Esta no final da última bisnaga. Esta suuuper branquinho, e agora sóAUtor da propria saúde, canal do youtube', '2025-04-14T18:58:44.068000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8738e1b5-f42a-4542-ad89-18966dca5fa7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Troca do clareamento interno do 21 e 22', '2025-04-14T19:46:35.006000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4f910117-b87d-4358-9f3c-73c837bc1a91', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Reavaliação do que vamos fazer com dentes da Elza. PLanejamos tudo e agora vamos realizar. Nesse dia eu troquei o clareametno mais uma vez do 22 e 21', '2025-07-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6121468f-4bcd-4014-80f0-f4ddef568a08', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na oclusal/incisal e palatina do dente 26, Rest. RC Classe II G2 na mesial e oclusal/incisal do dente 27 foram finalizadosDA3 E AE3 Vittraisolamento absoluto ANestesia mepi polimento e acabamento', '2025-07-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8eddfe18-03a7-4fa2-af9d-1c41d7a587b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G2 na vestibular do dente 13, Rest. RC Classe V G2 na vestibular do dente 14, Rest. RC Classe V G2 na vestibular do dente 15, Rest. RC Classe V G2 na vestibular do dente 33, Rest. RC Classe V G2 na vestibular do dente 32 foram finalizadosAsperização com brocas, teflon no sulco gengival, ataque ácido. DA3 EA3 vittra', '2025-07-23T21:09:42.965000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c194c98f-159c-4dc7-b070-e58fc68ab67e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta de avaliação &#43; botox terço superior', '2025-03-27T22:56:40.746000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0de5fbc3-7c76-4696-8074-a2c1a3bfe234', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Não ficou nenhum roxinho --- Vamos dar uma unidade de botox na sobrancelha esquerda para igualarUma unidade em cada corrugar para melhorar o bravo4ml de preenchimento 0,3 asas do nariz, 0,3 ristow02, ck2 0,1 ck1 O,1 Ck0 0,5 ml na boca 1ml de gel na olheira', '2025-04-10T17:32:04.147000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ff689234-5b06-4a6d-a1c6-79dc187748de', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retorno após 20 dias do preenchimento, Estava tudo ok. Coloquei 0,2 na olheira e no canto do olho, um pouco também no fundinho da bochecha. Coloque mais uns 02,/0,3 no lábio inferior para igualar com o superior, de maneira geral ela está muito mais bonita e satisfeita', '2025-04-29T20:11:27.506000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a2ed6023-13d1-40a2-8e33-62b2d0a1ce3f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Bioestumulador Radiesse Primeira sessão fiz na tempora e zigomático 2ml Mandibula eu fiz 10 vetores com 0,2ml cada um a marionete eu fiz 1,0 com 5 vetores deu maiiis o menos isso', '2025-05-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c76b517e-4ded-4b2e-9313-5cd29bd6be45', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Radiesse Duo - 1,5ml --- Bioestimulador de colágeno foi finalizado', '2025-05-21T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2e3b9d73-2235-4106-93f8-a38a6625a4cc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Bolsas de 5/6mm generalizado na parte superior entre 23/24 7/8mmentre 27/26 com 10mm &#43;moldagem para entrega do clareamentoLimpeza de Protocolo de Saúde Gengival , Clareamento Dentário Caseiro foram finalizados', '2025-06-16T19:47:44.360000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('dd08e301-5efa-4fb1-8600-caa4afce98e6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Entrega das placas de clareamento--- tudo certo', '2025-06-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b96e8699-8c00-47cf-859b-626b9799ca0f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda limpeza e botoxEstava com a placa bem controlada e com pouco calculo generalizado. O halito estava um milhão de vezes melhor. AInda tinha bastante sangramento e as bolsas continuaram iguais. Mas a qualidade visual da gengiva já está muuuito melhorO botox foi no terço superior e inferior na boca', '2025-07-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d57a722a-528c-41af-bf04-2670ab2a8a44', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-07-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('97b701a8-6e72-4b89-903b-54f3292de5c6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox) foi finalizado', '2025-07-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4908eae8-f8f8-4076-b775-ed2e5583e51f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
terceira limpeza ---- muuuuuita bolsa superior, pouca evoluçào. mais sangramento que da outra vez. pedi para usar o periogard', '2025-08-27T19:29:51.281000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1ea0dd8f-e9d9-4e7f-9e79-971f0aaee376', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-08-27T19:51:30.418000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9a094381-2e6e-4b11-9453-bb152dfe172c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Peeling com ATA 10%20 minutos de anestésico microagulhamento &#43; antiage &#43; ata 10% &#43; mascara de retinóico', '2025-09-24T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('158d0bff-2357-4536-bf7e-8857a3ab7a5f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Microagulhamento foi finalizado', '2025-09-24T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8be45b0f-7c24-40bd-96b9-b928ce884569', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado Continua com horrores de bolsa em alguns lugares. o 27 está por um fio mas vamos manter ele até o fim da vida. a Jô teve alguns deslises por ter ficado doente e a gengiva dela ainda não está 100%. vamos manter as limpezas por mais alguns meses provavelmente', '2025-10-06T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e97e5d80-797d-401e-86cb-42427df9093e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Cuidados tão meio esquisitos... Fio dental --- usa sempre -- fio dental de haste 2 a 3 vezes por dia ---- antes de dormir não come mais nada depois SENTE O DENTE SENSÍVEL DE BAIXO DE VEZ EM QUANDO quando tem algum estímulo', '2025-11-17T20:58:44.681000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e5237f0e-92e7-4c6a-abbd-0ff28051207a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Microagulhamento , Rest. RC Classe II G3 na oclusal/incisal e vestibular do dente 38, Ajuste de Implante do dente 36, Ajuste de Implante do dente 37, Ajuste de Implante do dente 45, Limpeza de Protocolo de Saúde Gengival foram finalizados', '2025-11-17T21:38:21.492000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fdaae193-1210-42c9-9a73-e77cf9786cb2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
passou varias semanas na praia ano novo com o Juliano na praiaNão sarou da tosse, sente uma sensação de expectorar aquele catarro que ta la um tempo. Ela desleixou um pouco do cuidado dos dentes', '2026-01-21T18:51:10.484000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a16fc55a-f6b5-462c-9f6e-f8619709e3ab', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoBolsas persistentes entre molares e prés ---- sangramnto leve mas generalizado ---', '2026-02-19T18:27:37.057000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('165fe22f-3d6e-4400-94a9-b375523f14e3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-02-19T18:28:39.831000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('828e04ec-dcb4-4667-a117-fa54e7e338ab', '30a89c67-7497-457f-a887-a56d1d721f6d', '73b9563e-97bb-4975-b136-4a2985068ec5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Uma sessão de clareamento de cortesia pelo aniversário!!', '2025-04-09T18:41:17.336000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5d9bb487-fa44-4a0b-9317-b058f2103d86', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-11-03T23:33:46.455000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('05ced933-2389-4d0a-afa6-47b9e7697bb6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe IV G2 foi finalizado', '2025-11-10T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('24d3b6a9-f687-4d47-a6bc-db999f8c8668', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Primeira sessão de clareamento &#43; rest 45', '2025-11-10T16:46:52')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('94c7d6c9-1d16-4770-9ac8-14e97ae79ab6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda sessão de clareamento', '2025-11-27T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('aac00fe6-5b31-4559-9f71-da615a4b703a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda sessão de clareamento', '2025-11-27T16:47:34')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6e9f484d-bae7-46d6-8f5d-676fea557a9a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoLIMPEZA, sangramento generalizado, mas muuuito menor do que antes. Ensinei ela a escovar a lingua, e ficou linda Testamos o mock up e ela ficou uma gata. MUdei a altura do central, deixei a distal icnisal mais comprida e a borda mais comprida de maneira geral. Deixei o lateral maior e mais arredondado na pontaArrumei o lateral quebrado também, com gradia a1 e só. &#43;- polimento e acabamento', '2025-12-10T15:43:05.333000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fb9b40a4-3a70-462c-b2ff-8eb5c7dee982', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
desgaste do 14 ao 24 &#43; escaneamento e escolha da cor Bl4', '2026-01-13T20:15:32.381000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e0356fb9-55d9-4786-9a3d-7d1f7a0ac85a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário foi finalizadomuito pouco sangramento, e bolsa de 4mm no 27/26. já deixei dela de auta das limezas', '2026-01-28T13:47:00.863000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('355597c7-33a9-46ba-83ce-1c9d5672fb80', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G2 na oclusal/incisal e distal do dente 45, Faceta em Resina Fotopolimerizável do dente 16, Faceta em Resina Fotopolimerizável do dente 15, Faceta em Resina Fotopolimerizável do dente 26, Faceta em Resina Fotopolimerizável do dente 25, Faceta Cerâmica - E-max do dente 14, Faceta Cerâmica - E-max do dente 13, Faceta Cerâmica - E-max do dente 12, Faceta Cerâmica - E-max do dente 11, Faceta Cerâmica - E-max do dente 21, Faceta Cerâmica - E-max do dente 22, Faceta Cerâmica - E-max do dente 23, Faceta Cerâmica - E-max do dente 24, Faceta Cerâmica - E-max do dente 15, Faceta Cerâmica - E-max do dente 25, Faceta Cerâmica - E-max do dente 26, Faceta Cerâmica - E-max do dente 16 foram finalizados', '2026-02-20T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2adf24ff-d433-4328-bef6-e23b3db12525', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajustes das facetas cimentadas.... &#43; fotos', '2026-03-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1f981abd-f942-492b-ad97-944eaa31707c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Combinado (caseiro e consultório) foi finalizado entrega da placa inferior', '2026-03-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('72a16b7e-38e5-42c7-a4b9-7da0390b1222', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd5da232b-a80a-46bf-992f-4868b12b057f', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
A1 gradia &#43; distal incisal do 21mesial interproximal 21 e 11Borda incisal 11 Distal 11 Borda incisal do 12', '2025-04-14T19:56:29.993000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c5b5dd67-035f-4875-bc56-ec7a09bae08d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd5da232b-a80a-46bf-992f-4868b12b057f', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ela se incomoda com o queixo celulitico Ela tinha medo que caísse tudo, mas agora tá tudo bem.', '2025-12-17T19:26:29.073000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d18f15f3-2a65-4d85-9152-b68f8e0e9d95', '30a89c67-7497-457f-a887-a56d1d721f6d', '4cf398df-1cda-4227-8dba-48c24c90ecb0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Miguel estava com uma cárie oclusal no 36. Removi sem anestesia, com broca de alta e baixa. Usei bulkfill flow e daí vittra unique. talvez foi um pouco de saliva, tem que ver como vai estar na próxima.', '2025-05-06T20:16:18.522000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0c449a98-c337-4b32-a9a9-6946ea272864', '30a89c67-7497-457f-a887-a56d1d721f6d', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
PRojeto de um parque tematico empenha morou na suica 8 anos fazia muito esquiarFocado em criancas em penha', '2025-04-16T19:59:19.948000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a300d1cc-9e50-44b3-9926-b708cf4564ec', '30a89c67-7497-457f-a887-a56d1d721f6d', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Última sessão de clareamento, &#43; fotos e planejamento para os próximos passos das próximas consulta', '2025-04-28T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('680fdbb6-c606-4bb5-962a-096d7bdd1f55', '30a89c67-7497-457f-a887-a56d1d721f6d', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório foi finalizadoFIzemos as quatro sessões mais doidas da vida haha, mas deu um resultado incrivel que eu e ele amamos!! Partiu cuidar do dente com problema de fratura e dar retoques finais na estética do paciente', '2025-04-30T19:06:20.635000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('929d3fb1-1462-40eb-95f3-d8996a63f0e1', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadogengiva toda linda e limpinha. Ela comentou na avaliação que costuma tomar sempre bastante refrigerante e que teve histórico de cárie na vida dela. mas estava tudo bem para quem parecia que teria muitas coisa. ela reclamou de dor em um molar inferior esquerdo e o que eu virifiquei era que tinha uma dentina exposta e somente isso. Precisamos fechar', '2025-04-30T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d856727e-a0a2-479a-8d1f-ba42cc62912a', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório foi finalizado', '2025-05-16T13:53:10.585000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('618b7622-0892-4ad5-ac67-7d607226f606', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G1 na oclusal/incisal do dente 36 foi finalizadoSomente o fechamento da dentina exposta e foi feito a primeira sessão de clareamento esse dia', '2025-05-23T14:36:10.636000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d59da839-ced4-445b-bb6c-f54698ca8727', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
quarta sessão finalizada de clareamento', '2025-05-23T19:56:33.945000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('05c7b07f-c351-40c7-a009-5e6d50cfe776', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Faceta em Resina Fotopolimerizável do dente 12, Faceta em Resina Fotopolimerizável do dente 21 foram finalizadosFiz os dois hoje e finalizei hoje!!Cores: 12 ---- camada palatina CT &#43; AO2 &#43; pigmento branco e azul &#43; a1 &#43; CTe ainda achei muito branco. se um dia precisar mexer eu vou ter que tirar a ultima camada e entrar bem até tirar quase toda a AO2 pq ficou meio estourada.11 -- CT &#61; A1 &#43;AO2 &#43; pigmentos &#43; Wt. mas depois desgatei tanto que acho que saiu toda a WT', '2025-06-09T19:57:39.956000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f8dd0c3b-7f19-422d-9ac7-974bcc005bf8', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
ajuste de cor do 12tirei a primeira camada até quase sumir com a dentina e daí coloquei mais corante azul e branco e selei tudo com a1 e ct gradia por cima', '2025-06-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('eaee0141-52bb-424a-93f0-204a5335670a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd70a9c1f-bd34-422a-9079-95a950bad776', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadonada de mais, ela tinha um pouco de cálcula na contenção e uma gengivite leve generalizada, mas anda de mais. indiquei como seria que ela deveria escovar a lingua e como usar o fio dental. e aí sucesso.falei pra ela comprar o superfloss pra ajudar na contenção', '2025-06-23T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5783b838-f85a-4804-b63d-71b9036a7380', '30a89c67-7497-457f-a887-a56d1d721f6d', '661c1452-b95b-4087-9954-b4920884a36d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação para SouSmile &#43; indicação de limpeza Ela se enquadra no plano Smart', '2025-05-23T14:41:05.806000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a7bca093-76e9-4a65-8d14-0c3306b333cb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'df9c56f4-8854-48a0-ab6a-9deaf88b431e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
ela é advogada no andar de baixo. a gente super se conectou. ela veio de floripa para ca pq tinha terminado com o namorado e precisava remoçar. Conheci a perfeita da Claudia esse dia . A gente conversou bastante e eu ofereci para ela o tratamento de limpezas por 1600.00 ela viu bastante vantagem mas achou um pouco estranho eu cobrar tanto por uma limpeza que a principio era igual a que ela estava pagando 220,00. também me questionei a mesma coisa', '2025-06-02T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('62a0839a-2349-498e-aea1-27ad0f2b95e0', '30a89c67-7497-457f-a887-a56d1d721f6d', '8326366a-4ad0-43a4-b7fb-27bcadcc0928', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Toxina botulínica (botox), Clareamento de Consultório 1ª Sessão foram finalizadosFiz o botox nele e a 1 sessão de clareamento. Nós só fizemos o botox no terço superior Ele não sentiu sensibilidade na pirmeira sessão e aplicamos 4 vezes', '2025-06-06T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b3cdc20a-fc1d-4db4-a0e1-2fb00b4c05b5', '30a89c67-7497-457f-a887-a56d1d721f6d', '66522905-8b81-47d2-b5bd-d0a3f677ba4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
caiu a restauração inteira -- não dói nada --- ta entrando comida ali em cima lado esquerdo ---- e tem a impressão que tem uma outra restauração quebrada do lado direito em cima Sensibilidade nos dentes com a raiz exposta. depende o dia -- açúcar, banana, gelado, quente.', '2026-03-20T18:05:20.331000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6ab7019e-5da0-4ed6-9a8b-3088809529f8', '30a89c67-7497-457f-a887-a56d1d721f6d', '66522905-8b81-47d2-b5bd-d0a3f677ba4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G2 do dente 14, Rest. RC Classe V G2 do dente 13, Rest. RC Classe V G2 do dente 16, Rest. RC Classe I G4 na oclusal/incisal do dente 16 foram finalizadosRestauração cervical 13/14 ---- unique vittra _ ea1 vittra &#43; 16 OP -- DA2 EA2', '2026-03-23T13:21:12.585000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3d6e9169-2fde-436d-af9b-26dbf036f9eb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd16be994-37a2-4efd-93a9-68eae6db8cce', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recimentação da peça do dente 37, primeiro ele já soltou e deposi eu tive que colar ele de novo. Fé em deus que vai dar certo', '2025-06-04T18:19:03.969000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f09dfb7f-28ac-4983-9ef8-bcbeb4c83eb9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd16be994-37a2-4efd-93a9-68eae6db8cce', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recimentação de Trabalhos Protéticos foi finalizado', '2025-06-04T18:21:21.701000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('72c560bd-3f5a-4561-9ad3-8e96aac90167', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c39ed232-c153-47f0-9964-f2b66e909271', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação inicial. Tudo certo.um pouco de gengivite, mas ele literalmente nunca foi no dentista antes praticamente. fofo Placa em vários dentes, mas nada de mais. Ele vai precisar de limpeza, duas restauração e a extração dos sisos antes de fazer alinhadores e clareamento', '2025-07-07T20:28:57.054000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e2ff0ccf-ea4b-426f-a29f-7b40364c0f50', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebfa85aa-245b-421c-b809-ef5ca6544336', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G1 na oclusal/incisal e distal do dente 24 foi finalizadoAnamnese --- &#43;avaliação &#43; restauração', '2025-06-23T21:19:57.282000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('391a7761-b75e-4187-9fd7-fc924b2c7077', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebfa85aa-245b-421c-b809-ef5ca6544336', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Saiu toda a restauração e agora esta só uma peliculazinha.', '2025-12-26T12:29:16.439000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c5d874b5-b970-4acc-bae3-976e64e8f4cd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebfa85aa-245b-421c-b809-ef5ca6544336', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Restauração provisória do dente 17 foi finalizadoCIV com centrix', '2025-12-26T13:15:49.716000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('37612216-217f-4bc1-bc55-2ae3d82af6f2', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c81d4301-d1cb-4352-9614-42d2696cd165', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Exodontia de Dentes Semi-inclusos / impactados do dente 38, Exodontia de Dentes Semi-inclusos / impactados do dente 48 foram finalizadosClayton extraiu os dois sisos. Foi feito bastante osteotomia para remover os dois sisos. Mas correu tudo bem', '2025-06-26T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7defdc4d-d4ec-48ed-b0a7-e1dbd667e197', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c81d4301-d1cb-4352-9614-42d2696cd165', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção de pontos, o lado direito abriu e agora ele tem que fazer lavagem dentro do buraco para sarar o &#34;buraco&#34;. Não consegui remover todos os pontos, pq estava muito machucado ainda.', '2025-07-07T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('269491ff-03cc-466c-83c3-7e68075e35cb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c81d4301-d1cb-4352-9614-42d2696cd165', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Retorno para avalição de pontos e Esta fazendo o bochecho com água morna e sal. O lado que esta dando problema é o direito, soltou um potno e estava com um &#34;buraco&#34;? aberto, saindo gosto ruim. Dei mai sum ponto duplo e lavei bem com clorexidina e periogard. ele vai comprar oflluido da Bluem e fazer uum bochecho leve. limpar os pontos com uma gaze molhada em água morna e sal. Vai aplicar Omcilom orabase em cima dos machucados para Dói no fundo até os dentes de sisso em cima, mas pode ser dor reflexo.', '2025-07-07T17:44:36.081000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a5e3e6c1-20f5-4808-988f-bf13f0d2aaae', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c81d4301-d1cb-4352-9614-42d2696cd165', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G4 na oclusal/incisal do dente 14 foi finalizadoFoi uma classe I com a vittra unique', '2025-07-14T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a6fc5fd0-fb83-4960-bfe8-f4cc9622cc5f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c81d4301-d1cb-4352-9614-42d2696cd165', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoLimpeza com raspagem &#43; jato de bicarbonato &#43; profilaxia ---- sangramento mas pouco, e pouco calculo. Nenhuma bolsa', '2025-07-24T18:39:07.573000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3365b468-a7ea-442b-80e4-9d9d16e870ac', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e4cd49a-c974-424b-9d29-fc62d8284d85', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação da Célia, tudo certo, faltam alguns dentes e precisa de limpeza, orientação e higiene, algumas restaurações, mas no final das contas está tudo certo.', '2025-07-07T20:38:40.991000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d150c029-598e-443f-9fb8-bf15724c6f4a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a1bf1cb5-63ce-4714-b182-8c3fe1369c74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Na próxima, eu vou trocar alguns componentes e vamos mandar a prótese para fazer as soldas.', '2025-07-30T20:42:43.752000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fcbcaf1e-4abe-4243-b7aa-e94267cacb56', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação na proxima eu einvestigo um dente que ofii quando ele come pipoca', '2025-07-10T21:09:03.451000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f585594a-0ac2-40fe-b4e7-16e559108aa7', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival , Consulta odontológica foram finalizadosRemoção da gengiva em cima do dente.Limpeza com broca de baixa, evicarie para ver se tinha cárie, não tinha. Tentei limar para ver se encontrava o canal e não encontrei. Anestersiei e coloquei com a pistola de civ o civ na cavidade. Fiz a limpeza', '2025-09-03T14:23:36.876000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b6d1485c-71e2-4d3d-8bbb-eb33557adc52', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abertura &#43; Medicação Intracanal foi finalizado (irriigacao com clorexidina - instrumentação com lima 8/10/15 --- paramono, coltoso e bioplic) &#43; primeira sessão de clareamento. Sdi pola office 4 sessões', '2025-09-11T14:07:11.366000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e5c60dd6-76f7-4c9e-9583-226b7df4736f', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda sessão de clareamento de consultório... pedra pomes &#43; 5minutos de dessensibilizante &#43; 3c aplicacoes sdi pola office .... sentiu sensibilidade no 21/11 ... nao quis a quarta. &#43; 10 minutos de dessensibilizante', '2025-09-16T17:31:10.117000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c6d86629-0e70-4af0-8118-ca1c16a8bddc', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Terceira sessão de clareamento. Sempre tem muito progresso no caso do Thiago. Mas como tem uma restauração antiga bem nos dentes da frente, acaba que fica mais difícil de enxergar a evolução.', '2025-10-07T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0a4f0f44-90bf-4e09-8a37-e59acef670e9', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório, Seringas de Clareamento &#43; avaliação da plaquinha antiga foram finalizadosTerminamos todas as 4 sessões do clareamento dele e agora ele vai usar mais uma seringa de clareamento em casa, porque ele quer o dente super branquinho. Na minha opinião já chegamos na saturação do dente dele.', '2025-10-16T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bf33349e-63e1-4c7b-8e7a-6415a80a7dd2', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Extração Molar do dente 27, Enxerto com Osso Liofilizado do dente 27, Instalação de implante cone morse foram finalizados', '2025-11-03T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8d2f2b7f-e3bc-49ce-a02b-6c49515a9890', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ele está tão bem que não sente nada&#61;&#61;&#61; ele só sente os pontos incomodar um pouco.Dor e nem sangramento depois da cirurgia. Ele vai começar a usar o clareamento agora', '2025-11-12T13:58:48.088000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1047c22c-4096-4950-a5aa-f4d3a28b7ea8', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 12, Recontorno Cosmético do dente 11, Recontorno Cosmético do dente 21, Recontorno Cosmético do dente 22, Recontorno Cosmético do dente 23 foram finalizados', '2026-02-18T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8c790d67-681d-4b0c-a00e-5e66f1ca79c4', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
FACETAS DOS 23 AO 13 --- PALATINA BD BL DA ELORA EM TODOS DEPOIS MAMELOS COM O MESMO E DEPOIS CT NA INCISAL &#43; WE PALFIQUE DE COBERTURA nos caninos eu usei DA1 vittra e daí cobri com B1 da gradia', '2026-02-18T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e5498d5e-c80b-4daf-a475-060eb68e4989', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 13 foi finalizado', '2026-02-18T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a3a2ba32-ba33-41f2-a051-babf37655f80', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b8578ce5-7a78-4833-a06d-5f5a7270a1f4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação da face. ela me pediu para abrir mais o olhar dela. melhorar bigode chines e queria até um pouco de boca. eu falei pra gente fazer ultraformer e botox. Mas ficou caro e acho que ela não vai fazer. Afinal, talvez 2ml de preenchimento &#43; 1 botox já teria deixado ela feliz.', '2025-07-17T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d6681d11-22c0-41d3-b2af-067dd2083a15', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c1f8fee3-062d-478d-80f9-385959c98e29', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Faceta em Resina Fotopolimerizável do dente 13, Faceta em Resina Fotopolimerizável do dente 12, Faceta em Resina Fotopolimerizável do dente 11, Faceta em Resina Fotopolimerizável do dente 21, Faceta em Resina Fotopolimerizável do dente 22, Faceta em Resina Fotopolimerizável do dente 23 foram finalizadosb1 gradialaterais teve OL da 3m &#43; b1 &#43; corante', '2026-01-12T21:14:28.337000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9c43f595-8fee-4c0c-917e-2e22414202b8', '30a89c67-7497-457f-a887-a56d1d721f6d', '48444d61-53e5-4d33-a400-d7c175839294', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-08-12T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('355bc3c1-567e-4dcb-99fe-f1f54f4fc1e5', '30a89c67-7497-457f-a887-a56d1d721f6d', '48444d61-53e5-4d33-a400-d7c175839294', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. Ponta de Cúspide do dente 33, Rest. Ponta de Cúspide do dente 43, Rest. Ponta de Cúspide do dente 13, Rest. Ponta de Cúspide do dente 23, Placa de mordida miorelaxante foram finalizadosfeito tudo com DA1Ajustes e polimento moldagem e registro oclusal com silicone de condensação', '2025-08-20T14:45:29.924000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6b401e76-b984-4db5-b6ef-4ef05e2fd4df', '30a89c67-7497-457f-a887-a56d1d721f6d', '48444d61-53e5-4d33-a400-d7c175839294', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Recontorno Cosmético do dente 11, Recontorno Cosmético do dente 12, Recontorno Cosmético do dente 21, Recontorno Cosmético do dente 22 foram finalizados Tudo com da1 vittra palatina. vestibulaer A! gradia _ ct na parte média do 21 e 11 pra dar continuidade &#43; reparo no 33 ponta de cuspide', '2025-08-27T19:46:27.706000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a4db9d30-2316-426b-842e-ed87029d512f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ff582bde-36f0-46a4-990b-ac14e22dcb5d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta odontológica foi finalizadoAvaliação -- &#43; conversa e planejamento.', '2025-08-21T14:29:28.432000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6ca4c4a5-fdfd-48bf-a584-2db42756dc14', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ec07e624-5568-4066-b901-1d4df9727744', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação &#43; conversa &#61;&#61;&#61; ele quer re,over todos os amalgamas mais para frente, mas agora ele ta com o 46 quebrado. vamos fazer provisorio e coroa de resina . ele tem 3 endodontias e quer arrancar esses dentes um dia também', '2025-08-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1e1c03b5-702a-48d7-99fe-9abeceb4f0cd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ec07e624-5568-4066-b901-1d4df9727744', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção da resina &#43; amálgama antiga. 46Anestesia (mepi) &#43; isolamento absoluto &#43; núcleo de preenchimento com a1 ivoclar.', '2025-09-09T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('efc00efa-f20f-4f98-a3e0-4ae192022f3d', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ec07e624-5568-4066-b901-1d4df9727744', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
FInalizei o preparo, mas não conegui anestesiar ele por nada. Fiz de tudo e nada. lábio dormente e quando eu acionava a broca forte ele sentia dor. Tive que tentar finalizar o preparo para uma overlay, porque não dava de jeito nenhum. moldagem com adicao', '2025-10-01T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('09e21fd2-3975-4a46-ae98-c61256996ffd', '30a89c67-7497-457f-a887-a56d1d721f6d', '42f9c26f-7b14-4a93-b1ba-6e18cbd148c7', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Primeira sessão de clareamento e avaliação inicial', '2025-08-22T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bc41f9cb-dabd-4f52-8490-d7cf431e9537', '30a89c67-7497-457f-a887-a56d1d721f6d', '42f9c26f-7b14-4a93-b1ba-6e18cbd148c7', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda sessão de clareamento. Nenhuma sensibilidade novamente... Moldagem para as placas de clareamento', '2025-08-28T21:59:47.539000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f92b8948-a746-4f71-85e4-5db96176801b', '30a89c67-7497-457f-a887-a56d1d721f6d', '42f9c26f-7b14-4a93-b1ba-6e18cbd148c7', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório, Clareamento Dentário Caseiro, Limpeza de Protocolo de Saúde Gengival foram finalizados Limpeza feita com raspagem manual. E profilaxia &#43; fio dental. Pouco sangramento, mas bastante placa mole. Cálculo somente na cervical da contenção. Uma das resinas está solta no 32. Última sessão de clareamento hoje também! E entrega mais orientação de uso do clareamento caseiro', '2025-09-19T18:36:39.761000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4f87957a-bd3d-4ee7-9c8b-629aa4d22abc', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd43621ae-8c82-47b0-88f8-0170352be0c4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoAvaliação inicial &#43; limpeza ----', '2025-09-12T22:24:02.110000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('79ff16d1-9261-48a8-b300-0104b3f96cf8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd43621ae-8c82-47b0-88f8-0170352be0c4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ta tentando o máximo possível cuidar, mas não comprou o bochecho. Fio dental todos os dias, inclusive as vezes duas vezes por dia. Parou de sangrar. Não sai cheiro ruim. A escova fica descabelada. ele comprar as escovas de cabo de madeira com cerdas macias. Ele esta sem sangramento na sondagem, ele continua com bolsa 27/28e em outros lugares', '2025-10-22T13:34:02.429000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('81bad904-2f1f-4fa5-9d60-bc7af507116c', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd43621ae-8c82-47b0-88f8-0170352be0c4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-10-22T14:41:50.834000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('06da1705-76c1-457e-83de-a127df07e2e4', '30a89c67-7497-457f-a887-a56d1d721f6d', '61813a3c-7407-4dd3-8e9a-2127be0f0490', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadogengivite. Gengiva bem vermelha. e sangrante e bem inchada. Tem fotosMas quanto a sondagem está tudo certo.', '2025-09-24T19:06:03.736000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9a6190c7-9ae5-4cd0-a55f-2bb33fd00b0a', '30a89c67-7497-457f-a887-a56d1d721f6d', '61813a3c-7407-4dd3-8e9a-2127be0f0490', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Gengiva mais bonita. Pegou uma intoxicação alimentar no aeroporto ---- McDonalds voltou dia 10//11 do rio de janeiro. Ta usando o fio dental de haste. Escovação --- curaprox. Escovando a lingua ---- Com raspador de lingua', '2025-11-17T19:34:56.959000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a13f62c4-9388-4dcd-95c3-e8b1a6a048b9', '30a89c67-7497-457f-a887-a56d1d721f6d', '61813a3c-7407-4dd3-8e9a-2127be0f0490', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival , Remoção de Excessos do dente 27, Remoção de Excessos do dente 32, Remoção de Excessos do dente 31, Remoção de Excessos do dente 41, Remoção de Excessos do dente 33, Seringas de Clareamento &#43; avaliação da plaquinha antiga foram finalizadosLimepza --- sangrou razoavelmente durante a limepza e sangrou mais com o jato. com a sondagem quase nadabolsa pequena entrw 24.23 Escoavação ta lignua ta legal:|pedi pra interromper o periogard e so usar o bkuem', '2025-11-17T20:44:57.674000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('525eef39-7790-4ace-896c-187a84a3a5cd', '30a89c67-7497-457f-a887-a56d1d721f6d', '61813a3c-7407-4dd3-8e9a-2127be0f0490', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Percebeu que na TPM a gengiva dela fica mais sensível. Sangrou a gengiva dela um diazinho durante a tpm e agora já passou. Escova - de manhã escova o dente, toma café e daí caso ela saia de casa ela escova de novo e de noite ela escova antes de dormir Fio-dental ---- De noite - não ta sangrando -- nem saindo cheiro ruim Bochecho --- Ela ta usando um da colgate, O PLACS --- Ela tava usando a CURAPROX', '2026-02-05T19:59:28.743000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('248c2279-bd11-4c88-9f9f-2ab76a2be9cd', '30a89c67-7497-457f-a887-a56d1d721f6d', '61813a3c-7407-4dd3-8e9a-2127be0f0490', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção de Excessos do dente 42, Remoção de Excessos do dente 43, Rest. RC Classe IV G1 na oclusal/incisal do dente 21, Limpeza de Protocolo de Saúde Gengival foram finalizadosBD elóra --- borda incisal do 21 --- limpeza finalizada, poucos sangramentos remoção final das resinas palatinas anteriores inf.', '2026-02-05T21:06:26.071000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('551840b9-361e-454a-af08-27dceaf39fb6', '30a89c67-7497-457f-a887-a56d1d721f6d', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste de Implante do dente 36, Componente Protético do dente 36, Rest. RC Classe II G1 foram finalizadosMoldagem do implante &#43; ajuste da restauração do 37', '2025-10-13T13:35:53.884000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('14f8e467-07da-46d5-80f7-aff680ecafb7', '30a89c67-7497-457f-a887-a56d1d721f6d', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na oclusal/incisal e distal do dente 26, Rest. RC Classe II G3 na mesial e oclusal/incisal do dente 16 foram finalizadosEsta aqui os 16/26 mas na verdade foi o 27 e 17. Não consegui mudar na hora o planejamento... Anestesia local, remoção das cáries, isolamento total&#43; bulk filll flow &#43; vitra unique', '2025-10-24T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5e330d25-6b02-4974-b67a-bb17f6401abb', '30a89c67-7497-457f-a887-a56d1d721f6d', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G4 na oclusal/incisal, distal e vestibular do dente 14 foi finalizadoremoção da restauração antida OD &#43; preparo pequeno na vestibular &#43; dA2 vittra', '2025-11-03T15:09:34.129000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('358ed1e9-5436-4455-8948-5fc1d3bbe375', '30a89c67-7497-457f-a887-a56d1d721f6d', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Se adaptou bem. Quando troca de aparelho ele sente a pressão Quando ele troca de aparelho não vê a diferença', '2026-02-27T20:18:21.589000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e4ce3fa9-0116-4762-83b1-f046a103f9e9', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento em Consultório, Raspagem Supra-gengival (RAP) - Limpeza, Gengivoplastia do dente 11, Faceta em Resina Fotopolimerizável do dente 11, Faceta em Resina Fotopolimerizável do dente 12, Faceta em Resina Fotopolimerizável do dente 13, Faceta em Resina Fotopolimerizável do dente 21, Faceta em Resina Fotopolimerizável do dente 22, Faceta em Resina Fotopolimerizável do dente 23 foram finalizadoswt vestibu;ar DA1 vittra Ct palatina', '2025-11-28T19:40:36.427000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('afb51394-7365-4ca0-86fa-f1699f5d65d0', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajustes finais e polimentos', '2025-12-05T20:35:08.264000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4988ae82-9346-4b55-b4f1-010465554e40', '30a89c67-7497-457f-a887-a56d1d721f6d', '560be938-7906-4c3a-9e00-072c38340dde', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoavaliação &#43; sondagem ... sondagens beeem profundas de', '2025-10-15T17:58:18.953000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('45576a7b-7a95-4c2e-b2d3-ee08c15c167a', '30a89c67-7497-457f-a887-a56d1d721f6d', '560be938-7906-4c3a-9e00-072c38340dde', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe V G3 na vestibular do dente 23, Rest. RC Classe V G3 na oclusal/incisal e vestibular do dente 22, Rest. RC Classe III G4 na oclusal/incisal, distal e vestibular do dente 13 foram finalizadosVittra unique', '2025-11-05T20:09:08.771000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('41ae6fe1-cb8f-48cc-86bc-cdd46d2b47a8', '30a89c67-7497-457f-a887-a56d1d721f6d', '560be938-7906-4c3a-9e00-072c38340dde', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário do dente 16, Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário do dente 17, Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário do dente 15, Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário do dente 25, Limpeza &#43; RAP Sub. e Supra gengival &#43; Polimento Coronário do dente 26 foram finalizados', '2025-11-05T20:09:36.830000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('54425e75-afad-4edf-9215-296aebfe20b5', '30a89c67-7497-457f-a887-a56d1d721f6d', '7deadc27-488c-41f7-8d9f-9b37736f8b78', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta inicial. Paciente bem cético quanto aos outros dentista que ele encontrou depois que o dele de &#43;20anos se aposentou. Ele quer basicamente aumentar o tamnho dos dentes de baixo pra conseguir mastigar melhor. A ideia inicial vai ser planejar próteses de resina para servirem como provisórias para que a gente veja se foi inteligente. Ele disse que a prótese do 37 sobre implante está machucando a gengiva. não posso esquecer disso.', '2025-10-31T19:09:02.474000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2f1a1b31-e58e-4393-9e3f-fc8ef2b485a2', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Começou a usar o fio dental e gostou. Não está sangrando a gengiva depois de usar o fio dental/ GOSTOU DO GUM. esta escovando a lingua e usando o bochecho. VÃo comprar o BLUE M Ele tem usado a escova para escovar a lingua e usado o raspador depois.', '2025-12-17T18:09:36.401000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a71e24a8-4303-4a45-8c84-72e7dc86ecc0', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Passou bem o final de anoVoltaram do rio semana passada, No rio só escovava os dentes e não fazia mais nada. Normalmente tem passado o fio dental e usado o enxaguando tambémNão tem usado muito a escova de lingua.Voltou do rio e voltou a usar. NÃO SANGRA -- mas em um dente sangrou ontem. Tem usado a escova de dente da colgate ----', '2026-02-04T19:01:00.322000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a1490842-4298-47d8-8e15-b660d9cbe371', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadosangramento generalizado &#43; alguns calculos sub queeu eu tirei. ainda tem algumas bolsas mas melhorou muito desde a ultima veza lingua ainda é um problema, mas vamos tentar colocar a escova;cão da lingua antes da dos dentes para ver se lembra', '2026-02-04T19:43:12.864000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4b17054c-3b31-45eb-8058-da62ec702f5c', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-02-04T19:50:50.933000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d8109225-cd09-4c4c-a23f-939b76571271', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Primeira sessão de clareamento', '2026-02-19T20:12:35.472000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c5858cd5-13b1-4bed-8125-16f04e0160a6', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Segunda sessão de clareamento --- usei o da DFL', '2026-03-04T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e81195ac-143b-4b5d-bed8-26c1537c0f52', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
terceira sessão Clareamento em Consultório foi finalizado', '2026-03-12T22:06:34.208000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('79ef245b-31a2-48b8-8e11-2da52c1a1e03', '30a89c67-7497-457f-a887-a56d1d721f6d', 'af84440e-9f9c-4117-82a6-f25614565983', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Clareamento Dentário Caseiro, Limpeza de Protocolo de Saúde Gengival foram finalizadospouco sangramento ---- e orientação de higiene', '2025-11-28T12:30:17.498000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4abef48a-4909-49a3-8140-7900c2d364b7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'af84440e-9f9c-4117-82a6-f25614565983', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Entrega do clareamento. &#43; explicações &#43; avaliação da gengiva entre 36/37', '2025-12-05T20:26:22.194000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9c0e6db0-2386-44b7-82d8-285587c912c3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'af84440e-9f9c-4117-82a6-f25614565983', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
ela não terminoua primeira e está terminando a segunda agora. Ela ficou uma semana sem para não machucar ZERO sensibilidade. FLuor no 37&#43;36&#43;35, ela sentie sensibilidade no 37, para escova e normalmente, mas eu acredito queseja falta de cuidado na hora da higiente....orientação de escova;cão mais eficiente nos dentes suepriores posteriores.', '2026-01-26T11:49:03.375000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('802789f9-a15f-4539-ae52-4c1d72dca707', '30a89c67-7497-457f-a887-a56d1d721f6d', '1cd22015-cb1b-4555-9cbb-f6e066d79205', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoBolsa localizado nos molares superiores', '2025-12-18T17:37:56.033000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9afb6c62-dd7c-4c1c-8b47-cdaa54af8fa8', '30a89c67-7497-457f-a887-a56d1d721f6d', '1cd22015-cb1b-4555-9cbb-f6e066d79205', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Escovando duas vezes por dia, manhã e noite. escova macia Fio dental --- usa quase todos os dias --- 3 a 4 x por semana --- não sangra --- não sai cheiro ruim Nada de novo, nenhum dente doendo', '2026-02-04T16:57:35.691000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8c0539d2-a726-4148-870d-897b7b0fa4c6', '30a89c67-7497-457f-a887-a56d1d721f6d', '1761f823-1b51-4461-bb66-c0ed6636c302', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação &#43; limpeza tinha algumas bolsas e tinha um problema entre. 12 e o 11 Orientação de higiene', '2025-12-15T21:45:46.127000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('323c6524-854b-403a-887c-9f2130878e36', '30a89c67-7497-457f-a887-a56d1d721f6d', '1761f823-1b51-4461-bb66-c0ed6636c302', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2025-12-15T21:48:04.790000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c5b9f050-3c86-4c79-8a6a-a4b8bdea180f', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e916e68-5fec-4d59-bd67-1924603810cf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Ajuste de Implante foi finalizadoRemocão do implante remédio no alveolo mais aperto de 22N para ver se segura.', '2026-01-22T18:32:02.928000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('29018097-c77d-48db-96f7-9c11173aa4d6', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e916e68-5fec-4d59-bd67-1924603810cf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G4 na mesial, oclusal/incisal e distal do dente 17 foi finalizadoRemoção de toda resina periférica antiga &#43; isolamento absoluto, evicárie e daíflow nas interproximais, bulk fill no miolo e da2 vitra e um pouco de unique pra cobrir. Acho que deu um ponto de contato legal fiz a metade OD do 16. Cárie em baixo da rest. antiga. isolamento absoluto, evicárie e mesmas resinas de antes.', '2026-02-06T18:49:22.738000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('85a51d7b-2ad1-49a2-97db-345d6d6a3b88', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e916e68-5fec-4d59-bd67-1924603810cf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na oclusal/incisal e distal do dente 14, Rest. RC Classe II G4 na mesial, oclusal/incisal e distal do dente 16 foram finalizadosIsolamento absoluto...', '2026-03-05T22:57:34.007000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6e1203da-479f-4207-b82b-1b83bdbe1923', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e916e68-5fec-4d59-bd67-1924603810cf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
primeira sessão de Clareamento em Consultório foi finalizado', '2026-03-11T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('58e5736c-4427-4f9c-bc82-eda93f9aa3b1', '30a89c67-7497-457f-a887-a56d1d721f6d', '3341da60-6d82-4c06-8cbe-b9209ac93919', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Remoção de Excessos do dente 23, Remoção de Excessos do dente 22, Remoção de Excessos do dente 21 foram finalizadosRemoção dos excessos com broca e polimento, deixei o central com masi cara de dente e deixei tudo mais bonito', '2026-01-28T21:04:52.878000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9d4b8d9d-f24a-4323-b913-c8c7d949d0d6', '30a89c67-7497-457f-a887-a56d1d721f6d', '73401fb7-c682-4da7-9352-06f591c47fad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G1 na oclusal/incisal do dente 46 foi finalizado', '2026-01-26T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('87e31eab-4095-49d2-a989-1212ca97a0d1', '30a89c67-7497-457f-a887-a56d1d721f6d', '73401fb7-c682-4da7-9352-06f591c47fad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação, &#43; remocção de cárie inativa na vetibular do 46. precisa de limpeza, orientação de higiene', '2026-01-26T12:51:47.847000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5ba2f742-3248-4409-ab74-928be21a2362', '30a89c67-7497-457f-a887-a56d1d721f6d', '73401fb7-c682-4da7-9352-06f591c47fad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadoUm pouco de sangramento generalizado, mas nada de mais. Só manter em casa', '2026-02-06T18:15:22.016000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f0612c16-62d6-4a88-be35-e3be6a0aa618', '30a89c67-7497-457f-a887-a56d1d721f6d', '2462a256-7ae6-4b62-a418-b3704d6e9f22', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe I G3 na oclusal/incisal do dente 75, Limpeza de Protocolo de Saúde Gengival foram finalizados', '2026-02-06T21:49:45.652000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9ac2f21e-fda3-4c41-bad1-cefbfc7fb49e', '30a89c67-7497-457f-a887-a56d1d721f6d', '250bcb2e-1891-442a-8dfd-9c55b7790792', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na mesial e oclusal/incisal do dente 14 foi finalizado isolamento absoluto ---- restauração com anestesia', '2026-02-13T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6bdbc850-76f0-48f6-b30a-4b90ddf18a74', '30a89c67-7497-457f-a887-a56d1d721f6d', '250bcb2e-1891-442a-8dfd-9c55b7790792', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Está mais seguido o uso do fio-dental (não sangra, as vezes em um ou outro dente está sangrando) --------- não sente o cheiro ruimmmm ---- ---- 3 cafés da manhã ----- não tanto café ultimamente ----- continua com açúcar ----- Está usando o fio dental de haste ---- ta escovando a lingua ----', '2026-02-23T16:43:08.962000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('074cefe2-db2b-4594-a04a-04013d718523', '30a89c67-7497-457f-a887-a56d1d721f6d', '250bcb2e-1891-442a-8dfd-9c55b7790792', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
sangramento em alguns dentes, em varias gengivas --- mas nada de bolsa ---- ela ta usando mais fio dental , mas ainda não está otimo --- a lingua esta com u pouco de saburra ainda porq ue ela tem dificuldade de escovar Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-02-23T17:24:41.399000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5cc34026-9e91-4111-9943-d7b9375928c8', '30a89c67-7497-457f-a887-a56d1d721f6d', '1ae38cda-9094-4afd-b137-ab1cc3b44441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
limpeza', '2026-02-13T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bde1607b-e049-4fa0-b026-ed69b91878ce', '30a89c67-7497-457f-a887-a56d1d721f6d', '1ae38cda-9094-4afd-b137-ab1cc3b44441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizado', '2026-02-23T17:38:36.897000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b91bec48-670c-467c-932b-40e7f3270829', '30a89c67-7497-457f-a887-a56d1d721f6d', '1ae38cda-9094-4afd-b137-ab1cc3b44441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Sangra bastante mas bate na gengiva por causa da força --- não sente cheiro ruim ---- Usa a mesma escova que usava antes --- não sangra quando escova o dente a------ escovando a lingua ------ deu uma dificuldade no começo, mas agora já ta conseguindo melhor.', '2026-02-23T17:38:43.962000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('52bcde28-17dc-4e5a-b067-91f5c2b21c8d', '30a89c67-7497-457f-a887-a56d1d721f6d', '1ae38cda-9094-4afd-b137-ab1cc3b44441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na oclusal/incisal e distal do dente 14, Rest. RC Classe III G4 na distal, vestibular e palatina do dente 13 foram finalizadosIsolamento absoluto --- anestesia --- vittra uniqueee', '2026-02-23T18:52:33.744000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5f8469f3-5806-4f1a-95f3-129334dab482', '30a89c67-7497-457f-a887-a56d1d721f6d', '9b4c082b-00c5-479b-99d1-401b1382a441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Anamnese &#43; avaliação &#61;&#61;&#61; ddoença periodontal moderada/alta', '2026-02-25T22:10:26.242000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b730f2ac-b71e-46e2-ae36-eab612929968', '30a89c67-7497-457f-a887-a56d1d721f6d', '9b4c082b-00c5-479b-99d1-401b1382a441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival foi finalizadosondagens de 6/7 milimetros entre molares -- bastante sangramento, calculo supra e subgengival. Orientação de higiene ao final &#43; entrega de escova de dente de lingua, dente e pasta.', '2026-02-25T22:10:47.690000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cbd44ad7-248c-407d-bb96-60841d463fbe', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Limpeza de Protocolo de Saúde Gengival , Rest. RC Classe IV G1 na oclusal/incisal do dente 11 foram finalizados', '2026-02-25T03:00:00')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('19eb4b5f-4fe2-4e8d-bf34-d166393163ea', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação &#43; limpeza &#43; rest incisivo sup 11 A1 vittra', '2026-03-05T16:28:50.946000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f90b07a9-4b73-4678-b5b6-3989586a1195', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Não sangra --- ela não passava nenhuma vez -- nunca 1x na semana --- não saiu cheiro ruim -- o dente que a gente arrumou ela gostou bastante ---', '2026-03-05T16:29:08.186000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('92e2e166-9f18-41b1-9d9f-a5aa86e08bd7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Rest. RC Classe II G3 na mesial e oclusal/incisal do dente 27 foi finalizadovittra unique &#43; isolamento total &#43; ela precisa de muita anestesia', '2026-03-05T18:00:19.161000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('41da60e6-e5b4-47a4-9d2d-084cdf176c33', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Consulta odontológica foi finalizado irrigação (periogard) das areas onde ficavam os sisos 38c e 48 -- &#43; omcilon &#43; remedio &#43; orientacões', '2026-03-12T22:10:17.962000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ad07ab96-39ef-470c-b924-69041928c2b5', '30a89c67-7497-457f-a887-a56d1d721f6d', '3ed700e8-0d0a-4118-af57-026524750418', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Avaliação e orientação de higiene. Paciente tem apenas os dois incisivos centrais inferiores.', '2026-02-26T20:03:48.012000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2faaed05-4a2d-4b8f-8523-04c6298475bd', '30a89c67-7497-457f-a887-a56d1d721f6d', '22198903-8a6f-42b3-81c5-1c77807a7241', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
primeira sessão de Clareamento em Consultório foi finalizado', '2026-03-12T22:08:58.668000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cd3374f4-0783-4457-82bc-ed682691c324', '30a89c67-7497-457f-a887-a56d1d721f6d', '01ac73a4-bbda-43c2-9a10-16e634244aa8', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Evolução - Julia Bonfanti]
Abertura &#43; Medicação Intracanal do dente 25, Restauração provisória do dente 25 foram finalizados', '2026-03-12T15:33:37.541000')
ON CONFLICT DO NOTHING;

-- ============================================================
-- 4. CONTACT NOTES (anamnese)
-- ============================================================
-- 139 anamneses encontradas

INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b41ad19c-b034-4ae2-a08f-c1aac003289e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bb9e4474-cf4e-458b-aa03-1b14b3d79c94', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-22T17:45:43.528000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0df75eaf-fd60-4348-8f72-c4731c7db26d', '30a89c67-7497-457f-a887-a56d1d721f6d', '1761f823-1b51-4461-bb66-c0ed6636c302', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-12-15T20:25:38.377000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2500b3ec-3425-40be-b64a-4e974bdcc078', '30a89c67-7497-457f-a887-a56d1d721f6d', '0ab9f064-4ba4-4603-8a91-15622bbe7e17', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-06T21:28:15.152000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bd241a2c-411c-4813-9323-faa1950f80af', '30a89c67-7497-457f-a887-a56d1d721f6d', '1e4dde0f-6814-494d-b74d-96d654738039', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-06T21:32:49.569000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('410c82c9-d481-4619-80b1-1abee8093604', '30a89c67-7497-457f-a887-a56d1d721f6d', '06e94d65-867a-4f07-934e-3431dac5e9bf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-11T20:01:14.158000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3b31581c-7eda-4637-ac52-96f289a8ba45', '30a89c67-7497-457f-a887-a56d1d721f6d', '4d84bd70-53ff-4cf7-ac12-03ab33e64c94', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T20:11:00.651000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6b934eb2-41ea-4b59-96e9-e2a29a3c9ffb', '30a89c67-7497-457f-a887-a56d1d721f6d', '0317a7d4-e362-4b21-8a3f-aa1262a133c5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T20:18:41.493000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('19ddd42b-edce-4e9b-9e1c-615184d33aec', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b4ab2ee8-3020-4788-9a19-a5221db66c04', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-06T21:34:52.358000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cce6a1c8-699c-44de-ba7c-da7e59319aeb', '30a89c67-7497-457f-a887-a56d1d721f6d', '9eee0fbd-2b61-4c85-a592-29f5dfe2ae5d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-11T20:46:10.741000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4eed9ef6-fe49-4d3b-b645-39c7bb053ec8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a6a08e6d-b6e8-485a-91b8-5e5d9a824567', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-11T20:26:08.776000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cd7263f9-7ce9-486d-a505-bd8689b492e7', '30a89c67-7497-457f-a887-a56d1d721f6d', '81aa26ae-ee03-43bb-a583-902db2ab0b92', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T21:14:22.523000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0e4e75b2-2083-4618-8b7f-9b46e059e409', '30a89c67-7497-457f-a887-a56d1d721f6d', '436e6f97-a149-402b-96c6-42eddfcf5646', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T20:36:59.506000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('73756290-ff95-4785-b435-ee1b1055f48e', '30a89c67-7497-457f-a887-a56d1d721f6d', '660e1073-20af-4942-8262-7383cf1b3a61', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-11T21:05:05.526000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5c7a6c9e-18e9-4522-b5fd-a8d3f534f3ec', '30a89c67-7497-457f-a887-a56d1d721f6d', '08aed8d0-f25c-4470-ab83-e56dd78fc6fa', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T20:54:07.486000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('caeaa82f-0dbc-42bf-82ba-522814233e1e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e03385ee-a8bb-48f1-8e5d-912d8cb341b1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:45:58.120000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6668ee07-0fb9-4a78-9ef6-2c019354034f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a1f7ee50-addb-4ee2-bdae-25e7e34e7005', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T21:36:31.946000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5313fa6a-6c1c-4672-8c74-cb17084cecc2', '30a89c67-7497-457f-a887-a56d1d721f6d', '479d339e-80e4-4930-8e02-708629653d80', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T18:02:21.452000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a334c7db-976b-4b3b-95ce-f5abcae24ff6', '30a89c67-7497-457f-a887-a56d1d721f6d', '4083d3b1-f04f-45aa-ac60-f2352fb175ac', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:48:58.322000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0787d41a-17ec-485d-8a06-ee2b9cadd377', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c29d267c-5cd8-4d08-8f05-a70ed2ab08d3', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T17:59:52.563000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('df242b8f-58bb-4676-9287-30b75c500b14', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd74230ec-e105-4795-9ff2-46b91a4bcafe', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T19:35:06.136000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('79913dbc-fe13-4061-9d81-eff6df4c0b32', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a91d2816-d10a-430a-a0c8-d141ee7746d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T18:25:05.312000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8eed8eae-3f2a-4863-92ee-6bf839b17672', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd07b416a-84c1-4639-8600-d1d2426c97e1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T22:03:09.259000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('24e0d8c7-1258-48db-a9f4-18eb390d76ff', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b0fb3904-d922-41a1-874a-e8529d6ffc29', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T22:07:22.878000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a5ed8671-3df8-4332-a67b-14ebd6ae279e', '30a89c67-7497-457f-a887-a56d1d721f6d', '000b97eb-e244-4d41-a648-ae55a95f8e9f', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T18:18:53.624000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e953a61a-5913-49f6-8ec8-4644c01838d8', '30a89c67-7497-457f-a887-a56d1d721f6d', '77e6d0fd-c67d-48bb-b0c1-0902da5807db', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T22:12:16.554000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0b8b236c-3a78-49b3-bab0-52fadf3dec69', '30a89c67-7497-457f-a887-a56d1d721f6d', '28d78055-d332-40c4-91a6-802809dc6944', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T22:31:00.021000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('25d27e39-da94-4806-bb82-ead256f0e927', '30a89c67-7497-457f-a887-a56d1d721f6d', '226f0e17-7ad5-4e45-92f3-8d44293722e0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T22:35:03.465000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('15aff520-ebf2-4f6e-84b9-6a86f139d78f', '30a89c67-7497-457f-a887-a56d1d721f6d', '62c6c756-46e0-4138-a451-a84f22c24775', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T22:41:28.203000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('59e56a5f-92a5-4461-89f8-dddeb0649eeb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b7b1ca75-e35d-46ad-aefd-f6f21e0ad7ca', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T22:46:31.934000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a4978c3a-fff4-4c85-bccf-6c5970eebbf5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ececa12a-7ebf-4741-8dc1-2da654c5762b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T22:51:51.422000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4ba2f97e-fea1-496f-94f7-9bc1e0615b87', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b36c4474-79a9-4cf3-a3ec-510d689fc6ce', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T18:30:28.235000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('734157ce-55ba-4b14-9b39-eef705aadf19', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e7aee980-901f-468f-bdd6-dd9db93c25d4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T18:08:48.460000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3e062a17-330d-400c-8488-4930f6e3be07', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ecf91d1b-5774-40e2-b5da-4d2b63e83cad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T20:27:45.781000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('dcc24d21-f009-4e18-8ff8-c0e604b017d2', '30a89c67-7497-457f-a887-a56d1d721f6d', '55ffdef5-af94-4693-895c-352ef43c4139', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T20:00:52.904000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('36a5ae1e-0e2b-4fc2-9276-cd06647060bb', '30a89c67-7497-457f-a887-a56d1d721f6d', 'dd619242-6f83-4bf1-9b4e-57426a38d0ae', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T20:09:54.923000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ab117967-3fc5-44c7-aeca-f4cd2f74381e', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c5c662c-fd50-4935-8bf2-0463f5558f74', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T20:34:23.832000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fd2bf88c-aa48-4f9a-92f4-147ee0791297', '30a89c67-7497-457f-a887-a56d1d721f6d', '77772554-ecd1-45b9-98d4-c4dfc4226388', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:03:17.997000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('97797125-48c1-4e99-92de-358942bd25b1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'cdee6000-3f7b-4e90-9db3-a38c01e4ebbc', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T21:29:31.197000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5b56597a-751a-4657-9a93-0c62f69de638', '30a89c67-7497-457f-a887-a56d1d721f6d', '9c580499-c111-46f4-94c7-df83d0f6d536', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T20:56:06.974000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('28d6adc2-e646-4740-ad52-f644f32f26a5', '30a89c67-7497-457f-a887-a56d1d721f6d', '7bf77835-1526-4196-88cd-9090a6434e59', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:10:36.040000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('523392f5-44b9-47e1-9492-2202a30f2f65', '30a89c67-7497-457f-a887-a56d1d721f6d', '1f3011ca-679e-4cfa-be37-eda40d8957bf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T20:45:19.903000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e0fd77a1-31b5-458a-a04c-c4d2a5e904f1', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e17fd542-482c-47f9-8244-43b13b079825', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:39:20.331000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0b28a3c9-9a5f-4f6c-8827-52df71abf0e1', '30a89c67-7497-457f-a887-a56d1d721f6d', '3571dcf2-89f6-4ea5-a34d-828b25f83756', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:16:50.236000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5d52bc61-bcc0-4a6a-a5af-a5c8bab1e36b', '30a89c67-7497-457f-a887-a56d1d721f6d', '92e5bc70-44f2-453a-b4bb-ab9464c465f8', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-12T21:21:42.270000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ae0aa0dc-aea5-4b04-bc56-8c3a12162a01', '30a89c67-7497-457f-a887-a56d1d721f6d', 'de4f8ead-3e4b-494c-a00e-e9cc84990f12', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T21:55:47.515000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('d7f9d1bb-587e-4afd-b478-464efb8db766', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f4eaa10e-a58b-4b8e-b492-277abd7b5b5e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-18T19:03:10.795000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('480b30ad-21f3-47e0-956d-8414222dc79a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'cb336620-5a2d-4598-99b1-8f59cf765b32', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-18T19:10:06.640000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8c5a6add-f9d9-406a-9e52-5ef76a47bb8b', '30a89c67-7497-457f-a887-a56d1d721f6d', '9f3d2e91-6154-4903-ba0c-9f9433d2d819', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-18T19:32:01.905000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0d889a25-2368-416c-b16e-c640f36c9960', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bcc82287-f376-4261-82f7-fe42f71a3009', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-18T19:00:11.430000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ba028bdb-b09b-404b-80f0-d5ec26134b97', '30a89c67-7497-457f-a887-a56d1d721f6d', '856191f5-8367-43cc-bc39-a413baf8db05', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-11-18T19:23:36.490000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1d2cf7de-9125-4670-a9cb-eaaaea45dcc3', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ef9abe37-1faa-43c4-82b6-960d3403d370', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T18:14:22.608000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6fc7575d-1216-48d9-86f0-93ae30417219', '30a89c67-7497-457f-a887-a56d1d721f6d', '3aeebec7-ce34-4832-9c05-64fd26aa0b3b', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-22T16:40:52.687000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('26160ad2-3a69-40c5-9e80-4c832d6a9869', '30a89c67-7497-457f-a887-a56d1d721f6d', '6cd890d6-ab9e-4c46-b46d-49de6f90e4b1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF]', '2024-11-26T19:57:02.834000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('591a3c5a-af7e-478f-bb67-24c7775ae7c4', '30a89c67-7497-457f-a887-a56d1d721f6d', '4a1150e2-250a-447a-907f-b38ef20bd546', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF]', '2024-11-26T20:44:18.050000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cb623791-a24e-4d77-93b9-38a198964004', '30a89c67-7497-457f-a887-a56d1d721f6d', '6dbe39bc-235e-4dbd-b69b-a7b753328a06', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-03T18:39:34.734000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('476693ca-263b-4285-ad7c-57ba3749ab8a', '30a89c67-7497-457f-a887-a56d1d721f6d', '9e7be956-a04c-480d-9a14-204457236b6c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-09T10:45:12.233000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fb7cfe4e-cabb-45da-b863-867e2dc28d9e', '30a89c67-7497-457f-a887-a56d1d721f6d', 'de501c73-6b00-4f57-842c-cb8db2665125', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF]', '2024-12-06T20:46:23.878000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4810d3af-1d96-43a1-a135-717dbdf300a1', '30a89c67-7497-457f-a887-a56d1d721f6d', '6d78a343-ac08-4c3c-ae1c-d792d9fb0679', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF] ⚠️ POSSUI ALERTA', '2024-12-06T21:30:40.074000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0ad536c3-2417-4f5c-82e5-5be229b08891', '30a89c67-7497-457f-a887-a56d1d721f6d', '36fb7501-1117-4461-bec2-5fa83e2a2592', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-09T13:17:06.332000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e188681c-f8c0-42e0-8161-c7759828a524', '30a89c67-7497-457f-a887-a56d1d721f6d', '731093fd-45cb-42df-8ae4-a57e4308a523', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF] ⚠️ POSSUI ALERTA', '2024-12-10T14:55:34.382000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4b1e5ddb-5ed9-449a-9d3b-895d4edc9f37', '30a89c67-7497-457f-a887-a56d1d721f6d', 'f430e5f9-62e4-4c37-adf8-71bfe166264e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-12-06T17:56:58.661000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5d59aff8-cf84-4fb7-b9f0-46845230da60', '30a89c67-7497-457f-a887-a56d1d721f6d', '0362a595-189d-4403-85d1-053861a7c74c', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-16T14:09:52.972000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('3864b0c5-bff3-485e-bbce-11a2b1918549', '30a89c67-7497-457f-a887-a56d1d721f6d', '22198903-8a6f-42b3-81c5-1c77807a7241', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-03-12T11:50:40.432000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6ff36807-5d96-413f-b398-c19a3a06d875', '30a89c67-7497-457f-a887-a56d1d721f6d', '25d84b99-e3a3-4301-9a88-b47e74fff232', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF]', '2024-12-10T12:33:22.969000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c479ae99-2763-481d-bb17-496ec08f355a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c2eb0b64-cb45-4a8a-8a3b-489d3ac494be', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-12-23T13:31:22.572000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f8924eae-3cda-4b4f-93a2-76f386495b55', '30a89c67-7497-457f-a887-a56d1d721f6d', '6b02133d-82f2-4805-83ad-f4cbe277fcc1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-17T21:39:25.444000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('8996fac6-c7b4-4902-89fa-f1a494a19cab', '30a89c67-7497-457f-a887-a56d1d721f6d', '608e06f2-4047-466d-8fef-14215606c72e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-30T18:37:11.505000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a72a6a79-aa32-495b-8fcd-8aaad2bba128', '30a89c67-7497-457f-a887-a56d1d721f6d', '622a582d-4019-4358-a8ed-17be22988625', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-11T21:20:28.564000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c6431414-a37f-4f1a-a38c-179983cad6dc', '30a89c67-7497-457f-a887-a56d1d721f6d', '60bd9707-ca9f-4b39-ae6c-9de90b92ebfa', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2024-12-23T14:29:49.659000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b87b7604-68cf-45fe-a009-53fafd1b1f1f', '30a89c67-7497-457f-a887-a56d1d721f6d', '7aabeb0d-e695-415c-9ceb-c481281170b3', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-01-21T19:10:35.858000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2730865e-791e-4d4a-abaf-c0442ca8d249', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aed06d4e-467c-45db-b1bc-c824f45db998', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-01-21T14:18:55.853000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('397786a6-dae7-4e24-9291-b9423edf41bb', '30a89c67-7497-457f-a887-a56d1d721f6d', '01ac73a4-bbda-43c2-9a10-16e634244aa8', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2026-03-12T14:20:07.519000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c612e0cc-7a5b-4e5d-8de9-295acc35d436', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e3c443c2-f81c-4335-b34a-cdafeb13bf7e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2025-01-20T14:11:02.376000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('cb32d0ac-2a7a-4d87-9768-f8d19a4f1edf', '30a89c67-7497-457f-a887-a56d1d721f6d', '70b5e785-9cbe-446e-9363-69976344424a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2025-02-05T18:06:35.207000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('52a2a440-83ec-4603-9012-54249983571b', '30a89c67-7497-457f-a887-a56d1d721f6d', '9f024036-b223-48f2-b685-56bb1ed29e89', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-02-10T13:44:39.071000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4a42b4e9-f878-49f3-a83f-f9dcf1696fdc', '30a89c67-7497-457f-a887-a56d1d721f6d', '0802e1be-51d6-4fce-9865-5df35019a2d6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-02-11T20:06:25.278000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('76278294-4410-40a3-a8f5-fe9a3b21a19d', '30a89c67-7497-457f-a887-a56d1d721f6d', '74764bac-ce24-44c4-81b3-9a3a10ff49f4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2025-02-14T17:07:43.611000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('193dbada-fdff-4fe6-9fb8-28679e74200a', '30a89c67-7497-457f-a887-a56d1d721f6d', '4dfb2b9f-e0c8-4611-84e4-d38239beb089', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-02-21T21:05:08.779000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('fa5e735e-6ea5-4188-812f-d39a94a3376f', '30a89c67-7497-457f-a887-a56d1d721f6d', 'bdc61a26-e95a-412c-bc57-7eeb6bf030d5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-02-28T14:10:18.222000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('045c820b-1e2d-4fdc-ae70-bbbcf900932a', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd4116ae3-bc89-42ef-828d-28eb7f85d483', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2025-03-27T17:27:17.394000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('67687c8d-14c9-4eb0-8f04-6e68d7834068', '30a89c67-7497-457f-a887-a56d1d721f6d', 'a5ead29a-1318-4ee3-960c-d25443748337', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2024-11-04T14:19:29.177000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7b916068-f42a-4a9e-bc22-c093c4c35156', '30a89c67-7497-457f-a887-a56d1d721f6d', '73b9563e-97bb-4975-b136-4a2985068ec5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-04-09T17:19:57.495000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('beb3fd89-518f-49fb-9c30-fbe59bf866a4', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd5da232b-a80a-46bf-992f-4868b12b057f', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-04-14T16:55:02.557000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b1e21a3e-2944-48ca-a74e-e955c685b96f', '30a89c67-7497-457f-a887-a56d1d721f6d', '8e1f5ca3-673e-4850-8ab3-41ed5b01213e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-04-16T20:05:18.575000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('4962bbf2-dfb9-4782-bcce-143ae2e65ccf', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b00c905d-700e-4da6-b9e7-58c1372c9836', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-12-17T17:09:33.383000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c661fc8a-932f-49fc-871c-073eced6368e', '30a89c67-7497-457f-a887-a56d1d721f6d', '317cc99b-403a-4bca-98d7-654511590c0a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-04-30T19:38:53.452000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('52c07d40-26a8-4f1b-bcd8-07c560a1a951', '30a89c67-7497-457f-a887-a56d1d721f6d', '661c1452-b95b-4087-9954-b4920884a36d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-05-21T20:01:13.542000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('065253b3-576b-4733-ae70-548415dd19d4', '30a89c67-7497-457f-a887-a56d1d721f6d', '30ae2ffd-097d-465b-a3ff-66f09ec869c0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE]', '2025-02-18T19:13:45.131000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2024965a-de42-4ed2-9d65-743611facfc7', '30a89c67-7497-457f-a887-a56d1d721f6d', 'df9c56f4-8854-48a0-ab6a-9deaf88b431e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-06-02T21:02:07.689000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5827ff9c-8940-43d4-9936-36192f66b663', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd16be994-37a2-4efd-93a9-68eae6db8cce', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-06-04T17:03:02.475000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('469e2180-14f8-407f-95ed-bcee683c9492', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ebfa85aa-245b-421c-b809-ef5ca6544336', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-06-23T20:22:09.180000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('02954311-7511-49f3-aac2-3efdf0aa4782', '30a89c67-7497-457f-a887-a56d1d721f6d', '64995bb8-820f-4a27-b24d-359b87d8c6bc', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-06-23T21:45:57.551000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('decdbe85-26fa-4a37-a466-b33ce58e73a8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c39ed232-c153-47f0-9964-f2b66e909271', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-07-07T19:04:41.384000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2cb026dc-912c-4e14-b8c8-1223da81023f', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e4cd49a-c974-424b-9d29-fc62d8284d85', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-07-07T19:47:02.739000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ac3136e9-4704-4d9d-aec5-6b086e931a0c', '30a89c67-7497-457f-a887-a56d1d721f6d', '19b5ede7-9a9b-482f-8357-503d9bd22f02', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-07-10T20:31:21.161000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b5eb3992-b29f-4fd2-b80f-dfcfc2f23080', '30a89c67-7497-457f-a887-a56d1d721f6d', '1cd22015-cb1b-4555-9cbb-f6e066d79205', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-12-18T16:54:05.782000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5fddd1c8-6935-4355-b601-13f8654ee2ae', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b8578ce5-7a78-4833-a06d-5f5a7270a1f4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese HOF] ⚠️ POSSUI ALERTA', '2025-07-17T17:25:43.398000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('c4d6977a-5e8b-41a2-b098-185fff2f7d6b', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ddc4d99d-6e9a-4244-b9ff-eda9a20fa9bc', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-12-18T17:48:45.372000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6807dfd0-4a3e-47c6-9ad2-efdcb190edf8', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ddc4d99d-6e9a-4244-b9ff-eda9a20fa9bc', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-12-18T17:56:36.208000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b3612d75-4119-49bf-a07c-d65fbe0f69e8', '30a89c67-7497-457f-a887-a56d1d721f6d', '82d36231-6824-45b9-94ab-f8522bb162b5', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-07-25T18:54:11.201000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('761ada2b-ec29-4cf2-8baa-7e1d1b156b5c', '30a89c67-7497-457f-a887-a56d1d721f6d', '84819211-94af-4341-9833-0e8fbe086421', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-07-23T21:14:27.870000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6256d9e5-270f-457f-a6ed-6f0b2b283165', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c17cf794-d778-4724-a5af-e0ab3eaae24d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-07-24T20:27:47.227000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a0db47fe-271b-4b07-b9cc-f3b646d0aecd', '30a89c67-7497-457f-a887-a56d1d721f6d', '48444d61-53e5-4d33-a400-d7c175839294', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-08-14T18:56:42.056000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('83b314fd-c12c-472b-8012-6394993daaf5', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b98c7e22-2e16-402b-8bc1-bbd48c31e561', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2025-08-18T20:26:18.056000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bdbd07cb-f443-4102-a7b7-b5753c41c553', '30a89c67-7497-457f-a887-a56d1d721f6d', 'aae9a5b0-c99e-412e-b319-0fbc9d1d7c19', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-08-18T18:56:42.345000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('ca68e065-a294-4c67-ac3a-cbaf870cb307', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ff582bde-36f0-46a4-990b-ac14e22dcb5d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2025-08-21T14:00:22.290000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('618e7a00-bc82-42cd-a27f-183e636ca037', '30a89c67-7497-457f-a887-a56d1d721f6d', 'ec07e624-5568-4066-b901-1d4df9727744', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-08-25T20:49:55.570000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7db995a8-5665-4ff0-bd2d-f32250e7c0a6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd43621ae-8c82-47b0-88f8-0170352be0c4', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2025-09-12T21:19:59.802000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('7a2407e5-2edb-4c73-9f69-b5c434996f2e', '30a89c67-7497-457f-a887-a56d1d721f6d', '998494b0-fb09-4886-acad-afe50338fa80', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-09-12T22:33:33.254000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e273ac9f-7855-4dee-a12e-0558d62507f7', '30a89c67-7497-457f-a887-a56d1d721f6d', '61813a3c-7407-4dd3-8e9a-2127be0f0490', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-09-24T17:38:59.716000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('e23c7deb-053b-4d57-b6c9-69ba6f5176a0', '30a89c67-7497-457f-a887-a56d1d721f6d', '3983dfeb-8056-4694-897f-0cc35b43743d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-09-29T13:05:16.462000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9fd3ff69-fb74-4040-ab31-78dd570853ee', '30a89c67-7497-457f-a887-a56d1d721f6d', 'd90aad48-e084-446b-8297-1846acde64e1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-09-29T16:59:39.594000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f7cc06d1-9a3d-441e-8e8d-789e42d13c36', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e6facbe7-e197-429e-af83-380eaf9654a6', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-09-29T18:34:34.592000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f457e6f7-8867-4aee-9382-50e5487c0cf1', '30a89c67-7497-457f-a887-a56d1d721f6d', '16c6fff8-d2c9-47e1-b4ea-1a44dbcab3d1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-09-29T19:57:57.792000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('39b3b32f-be71-4e41-b541-cbbada537455', '30a89c67-7497-457f-a887-a56d1d721f6d', '867dbf1d-49aa-4983-a74e-645a86deb407', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese TESTE] ⚠️ POSSUI ALERTA', '2024-11-12T20:17:27.550000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2fb3e19a-ed9c-46ab-b308-07df930ba2b6', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c97ebfcf-67f5-4baf-ac22-37dabb3ef81e', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-10-10T19:38:57.739000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('16d742a7-c2c0-48d9-ab7b-bf55f30f2b0c', '30a89c67-7497-457f-a887-a56d1d721f6d', '560be938-7906-4c3a-9e00-072c38340dde', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-10-15T17:02:21.171000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('731e8e16-95b6-4480-b3ca-cc2a4c0bd55b', '30a89c67-7497-457f-a887-a56d1d721f6d', '7deadc27-488c-41f7-8d9f-9b37736f8b78', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-10-31T17:54:46.569000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('0c7488fb-589e-4588-9e75-009625a474b2', '30a89c67-7497-457f-a887-a56d1d721f6d', '07ebb0a5-b88d-495d-a208-aec6f773ab6d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: HOF] ⚠️ POSSUI ALERTA', '2025-11-05T14:33:15.783000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('12ebeb1c-9f60-4d6b-b0fd-d8801e8e59dd', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c64e15b2-fedb-435a-90cc-f433d3b647b0', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-11-05T15:30:08.197000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('de9bad0f-f507-4988-9111-4fe7d5bab3a5', '30a89c67-7497-457f-a887-a56d1d721f6d', '92a87080-6802-4569-beec-3cc2bf304f4a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-11-10T19:35:06.422000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('bd5f770c-8075-48c6-ac55-c762e2b8ff45', '30a89c67-7497-457f-a887-a56d1d721f6d', 'c6d60903-c3ee-4dbf-a1e9-b90fbd3ed91a', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-11-17T18:21:59.159000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('9d8ec723-01f7-4ec4-8d29-899a72950940', '30a89c67-7497-457f-a887-a56d1d721f6d', 'af84440e-9f9c-4117-82a6-f25614565983', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2025-11-28T11:31:24.178000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('6403df8a-be54-4040-b3aa-19cdd37f2591', '30a89c67-7497-457f-a887-a56d1d721f6d', 'e06161b2-207e-406b-99ab-4af1bb3eee1d', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2025-12-08T12:29:28.394000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('1a5d63cd-dc48-4c23-a637-a11ca864ad7b', '30a89c67-7497-457f-a887-a56d1d721f6d', '2e916e68-5fec-4d59-bd67-1924603810cf', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-01-22T17:59:50.167000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('b3d2ed7c-2988-4b15-8d0e-21e918ea4eed', '30a89c67-7497-457f-a887-a56d1d721f6d', '73401fb7-c682-4da7-9352-06f591c47fad', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-01-26T12:06:37.085000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('f34acd12-39a0-45ca-ac2b-5442f2a96dfc', '30a89c67-7497-457f-a887-a56d1d721f6d', '2462a256-7ae6-4b62-a418-b3704d6e9f22', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-01-26T17:58:15.110000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a295032f-a540-483c-9233-ef168a3ba4d6', '30a89c67-7497-457f-a887-a56d1d721f6d', '3341da60-6d82-4c06-8cbe-b9209ac93919', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-01-28T20:02:57.593000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('926c1480-3e9a-4b24-9421-982ac28eafe1', '30a89c67-7497-457f-a887-a56d1d721f6d', '7f82556e-7d66-464a-be4e-de4370c1ab44', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-02-06T17:10:22.986000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('a35d3a87-c31b-486c-9960-6ab137bdb38b', '30a89c67-7497-457f-a887-a56d1d721f6d', '1ae38cda-9094-4afd-b137-ab1cc3b44441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2026-02-06T21:00:52.163000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('5cddee9b-3ced-4781-820f-1ae8137db472', '30a89c67-7497-457f-a887-a56d1d721f6d', '250bcb2e-1891-442a-8dfd-9c55b7790792', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-02-06T19:02:35.079000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('560356c5-9267-42d6-90ff-8f8abb1ef72f', '30a89c67-7497-457f-a887-a56d1d721f6d', '9e8c528f-2d25-4ec5-a790-47f866d3aa49', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2026-03-20T19:24:40.873000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('db70ad82-9f56-4230-ac1f-c005c8aa99da', '30a89c67-7497-457f-a887-a56d1d721f6d', '4da0b4ea-bd76-48dd-94ab-693e5f7cc3e1', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2026-02-18T15:15:45.662000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('01c04f1b-7360-495f-91fe-d408a9de3889', '30a89c67-7497-457f-a887-a56d1d721f6d', 'b2c9d97d-19c6-4a23-9640-8e48ec9a6fdd', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-02-26T19:31:42.435000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('01eb7128-88ed-4dc7-893e-677e6d86fcca', '30a89c67-7497-457f-a887-a56d1d721f6d', '9b4c082b-00c5-479b-99d1-401b1382a441', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO] ⚠️ POSSUI ALERTA', '2026-02-25T21:00:46.722000')
ON CONFLICT DO NOTHING;
INSERT INTO contact_notes (id, clinic_id, contact_id, author_id, body, created_at)
VALUES ('2f7d02e6-c775-4b8a-95d8-73349e639e9c', '30a89c67-7497-457f-a887-a56d1d721f6d', '3ed700e8-0d0a-4118-af57-026524750418', '8b1b148f-368b-4480-acdf-2236a593b2fb', '[Anamnese: Anamnese PADRÃO]', '2026-02-26T18:10:54.693000')
ON CONFLICT DO NOTHING;

-- ============================================================
-- IMPORT CONCLUÍDO
-- Contatos: 202
-- Consultas: 623
-- Evoluções: 453
-- Anamneses: 139
-- ============================================================
