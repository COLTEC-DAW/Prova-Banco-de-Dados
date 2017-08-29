/*****CONSULTAS*****/
/*1*/
SELECT nome, marca FROM impressoras;

/*2*/
SELECT funcionarios.nome, cargos.nome, cargos.salario FROM funcionarios 
JOIN funcionario_cargo ON funcionario_cargo.id_funcionario = funcionarios.id 
JOIN cargos ON cargos.id = funcionario_cargo.id_cargo;

/*3*/
SELECT num_paginas, valor, data, clientes.nome AS cliente, impressoras.nome AS impressora, funcionarios.nome AS funcionario FROM atendimentos 
JOIN clientes ON clientes.id = atendimentos.id_cliente 
JOIN impressoras ON impressoras.id = atendimentos.id_impressora 
JOIN funcionarios ON funcionarios.id = atendimentos.id_funcionario;

/*4*/
SELECT num_paginas, valor, data, clientes.nome AS cliente, impressoras.nome AS impressora, impressoras.marca AS impressora_marca, funcionarios.nome AS funcionario FROM atendimentos 
JOIN clientes ON clientes.id = atendimentos.id_cliente 
JOIN impressoras ON impressoras.id = atendimentos.id_impressora 
JOIN funcionarios ON funcionarios.id = atendimentos.id_funcionario
WHERE impressoras.marca = "hp";

/*5*/
SELECT DISTINCT clientes.nome FROM clientes
JOIN atendimentos ON atendimentos.id_cliente = clientes.id
WHERE atendimentos.data < "2017-07-01 00:00:00";