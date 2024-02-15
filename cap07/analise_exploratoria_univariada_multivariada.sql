SELECT 
    date,
    location,
    total_cases,
    new_cases,
    total_deaths,
    population
FROM
    cap07.covid_mortes
ORDER BY 2 , 1;

## qual a media de mortos por país?
## analise univariada
SELECT 
    location AS Localizacao,
    AVG(total_deaths) AS Media
FROM
    cap07.covid_mortes
GROUP BY location
ORDER BY Media DESC;

## analise univariada ou multivaraida?
SELECT 
    location,
    AVG(total_deaths) AS MediaMortos,
    AVG(new_cases) AS NovosCasos
FROM
    cap07.covid_mortes
GROUP BY location
ORDER BY MediaMortos DESC; ### analise univariada!

## qual a proporcao de mortes em relacao ao total de casos no Brasil?
## analise multivariada
SELECT 
    location,
    total_cases AS Casos,
    total_deaths AS Mortes,
    (total_deaths / total_cases) * 100 AS PercentualMortes
FROM
    cap07.covid_mortes
WHERE
    location = 'Brazil'
ORDER BY 2 , 1;