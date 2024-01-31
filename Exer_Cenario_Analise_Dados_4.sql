# 1- Qual o número de hubs por cidade?
SELECT * FROM gf.hubs order by hub_city;
SELECT 
    hub_city, COUNT(hub_id)
FROM
    gf.hubs
GROUP BY (hub_city);


# 2- Qual o número de pedidos (orders) por status?
SELECT * FROM gf.orders;
SELECT 
    COUNT(DISTINCT store_id) AS Pedidos, order_status AS Status
FROM
    gf.orders
GROUP BY status;


# 3- Qual o número de lojas (stores) por cidade dos hubs?
SELECT * FROM gf.stores s, gf.hubs h WHERE s.hub_id = h.hub_id;
SELECT 
    COUNT(DISTINCT s.store_name) AS Quant, h.hub_city AS Cidade
FROM
    gf.stores s,
    gf.hubs h
WHERE
    s.hub_id = h.hub_id
GROUP BY h.hub_city
ORDER BY Cidade;


# 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado?
SELECT * FROM gf.payments order by payment_amount;
SELECT 
    MAX(payment_amount) AS Maior, MIN(payment_amount) AS Menor
FROM
    gf.payments
WHERE
    payment_status = 'PAID';


# 5- Qual tipo de driver (driver_type) fez o maior número de entregas?
SELECT 
    COUNT(driver_id) QUANT, driver_type TIPO
FROM
    gf.drivers
GROUP BY driver_type
ORDER BY quant DESC
LIMIT 1;


# 6- Qual a distância média das entregas por tipo de driver (driver_modal)?
SELECT 
    ROUND(AVG(de.delivery_distance_meters), 2) AS Media,
    d.driver_modal AS Modelo
FROM
    gf.drivers AS d
        JOIN
    gf.deliveries AS de ON d.driver_id = de.driver_id
GROUP BY d.driver_modal;


# 7- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?
SELECT 
    ROUND(AVG(o.order_amount), 2) AS Media, s.store_name AS Loja
FROM
    gf.orders AS o
        JOIN
    gf.stores AS s ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY Media DESC;


# 8- Existem pedidos que não estão associados a lojas? Se caso positivo, quantos?
SELECT 
    COUNT(DISTINCT (o.order_id)) AS Pedidos
FROM
    gf.orders AS o
        LEFT JOIN
    gf.stores AS s ON o.store_id = s.store_id
WHERE
    s.store_id IS NULL;

# 9- Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
SELECT 
    ROUND(SUM(o.order_amount), 2) AS TOTAL,
    c.channel_name AS NOME
FROM
    gf.channels c
        JOIN
    gf.orders o ON c.channel_id = o.channel_id
        AND c.channel_name = 'FOOD PLACE';


# 10- Quantos pagamentos foram cancelados (chargeback)?
SELECT 
    COUNT(DISTINCT (p.payment_id)) AS CANCELADOS
FROM
    gf.payments AS p
WHERE
    p.payment_status = 'chargeback';


# 11- Qual foi o valor médio dos pagamentos cancelados (chargeback)?
SELECT 
    ROUND(AVG(DISTINCT (p.payment_amount)), 2) AS Media,
    p.payment_status AS Status
FROM
    gf.payments AS p
WHERE
    p.payment_status = 'chargeback'
GROUP BY p.payment_status;


# 12- Qual a média do valor de pagamento por método de pagamento
SELECT 
    ROUND(AVG(payment_amount), 2) AS Media,
    payment_status AS Metodo
FROM
    gf.payments
GROUP BY payment_status
ORDER BY media DESC;
 
# (payment_method) em ordem decrescente?
SELECT 
    *
FROM
    gf.payments
ORDER BY payment_method DESC;

# 13- Quais métodos de pagamento tiveram valor médio superior a 100?
SELECT 
    ROUND(AVG(p.payment_amount), 2) AS media,
    p.payment_method AS Metodo
FROM
    gf.payments AS p
GROUP BY p.payment_method
HAVING media > 100
ORDER BY media DESC;


# 14- Qual a média de valor de pedido (order_amount) por estado do hub (hub_state),
# segmento da loja (store_segment) e tipo de canal (channel_type)?
SELECT 
    ROUND(AVG(o.order_amount), 2) AS Media,
    h.hub_state AS Estado,
    s.store_segment AS Segmento,
    c.channel_type AS Tipo
