/*****CRIANDO DB*****/
/*IMPRESSORAS*/
CREATE TABLE impressoras (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	marca VARCHAR(45) NOT NULL
);

/*CLIENTES*/
CREATE TABLE clientes (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	CPF VARCHAR(45) NOT NULL
);

/*FUNCIONARIOS*/
CREATE TABLE funcionarios (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	CPF VARCHAR(45) NOT NULL
);

/*CARGOS*/
CREATE TABLE cargos (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	nome VARCHAR(45) NOT NULL,
	salario DECIMAL(5,2) NOT NULL
);

/*ATENDIMENTOS*/
CREATE TABLE atendimentos (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	num_paginas INT NOT NULL,
	valor DECIMAL(5,2) NOT NULL,
	data DATETIME NOT NULL,
	id_impressora INT NOT NULL,
	id_cliente INT NOT NULL,
	id_funcionario INT NOT NULL,
	
	CONSTRAINT fk_id_impressora FOREIGN KEY (id_impressora) REFERENCES impressoras(id),
	CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id),
	CONSTRAINT fk_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id)
);

/*FUNCIONARIO_CARGO*/
CREATE TABLE funcionario_cargo (
	id_funcionario INT PRIMARY KEY NOT NULL,
	id_cargo INT NOT NULL,
	
	CONSTRAINT pk_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id),
	CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo) REFERENCES cargos(id)
);