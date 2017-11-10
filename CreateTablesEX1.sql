CREATE DATABASE IF NOT EXISTS ANDRE;
use andre;
Create TABLE if not exists Curso (
		numCurso integer PRIMARY KEY auto_increment,
		nome varchar(128),
		totalCreditos smallint
);


CREATE TABLE if not exists Aluno ( 
		numAluno integer auto_increment,
		nome varchar(128),		
		endereco longtext,
		cidade varchar(85),
		telefone varchar(13),
		numCurso integer,
		PRIMARY KEY(numAluno),
		FOREIGN KEY(numCurso) REFERENCES Curso(numCurso) ON DELETE SET NULL
);

CREATE TABLE if not exists Disciplina (
		numDisc integer PRIMARY KEY AUTO_INCREMENT,
		nome varchar(128),
		quantCreditos int
);

CREATE TABLE if not exists Professor(
		numFunc integer auto_increment,
		nome varchar(128),
		admissao date,
		areaPesquisa varchar(256),
		PRIMARY KEY (numFunc)
);
CREATE TABLE if not exists Aula (
		numAluno integer,
		numDisc integer,
		numFunc integer,
		semestre varchar(64),
		nota integer,
		
		FOREIGN KEY(numAluno) 	REFERENCES Aluno(numAluno) 		ON DELETE CASCADE,
		FOREIGN KEY(numDisc) 	REFERENCES Disciplina(numDisc) 	ON DELETE CASCADE,
		FOREIGN KEY(numFunc) 	REFERENCES Professor(numFunc) 	ON DELETE CASCADE,

		PRIMARY KEY(numAluno, numDisc, numFunc)
);

CREATE TABLE if not exists DisciplinaCurso (
		numDisc integer,
		numCurso integer,
		PRIMARY KEY(numDisc, numCurso),
		FOREIGN KEY (numDisc) REFERENCES Disciplina(numDisc) ON DELETE CASCADE,
		FOREIGN KEY (numCurso) REFERENCES Curso(numCurso) ON DELETE CASCADE
);
			