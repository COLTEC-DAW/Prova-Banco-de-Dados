CREATE TABLE Impressoras (
    id INT AUTO_INCREMENT NOT NULL,

    nome VARCHAR(30) NOT NULL,
    marca VARCHAR(30) NOT NULL,
    
    CONSTRAINT pk_id PRIMARY KEY (id)
);



CREATE TABLE Clientes (
    id INT AUTO_INCREMENT NOT NULL,

    nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(30) NOT NULL,
    
    CONSTRAINT pk_id PRIMARY KEY (id)
);

CREATE TABLE Cargos (
    id INT AUTO_INCREMENT NOT NULL,

    nome VARCHAR(30) NOT NULL,
    salario DECIMAL(7,2) NOT NULL,
    
    CONSTRAINT pk_id PRIMARY KEY (id)
);

CREATE TABLE Funcionarios (
    id INT AUTO_INCREMENT NOT NULL,

    nome VARCHAR(30) NOT NULL,
    cpf VARCHAR(30) NOT NULL,
    id_cargo INT NOT NULL,
    
    CONSTRAINT pk_id PRIMARY KEY (id),
    CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo) REFERENCES Cargos(id)
);

CREATE TABLE Atendimentos (

    id INT AUTO_INCREMENT NOT NULL,

    num_pags INT NOT NULL,
    valor DECIMAL(5,2) NOT NULL,
    data DATETIME NOT NULL,

    id_impressora INT NOT NULL,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    
    CONSTRAINT pk_id PRIMARY KEY (id),
    CONSTRAINT fk_id_impressora FOREIGN KEY (id_impressora) REFERENCES Impressoras(id),
    CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    CONSTRAINT fk_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id)
);



SELECT * FROM `Impressoras`;

SELECT Funcionarios.nome, Cargos.nome FROM `Funcionarios` JOIN `Cargos` ON Funcionarios.id_cargo = Cargos.id;

SELECT Atendimentos.num_pags, Atendimentos.valor, Atendimentos.data, Impressoras.nome, Clientes.nome, Funcionarios.nome FROM `Atendimentos` 
JOIN `Impressoras` ON Atendimentos.id_impressora = Impressoras.id 
JOIN `Clientes` ON Atendimentos.id_cliente = Clientes.id 
JOIN `Funcionarios` ON Atendimentos.id_funcionario = Funcionarios.id;

SELECT Atendimentos.num_pags, Atendimentos.valor, Atendimentos.data, Impressoras.nome FROM `Atendimentos` 
JOIN `Impressoras` ON Impressoras.marca = "HP";

SELECT DISTINCT Atendimentos.data, Atendimentos.id_cliente, Clientes.nome FROM `Atendimentos` 
JOIN `Clientes` ON Atendimentos.id_cliente = Clientes.id WHERE Atendimentos.data < '2017-07-01 00:00:00';