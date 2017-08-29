#1 Listar nome e marca de todas as impressoras existentes
	SELECT nome, marca FROM impressoras;
#2 Listar o nome, cargo, e salário de cada funcionário
	SELECT funcionarios.nome, cargos.nome, cargos.salario FROM funcionarios, cargos WHERE funcionarios.cargoId = cargos.cargoId;
#3 Listar os detalhes de todos os atendimentos existentes
	SELECT clientes.nome, impressoras.nome, funcionarios.nome, atendimentos.num_paginas, atendimentos.valor , atendimentos.data 
		FROM clientes, impressoras, funcionarios, atendimentos 
		WHERE clientes.clienteId = atendimentos.clienteId AND impressoras.impressoraId = atendimentos.impressoraId AND funcionarios.funcionarioId = atendimentos.funcionarioId;
#4 Listar os atendimentos que foram feitos nas impressoras de marca 'HP'
	SELECT clientes.nome, impressoras.nome, funcionarios.nome, atendimentos.num_paginas, atendimentos.valor , atendimentos.data 
		FROM clientes, impressoras, funcionarios, atendimentos 
		WHERE clientes.clienteId = atendimentos.clienteId AND impressoras.impressoraId = atendimentos.impressoraId AND funcionarios.funcionarioId = atendimentos.funcionarioId
		AND impressoras.marca LIKE '%HP%';
#5 Listar o nome dos clientes que foram atendidos até Julho de 2017
	SELECT DISTINCT clientes.nome 
		FROM clientes, atendimentos
		WHERE clientes.clienteId = atendimentos.clienteId
		AND atendimentos.data < "2017-08-01 00:00:00"; 