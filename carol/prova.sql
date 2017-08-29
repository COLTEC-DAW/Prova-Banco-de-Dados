 /*CRIAÇÃO DA TABELA IMPRESSORAS*/

CREATE TABLE Impressoras
(Nome VARCHAR(60) NOT NULL,
 Marca VARCHAR(60) NOT NULL,
 ID INT AUTO_INCREMENT NOT NULL,
 CONSTRAINT pk_impressora PRIMARY KEY (ID));

 /*CRIAÇÃO DA TABELA FUNCIONÁRIOS*/

CREATE TABLE Funcionarios
(Nome VARCHAR(60) NOT NULL,
 CPF DECIMAL (11,0) NOT NULL,
 ID INT AUTO_INCREMENT NOT NULL,
 CONSTRAINT pk_funcionarios PRIMARY KEY (ID));

 /*CRIAÇÃO DA TABELA CARGOS*/

 CREATE TABLE Cargos
(Nome VARCHAR(60) NOT NULL,
 Salario DOUBLE NOT NULL,
 ID INT AUTO_INCREMENT NOT NULL,
 CONSTRAINT pk_cargos PRIMARY KEY (ID));

 /*CRIAÇÃO DA TABELA CLIENTES*/

 CREATE TABLE Clientes
(Nome VARCHAR(60) NOT NULL,
 CPF DECIMAL (11,0) NOT NULL,
 ID INT AUTO_INCREMENT NOT NULL,
 CONSTRAINT pk_clientes PRIMARY KEY (ID));

 /*CRIAÇÃO DA TABELA ATENDIMENTOS*/

 CREATE TABLE Atendimentos
(impressoraID INT NOT NULL,
 clienteID INT NOT NULL,
 funcionarioID INT NOT NULL,
 numPaginas INT NOT NULL,
 valor DECIMAL(10,2) NOT NULL,
 data DATETIME NOT NULL,
 ID INT AUTO_INCREMENT NOT NULL,
 CONSTRAINT pk_atendimentos PRIMARY KEY (ID));




 /*PERMITINDO QUE UM FUNCIONÁRIO POSSUA UM ÚNICO CARGO */
 ALTER TABLE Funcionarios
 ADD cargoID INT NOT NULL;

 ALTER TABLE Funcionarios
 ADD CONSTRAINT fk_cargo_funcionario FOREIGN KEY (cargoID)
    REFERENCES Cargos(ID);

/*PERMITINDO QUE UM CARGO TENHA MÚLTIPLOS FUNCIONÁRIOS*/
CREATE TABLE Cargo_Funcionario
(cargoID INT NOT NULL,
 funcionarioID INT NOT NULL);

 ALTER TABLE Cargo_Funcionario
 ADD CONSTRAINT fk_cargo_cargo FOREIGN KEY (cargoID)
    REFERENCES Cargos(ID);

 ALTER TABLE Cargo_Funcionario
 ADD CONSTRAINT fk_funcionario_funcionario FOREIGN KEY (funcionarioID)
    REFERENCES Funcionarios(ID);

/*PERMITINDO QUE UM FUNCIONÁRIO FAÇA N ATENDIMENTOS*/
CREATE TABLE Funcionario_Atendimento
(funcionarioID INT NOT NULL,
 atendimentoID INT NOT NULL);

 ALTER TABLE Funcionario_Atendimento
 ADD CONSTRAINT fk_funcionario_funcionario2 FOREIGN KEY (funcionarioID)
    REFERENCES Funcionarios(ID);

 ALTER TABLE Funcionario_Atendimento
 ADD CONSTRAINT fk_atendimento_atendimento FOREIGN KEY (atendimentoID)
    REFERENCES Atendimentos(ID);

 /*PERMITINDO QUE UM ATENDIMENTO POSSUA UM ÚNICO CLIENTE */
 ALTER TABLE Atendimentos
 ADD CONSTRAINT fk_atendimento_cliente FOREIGN KEY (clienteID)
    REFERENCES Clientes(ID);

 /*PERMITINDO QUE UM ATENDIMENTO POSSUA UMA ÚNICA IMPRESSORA */
 ALTER TABLE Atendimentos
 ADD CONSTRAINT fk_atendimento_impressora FOREIGN KEY (impressoraID)
    REFERENCES Impressoras(ID);

 /*PERMITINDO QUE UM ATENDIMENTO POSSUA UM ÚNICO FUNCIONÁRIO */
 ALTER TABLE Atendimentos
 ADD CONSTRAINT fk_atendimento_funcionario FOREIGN KEY (funcionarioID)
    REFERENCES Funcionarios(ID);

