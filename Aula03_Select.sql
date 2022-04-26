--Aula 01 - DML - Linguagem de Manipulação de Dados
	-- Comando Select

--quem são os meus clientes
select * -- * significa todas as cols
from Cliente

--quais os nomes e telefones de todos os clientes
select nome, telefone
from Cliente

--quais os nomes, telefones e cpf de todos os clientes 
--(nome da coluna em caixa alta)
select nome as NOME, telefone AS TELEFONE, cpf AS CPF
from Cliente

--Mostre o nome e o endereço de todos os clientes do sexo feminino
SELECT nome,endereco FROM CLIENTE
WHERE sexo <> 'F'

--maneiras de realizar uma comparação
--  =     IGUAL
--  != <> DIFERENTE
--  >     MAIOR
--  <     MENOR
--  >=    MAIOR OU IGUAL
--  <=    MENOR OU IGUAL

--MOSTRE OS DADOS DE TODOS OS CLIENTES DO SEXO MASCULINO DA CIDADE DE SOROCABA
SELECT *
FROM Cliente
WHERE sexo = 'M'
AND cidade = 'Sorocaba'

-- E   -> AND
-- OU  -> OR
-- NÃO -> NOT

-- MOSTRE O NOME DE TODOS OS CLIENTES DO SEXO MASCULINO
-- DA CIDADE DE SOROCABA E Votorantim
SELECT *
FROM Cliente
WHERE sexo = 'M'
AND (CIDADE = 'Sorocaba'
or cidade = 'Votorantim')

select * 
from Cliente
where sexo = 'M'
and cidade in ('Sorocaba', 'Votorantim')

-- Todos os clientes que não tem telefone cadastrado
select * 
from Cliente
where telefone is null
or telefone = ''

-- like
	-- % qualquer coisa
	-- _ qualquer caracter
	-- [] conjunto
	-- ^  não
-- Mostre os clientes com o nome Edson
select * 
from Cliente
where nome like 'Edson%'

-- mostre todos os clientes com e-mail do uol
select *
from Cliente
where email like '%uol%'

-- Mostre o nome dos clientes que possuem na segunda letra a letra A
select * 
from Cliente
where nome like '_a%'

select *
from Cliente
where telefone like '(__)____-____'

--mostre todos os e-mail inválidos dos clientes
select email
from Cliente
where email not like '_%@_%._%'

--quantos clientes eu tenho
select COUNT(*) as quantidade 
from Cliente

--maior valor de item_pedido
select max(valor) as maior 
from Item_Pedido

--menor valor de item_pedido
select min(valor) as maior 
from Item_Pedido

--valor médio de valor de item_pedido
select avg(valor) as maior 
from Item_Pedido

-- Todos os nomes de clientes em ordem alfabética
select nome
from Cliente
order by nome desc

--ordenar cidade ascendente 
--e ordenar nome descrescente
select nome, cidade
from Cliente
order by cidade asc, nome desc

-- DISTINCT 
SELECT DISTINCT bairro 
FROM Cliente
ORDER BY bairro

SELECT BAIRRO, COUNT(*)
FROM Cliente
GROUP BY bairro

--QUANTOS CLIENTES DO SEXO MASCULINO E DO SEXO FEMININO EU 
--TENHO CADASTRADO
SELECT cidade, SEXO, COUNT(*) AS QUANTIDADE
FROM Cliente
GROUP BY cidade, sexo
ORDER BY cidade