SELECT * FROM cap07.covid_mortes;
SELECT * FROM cap07.covid_vacinacao;
set sql_safe_updates = 1;    
UPDATE cap07.covid_vacinacao SET date  = STR_TO_DATE(date, '%d/%m/%y');