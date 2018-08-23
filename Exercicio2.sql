CREATE TABLE estabelecimento (
    cnpj INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(60) NOT NULL
);

CREATE TABLE item (
    codigo INT PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    valor FLOAT NOT NULL
);

CREATE TABLE pedido (
    codigo INT PRIMARY KEY,
    hora TIME NOT NULL
);

CREATE TABLE cliente (
    cpf INT NOT NULL PRIMARY KEY,
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    telefone INT NOT NULL
);

CREATE TABLE motorista (
    nome VARCHAR(40) NOT NULL,
    endereco VARCHAR(60),
    cpf INT NOT NULL PRIMARY KEY
);
