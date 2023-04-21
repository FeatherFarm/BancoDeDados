CREATE DATABASE featherFarm;
USE featherFarm;

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY auto_increment,
    nomeEmpresa VARCHAR(100) NOT NULL,
    cnpj CHAR(14) NOT NULL,
    cep CHAR(8) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero VARCHAR(5) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    email VARCHAR(100) NOT NULL,
    email2 VARCHAR(100),
    senha VARCHAR(50) NOT NULL,
    telefone1 VARCHAR(15) NOT NULL,
    telefone2 VARCHAR(15),
    site VARCHAR(100) NOT NULL
);

CREATE TABLE galpao(
	idGalpao INT PRIMARY KEY auto_increment,
    localizacao VARCHAR(100),
    area DOUBLE(10,2),
    qtdSensores INT,
    fkEmpresa INT, FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE sensor (
  id_sensor INT PRIMARY KEY auto_increment,
  modelo VARCHAR(50),
  fabricante VARCHAR(50),
  data_instalacao DATE,
  localizacao VARCHAR(100),
  estado VARCHAR(10), CONSTRAINT chkEstado CHECK (estado in('off', 'ligado', 'manutenção')),
  fkGalpao INT, FOREIGN KEY (fkGalpao) REFERENCES galpao(idGalpao)
);


CREATE TABLE dados_sensor (
  data_hora DATETIME PRIMARY KEY,
  temperatura DECIMAL(4,2),
  umidade DECIMAL(4,2), 
  fkSensor INT,FOREIGN KEY (fkSensor) REFERENCES sensor(id_sensor)
);


