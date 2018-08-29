USE MyFoodDB;

CREATE TABLE estabelecimento (
    nome VARCHAR(45),
    cnpj INT NOT NULL,
    endereco VARCHAR(128),

    CONSTRAINT pk_estabelecimento PRIMARY KEY (cnpj)
);

CREATE TABLE item (
    codigo INT NOT NULL,
    nome VARCHAR(45),
    valor INT,
    estabelecimento_cnpj INT,

    CONSTRAINT pk_item PRIMARY KEY (codigo),
    CONSTRAINT fk_estabelecimento_cnpj FOREIGN KEY (estabelecimento_cnpj)
        REFERENCES estabelecimento(cnpj)
);

CREATE TABLE cliente (
    telefone INT(11),
    cpf INT NOT NULL,
    nome VARCHAR(45),
    endereco VARCHAR(128),

    CONSTRAINT pk_cliente PRIMARY KEY (cpf)
);

CREATE TABLE motorista (
    telefone INT(11),
    cpf INT(11) NOT NULL,
    nome VARCHAR(45),
    endereco VARCHAR(128),

    CONSTRAINT pk_motorista PRIMARY KEY (cpf)
);

CREATE TABLE pedido (
    codigo INT NOT NULL,
    hora DATETIME NOT NULL,
    cliente_cpf INT(11),
    motorista_cpf INT(11) NOT NULL,

    CONSTRAINT pk_pedido PRIMARY KEY (codigo),
    CONSTRAINT fk_cliente_cpf FOREIGN KEY (cliente_cpf)
        REFERENCES cliente(cpf),
    CONSTRAINT fk_motorista_cpf FOREIGN KEY (motorista_cpf)
        REFERENCES motorista(cpf)
);

CREATE TABLE incluso (
    item_codigo INT NOT NULL,
    pedido_codigo INT NOT NULL,

    CONSTRAINT fk_item_codigo FOREIGN KEY (item_codigo)
        REFERENCES item(codigo),
    CONSTRAINT fk_pedido_codigo FOREIGN KEY (pedido_codigo)
        REFERENCES pedido(codigo)
);