/*PERMITINDO QUE UMA IMPRESSORA FAÇA N ATENDIMENTOS*/
CREATE TABLE Impressora_Atendimento
(atendimentoID INT NOT NULL,
 impressoraID INT NOT NULL);

 ALTER TABLE Impressora_Atendimento
 ADD CONSTRAINT fk_impressora_impressora2 FOREIGN KEY (impressoraID)
    REFERENCES Impressoras(ID);

 ALTER TABLE Impressora_Atendimento
 ADD CONSTRAINT fk_atendimento_atendimento2 FOREIGN KEY (atendimentoID)
    REFERENCES Atendimentos(ID);

/*PERMITINDO QUE UM FUNCIONÁRIO FAÇA N ATENDIMENTOS*/
CREATE TABLE Funcionario_Atendimento
(atendimentoID INT NOT NULL,
 funcionarioID INT NOT NULL);

 ALTER TABLE Funcionario_Atendimento
 ADD CONSTRAINT fk_impressora_impressora3 FOREIGN KEY (impressoraID)
    REFERENCES Impressoras(ID);

 ALTER TABLE Funcionario_Atendimento
 ADD CONSTRAINT fk_funcionario_funcionario3 FOREIGN KEY (funcionarioID)
    REFERENCES Funcionarios(ID);

/*PERMITINDO QUE UM CLIENTE FAÇA N ATENDIMENTOS*/
CREATE TABLE Cliente_Atendimento
(atendimentoID INT NOT NULL,
 clienteID INT NOT NULL);

 ALTER TABLE Cliente_Atendimento
 ADD CONSTRAINT fk_atendimento_atendimento4 FOREIGN KEY (atendimentoID)
    REFERENCES Impressoras(ID);

 ALTER TABLE Cliente_Atendimento
 ADD CONSTRAINT fk_cliente_cliente4 FOREIGN KEY (clienteID)
    REFERENCES Clientes(ID);



/* FAZENDO AS CONSULTAS */
1- SELECT `Nome`, `Marca` FROM `Impressoras`;
2- SELECT Funcionarios.Nome, Cargos.Nome, Cargos.Salario FROM `Funcionarios`, Cargos WHERE Funcionarios.cargoID = Cargos.ID
3- SELECT Atendimentos.numPaginas, Atendimentos.valor, Atendimentos.data, Clientes.nome, Clientes.CPF, Funcionarios.Nome, Funcionarios.CPF, Impressoras.Nome, Impressoras.Marca FROM `Atendimentos`, Clientes, Funcionarios, Impressoras WHERE Atendimentos.impressoraID = Impressoras.ID AND Atendimentos.clienteID = Clientes.ID AND Atendimentos.funcionarioID = Funcionarios.ID
4- SELECT Atendimentos.numPaginas, Atendimentos.valor, Atendimentos.data, Clientes.nome, Clientes.CPF, Funcionarios.Nome, Funcionarios.CPF, Impressoras.Nome, Impressoras.Marca FROM `Atendimentos`, Clientes, Funcionarios, Impressoras WHERE Atendimentos.impressoraID = Impressoras.ID AND Atendimentos.clienteID = Clientes.ID AND Atendimentos.funcionarioID = Funcionarios.ID AND Impressoras.Nome LIKE '%HP%';
5- SELECT Clientes.nome FROM `Atendimentos`, Clientes WHERE  Atendimentos.clienteID = Clientes.ID AND Atendimentos.data < '2017-07-31 00:00:00'