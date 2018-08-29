Create database if not exists germano_prova;
use germano_prova;

create table if not exists motorista(
	cpf int not null primary key auto_increment,
	nome varchar(45) not null,
	endereco varchar(80) not null
)ENGINE=INNODB;

create table if not exists cliente(
	cpf int not null primary key auto_increment,
	nome varchar(45) not null,
	endereco varchar(80) not null
)ENGINE=INNODB;

create table if not exists estabelecimento(
	cnpj int not null primary key auto_increment,
	nome varchar(45) not null,
	endereco varchar(80) not null
)ENGINE=INNODB;

create table if not exists item(
	codigo int not null primary key auto_increment,
	nome varchar(45) not null,
	valor decimal(18,2) not null,
    cnpj_estabelecimento int not null,
    
    FOREIGN KEY (cnpj_estabelecimento) REFERENCES estabelecimento(cnpj)
)ENGINE=INNODB;

create table if not exists pedido(
	codigo int not null primary key auto_increment,
	hora datetime not null,
	cpf_cliente int not null, 
    cpf_motorista int not null,
    
    FOREIGN KEY (cpf_cliente) REFERENCES cliente(cpf),
    foreign key (cpf_motorista) references motorista(cpf)
)ENGINE=INNODB;

create table if not exists pedido_item(
	codigo int not null primary key auto_increment,
	codigo_item int not null,
    codigo_pedido int not null,
    
    FOREIGN KEY (codigo_item) REFERENCES item(codigo),
    FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo)
)ENGINE=INNODB;