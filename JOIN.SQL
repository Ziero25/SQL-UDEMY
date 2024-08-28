/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+--------+---------------+-----------+
| NOME   | EMAIL         | IDCLIENTE |
+--------+---------------+-----------+
| JOAO   | JOAO@IG.COM   |         1 |
| CARLOS | CARLOS@IG.COM |         3 |
| CLARA  | NULL          |         5 |
| JORGE  | JORGE@IG.COM  |         6 |
| CELIA  | CELIA@IG.COM  |         7 |
| ANA    | ANA@IG.COM    |        16 |
+--------+---------------+-----------+

+------------+-------------------+-------------+
| ID_CLIENTE | BAIRRO            | CIDADE      |
+------------+-------------------+-------------+
|          1 | CENTRO            | B.HORIZONTE |
|          3 | JARDIM SANTA RITA | MORRO.AGUDO |
|          5 | CENTRO            | ORLANDIA    |
|          6 | CENTRO            | MORRO.AGUDO |
|          7 | CENTRO            | MORRO.AGUDO |
|         16 | CENTRINHO         | PERNAMBUCO  |
+------------+-------------------+-------------+

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE

+--------+------+-------------------+-------------+
| NOME   | SEXO | BAIRRO            | CIDADE      |
+--------+------+-------------------+-------------+
| JOAO   | M    | CENTRO            | B.HORIZONTE |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO |
| CLARA  | F    | CENTRO            | ORLANDIA    |
| JORGE  | M    | CENTRO            | MORRO.AGUDO |
| CELIA  | F    | CENTRO            | MORRO.AGUDO |
| ANA    | F    | CENTRINHO         | PERNAMBUCO  |
+--------+------+-------------------+-------------+

/* WHERE = SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

+-------+------+-----------+-------------+
| NOME  | SEXO | BAIRRO    | CIDADE      |
+-------+------+-----------+-------------+
| CLARA | F    | CENTRO    | ORLANDIA    |
| CELIA | F    | CENTRO    | MORRO.AGUDO |
| ANA   | F    | CENTRINHO | PERNAMBUCO  |
+-------+------+-----------+-------------+

/* WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F' -> TABELA VERDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+--------+------+-------------------+-------------+
| NOME   | SEXO | BAIRRO            | CIDADE      |
+--------+------+-------------------+-------------+
| JOAO   | M    | CENTRO            | B.HORIZONTE |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO |
| CLARA  | F    | CENTRO            | ORLANDIA    |
| JORGE  | M    | CENTRO            | MORRO.AGUDO |
| CELIA  | F    | CENTRO            | MORRO.AGUDO |
| ANA    | F    | CENTRINHO         | PERNAMBUCO  |
+--------+------+-------------------+-------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /* JUNCAO */
	ON IDCLIENTE = ID_CLIENTE 
WHERE SEXO = 'F'; /* SELECAO */

+-------+------+-----------+-------------+
| NOME  | SEXO | BAIRRO    | CIDADE      |
+-------+------+-----------+-------------+
| CLARA | F    | CENTRO    | ORLANDIA    |
| CELIA | F    | CENTRO    | MORRO.AGUDO |
| ANA   | F    | CENTRINHO | PERNAMBUCO  |
+-------+------+-----------+-------------+

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE 
	INNER JOIN TELEFONE
	ON IDCLIENTE = ID_CLIENTE;

+--------+------+---------------+------+-----------+
| NOME   | SEXO | EMAIL         | TIPO | NUMERO    |
+--------+------+---------------+------+-----------+
| JORGE  | M    | JORGE@IG.COM  | CEL  | 982337226 |
| JORGE  | M    | JORGE@IG.COM  | RES  | 245154124 |
| JOAO   | M    | JOAO@IG.COM   | CEL  | 124536454 |
| JOAO   | M    | JOAO@IG.COM   | RES  | 564821456 |
| CARLOS | M    | CARLOS@IG.COM | CEL  | 874154844 |
| CARLOS | M    | CARLOS@IG.COM | CEL  | 454567415 |
| JORGE  | M    | JORGE@IG.COM  | COM  | 457845411 |
| JOAO   | M    | JOAO@IG.COM   | RES  | 564215366 |
| CARLOS | M    | CARLOS@IG.COM | CEL  | 982515546 |
| CARLOS | M    | CARLOS@IG.COM | COM  | 654568425 |
+--------+------+---------------+------+-----------+

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE 
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE

+--------+------+-------------------+-------------+------+-----------+
| NOME   | SEXO | BAIRRO            | CIDADE      | TIPO | NUMERO    |
+--------+------+-------------------+-------------+------+-----------+
| JORGE  | M    | CENTRO            | MORRO.AGUDO | CEL  | 982337226 |
| JORGE  | M    | CENTRO            | MORRO.AGUDO | RES  | 245154124 |
| JOAO   | M    | CENTRO            | B.HORIZONTE | CEL  | 124536454 |
| JOAO   | M    | CENTRO            | B.HORIZONTE | RES  | 564821456 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | CEL  | 874154844 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | CEL  | 454567415 |
| JORGE  | M    | CENTRO            | MORRO.AGUDO | COM  | 457845411 |
| JOAO   | M    | CENTRO            | B.HORIZONTE | RES  | 564215366 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | CEL  | 982515546 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | COM  | 654568425 |
+--------+------+-------------------+-------------+------+-----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
	ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
	ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+-------------------+-------------+------+-----------+
| NOME   | SEXO | BAIRRO            | CIDADE      | TIPO | NUMERO    |
+--------+------+-------------------+-------------+------+-----------+
| JORGE  | M    | CENTRO            | MORRO.AGUDO | CEL  | 982337226 |
| JORGE  | M    | CENTRO            | MORRO.AGUDO | RES  | 245154124 |
| JOAO   | M    | CENTRO            | B.HORIZONTE | CEL  | 124536454 |
| JOAO   | M    | CENTRO            | B.HORIZONTE | RES  | 564821456 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | CEL  | 874154844 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | CEL  | 454567415 |
| JORGE  | M    | CENTRO            | MORRO.AGUDO | COM  | 457845411 |
| JOAO   | M    | CENTRO            | B.HORIZONTE | RES  | 564215366 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | CEL  | 982515546 |
| CARLOS | M    | JARDIM SANTA RITA | MORRO.AGUDO | COM  | 654568425 |
+--------+------+-------------------+-------------+------+-----------+

/* PONTEIRAMENTO ACIMA É AJUDADO NA PERFORMANCE POIS É CHECADO APENAS A ORIGEM E AS COLUNAS MENCIONADAS ASSIM POUPANDO O TRABALHO */

