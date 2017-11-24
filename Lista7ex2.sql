USE ANDRE;
-- 2a:
SELECT DISTINCT nome FROM CURSO;

-- 2b:
SELECT nome, telefone FROM aluno WHERE cidade LIKE "São Carlos___SP" OR cidade="São Carlos" ORDER BY nome DESC;

-- 2c
SELECT nome FROM professor WHERE admissao < '1993-01-01';

-- 2d) Quais os nomes de alunos que iniciam com a letra 'J'.
SELECT nome FROM aluno WHERE nome LIKE 'J%';

-- 2e) Quais os nomes das disciplinas do curso de Ciência da Computação.
SELECT disciplina.nome FROM disciplina, disciplinacurso, curso WHERE curso.Nome="Ciência da Computação" AND disciplinacurso.numCurso = curso.numCurso AND disciplina.numDisp = disciplinacurso.numDisp;

-- 2f) Quais os nomes dos cursos que possuem no curriculum a disciplina Cálculo Numérico.
SELECT c.nome FROM curso c, disciplinacurso dc, disciplina d WHERE d.Nome="Cálculo Numérico" AND dc.numDisp= d.numDisp AND c.numCurso = dc.numCurso;

-- 2g) Quais os nomes das disciplina que o aluno Marcos João Casanova cursou no 1º semestre de 1998.
SELECT disciplina.nome FROM disciplina, aluno, aula WHERE 
								aula.semestre = "11998" 
								AND aluno.nome= "Marcos João Casanova" 
								AND aluno.numAluno=aula.numAluno 
								AND disciplina.numDisp = aula.numdisp;

-- 2h) Quais os nomes das disciplinas que o aluno Ailton Castro foi reprovado.
SELECT disciplina.nome, aula.nota FROM disciplina 
							INNER JOIN aula ON disciplina.numDisp=aula.numDisp 
							INNER JOIN aluno ON aula.numAluno = aluno.numAluno

							WHERE aluno.nome = "Ailton Castro" AND aula.nota < 5;

SELECT disciplina.nome, aula.nota FROM disciplina, aula, aluno WHERE aluno.nome = "Ailton Castro" AND aula.nota < 5
														AND disciplina.numDisp = aula.numDisp
														AND aula.numAluno = aluno.numAluno;
-- 2i) Quais os nomes de alunos reprovados na disciplina de Cálculo Numérico no 1º semestre de 1998.
SELECT aluno.nome FROM aluno, disciplina, aula WHERE aula.nota < 5 AND aula.semestre = "11998"
												AND disciplina.numdisp = aula.numdisp AND disciplina.nome = "Cálculo Numérico"
												AND aluno.numAluno = aula.numAluno;
		
SELECT aluno.nome, aula.nota, disciplina.nome FROM aluno, aula, disciplina
												WHERE aula.nota < 5 AND aula.semestre = "11998"
												AND disciplina.numdisp = aula.numdisp AND disciplina.nome = "Cálculo Numérico"
												AND aluno.numAluno = aula.numAluno;
-- 2j) Quais os nomes das disciplinas ministradas pelo prof. Ramon Travanti.
SELECT DISTINCT disciplina.nome FROM disciplina, aula, professor WHERE professor.nome LIKE "%Ramon Travanti"
													AND aula.numFunc = professor.numFunc
													AND disciplina.numDisp = aula.numDisp;
													
-- 2k) Quais os nomes dos professores que já ministraram aula de Banco de Dados.
SELECT DISTINCT professor.nome FROM professor, aula, disciplina WHERE disciplina.nome = "Banco de Dados"
																AND aula.numDisp = disciplina.numDisp
																AND professor.numFunc = aula.numFunc;

-- 2l) Qual a maior e a menor nota na disciplina de Cálculo Numérico no 1º semestre de 1998.
SELECT MAX(aula.nota), MIN(aula.nota) FROM aula, disciplina WHERE disciplina.nome = "Cálculo Numérico" AND aula.semestre = "11998"
																AND disciplina.numDisp = aula.numDisp;

#QUERY ANINHADA:  Obrigatório ao usar duas funções de Agregação.
-- 2m) Qual o nome do aluno que obteve maior nota na disciplina de Engenharia de Software
-- 		no 1º semestre de 1998. Deve retornar o nome e a nota do aluno.
SELECT aluno.nome, aula.nota FROM aluno, aula, disciplina WHERE disciplina.nome = "Engenharia de Software"
																AND aula.numDisp = disciplina.numDisp
																AND aula.nota = (SELECT MAX(au.nota) FROM aula au, disciplina dis WHERE dis.nome = "Engenharia de Software"
																																AND dis.numDisp=au.numDisp);
			

-- 2n) Quais os nomes de alunos que cursaram o 1º semestre de 1998 em ordem alfabética, em
-- 		cada disciplina oferecida nesse semestre (listar também os nomes das disciplinas e os
-- 		nomes dos professores que ministraram cada disciplina).
SELECT aluno.nome AS "Aluno", disciplina.nome AS "Disciplina", professor.nome AS "Professor"
	FROM aluno, disciplina, professor, aula
		WHERE aula.semestre = "11998" AND
				disciplina.numDisp = aula.numdisp AND aluno.numaluno = aula.numaluno AND professor.numfunc = aula.numfunc
		ORDER BY disciplina.nome, aluno.nome;

