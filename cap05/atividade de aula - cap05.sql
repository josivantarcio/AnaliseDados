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

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (12, "Bill Gates", "Rua 14", "Santos", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (13, "Jeff Bezos", "Rua 29", "Osasco", "SP");

# Insere mais 3 pedidos
INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1016, 11, 5, now(), 27, 234.09);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1017, 12, 4, now(), 22, 678.30);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1018, 13, 4, now(), 22, 978.30);


SELECT SUM(p.valor_pedido) as soma,
	c.cidade_cliente as cidade,
    c.estado_cliente as estado
FROM cap05.TB_PEDIDOS p 
INNER JOIN cap05.TB_CLIENTES c 
ON p.id_cliente = c.id_cliente
GROUP BY c.cidade_cliente, c.estado_cliente;

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (14, "Melinda Gates", "Rua 14", "Barueri", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (15, "Barack Obama", "Rua 29", "Barueri", "SP");


SELECT 
	CASE
		WHEN FLOOR( SUM( p.valor_pedido)) IS NULL THEN 0 ELSE  FLOOR( SUM( p.valor_pedido))
	END as soma,
	c.nome_cliente as nome,
    c.cidade_cliente as cidade,
	c.estado_cliente as estado
FROM cap05.TB_PEDIDOS as p 
RIGHT JOIN cap05.TB_CLIENTES as c 
ON p.id_cliente = c.id_cliente
GROUP BY c.estado_cliente, c.nome_cliente, c.cidade_cliente;