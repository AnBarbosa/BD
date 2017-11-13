use ANDRE;
-- CURSO
insert into Curso values(2142,'Engenharia Civil',1500); 
insert into Curso values(2143,'Ciência da Computação',2000); 
insert into Curso values(2144,'Direito',1750); 
insert into Curso values(2145,'Pedagogia',1500); 
insert into Curso values(2146,'Odontologia',1600); 

-- DISCIPLINA
insert into Disciplina values(1,'Banco de Dados',30); 
insert into Disciplina values(2,'Estrutura de Dados',30); 
insert into Disciplina values(3,'Direito Penal',25); 
insert into Disciplina values(4,'Calculo Numerico',30); 
insert into Disciplina values(5,'Psicologia Infantil',25); 
insert into Disciplina values(6,'Direito Tributario',33); 
insert into Disciplina values(7,'Engenharia de Software',27); 

-- DISCIPLINACURSO
insert into DisciplinaCurso values(1,2143); 
insert into DisciplinaCurso values(2,2143); 
insert into DisciplinaCurso values(3,2144); 
insert into DisciplinaCurso values(4,2143); 
insert into DisciplinaCurso values(4,2142); 
insert into DisciplinaCurso values(5,2145); 
insert into DisciplinaCurso values(6,2144); 
insert into DisciplinaCurso values(7,2143); 
insert into DisciplinaCurso values(7,2142); 

-- PROFESSOR
insert into Professor values(45675, 'Abgair Simon Ferreira', '1992-04-10', 'Banco de Dados'); 
insert into Professor values(45690, 'Ramon Travanti', '1993-05-20', 'Direito Romano'); 
insert into Professor values(45691, 'Gustavo Gouveia Netto', '1993-04-05', 'Sociologia'); 
insert into Professor values(45692, 'Marcos Salvador', '1993-03-31', 'Matematica Financeira'); 
insert into Professor values(45693, 'Cintia Falcão', '1993-02-15', 'Engenharia de Software'); 

-- ALUNO
insert into Aluno values(111, 'Edvaldo Carlos Silva', 'Av. São Carlos, 186', 'São Carlos', 0172769999, 2143); 
insert into Aluno values(112, 'João Benedito Scapin', 'R. Jose Bonifacio, 70', 'São Carlos', 0172738974, 2142); 
insert into Aluno values(113, 'Carol Antonia Silveira', 'R. Luiz Camoes, 120', 'Ibate', 0172788568, 2145); 
insert into Aluno values(114, 'Marcos Joao Casanova', 'Av. São Carlos, 176', 'São Carlos', 0172749874, 2143); 
insert into Aluno values(115, 'Simone Cristina Lima', 'R. Raul Junior, 180', 'São Carlos', 0172739865, 2144); 
insert into Aluno values(116, 'Ailton Castro', 'R. Antonio Carlos, 120', 'Ibate', 0172788563, 2142); 
insert into Aluno values(117, 'Jose Paulo Figueira', 'R. XV de Novembro, 871', 'São Carlos', 0172749873, 2145); 

-- AULA
insert into Aula values(111, 1, 45675, 011998, 8.5); 
insert into Aula values(111, 2, 45675, 011998, 6.0); 
insert into Aula values(111, 2, 45675, 021998, 7.0); 
insert into Aula values(115, 3, 45690, 011998, 4.5); 
insert into Aula values(115, 3, 45690, 021998, 7.5); 
insert into Aula values(111, 4, 45692, 011998, 8.0); 
insert into Aula values(112, 4, 45692, 011998, 7.0); 
insert into Aula values(113, 5, 45691, 011998, 7.5); 
insert into Aula values(115, 6, 45690, 011998, 9.0); 
insert into Aula values(111, 7, 45693, 011998, 10.0); 
insert into Aula values(112, 7, 45693, 011998, 5.5); 
insert into Aula values(112, 7, 45693, 021998, 10.0); 
insert into Aula values(114, 1, 45675, 011998, 7.0); 
insert into Aula values(114, 2, 45675, 011998, 8.0); 
insert into Aula values(114, 4, 45692, 011998, 6.5); 
insert into Aula values(114, 4, 45692, 021998, 8.5); 
insert into Aula values(116, 4, 45692, 011998, 3.5); 
insert into Aula values(116, 4, 45692, 021998, 9.5); 
insert into Aula values(114, 7, 45693, 011998, 9.5); 
insert into Aula values(116, 7, 45693, 011998, 8.5); 
