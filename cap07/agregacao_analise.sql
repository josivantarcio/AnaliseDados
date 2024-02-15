## qual é a proporcao media entre o total de casos e a populacao de cada localidade?
SELECT 
    location,
    AVG((total_cases / population) * 100) AS percentual
FROM
    cap07.covid_mortes
GROUP BY location
ORDER BY percentual DESC;

## considerando o maior valor de casos, quais os países com maior taxa de infeccao em relacao à populacao?
SELECT 
    location,
    MAX(total_cases) AS totalCasos,
    MAX(total_cases / population) * 100 AS total_Per
FROM
    cap07.covid_mortes
WHERE
    continent IS NOT NULL
GROUP BY location , population
ORDER BY total_Per DESC;
    
## quais os países com maior numero de mortes?
SELECT 
    location AS locais,
    MAX(CAST(total_deaths AS UNSIGNED)) AS maiores
FROM
    cap07.covid_mortes
WHERE
    continent IS NOT NULL
GROUP BY locais
ORDER BY maiores DESC;