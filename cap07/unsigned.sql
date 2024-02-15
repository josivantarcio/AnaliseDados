## quais os continentes com maior numero de mortes?
SELECT 
    continent Continentes,
    MAX(CAST(total_deaths AS UNSIGNED)) NumeroMortes
FROM
    cap07.covid_mortes
WHERE
    continent IS NOT NULL
GROUP BY Continentes
ORDER BY NumeroMortes DESC;

## Qual o numero de mortes por dia?
SELECT 
    date AS Data,
    SUM(new_cases) AS NovosCasos,
    SUM(CAST(new_deaths AS UNSIGNED)) AS NovasMortes,
    coalesce((SUM(CAST(new_deaths AS UNSIGNED)) / SUM(new_cases)) * 100,'NA') AS Percent
FROM
    cap07.covid_mortes
WHERE
    continent IS NOT NULL
GROUP BY Data
ORDER BY 1 , 2;