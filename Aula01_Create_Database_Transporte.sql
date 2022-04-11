--SQL (Structed Query Language)
	--DML (Data Manipulation Language)
		--Select | Insert | Update | Delete
	--DDL (Data Definition Language)
		-- Create | Alter | Drop
	--DCL (Data Control Language)
		-- Grant | Revoke

-- Criar um banco de Dados
Create database Transporte
go
use Transporte

create table Tipo_carga
(
	cod_tipo_carga int identity(1, 1) primary key,
	descricao varchar(80) not null
)
go

CREATE TABLE Motorista
(
	cod_motorista int identity(1,1) primary key,
	nome varchar(50) not null,
	telefone varchar(15) null,
	email varchar(100) not null
)
go

create table Veiculo
(
	cod_veiculo int identity(1,1) not null,
	placa varchar(10) not null,
	modelo varchar(100),
	cor varchar(50),
	ano int not null,
	primary key(cod_veiculo)
)
go

create table Viagem 
(
	cod_viagem int identity(1,1) primary key,
	endereco varchar(200) not null,
	numero varchar(20) not null,
	bairro varchar(300) not null,
	cep varchar(10) null,
	cidade varchar(50),
	estado varchar(2),
	dataSaida datetime not null,
	dataRetorno datetime null,
	cod_motorista int not null references Motorista(cod_motorista),
	cod_veiculo int not null references Veiculo (cod_veiculo),
	cod_tipo_carga int references Tipo_carga (cod_tipo_carga)
)

