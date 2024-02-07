SELECT * FROM cap06.TB_BIKES;
## Duracao total do aluguel das bikes (hora), ao longo do tempo, por estacao de inicio de aluguel da bike, 
## quando a data de inicio for inferior a 08/01/2012
SELECT duracao_segundos as duracaoSegundos,
	SUBSTRING(data_inicio,1,10) as dataInicial,
    estacao_inicio as estacaoInicial,
    SUM(duracao_segundos /60 /60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) as duracaoTotal
FROM cap06.TB_BIKES WHERE data_inicio < '2012-01-08';