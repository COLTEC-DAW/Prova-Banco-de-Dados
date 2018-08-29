
CREATE TABLE cliente(

	cpf VARCHAR(10) NOT NULL,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	telefone VARCHAR(45) NOT NULL,

	CONSTRAINT pk_cpf PRIMARY KEY (cpf)

);

CREATE TABLE motorista(

	cpf VARCHAR(10) NOT NULL,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(45) NOT NULL,
	
	CONSTRAINT pk_cpf PRIMARY KEY (cpf)

);


CREATE TABLE estabelecimento(

	cnpj VARCHAR(10) NOT NULL,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	
	CONSTRAINT pk_cnpj PRIMARY KEY (cnpj)	

);

CREATE TABLE item(

	codigo_pedido INT NOT NULL,
	nome VARCHAR(45) NOT NULL,
	valor FLOAT NOT NULL,
	estabelecimento_cnpj VARCHAR(10) NOT NULL,
	
	CONSTRAINT pk_codigo_pedido PRIMARY KEY (codigo_pedido),
	CONSTRAINT fk_estabelecimento_cnpj FOREIGN KEY (estabelecimento_cnpj) REFERENCES estabelecimento(cnpj)

);

CREATE TABLE pedido(

	codigo INT NOT NULL,
	hora TIME NOT NULL,
	endereco VARCHAR(100) NOT NULL,
	telefone VARCHAR(45) NOT NULL,
	cliente_cpf VARCHAR(10),
	motorista_cpf VARCHAR(10) NOT NULL,

	CONSTRAINT pk_codigo PRIMARY KEY (codigo),
	CONSTRAINT fk_cliente_cpf FOREIGN KEY (cliente_cpf) REFERENCES cliente(cpf),	
	CONSTRAINT fk_motorista_cpf FOREIGN KEY (motorista_cpf) REFERENCES motorista(cpf)

);

CREATE TABLE pedido_has_item(

	pedido_codigo INT NOT NULL,
	item_codigo_pedido INT NOT NULL,

	CONSTRAINT fk_pedido_codigo FOREIGN KEY (pedido_codigo) REFERENCES pedido(codigo),	
	CONSTRAINT fk_item_codigo_pedido FOREIGN KEY (item_codigo_pedido) REFERENCES item(codigo_pedido)

);

