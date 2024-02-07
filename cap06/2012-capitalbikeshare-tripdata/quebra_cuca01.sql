SELECT 
    *
FROM
    lab06.TB_BIKE;

SELECT 
    SUM(Duration / 60 / 60) Duracao_Horas
FROM
    lab06.TB_BIKE;
    
SELECT Duration,
	round(avg(duration) over (order by start_date),2) Bike,
    Bike_number
from lab06.TB_BIKE;

SELECT 
    Duration Duracao_segundos,
    SUM(Duration / 60 /60) OVER(PARTITION BY Start_station_number ORDER BY start_date) AS Duracao_horas,
    Start_station AS Estacao,
    start_date AS DataInicio
FROM
    lab06.TB_BIKE
    WHERE Start_date < '2012-01-08';