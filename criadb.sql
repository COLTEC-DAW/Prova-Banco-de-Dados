-- CRIA AS TABELAS

CREATE TABLE impressoras
			(id int,
             nome varchar(40),
             marca varchar(20));

CREATE TABLE cargos(
            id INT,
            nome VARCHAR( 20 ),
            salario DECIMAL);

create table clientes(
    		id int,
    		nome varchar(40),
    		cpf varchar(11));

create table funcionarios(
    			id int,
    			nome varchar(40),
    			cpf varchar(11));

create table atendimentos(
    		horaEdia datetime,
    		id_impressore int,
    		id_cliente int,
    		id_funcionario int,
    		numpaginas int,
    		valor decimal);

-- MODIFICA AS TABELAS PARA INCLUIR KEYS E RELAÇÕES

alter table impressoras
	add constraint pk_impressoras primary key (id);

alter table cargos
	add constraint pk_cargos primary key (id);

alter table clientes
	add constraint pk_clientes primary key (id);

alter table funcionarios
	add constraint pk_funcionarios primary key (id),
    add id_cargo int,
    add constraint fk_funcionarios foreign key (id_cargo) references cargos(id);

alter table atendimentos
    add constraint pk_atendimentos primary key (horaEdia),
    add constraint fk_idImpressora_atendimento foreign key (id_impressore) references impressoras(id),
    add constraint fk_idCliente_atendimento foreign key (id_cliente) references clientes(id),
    add constraint fk_idFuncionario_atendimento foreign key (id_funcionario) references funcionarios(id);