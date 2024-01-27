SELECT COUNT(*) as quant_cliente, cidade_cliente 
FROM cap05.TB_CLIENTES 
GROUP BY cidade_cliente 
ORDER BY quant_cliente DESC;

SELECT * FROM cap05.TB_PEDIDOS;
SELECT AVG(valor_pedido) as media FROM cap05.TB_PEDIDOS;

## media dos valores dos pedidos por cidade
SELECT ROUND( AVG(p.valor_pedido), 2) media_pedido, c.cidade_cliente cidade
FROM cap05.TB_PEDIDOS p , cap05.TB_CLIENTES c
WHERE p.id_cliente = c.id_cliente
GROUP BY c.cidade_cliente
ORDER BY media_pedido DESC;

# Insere um novo registro na tabela de clientes
INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (11, "Michael Jordan", "Rua 21", "Palmas", "TO");

SELECT 
	CASE
		WHEN ROUND(AVG(p.valor_pedido)) IS NULL THEN 0 ELSE ROUND(AVG(p.valor_pedido)) END media, 
        c.cidade_cliente cidade 
FROM cap05.TB_PEDIDOS p RIGHT JOIN cap05.TB_CLIENTES c
ON p.id_cliente = c.id_cliente
GROUP BY c.cidade_cliente
ORDER BY media DESC;