FROM
    gf.orders AS o
        JOIN
    gf.stores AS s ON s.store_id = o.store_id
        JOIN
    gf.hubs AS h ON h.hub_id = s.hub_id
        JOIN
    gf.channels AS c ON c.channel_id = o.channel_id
GROUP BY h.hub_state , s.store_segment , c.channel_type
ORDER BY Media DESC;


# 15- Qual estado do hub (hub_state), segmento da loja (store_segment) 
# e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
SELECT 
    h.hub_state AS Estado,
    s.store_segment AS Segmento,
    c.channel_type AS Tipo,
    o.order_amount AS Media
FROM
    gf.orders AS o
        JOIN
    gf.channels AS c ON o.channel_id = c.channel_id
        LEFT JOIN
    gf.stores AS s ON o.store_id = s.store_id
        LEFT JOIN
    gf.hubs AS h ON s.hub_id = h.hub_id
GROUP BY Tipo , Segmento , Estado , Media
HAVING FORMAT(AVG(Media > 450), 2)
ORDER BY Estado DESC;


# 16- Qual o valor total de pedido (order_amount) por estado do hub (hub_state), 
# segmento da loja (store_segment) e tipo de canal (channel_type)? Demonstre os totais
# intermediários e formate o resultado.
SELECT 
    FORMAT(SUM(o.order_amount), 2) total,
    h.hub_state estado,
    s.store_segment segmento,
    c.channel_type tipo
FROM
    gf.orders o,
    gf.hubs h,
    gf.stores s,
    gf.channels c
WHERE
    o.store_id = s.store_id
        AND s.hub_id = h.hub_id
        AND c.channel_id = o.channel_id
GROUP BY estado , segmento , tipo
ORDER BY estado DESC;


# 17- Quando o pedido era do Hub do Rio de Janeiro (hub_state), segmento de loja
# 'FOOD', tipo de canal Marketplace e foi cancelado, qual foi a média de valor do pedido (order_amount)?
SELECT 
    FORMAT(AVG(o.order_amount), 2) AS Media,
    h.hub_city AS cidade,
    s.store_segment AS segmento,
    c.channel_type AS tipo,
    o.order_status AS status
FROM
    gf.hubs h
        JOIN
    gf.orders o
        JOIN
    gf.stores s
        JOIN
    gf.channels c ON s.hub_id = h.hub_id
        AND o.store_id = s.store_id
        AND c.channel_id = o.channel_id
GROUP BY cidade , segmento , tipo , status
HAVING segmento = 'food'
    AND cidade = 'rio de janeiro'
    AND tipo = 'Marketplace'
    AND status LIKE 'cancel%';


# 18- Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi
# cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
SELECT 
    FORMAT(SUM(o.order_amount), 2) AS total,
    h.hub_state AS estado,
    s.store_segment AS segmento,
    c.channel_type AS tipo,
    o.order_status AS status_pedido
FROM
    gf.orders AS o
        JOIN
    gf.stores AS s
        JOIN
    gf.channels AS c
        JOIN
    gf.hubs AS h ON o.store_id = s.store_id
        AND c.channel_id = o.channel_id
        AND s.hub_id = h.hub_id
GROUP BY estado , segmento , tipo , status_pedido
HAVING segmento = 'good'
    AND tipo = 'Marketplace'
    AND status_pedido = 'canceled'
    AND total > 100.000;


# 19- Em que data houve a maior média de valor do pedido (order_amount)? Dica:
# Pesquise e use a função SUBSTRING().
SELECT 
    SUBSTRING(order_moment_created, 1, 10) AS data_venda,
    FORMAT(AVG(order_amount), 2) AS media
FROM
    gf.orders
GROUP BY data_venda
ORDER BY media DESC
LIMIT 1;


# 20- Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)? Dica:
# Use a função SUBSTRING().
SELECT 
    SUBSTRING(order_moment_created, 1, 10) AS data_venda,
    FORMAT(order_amount, 2) AS valor,
    order_status as situacao
FROM
    gf.orders
WHERE
    order_status = 'canceled'
ORDER BY valor DESC;