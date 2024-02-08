##estacao, data de inicio, duracao (segundos) numero de alugueis ao longo do tempo

SELECT * FROM cap06.TB_BIKES;
SELECT estacao_inicio AS estacao,
	data_inicio AS dataInicio,
    duracao_segundos AS duracao,
    ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero 
 FROM cap06.TB_BIKES
 WHERE data_inicio < '2012-01-08';
 
 ## casting
 # classificacao 1
 SELECT estacao_inicio AS estacao,
	CAST(data_inicio AS DATE) AS dataInicio,
    duracao_segundos AS duracao,
    ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as DATE)) AS numero
 FROM cap06.TB_BIKES WHERE data_inicio < '2012-01-08' AND numero_estacao_inicio = 31000;
 
 # classificacao 2
 SELECT estacao_inicio as estacao,
	CAST(data_inicio as DATE) as dataInicio,
    duracao_segundos as duracao,
    DENSE_RANK() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) AS numero
 FROM cap06.TB_BIKES WHERe data_inicio < '2012-01-08' AND numero_estacao_inicio = 31000;
 
 # classificacao 3
 SELECT estacao_inicio as estacao
	,CAST(data_inicio as DATE) as dataInicio
    ,duracao_segundos as duracao
    ,RANK() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as DATE)) AS numero
 FROM cap06.TB_BIKES WHERE data_inicio < '2012-01-08' AND numero_estacao_inicio = 31000;