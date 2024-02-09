## localizando registros anteriores(LAG) e posteriores(LEAD)
SELECT 
    estacao_inicio AS estacao
    ,CAST(data_inicio AS DATE) AS dataIncio
    ,LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) AS duracaoAnterior
	,duracao_segundos as DuracaoAtual
    ,LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) AS duracaoPosterior
FROM
    cap06.TB_BIKES 
WHERE data_inicio < '2012-08-01' AND numero_estacao_inicio = 31000;

## calcula o tempo de aluguel de cada registro usando o LAG ou LEAD
SELECT 
    estacao_fim AS estacao,
    CAST(data_inicio AS DATE) AS dataInicio,
    duracao_segundos AS duracao,
    LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) as duracaoSeguinte,
    CASE 
        WHEN LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) IS NOT NULL 
             AND LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) < duracao_segundos 
        THEN duracao_segundos - LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) 
        ELSE LEAD(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio AS DATE)) - duracao_segundos 
    END AS diferencaTempo
FROM
    cap06.TB_BIKES WHERE numero_estacao_inicio = 31000 AND data_inicio < '2012-08-01';
