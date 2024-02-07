select * from cap06.TB_BIKES;
## Duracao total do aluguel de bikes (por hora)
select sum(duracao_segundos /60 /60) as duracaoHora from cap06.TB_BIKES;

## Duracao total do aluguel de bikes (horas, ao longo do tempo (soma acumulada)
select substring( data_inicio, 1, 16) as dataInicio, duracao_segundos as duracaoSegundos,
	round(sum(duracao_segundos /60 /60) over(order by data_inicio),2) as duracaoHoras_Acumulando 
from cap06.TB_BIKES;