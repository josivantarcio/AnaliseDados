# Supondo que a comissão de cada vendedor seja de 10%, 
# quanto cada vendedor ganhou de comissão nas vendas no estado do Ceará?
# Retorne 0 se não houve ganho de comissão

SELECT 
	CASE 
		WHEN c.estado_cliente IS NULL THEN 'Vendedor fora da area' ELSE c.estado_cliente END as ESTADO,
	CASE 
		WHEN c.estado_cliente IS NOT NULL THEN ROUND( SUM( (p.valor_pedido * 0.10)) ,2) ELSE 0 END as TOTAL, 
        v.nome_vendedor as NOME
FROM cap05.TB_PEDIDOS as p
JOIN cap05.TB_CLIENTES as c RIGHT JOIN cap05.TB_VENDEDOR as v 
ON p.id_cliente = c.id_cliente AND c.estado_cliente = 'CE' AND p.id_vendedor = v.id_vendedor
GROUP BY c.estado_cliente, v.nome_vendedor
ORDER BY c.estado_cliente DESC
;