CREATE DATABASE MyFood;
USE MyFood;
CREATE TABLE estabelecimentos (
    id INT,
    nome VARCHAR(45),
    cnpj VARCHAR(45) NOT NULL,
    CONSTRAINT pk_estabelecimentos PRIMARY KEY (id),
    CONSTRAINT uk_estabelecimentos UNIQUE (cnpj)
);

CREATE TABLE itens (
    id INT,
    nome VARCHAR(45) NOT NULL,
    codigo VARCHAR(45) NOT NULL,
    valor FLOAT NOT NULL;
    estabelecimento_id INT,
    CONSTRAINT pk_itens PRIMARY KEY (id),
    CONSTRAINT uk_itens UNIQUE (codigo),

    CONSTRAINT fk_itens_estabelecimento FOREIGN KEY (estabelecimento_id)
    REFERENCES estabelecimentos(id),
);
CREATE TABLE clientes (
    id INT,
    nome VARCHAR(45),
    cpf VARCHAR(45) NOT NULL,
    telefone VARCHAR(45) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    CONSTRAINT pk_clientes PRIMARY KEY (id),
    CONSTRAINT uk_clientes UNIQUE (cpf)
);
CREATE TABLE motoristas (
    id INT,
    nome VARCHAR(45),
    cpf VARCHAR(45) NOT NULL,
    endereco VARCHAR(45) NOT NULL,
    CONSTRAINT pk_motoristas PRIMARY KEY (id),
    CONSTRAINT uk_motoristas UNIQUE (cpf)
);
CREATE TABLE pedidos (
    id INT;
    codigo VARCHAR(45) NOT NULL,
    hora TIMESTAMP NOT NULL,
    item_id INT,
    cliente_id INT,
    motorista_id INT,
    CONSTRAINT pk_pedidos PRIMARY KEY (id),
    CONSTRAINT uk_pedidos UNIQUE (codigo),
    CONSTRAINT fk_pedidos_item FOREIGN KEY (item_id) REFERENCES itens(id),
    CONSTRAINT fk_pedidos_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    CONSTRAINT fk_pedidos_motorista FOREIGN KEY (motorista_id) REFERENCES motoristas(id)
);

QUIT;