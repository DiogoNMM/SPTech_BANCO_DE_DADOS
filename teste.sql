create database pratica;
use pratica;

create table grupo(
idGrupo int primary key auto_increment,
nomeGrupo varchar(45),
descricao varchar(45)
);

create table aluno(
raAluno int primary key auto_increment,
fkGrupo int,
foreign key (fkGrupo) references grupo(idGrupo),
nomeAluno varchar(45),
emailAluno varchar(45)
);

create table professor(
idProfessor int primary key auto_increment,
nomeProfessor varchar(45),
disciplina varchar(45)
)auto_increment = 10000;

create table avaliacao(
idAvaliacao int auto_increment,
fkGrupo int,
foreign key(fkGrupo) references grupo(idGrupo),
fkProfessor int,
foreign key (fkProfessor) references professor(idProfessor),
datahorainicio datetime default current_timestamp,
nota double,
primary key (idAvaliacao, fkGrupo, fkProfessor)
);


insert into grupo values
(null, 'greenhouse', 'monitoramento de estufas'),
(null, 'biotechsoy', 'monitoramento de soja');

select * from grupo;

insert into aluno values
(null, 1, 'diogo', 'diogo@gmail.com'),
(null, 2, 'alexandre', 'alexandre@gmail.com'),
(null, 2, 'rafael', 'rafael@gmail.com'),
(null, 1, 'raul', 'raul@gmail.com');

select * from aluno;

insert into professor values
(null, 'vivian', 'banco de dados'),
(null, 'claudio', 'algoritimos'),
(null, 'thiago', 'TI');

select * from professor;

insert into avaliacao values
(null, 1, 10000, null, '9.50'),
(null, 2, 10001, null, '8.40');

select * from avaliacao;

select * from grupo join aluno on aluno.fkGrupo = grupo.idGrupo;

select * from grupo join aluno on aluno.fkGrupo = grupo.idGrupo where fkGrupo = 2;

select nota from avaliacao;

select truncate(avg(nota), 2) as 'media' from avaliacao;

select min(nota),max(nota) from avaliacao;

select truncate(sum(nota), 2) as 'soma' from avaliacao;

select prof.idProfessor, prof.disciplina, grupo.idGrupo, grupo.nomeGrupo, grupo.descricao, avaliacao.a

