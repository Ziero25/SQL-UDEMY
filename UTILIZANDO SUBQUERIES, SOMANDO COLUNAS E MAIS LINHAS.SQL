/* SUBQYERUES
VENDEDOR QUE VENDEU MENOS EM MARÇO E O SEU NOME 

NOME E O VALOR QUE VENDEU MENOS EM MARCO E O SEU NOME

QUEM VENDEU MAIS QUE O VALOR MEDIO DE FEV
*/

SELECT NOME, MIN(MARCO) AS MIN_MARCO
FROM VENDEDORES;

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO =(SELECT MIN(MARCO) FROM VENDEDORES);

SELECT NOME, MARCO FROM VENDEDORES
WHERE MARCO =(SELECT MAX(MARCO) FROM VENDEDORES);

SELECT NOME, FEVEREIRO FROM VENDEDORES
WHERE FEVEREIRO > (SELECT AVG(FEVEREIRO) FROM VENDEDORES);

/* OPERAÇÕES EM LINHA */

SELECT NOME, JANEIRO, FEVEREIRO, MARCO, 
(JANEIRO+FEVEREIRO+MARCO) AS "TOTAL_VENDAS",
TRUNCATE((JANEIRO+FEVEREIRO+MARCO) /3,2) AS "MEDIA"
FROM VENDEDORES; 

+----------+----------+-----------+----------+--------------+----------+
| NOME     | JANEIRO  | FEVEREIRO | MARCO    | TOTAL_VENDAS | MEDIA    |
+----------+----------+-----------+----------+--------------+----------+
| CARLOS   | 32042.32 |   2024.07 |  2025.63 |     36092.02 | 12030.67 |
| MARIA    |  4344.32 |   3233.07 |  2050.63 |      9628.02 |  3209.33 |
| ANTONIO  | 32042.32 |   5435.07 |  4234.63 |     41712.02 | 13904.00 |
| CLARA    | 67534.32 |   4322.07 |  9686.63 |     81543.02 | 27181.00 |
| ANDERSON |  6535.32 |   2024.07 |  2025.63 |     10585.02 |  3528.33 |
| IVONE    |  6356.32 |   2016.07 | 65963.63 |     74336.02 | 24778.67 |
| JOAO     |  5256.32 |   2000.07 |  2030.63 |      9287.02 |  3095.67 |
| CELIA    |  9865.32 |   2020.07 |  2650.63 |     14536.02 |  4845.34 |
+----------+----------+-----------+----------+--------------+----------+

/* APLICANDO UMA PORCENTAGEM */ 

SELECT NOME, JANEIRO, FEVEREIRO, MARCO, 
(JANEIRO+FEVEREIRO+MARCO) AS "TOTAL_VENDAS",
(JANEIRO+FEVEREIRO+MARCO) * .25 AS "DESCONTO",
TRUNCATE((JANEIRO+FEVEREIRO+MARCO) /3,2) AS "MEDIA"
FROM VENDEDORES; 

+----------+----------+-----------+----------+--------------+----------+----------+
| NOME     | JANEIRO  | FEVEREIRO | MARCO    | TOTAL_VENDAS | DESCONTO | MEDIA    |
+----------+----------+-----------+----------+--------------+----------+----------+
| CARLOS   | 32042.32 |   2024.07 |  2025.63 |     36092.02 |  9023.01 | 12030.67 |
| MARIA    |  4344.32 |   3233.07 |  2050.63 |      9628.02 |  2407.00 |  3209.33 |
| ANTONIO  | 32042.32 |   5435.07 |  4234.63 |     41712.02 | 10428.01 | 13904.00 |
| CLARA    | 67534.32 |   4322.07 |  9686.63 |     81543.02 | 20385.76 | 27181.00 |
| ANDERSON |  6535.32 |   2024.07 |  2025.63 |     10585.02 |  2646.25 |  3528.33 |
| IVONE    |  6356.32 |   2016.07 | 65963.63 |     74336.02 | 18584.01 | 24778.67 |
| JOAO     |  5256.32 |   2000.07 |  2030.63 |      9287.02 |  2321.75 |  3095.67 |
| CELIA    |  9865.32 |   2020.07 |  2650.63 |     14536.02 |  3634.01 |  4845.34 |
+----------+----------+-----------+----------+--------------+----------+----------+

+----------+----------+-----------+----------+--------------+----------+----------+
| NOME     | JANEIRO  | FEVEREIRO | MARCO    | TOTAL_VENDAS | DESCONTO | MEDIA    |
+----------+----------+-----------+----------+--------------+----------+----------+
| CARLOS   | 32042.32 |   2024.07 |  2025.63 |     36092.02 |  9023.01 | 12030.67 |
| MARIA    |  4344.32 |   3233.07 |  2050.63 |      9628.02 |  2407.00 |  3209.33 |
| ANTONIO  | 32042.32 |   5435.07 |  4234.63 |     41712.02 | 10428.01 | 13904.00 |
| CLARA    | 67534.32 |   4322.07 |  9686.63 |     81543.02 | 20385.76 | 27181.00 |
| ANDERSON |  6535.32 |   2024.07 |  2025.63 |     10585.02 |  2646.25 |  3528.33 |
| IVONE    |  6356.32 |   2016.07 | 65963.63 |     74336.02 | 18584.01 | 24778.67 |
| JOAO     |  5256.32 |   2000.07 |  2030.63 |      9287.02 |  2321.75 |  3095.67 |
| CELIA    |  9865.32 |   2020.07 |  2650.63 |     14536.02 |  3634.01 |  4845.34 |
+----------+----------+-----------+----------+--------------+----------+----------+ll