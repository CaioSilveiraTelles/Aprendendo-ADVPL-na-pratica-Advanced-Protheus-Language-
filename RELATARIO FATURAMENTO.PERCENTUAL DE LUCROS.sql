SELECT TP.SABOR FROM [TABELA DE PRODUTOS] TP -- Pegando sabor , da tabela de produto ,TP=TABELA DE PRODUTO

SELECT NF.DATA FROM [NOTAS FISCAIS] NF --Pegando a data da tabela de notas fiscais, NF=NOTAS FISCAIS

SELECT INF.QUANTIDADE * INF.PRE�O   AS FATURAMENTO FROM [ITENS NOTAS FISCAIS] INF --MULTIPLICANDO QUANTIDE POR PRE�O GERANDO O FATURAMENTO

--iNNER JOIN ENTRE AS TABELAS , MOSTRANDO AS INFOS

SELECT TP.SABOR ,NF.DATA, (INF.QUANTIDADE * INF.PRE�O )  AS FATURAMENTO
FROM  [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO

--YEAR NA DATA, PARA PEGAR SOMENTE O ANO , AGRUPANDO POR SABOR E DATA, SUM NO FATURAMENTO PARA NAO DAR ERRO NO GROUP

SELECT TP.SABOR ,year(NF.DATA) AS  ANO, SUM(INF.QUANTIDADE * INF.PRE�O ) AS FATURAMENTO
FROM  [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
GROUP BY TP.SABOR ,year(NF.DATA)

--ADICIONANDO FILTRO NO ANO 
SELECT TP.SABOR ,year(NF.DATA) AS  ANO, SUM(INF.QUANTIDADE * INF.PRE�O ) AS FATURAMENTO
FROM  [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE year(NF.DATA) ='2016'
GROUP BY TP.SABOR ,year(NF.DATA)

--INNER JOIN ENTRE AS DUAS CONSULTAS ACIMA, TOTAL = FATURAMENTO MULTIPLICADO , PERCENTUAL = O PERCENTUAL DE PARTIPA��O DOS LUCROS
-- CONVERTENDO E FILTRANDO , E CONCATENANDO UM % NO PERCENTUAL 
-- FILTRANDO DO MENO PARA O MAIOR
SELECT AUX1.SABOR, AUX1.ANO, CONVERT(DECIMAL(15,2), AUX1.FATURAMENTO) AS FATURAMENTO, 
CONVERT(VARCHAR, CONVERT(DECIMAL(15,2),(AUX1.FATURAMENTO/AUX2.TOTAL) * 100)) + ' %' 
AS PERCENTUAL FROM
(SELECT TP.SABOR ,year(NF.DATA) AS  ANO, SUM(INF.QUANTIDADE * INF.PRE�O ) AS FATURAMENTO
FROM  [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE year(NF.DATA) ='2016'
GROUP BY TP.SABOR ,year(NF.DATA)) AUX1
INNER JOIN (SELECT year(NF.DATA) AS  ANO, SUM(INF.QUANTIDADE * INF.PRE�O ) AS TOTAL
FROM  [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
WHERE year(NF.DATA) ='2016'
GROUP BY (NF.DATA)) AUX2
ON AUX1.ANO = AUX2.ANO
ORDER BY AUX1.FATURAMENTO DESC

--SUBSTUINDO SABOR POR TAMANHO

SELECT AUX1.TAMANHO, AUX1.ANO, CONVERT(DECIMAL(15,2), AUX1.FATURAMENTO) AS FATURAMENTO, 
CONVERT(VARCHAR, CONVERT(DECIMAL(15,2),(AUX1.FATURAMENTO/AUX2.TOTAL) * 100)) + ' %' 
AS PERCENTUAL FROM
(SELECT TP.TAMANHO, YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS FATURAMENTO
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
--WHERE YEAR(NF.DATA) = 2016
GROUP BY TP.TAMANHO, YEAR(NF.DATA)) AUX1
INNER JOIN (SELECT YEAR(NF.DATA) AS ANO, SUM (INF.QUANTIDADE * INF.PRE�O) AS TOTAL
FROM [ITENS NOTAS FISCAIS] INF INNER JOIN [TABELA DE PRODUTOS] TP
ON TP.[CODIGO DO PRODUTO] = INF.[CODIGO DO PRODUTO]
INNER JOIN [NOTAS FISCAIS] NF 
ON NF.NUMERO = INF.NUMERO
--WHERE YEAR(NF.DATA) = 2016
GROUP BY YEAR(NF.DATA)) AUX2
ON AUX1.ANO = AUX2.ANO
ORDER BY AUX1.FATURAMENTO DESC