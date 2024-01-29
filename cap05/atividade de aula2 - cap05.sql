## Algum vendedor participou de vendas cujo valor do pedido seja superior a 600 no estado de SP?

SELECT v.nome_vendedor as vendedor, p.valor_pedido as valor, c.estado_cliente as estado
FROM cap05.TB_PEDIDOS p , cap05.TB_VENDEDOR v, cap05.TB_CLIENTES c
WHERE v.id_vendedor = p.id_vendedor AND p.id_cliente = c.id_cliente 
AND p.valor_pedido >= 600 AND c.estado_cliente = 'SP';

## Qual estado teve mais de 5 pedidos?
SELECT c.estado_cliente as estado, COUNT(p.id_pedido) as soma
FROM cap05.TB_PEDIDOS p INNER JOIN cap05.TB_CLIENTES c
ON p.id_cliente = c.id_cliente
GROUP BY c.estado_cliente HAVING soma >= 5;