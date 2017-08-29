use `daw-aluno08-2017`;

# se já existirem essas tabelas
# DROP TABLE `clientes`, `impressoras`, `cargos`, `funcionarios`;

create table impressoras (
	id int auto_increment not null primary key,
	nome varchar(100) not null,
	marca varchar(100) not null 
);

create table clientes (
	id int auto_increment not null primary key,
	nome varchar(100) not null,
	cpf varchar(11) not null
);

create table funcionarios (
	id int auto_increment not null primary key,
	nome varchar(100) not null,
	cpf varchar(11) not null
);

create table cargos (
	id int auto_increment not null primary key,
	funcionario_id int not null,
	nome varchar(100) not null,
	salario decimal(10,2) not null,
	
	foreign key (funcionario_id) references funcionarios(id)
);

create table atendimentos (
	id int auto_increment not null primary key,
	impressora_id int not null,
	cliente_id int not null,
	funcionario_id int not null,
	num_paginas int not null,
	valor decimal(10,2) not null,
	quando timestamp,
	
	foreign key (impressora_id) references impressoras(id),
	foreign key (cliente_id) references clientes(id),
	foreign key (funcionario_id) references funcionarios(id)
);