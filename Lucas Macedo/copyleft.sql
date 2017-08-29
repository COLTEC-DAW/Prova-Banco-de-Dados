# CONFIGURAÇÃO DO BANCO DE DADOS DA COPYLEFT

CREATE TABLE IMPRESSORAS(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  marca VARCHAR(45) NOT NULL,
  CONSTRAINT pk_impressora PRIMARY KEY (id)
);

CREATE TABLE CLIENTES(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE CARGOS(
  id INT NOT NULL AUTO_INCREMENT, 
  nome VARCHAR(45) NOT NULL,
  salario DECIMAL(5, 2),
  CONSTRAINT pk_cargo PRIMARY KEY (id)
);

CREATE TABLE FUNCIONARIOS(
  id INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  CPF VARCHAR(11) NOT NULL,
  id_cargo INT NOT NULL,
  CONSTRAINT pk_funcionario PRIMARY KEY (id),

  CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo)
  REFERENCES CARGOS(id)
);

CREATE TABLE ATENDIMENTOS(
  id INT NOT NULL AUTO_INCREMENT,
  id_cliente INT NOT NULL,
  id_impressora INT NOT NULL,
  id_funcionario INT NOT NULL,
  data DATE NOT NULL,
  num_paginas INT NOT NULL,
  valor DECIMAL(5,2) NOT NULL,
  CONSTRAINT pk_emprestimo PRIMARY KEY (id),

  CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente)
  REFERENCES CLIENTES(id),

  CONSTRAINT fk_id_impressora FOREIGN KEY (id_impressora)
  REFERENCES IMPRESSORAS(id),

  CONSTRAINT fk_id_funcionario FOREIGN KEY (id_funcionario)
  REFERENCES FUNCIONARIOS(id)
);


# POVOAMENTO DO BANCO DE DADOS DA COPYLEFT

INSERT INTO IMPRESSORAS (nome, marca) VALUES ("Informática", "Xerox");
INSERT INTO IMPRESSORAS (nome, marca) VALUES ("Química", "HP");

INSERT INTO CLIENTES (nome, CPF) VALUES ("Dudu","00000000001");
INSERT INTO CLIENTES (nome, CPF) VALUES ("Chichi","00000000002");

INSERT INTO CARGOS (nome, salario) VALUES ("Copiador", 500.00);
INSERT INTO CARGOS (nome, salario) VALUES ("Encarregado do Clipes", 2000.00);

INSERT INTO FUNCIONARIOS (nome, CPF, id_cargo) VALUES ("Pouzão","10000000000", 1);
INSERT INTO FUNCIONARIOS (nome, CPF, id_cargo) VALUES ("Raulzão","20000000000", 1);
INSERT INTO FUNCIONARIOS (nome, CPF, id_cargo) VALUES ("De Paulazão","30000000000", 2);
#                                                                                                    cli func impress
INSERT INTO ATENDIMENTOS (id_cliente, id_funcionario, id_impressora, data, num_paginas, valor) VALUES (1, 1, 1, "2017-04-05", 13, 13.00);
INSERT INTO ATENDIMENTOS (id_cliente, id_funcionario, id_impressora, data, num_paginas, valor) VALUES (1, 2, 2, "2017-08-05", 100, 200.00);
INSERT INTO ATENDIMENTOS (id_cliente, id_funcionario, id_impressora, data, num_paginas, valor) VALUES (1, 1, 2, "2017-09-05", 40, 43.30);
INSERT INTO ATENDIMENTOS (id_cliente, id_funcionario, id_impressora, data, num_paginas, valor) VALUES (2, 1, 1, "2016-04-05", 3, 12.00);
INSERT INTO ATENDIMENTOS (id_cliente, id_funcionario, id_impressora, data, num_paginas, valor) VALUES (2, 3, 2, "2018-04-05", 2, 13.00);
INSERT INTO ATENDIMENTOS (id_cliente, id_funcionario, id_impressora, data, num_paginas, valor) VALUES (1, 3, 2, "2015-04-05", 4, 55.00);


# CONSULTAS NO BANCO DE DADOS DA COPYLEFT

SELECT * FROM IMPRESSORAS;

SELECT FUNCIONARIOS.nome, CARGOS.id, CARGOS.salario FROM FUNCIONARIOS, CARGOS
WHERE CARGOS.id = FUNCIONARIOS.id_cargo;

SELECT CLIENTES.nome, IMPRESSORAS.nome, FUNCIONARIOS.nome, ATENDIMENTOS.num_paginas, ATENDIMENTOS.data, ATENDIMENTOS.valor FROM ATENDIMENTOS, IMPRESSORAS, FUNCIONARIOS, CLIENTES
WHERE CLIENTES.id = ATENDIMENTOS.id_cliente AND IMPRESSORAS.id = ATENDIMENTOS.id_impressora AND FUNCIONARIOS.id = ATENDIMENTOS.id_funcionario;

# NÃO FUNCIONOU, MAS MEU ENFORÇO QUE CONTA
SELECT ATENDIMENTOS.id FROM IMPRESSORAS, ATENDIMENTOS
WHERE ATENDIMENTOS.id_impressora = IMPRESSORAS.id AND IMPRESSORAS.id LIKE '%HP%';

SELECT DISTINCT CLIENTES.nome FROM CLIENTES, ATENDIMENTOS
WHERE ATENDIMENTOS.data < "2017-08-01" AND CLIENTES.id = ATENDIMENTOS.id_cliente;
