CREATE TABLE clientes(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(70),
	cpf VARCHAR(16),

	CONSTRAINT pk_cliente PRIMARY KEY (id),

	CONSTRAINT uk_cliente UNIQUE (cpf)
);

CREATE TABLE impressoras(
	id INT AUTO_INCREMENT NOT NULL ,
	nome VARCHAR( 70 ) ,
	marca VARCHAR( 70 ) ,

	CONSTRAINT pk_impressora PRIMARY KEY ( id )
)

CREATE TABLE cargos(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR(70),
	salario DECIMAL (20,2),

	CONSTRAINT pk_cargos PRIMARY KEY (id),
    
	CONSTRAINT uk_cargos UNIQUE (nome)
);

CREATE TABLE funcionarios(
	id INT AUTO_INCREMENT NOT NULL,
	nome VARCHAR( 70 ),
	cpf VARCHAR( 16 ),
	cargo_id INT,

	CONSTRAINT pk_funcionario PRIMARY KEY ( id ),

	CONSTRAINT fk_cargo_funcionarios FOREIGN KEY ( cargo_id )
		REFERENCES cargos( id ),

	CONSTRAINT uk_funcionario UNIQUE (cpf)
)

CREATE TABLE atendimentos(
	id_impressora INT,
	id_funcionario INT,
	id_cliente INT,
	num_paginas INT,
	valor DECIMAL( 7, 2 ),
	data DATETIME,

	CONSTRAINT pk_atendimento 
		PRIMARY KEY ( id_impressora, id_funcionario, id_cliente, data ),

	CONSTRAINT fk_atendimento_impressora FOREIGN KEY ( id_impressora ) 
		REFERENCES impressoras( id ),

	CONSTRAINT fk_atendimento_funcionario FOREIGN KEY ( id_funcionario )
		REFERENCES funcionarios( id ),

	CONSTRAINT fk_atendimento_cliente FOREIGN KEY ( id_cliente )
		REFERENCES clientes( id )
)

/******************************************************************************/

SELECT nome, marca FROM impressoras;

/******************************************************************************/

SELECT funcionarios.nome, cargos.salario, cargos.nome
FROM funcionarios
JOIN cargos ON cargos.id = funcionarios.cargo_id;

/******************************************************************************/

SELECT atendimentos.data, atendimentos.valor, atendimentos.num_paginas, impressoras.nome, funcionarios.nome, clientes.nome
FROM atendimentos
JOIN impressoras ON impressoras.id = atendimentos.id_impressora
JOIN funcionarios ON funcionarios.id = atendimentos.id_funcionario
JOIN clientes ON clientes.id = atendimentos.id_cliente;

/******************************************************************************/

SELECT atendimentos.data, atendimentos.valor, atendimentos.num_paginas, impressoras.nome, funcionarios.nome, clientes.nome
FROM atendimentos
JOIN impressoras ON impressoras.id = atendimentos.id_impressora
JOIN funcionarios ON funcionarios.id = atendimentos.id_funcionario
JOIN clientes ON clientes.id = atendimentos.id_cliente
WHERE impressoras.marca =  "HP";


