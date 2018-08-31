Create database if not exists prova_daw;
use prova_daw;

CREATE TABLE IF NOT EXISTS estabelecimento (
  cnpj VARCHAR(11) NOT NULL PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  endereço VARCHAR(45) NOT NULL
  );


CREATE TABLE IF NOT EXISTS item (
  codigo INT NOT NULL PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  valor DOUBLE NOT NULL,
  estabelecimento_cnpj VARCHAR(11) NOT NULL,

CONSTRAINT fk_item_estabelecimento FOREIGN KEY (estabelecimento_cnpj) REFERENCES estabelecimento(cnpj)
);


CREATE TABLE IF NOT EXISTS cliente (
  cpf  VARCHAR(11) NOT NULL PRIMARY KEY,
  telefone VARCHAR(45) NULL,
  nome VARCHAR(45) NULL,
  endereço VARCHAR(45) NULL
);

CREATE TABLE IF NOT EXISTS motorista (
  cpf  VARCHAR(11) NOT NULL PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  endereço VARCHAR(45) NOT NULL,
  
  );


CREATE TABLE IF NOT EXISTS pedido (
  codigo  INT NOT NULL PRIMARY KEY,
  hora TIME NOT NULL,
  cliente_cpf VARCHAR(11) NOT NULL,
  motorista_cpf VARCHAR(11) NOT NULL,


  CONSTRAINT fk_cliente_pedido FOREIGN KEY (cliente_cpf) REFERENCES cliente(cpf),
  CONSTRAINT fk_motorista_pedido FOREIGN KEY (motorista_cpf) REFERENCES motorista(cpf)

);

CREATE TABLE IF NOT EXISTS incluso (
  item_codigo INT  NOT NULL,
  pedido_codigo INT NOT NULL,
  
  CONSTRAINT fk_item_incluso FOREIGN KEY (item_codigo) REFERENCES item(codigo),
  CONSTRAINT fk_pedido_incluso FOREIGN KEY (pedido_codigo) REFERENCES pedido(codigo)
  );