-- 2o) Quais nomes de alunos, nomes de disciplinas e notas do 1º semestre de 1998 no curso
-- 		de Ciência da Computação.
SELECT aluno.nome AS "Aluno", disciplina.nome AS "Disciplina", aula.nota AS "Nota"
	FROM aluno, disciplina, aula, disciplinacurso, curso
		WHERE aula.semestre = "11998" AND curso.Nome="Ciência da Computação" AND
				curso.NumCurso = disciplinacurso.numcurso AND disciplina.numDisp = disciplinacurso.numDISP AND -- Define a disciplina igual ao curso
				disciplina.numdisp = aula.numdisp AND aluno.numaluno = aula.numaluno 
		ORDER BY disciplina.nome, aluno.nome;


-- 2p) Qual a média de notas do professor Marcos Salvador.
SELECT AVG(aula.nota) 
		FROM aula, professor
		WHERE
			aula.numfunc = professor.numfunc;

-- 2q) Quais os alunos que tiveram nota entre 5.0 e 7.0 em ordem alfabetica de disciplina.
-- 		Deve retornar o nome do aluno, o nome da disciplina e nota referente a disciplina.
SELECT aluno.nome AS "Nome", disciplina.nome AS "Disciplina", aula.nota AS "Nota"
	FROM aluno, disciplina, aula
		WHERE
			aula.nota BETWEEN 5.0 AND 7.0
			AND aluno.numAluno = aula.numAluno AND disciplina.numDisp = aula.numDisp
		ORDER BY disciplina.nome, aula.nota; -- ORDER BY "Disciplina", "Nota" não funciona.

-- 2r) Quantos alunos o professor Abgair teve no 1º semestre de 1998.
SELECT COUNT(DISTINCT aluno.numAluno)
		FROM aula, professor, aluno
		WHERE
			professor.nome LIKE "Abgair%" AND aula.semestre = "11998" AND
			aula.numfunc = professor.numfunc AND
			aluno.numAluno = aula.numAluno;


-- 2s) Qual a média de notas e a quantidade de disciplinas cursadas pelo aluno Edvaldo Carlos
-- 		Silva.
SELECT AVG(aula.nota), COUNT(DISTINCT disciplina.numDisp) -- cursou duas vezes a mesma disciplina
		FROM aula, disciplina, aluno
		WHERE
			aluno.nome LIKE "Edvaldo Carlos Silva" AND
			aula.numAluno = aluno.numAluno		AND
			disciplina.numDisp = aula.numDisp;


-- 2t) Quais as médias das notas, por nome de disciplina, de todos os cursos do 1º semestre de 1998 em ordem alfabética de disciplina.
SELECT disciplina.nome, AVG(aula.nota) AS "Média"
		FROM aula, disciplina
		WHERE aula.semestre = "11998" AND 
			disciplina.numdisp = aula.numdisp
		GROUP BY disciplina.nome ORDER BY AVG(aula.nota);


-- 2u) Quais as médias das notas, por nome de professor, no 1º semestre de 1998.
SELECT professor.nome, AVG(aula.nota) as "Média" 
		FROM aula, professor 
		WHERE aula.semestre = "11998" and professor.numFunc = aula.numfunc
		GROUP BY professor.nome ORDER BY "Média";


-- 2v) Qual a média das notas , por disciplina, no 1º semestre de 1998 do curso de Ciência da
-- 		Computação.
SELECT disciplina.nome, AVG(aula.nota) as Média
		From aula, disciplina, curso, disciplinacurso
		WHERE curso.nome = "Ciência da Computação" and aula.semestre = "11998"
			  and disciplinacurso.numcurso = curso.numcurso
			  and disciplina.numdisp = disciplinacurso.numdisp
			  and aula.numDisp = disciplina.numDisp
		GROUP BY disciplina.nome ORDER BY Média;




# MAIS FACIL DE LER, MAS... USA MAIS MEMÓRIA??????
Create TABLE DisciplinasCC as (
SELECT disciplina.nome as nome , disciplina.numDisp as numDisp from  disciplina join disciplinacurso join curso on disciplina.numDisp = disciplinacurso.numdisp and  curso.numCurso = disciplinacurso.numCurso
where curso.nome = "Ciência da Computação");

select disciplina.nome, AVG(aula.nota) as Média from aula, DisciplinasCC as disciplina
	WHERE aula.numDisp = disciplina.numDisp
	GROUP BY disciplina.nome ORDER BY Média;

drop table DisciplinasCC;


		


-- 2w) Qual foi a quantidade de créditos concluídos (considerar somente as disciplinas
-- 		aprovadas) do aluno Edvaldo Carlos Silva.
SELECT aluno.nome, SUM(discAluno.quantCreditos) , discAluno.numDisp
		FROM
		aluno, (
				select aula.nota, aula.numAluno, disciplina.quantCreditos, disciplina.numDisp 
						from aula, disciplina 
						Where aula.numDisp = disciplina.numDisp 
							and aula.nota > 5
				) discAluno
		WHERE aluno.numAluno = discAluno.numAluno and aluno.nome like "Edvaldo Carlos Silva%"
		;#GROUP BY discAluno.numDisp;



-- 2x) Quais os nomes de alunos que já completaram 70 créditos (considerar somente os
-- 		aprovados na disciplina). Deve retornar os nomes dos alunos e a quantidade de créditos.



-- 2y) Quais os nomes de alunos que cursaram o 1º semestre de 1998 que pertencem ao curso
-- 		de Ciência da Computação e possuem nota superior à 8.0. Deve retornar os nomes dos
-- 		alunos, os nomes da disciplina e os nomes dos professores.

