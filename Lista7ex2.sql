use ANDRE;
-- 2a:
SELECT DISTINCT nome FROM CURSO;

-- 2b:
SELECT nome, telefone FROM aluno WHERE cidade like "São Carlos___SP" OR cidade="São Carlos" ORDER BY nome DESC;

-- 2c
SELECT nome FROM professor WHERE admissao < '1993-01-01';

-- 2d) Quais os nomes de alunos que iniciam com a letra 'J'.
SELECT nome FROM aluno where nome like 'J%';

-- 2e) Quais os nomes das disciplinas do curso de Ciência da Computação.
SELECT disciplina.nome FROM disciplina, disciplinacurso, curso where curso.Nome="Ciência da Computação" AND disciplinacurso.numCurso = curso.numCurso and disciplina.numDisp = disciplinacurso.numDisp;

-- 2f) Quais os nomes dos cursos que possuem no curriculum a disciplina Cálculo Numérico.
SELECT c.nome FROM curso c, disciplinacurso dc, disciplina d where d.Nome="Cálculo Numérico" AND dc.numDisp= d.numDisp AND c.numCurso = dc.numCurso;

-- 2g) Quais os nomes das disciplina que o aluno Marcos João Casanova cursou no 1º semestre de 1998.
SELECT disciplina.nome FROM disciplina, aluno, aula WHERE 
								aula.semestre = "11998" 
								and aluno.nome= "Marcos João Casanova" 
								and aluno.numAluno=aula.numAluno 
								and disciplina.numDisp = aula.numdisp;

-- 2h) Quais os nomes das disciplinas que o aluno Ailton Castro foi reprovado.
SELECT disciplina.nome, aula.nota FROM disciplina 
							INNER JOIN aula on disciplina.numDisp=aula.numDisp 
							INNER JOIN aluno on aula.numAluno = aluno.numAluno

							WHERE aluno.nome = "Ailton Castro" and aula.nota < 5;

SELECT disciplina.nome, aula.nota FROM disciplina, aula, aluno WHERE aluno.nome = "Ailton Castro" and aula.nota < 5
														and disciplina.numDisp = aula.numDisp
														and aula.numAluno = aluno.numAluno;
-- 2i) Quais os nomes de alunos reprovados na disciplina de Cálculo Numérico no 1º semestre de 1998.
SELECT aluno.nome FROM aluno, disciplina, aula WHERE aula.nota < 5 and aula.semestre = "11998"
												and disciplina.numdisp = aula.numdisp and disciplina.nome = "Cálculo Numérico"
												and aluno.numAluno = aula.numAluno;
		
Select aluno.nome, aula.nota, disciplina.nome from aluno, aula, disciplina
												WHERE aula.nota < 5 and aula.semestre = "11998"
												and disciplina.numdisp = aula.numdisp and disciplina.nome = "Cálculo Numérico"
												and aluno.numAluno = aula.numAluno;
-- 2j) Quais os nomes das disciplinas ministradas pelo prof. Ramon Travanti.
SELECT distinct disciplina.nome from disciplina, aula, professor WHERE professor.nome like "%Ramon Travanti"
													and aula.numFunc = professor.numFunc
													and disciplina.numDisp = aula.numDisp;
													
-- 2k) Quais os nomes dos professores que já ministraram aula de Banco de Dados.
SELECT distinct professor.nome from professor, aula, disciplina where disciplina.nome = "Banco de Dados"
																and aula.numDisp = disciplina.numDisp
																and professor.numFunc = aula.numFunc;

-- 2l) Qual a maior e a menor nota na disciplina de Cálculo Numérico no 1º semestre de 1998.
SELECT MAX(aula.nota), MIN(aula.nota) FROM aula, disciplina WHERE disciplina.nome = "Cálculo Numérico" and aula.semestre = "11998"
																and disciplina.numDisp = aula.numDisp;

-- 2m) Qual o nome do aluno que obteve maior nota na disciplina de Engenharia de Software
-- 		no 1º semestre de 1998. Deve retornar o nome e a nota do aluno.
SELECT aluno.nome, aula.nota FROM aluno, aula, disciplina WHERE disciplina.nome = "Engenharia de Software"
																and aula.numDisp = disciplina.numDisp
																and aula.nota = (SELECT MAX(au.nota) FROM aula au, disciplina dis where dis.nome = "Engenharia de Software"
																																and dis.numDisp=au.numDisp);
								

