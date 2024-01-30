## faturamento total por ano
SELECT ano, produto, SUM(faturamento) faturamento
FROM cap05.TB_VENDAS
GROUP BY ano, produto WITH ROLLUP
ORDER BY GROUPING(produto) DESC;

## preenchendo campos null apos o processamento
SELECT 
	IF (GROUPING(ano), 'total de todos os anos', ano) ano, 
	IF (GROUPING(pais), 'total de todos os paises',pais) pais,
    IF (GROUPING(produto), 'total de todos os produtos', produto) produto , 
    SUM(faturamento) fatura
FROM cap05.TB_VENDAS
GROUP BY ano,  pais, produto WITH ROLLUP;