use `daw-aluno08-2017`;

## Listar nome e marca de todas as impressoras existentes
select nome, marca from impressoras;

## Listar o nome, cargo, e salário de cada funcionário
select funcionarios.nome, cargos.nome, cargos.salario from funcionarios, cargos 
	where funcionarios.cargo_id = cargos.id;

## Listar os detalhes de todos os atendimentos existentes
select clientes.nome, impressoras.nome, funcionarios.nome, atendimentos.num_paginas, atendimentos.valor, atendimentos.quando
	from clientes, impressoras, funcionarios, atendimentos
    where clientes.id = atendimentos.cliente_id and impressoras.id = atendimentos.impressora_id and funcionarios.id = atendimentos.funcionario_id;

## Listar os atendimentos que foram feitos nas impressoras de marca 'HP'
select clientes.nome, impressoras.nome, funcionarios.nome, atendimentos.num_paginas, atendimentos.valor, atendimentos.quando
	from clientes, impressoras, funcionarios, atendimentos
    where clientes.id = atendimentos.cliente_id and impressoras.id = atendimentos.impressora_id and funcionarios.id = atendimentos.funcionario_id and impressoras.marca like '%HP%';

## Listar o nome dos clientes que foram atendidos até Julho de 2017
select distinct clientes.nome 
	from clientes, atendimentos
	where clientes.id = atendimentos.cliente_id
	and atendimentos.quando < "2017-08-01 00:00:00"; 