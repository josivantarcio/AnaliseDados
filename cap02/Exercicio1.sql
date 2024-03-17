## 1- Quais embarcações possuem pontuação de risco igual a 310?
SELECT 
    nome_navio, pontuacao_risco
FROM
    cap02.TB_NAVIOS
WHERE pontuacao_risco = 310;

## 2- Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?
SELECT 
    nome_navio, classificacao_risco, indice_conformidade
FROM
    cap02.TB_NAVIOS
WHERE
    classificacao_risco = 'A'
        AND indice_conformidade >= 95
ORDER BY indice_conformidade DESC;

## 3- Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?
SELECT 
    nome_navio, classificacao_risco, indice_conformidade
FROM
    cap02.TB_NAVIOS
WHERE
    classificacao_risco = 'c'
        OR classificacao_risco = 'd'
        AND indice_conformidade <= 95
ORDER BY indice_conformidade DESC;

SELECT * FROM cap02.TB_NAVIOS WHERE classificacao_risco IN ('c','d') AND indice_conformidade <= 95;

## 4- Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?
SELECT 
    nome_navio, classificacao_risco, pontuacao_risco
FROM
    cap02.TB_NAVIOS
WHERE
    classificacao_risco = 'a'
        OR pontuacao_risco = 0
ORDER BY pontuacao_risco DESC;

## 5- [DESAFIO] Quais embarcações foram inspecionadas em Dezembro de 2016?
SELECT 
    nome_navio,
    mes_ano,
    temporada
FROM
    cap02.TB_NAVIOS
WHERE temporada LIKE "%Dezembro 2016";