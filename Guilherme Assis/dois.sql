/* Criando a tabela estabelecimento... */

CREATE TABLE Estabelecimento (
id int NOT NULL,
nome varchar(45) NOT NULL,
endereco varchar(45) NOT NULL,
cnpj int NOT NULL);

/* Criando a tabela Item... */
CREATE TABLE Item (
id int NOT NULL,
nome varchar(45) NOT NULL,
valor decimal(10,2) NOT NULL);

/* Criando a tabela pedido... */
CREATE TABLE Pedido (
id int NOT NULL,
hora datetime NOT NULL);

/* Criando a tabela pedidoitem... */
CREATE TABLE Pedidoitem (
iditem int NOT NULL,
idpedido int NOT NULL );

/* Criando a tabela cliente... */
CREATE TABLE Cliente (
id int NOT NULL,
telefone int NOT NULL,
cpf int NOT NULL,
nome varchar(45) NOT NULL,
endereco varchar(45) NOT NULL);

/* Criando a tabela Motorista... */
CREATE TABLE Motorista (
id int NOT NULL,
nome varchar(45) NOT NULL,
cpf int NOT NULL,
endereco varchar(45) NOT NULL);

/* Alterar as tabelas para adicionar as chaves primarias...*/
alter table Estabelecimento add constraint pk_estabelecimento primary key (id);
alter table Item add constraint pk_estabelecimento primary key (id);
alter table Pedido add constraint pk_estabelecimento primary key (id);
alter table Cliente add constraint pk_estabelecimento primary key (id);
alter table Motorista add constraint pk_estabelecimento primary key (id);
alter table Pedidoitem add constraint pk_iditem primary key (iditem, idpedido);

/* Alterar as tabelas para adicionar as chaves estrangeiras*/
alter table Item
	add id_estabelecimento int NOT NULL,
	add constraint fk_item foreign key (id_estabelecimento) references Estabelecimento(id);

alter table Pedidoitem
	add constraint fk_pedidoitem foreign key (iditem) references Item(id);

alter table Pedidoitem
add constraint fk_pedidoitemp foreign key (idpedido) references Pedido(id);

alter table Pedido
	add id_cliente int NOT NULL,
	add constraint fk_pedidoc foreign key (id_cliente) references Cliente(id);

alter table Pedido
	add id_motorista int NOT NULL,
	add constraint fk_pedidom foreign key (id_motorista) references Motorista(id);


