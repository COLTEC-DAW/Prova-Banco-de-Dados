CREATE DATABASE MyFood;

USE MyFood;

CREATE TABLE Estabelecimento (
    CNPJ INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereço VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Estabelecimento PRIMARY KEY (CNPJ)
);

CREATE TABLE Item (
    Código INT AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Estabelecimento_CNPJ INT NOT NULL,
    CONSTRAINT pk_Item PRIMARY KEY (Código),
    CONSTRAINT fk_Item_Estabelecimento FOREIGN KEY (Estabelecimento_CNPJ) REFERENCES Estabelecimento(CNPJ)
);

CREATE TABLE Itens_do_pedido (
    Item_código INT NOT NULL,
    Pedido_código INT NOT NULL,
    CONSTRAINT fk_Itens_Item FOREIGN KEY (Item_código) REFERENCES Item(Código),
    CONSTRAINT fk_Itens_Pedido FOREIGN KEY (Pedido_código) REFERENCES Pedido(Código)
);

CREATE TABLE Pedido (
    Código INT AUTO_INCREMENT NOT NULL,
    Hora TIMESTAMP NOT NULL,
    Cliente_CPF INT NOT NULL,
    Motorista_CPF INT NOT NULL,
    CONSTRAINT pk_Pedido PRIMARY KEY (Código),
    CONSTRAINT fk_Pedido_Cliente FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF),
    CONSTRAINT fk_Pedido_Motorista FOREIGN KEY (Motorista_CPF) REFERENCES Motorista(CPF)
);

CREATE TABLE Cliente (
    CPF INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Telefone INT NOT NULL,
    Endereço VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Cliente PRIMARY KEY (CPF)
);

CREATE TABLE Motorista (
    CPF INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Endereço VARCHAR(50) NOT NULL,
    CONSTRAINT pk_Motorista PRIMARY KEY (CPF)
);