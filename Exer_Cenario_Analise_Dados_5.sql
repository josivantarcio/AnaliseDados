## Considerando o dataset usado ao longo deste capítulo, carregue o arquivo “2012Q2-
## capitalbikeshare-tripdata.csv” em uma nova tabela e responda as perguntas abaixo.
# 1- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?
SELECT 
    AVG(duracao) AS tempoMedio, tipo_membro AS tipo
FROM
    cap06.TB_BIKES_Q2
GROUP BY tipo_membro;


# 2- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e
# por estação fim (onde as bikes são entregues após o aluguel)?
SELECT 
    AVG(duracao) Duracao,
    tipo_membro Tipo,
    estacao_final EstacaoFinal
FROM
    cap06.TB_BIKES_Q2
GROUP BY Tipo , EstacaoFinal order by Tipo;

# 3- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e
# por estação fim (onde as bikes são entregues após o aluguel) ao longo do tempo?
SELECT 
	tipo_membro Tipo,
    estacao_final EstacaoFinal,
    AVG(duracao) OVER(PARTITION By tipo_membro and estacao_final ORDER BY CAST(data_final as DATE)) as Media,
    CAST(data_final as DATE) DataFinal
FROM
    cap06.TB_BIKES_Q2;


# 4- Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de
# aluguéis considerando a data de início?
SELECT 
	date_format(data_inicial, '%H') Hora,
    MAX(duracao) OVER (ORDER BY HOUR(data_inicial) desc) as Duracao
FROM
    cap06.TB_BIKES_Q2 where numero_bike = 'W01182' order by data_inicial desc limit 1;


# 5- Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a
# data de início?
SELECT 
    data_inicial as inicial,
    row_number() over (order by data_inicial) quant
FROM
    cap06.TB_BIKES_Q2
WHERE
    numero_bike = 'W01182';


# 6- Retornar:
# Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos
# Número de aluguéis de bikes (independente da estação) ao longo do tempo
# Somente os registros quando a data fim foi no mês de Abril
SELECT 
    estacao_final as estacaoFinal,
    DATE(data_final) as dataFinal,
    duracao as Duracao,
    row_number() over(order by data_final) Numero
FROM
    cap06.TB_BIKES_Q2
WHERE MONTH(data_final) = 4;


# 7- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# Retornar os dados para os aluguéis entre 7 e 11 da manhã
SELECT 
    estacao_final as estacaoFinal
    ,date_format(data_final, '%d/%M/%y %H/%i/%s') as dataFinal
    ,duracao as Duracao
    ,row_number() over(partition by day(data_inicial) order by data_inicial) as Ranking
FROM
    cap06.TB_BIKES_Q2
WHERE HOUR(data_inicial) >= 7 and HOUR(data_inicial) <= 11 order by data_inicial;

# 8- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para
# outro, considerando data de início do aluguel e estação de início?
# A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana
# abreviado e Jan igual mês abreviado). Retornar os dados para os aluguéis entre 01 e 03 da manhã
SELECT 
	duracao - lead(duracao, 1)OVER(partition by estacao_inicial order by data_inicial) as Diferenca,
    date_format(data_inicial, '%a/%b/%d %H:%i:%s' ) as DataInicial
FROM
    cap06.TB_BIKES_Q2
WHERE DAY(data_inicial) >= 1 AND DAY(data_inicial) <= 3;

# 9- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos os registros divididos em 4 grupos ao longo do tempo por partição
# Retornar os dados para os aluguéis entre 8 e 10 da manhã
# Qual critério usado pela função NTILE para dividir os grupos?
SELECT 
    estacao_final AS estacaoFinal,
    DATE_FORMAT(data_final, '%d/%M/%y %H:%i:%s') AS dataFinal,
    duracao AS Duracao,
    NTILE(4) OVER(order by data_final) AS Grupo
FROM
    cap06.TB_BIKES_Q2 
WHERE HOUR(data_inicial) >= 8 AND HOUR(data_inicial) <= 10;


# 10- Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do
# tempo considerando a data fim e estação fim?
# Retorne os dados entre os dias '2012-04-01' e '2012-04-02'
# Dica: Use função window e subquery
select * from (
	select 
		estacao_inicial as estacao,
		sum(duracao) over(partition by estacao_final order by data_final) as total 
	from cap06.TB_BIKES_Q2 
	where date(data_inicial) = '2012-04-01' and  date(data_final) = '2012-04-02') 
where total >= 35;