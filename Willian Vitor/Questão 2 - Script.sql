CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;


CREATE TABLE IF NOT EXISTS mydb.cliente (
	cliente_nome VARCHAR(45) NOT NULL,
	cliente_cpf SMALLINT(11) NOT NULL,
	cliente_endereco VARCHAR(45) NOT NULL,
	cliente_telefone SMALLINT(11) NULL,
	
    CONSTRAINT cliente_cpf PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS mydb.estabelecimento (
	estabelecimento_cnpj VARCHAR(17) NOT NULL,
	estabelecimento_nome VARCHAR(45) NOT NULL,
	estabelecimento_endereco VARCHAR(45) NOT NULL,
    
    CONSTRAINT estabelecimento_cnpj PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS mydb.motorista (
	motorista_cpf INT NOT NULL,
	motorista_nome VARCHAR(45) NOT NULL,
	motorista_endereço VARCHAR(45) NULL,
    
    CONSTRAINT motorista_cpf PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS mydb.pedido (
  pedido_codigo INT NOT NULL,
  pedido_hora TIME NOT NULL,
  item_item_codigo INT NOT NULL,
  cliente_cliente_cpf SMALLINT(11) NOT NULL,
  motorista_motorista_cpf INT NOT NULL,
  
  CONSTRAINT pedido_codigo PRIMARY KEY (id),
  
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_cpf)
    REFERENCES mydb.cliente (cliente_cpf),
  
  CONSTRAINT fk_pedido_motorista FOREIGN KEY (motorista_cpf)
    REFERENCES mydb.motorista (motorista_cpf)
);


CREATE TABLE IF NOT EXISTS mydb.item (
  item_codigo INT NOT NULL,
  item_nome VARCHAR(45) NOT NULL,
  valor DECIMAL(6) NOT NULL,
  
  CONSTRAINT item_codigo PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS mydb.incluso (
  pedido_codigo INT NOT NULL,
  item_codigo INT NOT NULL,
  INDEX fk_pedido_has_item_item1_idx (item_codigo ASC),
  INDEX fk_pedido_has_item_pedido1_idx (pedido_codigo ASC),
  
  CONSTRAINT pedido_codigo PRIMARY KEY (id),
  
  CONSTRAINT fk_pedido_pedido FOREIGN KEY (pedido_codigo)
    REFERENCES mydb.pedido (pedido_codigo),
    
  CONSTRAINT fk_pedido_item FOREIGN KEY (item_codigo)
    REFERENCES mydb.item (item_codigo)
);


CREATE TABLE IF NOT EXISTS mydb.oferece (
  estabelecimento_cnpj VARCHAR(17) NOT NULL,
  item_codigo INT NOT NULL,
  
  CONSTRAINT fk_estabelecimento_estabelecimento FOREIGN KEY (estabelecimento_cnpj)
    REFERENCES mydb.estabelecimento (estabelecimento_cnpj),
  
  CONSTRAINT fk_estabelecimento_item FOREIGN KEY (item_codigo)
    REFERENCES mydb.item (item_codigo)
);