## Qual a media de tempo(horas) de aluguel de bikes da estacao de inicio 31017?
SELECT * FROM cap06.TB_BIKES;
SELECT numero_estacao_inicio as estacaoInicio,
	AVG(duracao_segundos /60 /60) OVER (partition by numero_estacao_inicio order by data_inicio) mediaMovel
FROM cap06.TB_BIKES WHERE numero_estacao_inicio = 31017;

SELECT numero_estacao_inicio as estacaoInicio,
	AVG(duracao_segundos /60 /60) as Media
FROM cap06.TB_BIKES where numero_estacao_inicio = 31017;