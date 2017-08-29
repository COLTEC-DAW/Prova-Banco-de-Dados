CREATE TABLE impressoras (
  impressoraId INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  marca VARCHAR(255) NOT NULL
);

CREATE TABLE clientes(
  clienteId INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(255) NOT NULL
);

CREATE TABLE cargos (
  cargoId INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  salario FLOAT(10,2) NOT NULL
);

CREATE TABLE funcionarios(
  funcionarioId INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(255) NOT NULL,
  cargoId INT (10) UNSIGNED,
  FOREIGN KEY (cargoId) REFERENCES cargos(cargoId)
);

CREATE TABLE atendimentos(
  num_paginas int(10) NOT NULL,
  valor FLOAT(10,2) NOT NULL,
  data TIMESTAMP PRIMARY KEY,
  impressoraId INT (10) UNSIGNED,
  FOREIGN KEY (impressoraId) REFERENCES impressoras(impressoraId),
  clienteId INT (10) UNSIGNED,
  FOREIGN KEY (clienteId) REFERENCES clientes(clienteId),
  funcionarioId INT (10) UNSIGNED,
  FOREIGN KEY (funcionarioId) REFERENCES funcionarios(funcionarioId)
);