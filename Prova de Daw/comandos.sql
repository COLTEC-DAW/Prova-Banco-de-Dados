/*CRIANDO TABELAS*/

CREATE TABLE impressoras (
	id_impressora INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(30) NOT NULL,
	marca VARCHAR(30) NOT NULL
);

CREATE TABLE clientes (
	id_cliente INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(30) NOT NULL,
	cpf VARCHAR(30) NOT NULL
);

CREATE TABLE cargos (
	id_cargos INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(30) NOT NULL,
	salario FLOAT(10,2) NOT NULL
);

CREATE TABLE funcionarios (
	id_funcionarios INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(30) NOT NULL,
	cpf VARCHAR(30) NOT NULL,
	id_cargos INT(6) UNSIGNED,
  	FOREIGN KEY (id_cargos) REFERENCES cargos(id_cargos)
);

CREATE TABLE atendimentos (
	id_atendimentos INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
	data TIMESTAMP NOT NULL,
	valor FLOAT(10,2) NOT NULL,
	n_paginas INT(6) NOT NULL,
	id_funcionarios INT(6) UNSIGNED,
  	FOREIGN KEY (id_funcionarios) REFERENCES funcionarios(id_funcionarios),
	id_cliente INT(6) UNSIGNED,
  	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	id_impressora INT(6) UNSIGNED,
  	FOREIGN KEY (id_impressora) REFERENCES impressoras(id_impressora)
);

/*INSERINDO DADOS*/

INSERT INTO `impressoras` (`nome`, `marca`) VALUES ("do coltec", "hp");
INSERT INTO `impressoras` (`nome`, `marca`) VALUES ("da quimica", "samsung");

INSERT INTO `clientes` (`nome`, `cpf`) VALUES ("lucas", "123");
INSERT INTO `clientes` (`nome`, `cpf`) VALUES ("sander", "321");

INSERT INTO `cargos` (`nome`, `salario`) VALUES ("admin", 2000);
INSERT INTO `cargos` (`nome`, `salario`) VALUES ("escravo", 2);

INSERT INTO `funcionarios` (`nome`, `cpf`, `id_cargos`) VALUES ("escravo1", "1", 2);
INSERT INTO `funcionarios` (`nome`, `cpf`, `id_cargos`) VALUES ("escravo2", "2", 2);
INSERT INTO `funcionarios` (`nome`, `cpf`, `id_cargos`) VALUES ("admin1", "3", 1);
INSERT INTO `funcionarios` (`nome`, `cpf`, `id_cargos`) VALUES ("admin2", "4", 1);

INSERT INTO `atendimentos` (`data`, `valor`, `n_paginas`, `id_funcionarios`, `id_cliente`, `id_impressora`) VALUES ('2008-01-01 00:00:01', 5, 10, 1, 2, 1);
INSERT INTO `atendimentos` (`data`, `valor`, `n_paginas`, `id_funcionarios`, `id_cliente`, `id_impressora`) VALUES ('2009-01-01 00:00:01', 5, 10, 1, 2, 2);

/*CONSULTAS DE DADOS*/

#1) Listar nome e marca de todas as impressoras existentes:
	SELECT nome, marca FROM impressoras;
#2) Listar o nome, cargo, e salário de cada funcionário:
	SELECT funcionarios.nome, cargos.salario, cargos.nome FROM funcionarios, cargos
   	WHERE funcionarios.id_cargos = cargos.id_cargos;
#3) Listar os detalhes de todos os atendimentos existentes:
	SELECT atendimentos.data, atendimentos.valor, atendimentos.n_paginas, funcionarios.nome, clientes.nome, impressoras.nome FROM atendimentos, funcionarios,clientes,impressoras
	WHERE atendimentos.id_funcionarios = funcionarios.id_funcionarios AND clientes.id_cliente = atendimentos.id_cliente AND atendimentos.id_impressora = impressoras.id_impressora;
#4) Listar os atendimentos que foram feitos nas impressoras de marca 'HP':
	SELECT atendimentos.data, atendimentos.valor, atendimentos.n_paginas, funcionarios.nome, clientes.nome, impressoras.nome FROM atendimentos, funcionarios,clientes,impressoras
	WHERE atendimentos.id_funcionarios = funcionarios.id_funcionarios AND clientes.id_cliente = atendimentos.id_cliente AND atendimentos.id_impressora = impressoras.id_impressora AND impressoras.marca LIKE "%hp%";
#5) Listar o nome dos clientes que foram atendidos até Julho de 2017:
	SELECT clientes.nome, atendimentos.data FROM clientes, atendimentos
	WHERE atendimentos.data < "2017-07-01 00:00:01" AND atendimentos.id_cliente = clientes.id_cliente;