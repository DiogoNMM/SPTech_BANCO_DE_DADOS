create database revisao;
use revisao;

-- REGRA DE NEGÓCIO UM PARA UM

create table motorista(
id int primary key auto_increment,
nome varchar (45),
cnh char (11),
validade date,
categoria char(4)
-- check (categoria = 'A' or categoria 'B')
);

insert into motorista values 
(null,'Vivian','12345678900','2023-10-13','B');

select * from motorista;

create table carro (
idCarro int primary key auto_increment,
modelo varchar(45),
placa char(7),
estado char(2),
fkMotora int,
foreign key (fkMotora) references motorista(id)
);

insert into carro values
(null, 'i30','abc1234','SP',1);

select * from carro;

-- REGRA DE NEGÓCIO UM PARA MUITOS (DEPENDENTE)

create table carroAuto(
id int primary key auto_increment,
modelo varchar(45),
placa char(7),
estado char(2)
);

insert into carroAuto values
(null,'jetta','DEF5678','SC');

select * from carroAuto;

create table motoristaAuto(
idMotora int auto_increment,
fkCarro int,
foreign key (fkCarro) references carroAuto(id),
primary key (idMotora,fkCarro),
cnh char(11),
validade date,
categoria char(4)
);

alter table motoristaAuto add nome varchar(45) after fkCarro;

insert into motoristaAuto values
(null,1,'Franklin','00987654321','2023-12-18','B');

select * from motoristaAuto;

select motoristaAuto.nome, carroAuto.modelo from carroAuto join motoristaAuto on carroAuto.id = motoristaAuto.idMotora;

-- RECURSIVIDADE

create table motoristaDono(
idMotora int primary key auto_increment,
nome varchar(45),
cnh char (11),
validade date,
categoria char(4),
fkCondutor int,
foreign key (fkCondutor) references motoristaDono(idMotora)
);

insert into motoristaDono (nome) values
('SPTech');

insert into motoristaDono values
(null,'Rafael','13579008642','2023-01-24','AB',null);

select * from motoristaDono;

update motoristaDono set fkCondutor = 2 where idMotora = 1;

select * from motoristaDono as motora  join motoristaDono as condutor on condutor.idMotora = motora.fkCondutor;
select motora.nome, condutor.nome from motoristaDono as motora  join motoristaDono as condutor on condutor.idMotora = motora.fkCondutor;

-- REGRA DE NEGÓCIO N PARA N (MUITOS PARA MUITOS)

create table motoristaAluguel(
idMotorista int primary key auto_increment,
nome varchar(45),
cnh char(11),
validade date,
categoria char(4)
);

insert into motoristaAluguel values
(null,'Diogo','12345678901','2023-01-22','AB');

create table carroAluguel (
idCarro int primary key auto_increment,
modelo varchar(45),
placa char(7),
estado char(2)
);

insert into carroAluguel values 
(null,'X6','ABD1234','SP');

insert into carroAluguel values
(null,'Panamera','FGD1235','SC');

create table Aluguel(
idAluguel int auto_increment,
fkMotora int,
foreign key (fkMotora) references motoristaAluguel(idMotorista),
fkCarro int,
foreign key (fkCarro) references carroAluguel(idCarro),
primary key (idAluguel,fkMotora,fkCarro),
dtInicio datetime default current_timestamp,
dtFim datetime,
valor decimal(10,2),
check (valor >= 0)
);

insert into Aluguel (fkMotora, fkCarro, valor) values 
(1,1,10.99);

select * from Aluguel;

select * from motoristaAluguel join Aluguel on id