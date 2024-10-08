/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE
0 - NÃO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE( 
	IDCLIENTE  INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR (30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE, 
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	ESTADO VARCHAR(2) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT,
	FOREIGN KEY (ID_CLIENTE)
	REFERENCES CLIENTE(IDCLIENTE)
);

/* 
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA 
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE REGISTROS
*/

/* EM RELACIONAMENTO 1X1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

DROP TABLE CLIENTE;

SELECT * FROM CLIENTE;

INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@IG.COM','47563020845');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOS@IG.COM','47563032325');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@IG.COM','4756332032325');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','F',NULL,'475653450845');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','4756232320845');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','CELIA@IG.COM','43363020845');

SELECT * FROM ENDERECO;
DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL,'MG','B.HORIZONTE','RUA ANTONIO SA','CENTRO',1);
INSERT INTO ENDERECO VALUES(NULL,'SP','MORRO.AGUDO','RUA EQUADOR','JARDIM SANTA RITA',3);
INSERT INTO ENDERECO VALUES(NULL,'SP','ORLANDIA','RUA TRÊS','CENTRO',5);
INSERT INTO ENDERECO VALUES(NULL,'SP','MORRO.AGUDO','RUA EQUADOR 45','CENTRO',6);
INSERT INTO ENDERECO VALUES(NULL,'SP','MORRO.AGUDO','RUA ADOLPHO PONTONICO 23','CENTRO',7);
INSERT INTO ENDERECO VALUES(NULL,'BH','PERNAMBUCO','RUA DAS VELHAS 32','CENTRINHO',16);

DESC TELEFONE;

INSERT INTO TELEFONE VALUES(NULL,'CEL','982337226',6);
INSERT INTO TELEFONE VALUES(NULL,'RES','245154124',6);
INSERT INTO TELEFONE VALUES(NULL,'CEL','124536454',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','654568425',3);
INSERT INTO TELEFONE VALUES(NULL,'RES','564821456',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','874154844',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','454567415',3);
INSERT INTO TELEFONE VALUES(NULL,'COM','457845411',6);
INSERT INTO TELEFONE VALUES(NULL,'RES','564215366',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','982515546',3);

/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO --> É TUDO QUE VOCÊ QUER VER NA TELA */

SELECT NOW() AS DATA_ATUAL;

/* SELECAO -> É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
A CLAUSULA DE SELECAO É O WHERE*/

SELECT NOME, SEXO, EMAIL /*PROJECAO*/
FROM CLIENTE /*ORIGEM*/
WHERE SEXO = 'F'; /*SELECAO*/

SELECT NUMERO /*PROJECAO*/
FROM TELEFONE /*ORIGEM*/
WHERE TIPO = 'CEL'; /*SELECAO*/