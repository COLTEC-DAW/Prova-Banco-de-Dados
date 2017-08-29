-- Mostra nome e marca de todas as impressoras
select nome, marca from impressoras; 

-- Mostra nome, cargo e salario de todos os funcionarios
select funcionarios.nome, cargos.nome_cargo, cargos.salario from funcionarios
join cargos on funcionarios.id_cargo = cargos.id;

-- Detalhes do atendimento
select horaEdia, impressoras.nome, clientes.nome, funcionarios.nome, valor, numpaginas from atendimentos
join impressoras on id_impressore = impressoras.id
join clientes on id_cliente = clientes.id
join funcionarios on id_funcionario = funcionarios.id;

-- Todos os atendimentos em impressoras da marca "HHG2G" (não tinha da HP)
select horaEdia, impressoras.nome, clientes.nome, funcionarios.nome, valor, numpaginas from atendimentos
join impressoras on id_impressore = impressoras.id
join clientes on id_cliente = clientes.id
join funcionarios on id_funcionario = funcionarios.id
where impressoras.marca = "HHG2G";

-- Atendimentos até o fim de julho 2017
select horaEdia, impressoras.nome, clientes.nome, funcionarios.nome, valor, numpaginas from atendimentos
join impressoras on id_impressore = impressoras.id
join clientes on id_cliente = clientes.id
join funcionarios on id_funcionario = funcionarios.id
where horaEdia <= '2017-07-31 23:59:59';