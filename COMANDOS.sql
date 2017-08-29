#1
SELECT nome,marca FROM `daw-aluno15-2017`.`Impressoras`;

#2
SELECT cargos.nome,cargos.salario, Funcionarios.nome FROM `daw-aluno15-2017`.`cargos`, `daw-aluno15-2017`.`Funcionarios`
WHERE Funcionarios.cargos_idcargos = cargos.idcargos;

#3
SELECT * FROM `daw-aluno15-2017`.`Atendimentos`;

#4 (Nao consegui imprimir os dados apenas de Atendimentos, entao imprimi o id)
SELECT Atendimentos.idatendimento FROM `daw-aluno15-2017`.`Atendimentos`,`daw-aluno15-2017`.`Impressoras`
WHERE Atendimentos.Impressoras_idimpressora = Impressoras.idimpressora AND Impressoras.marca="HP"

#4
SELECT clientes_idclientes FROM `daw-aluno15-2017`.`Atendimentos`
WHERE data <= "2017-07-1 00:00:00";
