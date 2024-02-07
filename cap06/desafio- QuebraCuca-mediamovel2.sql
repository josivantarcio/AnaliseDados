## retornar:
## estacao de inicio, data de inicio de cada aluguel de bike e duracao de cada aluguel (segundos)
## numero de alugueis de bikes (independente da estacao) ao longo do tempo
## somente os registros quando a data de inicio for inferior a 08/01/2012

### solucao 1
SELECT * FROM cap06.TB_BIKES;
SELECT estacao_inicio AS estacaoInicio
	,data_inicio AS dataInicio
    ,duracao_segundos AS duracaoAluguel
    ,COUNT(*) OVER (ORDER BY data_inicio) AS nr_alugueis
FROM cap06.TB_BIKES WHERE data_inicio < '2012-01-08';

### solucao 2
SELECT estacao_inicio as estacaoInicio
	,data_inicio AS dataInicio
    ,duracao_segundos AS duracaoAluguel
    ,ROW_NUMBER() OVER (ORDER BY data_inicio) AS nr_alugueis
FROM cap06.TB_BIKES WHERE data_inicio < '2012-01-08';

## e se quisermos o mesmo resultado anterior, mas a contagem por estacao?
SELECT 
    estacao_inicio AS estacaoInicio,
    data_inicio AS dataInicio,
    duracao_segundos AS duracaoAluguel,
    ROW_NUMBER() OVER (PARTITION BY estacao_inicio ORDER BY data_inicio) AS nr_estacoes
FROM
    cap06.TB_BIKES WHERE data_inicio < '2012-01-08';