
CREATE TABLE Estabelecimento (
	CNPJ int NOT NULL,
    Nome varchar(45) NOT NULL,
    Endereco varchar(45) NOT NULL,
    
    PRIMARY KEY (CNPJ)
);

CREATE TABLE Cliente (
	CPF int NOT NULL,
    Nome varchar(45) NOT NULL,
    Endereco varchar(45) NOT NULL,
    Telefone varchar(45) NOT NULL,
    
    PRIMARY KEY (CPF)
);
    
CREATE TABLE Motorista (
	CPF int NOT NULL,
    Nome varchar(45) NOT NULL,
    Endereco varchar(45) NOT NULL,
    
    PRIMARY KEY (CPF)
);

CREATE TABLE Pedido (
	Codigo int NOT NULL AUTO_INCREMENT,
    Hora datetime NOT NULL,
    Cliente_CPF int NOT NULL,
    Motorista_CPF int NOT NULL,
    
    PRIMARY KEY (Codigo, Cliente_CPF, Motorista_CPF),
    FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF),
    FOREIGN KEY (Motorista_CPF) REFERENCES Motorista(CPF)
);

CREATE TABLE Item (
	Codigo int NOT NULL AUTO_INCREMENT,
    Nome varchar(45) NOT NULL,
    Valor float NOT NULL,
    Estabelecimento_CNPJ int NOT NULL,
    
	PRIMARY KEY (Codigo, Estabelecimento_CNPJ),
    FOREIGN KEY (Estabelecimento_CNPJ) REFERENCES Estabelecimento(CNPJ)
);    

CREATE TABLE Relação_Item_Pedido (
	Item_codigo int NOT NULL, 
    Item_estabelecimento int NOT NULL,
    Pedido_codigo int NOT NULL,
    
    PRIMARY KEY (Item_codigo, Item_estabelecimento, Pedido_codigo),
    FOREIGN KEY (Item_estabelecimento) REFERENCES Item(Estabelecimento_CNPJ),
    FOREIGN KEY (Pedido_codigo) REFERENCES Pedido(Codigo)
);
    
