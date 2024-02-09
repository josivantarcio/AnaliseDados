## fazendo agrupamento dos registros
SELECT estacao_inicio as Inicio,
	duracao_segundos as Duracao,
    ROW_NUMBER() OVER (Partition by estacao_inicio Order By duracao_segundos)as Registro,
    NTILE(2) OVER (Partition by estacao_inicio Order by duracao_segundos) as Grupo_dois,
    NTILE(8) OVER (Partition by estacao_inicio Order by duracao_segundos) as Grupo_seis
FROM cap06.TB_BIKES WHERE numero_estacao_inicio = 31000 AND data_inicio < '2012-01-08';



