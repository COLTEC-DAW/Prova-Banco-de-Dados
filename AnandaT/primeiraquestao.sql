/*Criando Tabelas e relacionamento*/
CREATE TABLE clientes (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (60) NOT NULL,
CPF VARCHAR (60) NOT NULL,
PRIMARY KEY (id) );

CREATE TABLE impressoras (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (60) NOT NULL,
marca VARCHAR (60) NOT NULL,
PRIMARY KEY (id) );

CREATE TABLE funcionarios (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (60) NOT NULL,
CPF VARCHAR (60) NOT NULL,
id_cargo INT NOT NULL, 
PRIMARY KEY (id),
CONSTRAINT fk_id_cargo FOREIGN KEY (id_cargo) REFERENCES cargos(id) );

CREATE TABLE cargos(
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR (60) NOT NULL,
salario DECIMAL (5,2) NOT NULL,
PRIMARY KEY (id) ); 
 
 CREATE TABLE atendimento (
id_cliente INT NOT NULL,
id_funcionario INT NOT NULL,
id_impressora INT NOT NULL,
num_paginas INT (10) NOT NULL,
valor VARCHAR (60) NOT NULL,
data  VARCHAR (10) NOT NULL, 
PRIMARY KEY (id_cliente, id_funcionario, id_impressora, data),
CONSTRAINT fk_id_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id),
CONSTRAINT fk_id_funcionario FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id), 
CONSTRAINT fk_id_impressora FOREIGN KEY (id_impressora) REFERENCES impressoras(id));

