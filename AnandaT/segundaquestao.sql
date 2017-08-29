/*Comandos*/ 
SELECT nome, marca FROM `impressoras`


SELECT cargos.nome, cargos.salario, funcionarios.nome FROM cargos, funcionarios
WHERE cargos.id = funcionarios.id_cargo; 


SELECT atendimento.* FROM atendimento, impressoras
WHERE impressoras.id = atendimento.id_impressora AND impressoras.marca = 'HP';

SELECT clientes.nome FROM clientes, atendimento
WHERE clientes.id = atendimento.id_cliente AND atendimento.data < "2017-07-01";
