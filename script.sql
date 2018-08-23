CREATE DATABASE myfood;

CREATE TABLE estabelecimento(	
	est_nome VARCHAR(50) NOT NULL,
	est_cnpj INT,
	est_endereco VARCHAR(50),
    item_item_cod INT
);

CREATE TABLE item(	
	item_cod INT,
	item_nome VARCHAR(50),
	item_valor DECIMAL(10, 2),

    CONSTRAINT pk_categoria1 PRIMARY KEY (item_cod)
);

CREATE TABLE item_has_pedido(
    item_item_cod INT,
    pedido_ped_cod INT

    CONSTRAINT pk_categoria2 PRIMARY KEY (item_item_cod)
    CONSTRAINT pk_categoria3 PRIMARY KEY (pedido_ped__cod)

);

CREATE TABLE pedido(	
	ped_cod INT,
	ped_hora TIME

    CONSTRAINT pk_categoria5 PRIMARY KEY (ped_cod)

);

CREATE TABLE cliente(	
	clie_telefone VARCHAR(20),
	clie_cpf VARCHAR(20),
	clie_nome VARCHAR(50),
	clie_endereco VARCHAR(50),
    pedido_ped_cod INT
);

CREATE TABLE motorista(	
	moto_nome VARCHAR(50) NOT NULL,
	moto_cpf VARCHAR(20),
	moto_endereco VARCHAR(50),
    pedido_ped_cod INT
);

