--SQL Server
 -- Abrir pelo Management Studio
	-- Tipo de autenticação: sql server authentication
	-- Usuário: sa
	-- senha: admin

use Transporte
--Excluir cod_tipo_carga da tabela Viagem
--sp_help Viagem --- comando para ver informações detalhadas da tabela

alter table Viagem drop constraint FK__Viagem__cod_tipo__2C3393D0
go
alter table Viagem drop column cod_tipo_carga
go
--Excluir a tabela Tipo_carga
drop table Tipo_carga
go
--Criar a tabela passageiro
create table Passageiro
(
	cod_passageiro int identity(1,1) primary key,
	nome varchar(50) not null,
	telefone varchar(20) null,
	rg varchar(15) null
)
go
--Criar a tabela Carga
create table Carga(
	cod_carga int identity(1,1) primary key,
	nome varchar(50) not null,
	descricao varchar(max)
)
go
--Criar a tabela PassageiroViagem
create table PassageiroViagem
(
	cod_passageiro int not null references Passageiro (cod_passageiro),
	cod_viagem int not null references Viagem (cod_viagem),
	data_cadastro datetime not null default(getdate()),
	primary key(cod_passageiro, cod_viagem)
)
go

--Criar a tabela CargaViagem
create table CargaViagem
(
	cod_carga int not null references Carga (cod_carga),
	cod_viagem int not null references Viagem (cod_viagem),
	quantidade int not null check(quantidade > 0),
	primary key (cod_carga, cod_viagem)
)

-- Adicionar a coluna CPF na tabela motorista
alter table Motorista add Cpf varchar(30) null

--Alterar a coluna modelo da tabela Veiculo para 150 carac não nulo
alter table Veiculo alter column modelo varchar(150) not null

--Criar a tabela manutencao
create table Manutencao
(
	cod_manutencao int identity(1,1) primary key,
	valor numeric(5,2) not null,
	data datetime not null,
	descricao varchar(max),
	nome varchar(150) not null,
	cod_veiculo int not null references Veiculo (cod_veiculo),
)