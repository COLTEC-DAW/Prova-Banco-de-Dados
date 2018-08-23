DROP DATABASE IF EXISTS myfood;
CREATE DATABASE myfood;
USE myfood;


CREATE TABLE IF NOT EXISTS estabelecimento(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cnpj INT NOT NULL,
  endereco VARCHAR(90) NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cpf INT NOT NULL,
  endereco VARCHAR(90) NOT NULL,
  telefone INT NOT NULL
);

CREATE TABLE IF NOT EXISTS motorista(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  cpf INT NOT NULL,
  endereco VARCHAR(90) NOT NULL
);

CREATE TABLE IF NOT EXISTS item(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  valor FLOAT NOT NULL,
  estabelecimento_id INT NOT NULL,
  CONSTRAINT fk_item_estabelecimento FOREIGN KEY (estabelecimento_id) REFERENCES estabelecimento(id)
);

CREATE TABLE IF NOT EXISTS pedido(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  hora VARCHAR(45) NOT NULL,
  cliente_id INT NOT NULL,
  motorista_id INT NOT NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  CONSTRAINT fk_pedido_motorista FOREIGN KEY (motorista_id) REFERENCES motorista(id)
);

CREATE TABLE IF NOT EXISTS incluso(
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT NOT NULL,
  item_id INT NOT NULL,
  CONSTRAINT fk_incluso_pedido FOREIGN KEY (pedido_id) REFERENCES pedido(id),
  CONSTRAINT fk_incluso_item FOREIGN KEY (item_id) REFERENCES item(id)
);
