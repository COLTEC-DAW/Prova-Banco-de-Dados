
/* Questão 2 */

--1

SELECT nome, marca FROM Impressoras;

--2

SELECT Funcionarios.nome, Cargos.nome, Cargos.salario FROM Funcionarios INNER JOIN Cargos ON Funcionarios.id_cargo = Cargos.id;

--3

SELECT Atendimentos.num_paginas, Atendimentos.valor, Atendimentos.data, Impressoras.nome AS Impressora_NOME, Impressoras.marca AS Impressora_MARCA, Clientes.nome AS Cliente_NOME, Funcionarios.nome AS Funcionario_NOME FROM Atendimentos INNER JOIN Impressoras ON Atendimentos.id_impressora = Impressoras.id INNER JOIN Clientes ON Atendimentos.id_cliente = Clientes.id INNER JOIN Funcionarios ON Atendimentos.id_funcionario = Funcionarios.id;

--4

SELECT Atendimentos.num_paginas, Atendimentos.valor, Atendimentos.data, Impressoras.nome AS Impressora_NOME, Impressoras.marca AS Impressora_MARCA, Clientes.nome AS Cliente_NOME, Funcionarios.nome AS Funcionario_NOME FROM Atendimentos INNER JOIN Impressoras ON Atendimentos.id_impressora = Impressoras.id INNER JOIN Clientes ON Atendimentos.id_cliente = Clientes.id INNER JOIN Funcionarios ON Atendimentos.id_funcionario = Funcionarios.id WHERE Impressoras.marca = 'HP';

--5

SELECT Clientes.nome AS Cliente_NOME FROM Atendimentos INNER JOIN Clientes ON Atendimentos.id_cliente = Clientes.id WHERE Atendimentos.data < '2017-07-31 23:59:59';