-- 2n) Quais os nomes de alunos que cursaram o 1º semestre de 1998 em ordem alfabética, em
-- 		cada disciplina oferecida nesse semestre (listar também os nomes das disciplinas e os
-- 		nomes dos professores que ministraram cada disciplina).
SELECT aluno.nome as "Aluno", disciplina.nome as "Disciplina", professor.nome as "Professor"
	FROM aluno, disciplina, professor, aula
		WHERE aula.semestre = "11998" and
				disciplina.numDisp = aula.numdisp and aluno.numaluno = aula.numaluno and professor.numfunc = aula.numfunc
		ORDER BY disciplina.nome, aluno.nome;

-- 2o) Quais nomes de alunos, nomes de disciplinas e notas do 1º semestre de 1998 no curso
-- 		de Ciência da Computação.
SELECT aluno.nome as "Aluno", disciplina.nome as "Disciplina", aula.nota as "Nota"
	FROM aluno, disciplina, aula, disciplinacurso, curso
		WHERE aula.semestre = "11998" and curso.Nome="Ciência da Computação" and
				curso.NumCurso = disciplinacurso.numcurso and disciplina.numDisp = disciplinacurso.numDISP and -- Define a disciplina igual ao curso
				disciplina.numdisp = aula.numdisp and aluno.numaluno = aula.numaluno 
		ORDER BY disciplina.nome, aluno.nome;


-- 2p) Qual a média de notas do professor Marcos Salvador.
SELECT AVG(aula.nota) 
		FROM aula, professor
		WHERE
			aula.numfunc = professor.numfunc;

-- 2q) Quais os alunos que tiveram nota entre 5.0 e 7.0 em ordem alfabetica de disciplina.
-- 		Deve retornar o nome do aluno, o nome da disciplina e nota referente a disciplina.
SELECT aluno.nome as "Nome", disciplina.nome as "Disciplina", aula.nota as "Nota"
	FROM aluno, disciplina, aula
		WHERE
			aula.nota BETWEEN 5.0 AND 7.0
			and aluno.numAluno = aula.numAluno and disciplina.numDisp = aula.numDisp
		ORDER BY disciplina.nome, aula.nota; -- ORDER BY "Disciplina", "Nota" não funciona.

-- 2r) Quantos alunos o professor Abgair teve no 1º semestre de 1998.
SELECT Count(distinct aluno.numAluno)
		FROM aula, professor, aluno
		WHERE
			professor.nome like "Abgair%" and aula.semestre = "11998" and
			aula.numfunc = professor.numfunc and
			aluno.numAluno = aula.numAluno;


-- 2s) Qual a média de notas e a quantidade de disciplinas cursadas pelo aluno Edvaldo Carlos
-- 		Silva.
SELECT AVG(aula.nota), Count(distinct disciplina.numDisp) -- cursou duas vezes a mesma disciplina
		FROM aula, disciplina, aluno
		WHERE
			aluno.nome like "Edvaldo Carlos Silva" and
			aula.numAluno = aluno.numAluno		and
			disciplina.numDisp = aula.numDisp;


-- 2t) Quais as médias das notas, por nome de disciplina, de todos os cursos do 1º semestre de 1998 em ordem alfabética de disciplina.
SELECT disciplina.nome, AVG(aula.nota) as "Média"
		FROM aula, disciplina
		WHERE aula.semestre = "11998" and 
			disciplina.numdisp = aula.numdisp
		GROUP BY disciplina.nome ORDER BY AVG(aula.nota)
			

			



-- 2u) Quais as médias das notas, por nome de professor, no 1º semestre de 1998.



-- 2v) Qual a média das notas , por disciplina, no 1º semestre de 1998 do curso de Ciência da
-- 		Computação.



-- 2w) Qual foi a quantidade de créditos concluídos (considerar somente as disciplinas
-- 		aprovadas) do aluno Edvaldo Carlos Silva.



-- 2x) Quais os nomes de alunos que já completaram 70 créditos (considerar somente os
-- 		aprovados na disciplina). Deve retornar os nomes dos alunos e a quantidade de créditos.



-- 2y) Quais os nomes de alunos que cursaram o 1º semestre de 1998 que pertencem ao curso
-- 		de Ciência da Computação e possuem nota superior à 8.0. Deve retornar os nomes dos
-- 		alunos, os nomes da disciplina e os nomes dos professores.

