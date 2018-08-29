create database if not exists MyFood;
use MyFood;

 create table if not exists estabelecimento(
	id int not null primary key auto_increment,
	nome varchar(255) not null,
	endereco varchar(255) not null,
    cnpj varchar(45) not null
);

 create table if not exists item(
	id int not null primary key auto_increment,
    estabelecimento_idEsta int not null,
	nome varchar(255) not null,
	valor varchar(144) not null,
	codigo varchar(45) not null,
    FOREIGN KEY (estabelecimento_idEsta) REFERENCES Estabelecimento(id)
);

 create table if not exists cliente(
	id int not null primary key auto_increment,
	nome varchar(255) not null,
	cpf varchar(45) not null,
	endereço varchar(255) not null,
    telefone varchar(144) not null
);

 create table if not exists pedido(
	id int not null primary key auto_increment,
    Motorista_idMotorista int not null,
    Cliente_idCliente int not null,
	codigo varchar(45) not null,
	hora time not null,
    FOREIGN KEY (Motorista_idMotorista) REFERENCES Motorista(id),
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(id)
);

 create table if not exists motorista(
	id int not null primary key auto_increment,
    Nome varchar(255) not null,
	cpf varchar(45) not null,
    endereco varchar(255) not null
);

 create table if not exists pedido(
	id int not null primary key auto_increment,
	id_livro int not null,
	id_biblioteca int not null,
 	FOREIGN KEY (id_livro) REFERENCES livros(id),
	FOREIGN KEY (id_biblioteca) REFERENCES bibliotecas(id),
    FOREIGN KEY (id_exemplar) REFERENCES exemplares(id)
);
