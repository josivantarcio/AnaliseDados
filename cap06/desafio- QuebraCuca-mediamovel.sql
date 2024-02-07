## retornar:
## estacao de inicio, data de inicio e duracao de cada aluguel de bike (segundos)
## duracao total de aluguel das bikes ao longo do tempo por estacao de inicio
## duracao media de aluguel de bikes ao longo do tempo por estacao de inicio
## numeros de alugueis de bikes por estacao ao longo do tempo
## somente os registros quando a data de inicio for inferior a 08/01/2012

SELECT * FROM cap06.TB_BIKES;
SELECT 
    estacao_inicio AS estacaoInicio,
    SUBSTRING(data_inicio, 1,10) AS dataInicio,
    duracao_segundos AS duracaoSegundo,
    SUM(duracao_segundos /60 /60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS duracaoTotal,
    AVG(duracao_segundos /60 /60) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS duracaoMedia,
    COUNT(*) OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS numeroAlugueis
FROM
    cap06.TB_BIKES WHERE data_inicio < '2012-01-08';