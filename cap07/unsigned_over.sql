## qual o numero de novos vacinados e a media movel de novos vacinados ao longo do tempo por localidade?
## considere os dados apenas da america do sul.alter
SELECT 
	date as Data,
    continent as Continente,
    location as Pais,
    cast(new_vaccinations as unsigned) as NovosVacinados,
    avg(cast(new_vaccinations as unsigned)) over( partition by location order by date) media
FROM
    cap07.covid_vacinacao
where continent IS NOT NULL  and continent = 'South America' order by 3, 2 desc;