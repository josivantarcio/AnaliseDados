## qual é o numero de novos vacinados e o total de novos vacinados ao longo do tempo por continente?
## Considera apenas os dados da america do sul
SELECT 
	continent,
    location,
    new_vaccinations as NovosVacinados,
    sum(cast(new_vaccinations as unsigned)) over (partition by continent order by date) total,
    date as Data
FROM
    cap07.covid_vacinacao where continent = 'south america' order by 1, date;


## qual é o numero de novos vacinados e o total de novos vacinados ao longo do tempo por continente?
## Considera apenas os dados da america do sul
## considere a data no formato January/2020

SELECT 
	continent,
    new_vaccinations Vacinados,
    sum(cast(new_vaccinations as unsigned)) OVER (partition by continent order by date_format(date, '%M/%Y')) Total,
    date_format(date, '%M/%Y') as Data
FROM
    cap07.covid_vacinacao WHERE continent = 'south america' order by 1,4;