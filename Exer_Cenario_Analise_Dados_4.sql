# 1- Qual o número de hubs por cidade?
SELECT * FROM gf.hubs order by hub_city;
SELECT hub_city, COUNT(hub_id)
FROM gf.hubs 
GROUP BY (hub_city);


# 2- Qual o número de pedidos (orders) por status?
SELECT * FROM gf.orders;
SELECT COUNT(DISTINCT store_id) as Pedidos, order_status as Status 
FROM gf.orders
GROUP BY status;


# 3- Qual o número de lojas (stores) por cidade dos hubs?
SELECT * FROM gf.stores s, gf.hubs h WHERE s.hub_id = h.hub_id;
SELECT COUNT(DISTINCT s.store_name) as Quant, h.hub_city as Cidade 
FROM gf.stores s, gf.hubs h
WHERE s.hub_id = h.hub_id
GROUP BY h.hub_city
ORDER BY Cidade;


# 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado?
SELECT * FROM gf.payments order by payment_amount;
SELECT MAX(payment_amount) as Maior, MIN(payment_amount) as Menor
FROM gf.payments 
WHERE payment_status = 'PAID';


# 5- Qual tipo de driver (driver_type) fez o maior número de entregas?
SELECT COUNT(driver_id) QUANT, driver_type TIPO FROM gf.drivers
GROUP BY driver_type
ORDER BY quant DESC 
LIMIT 1;


# 6- Qual a distância média das entregas por tipo de driver (driver_modal)?
SELECT ROUND( AVG(de.delivery_distance_meters),2) as Media, d.driver_modal as Modelo 
FROM gf.drivers as d JOIN gf.deliveries as de
ON d.driver_id = de.driver_id
GROUP BY d.driver_modal;


# 7- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?
SELECT ROUND(AVG(o.order_amount),2) as Media, s.store_name as Loja
FROM gf.orders as o JOIN gf.stores as s
ON o.store_id = s.store_id
GROUP BY s.store_name
ORDER BY Media DESC;


# 8- Existem pedidos que não estão associados a lojas? Se caso positivo, quantos?
SELECT COUNT(DISTINCT(o.order_id)) as Pedidos FROM gf.orders as o LEFT JOIN gf.stores as s
ON o.store_id = s.store_id
WHERE s.store_id IS NULL;

# 9- Qual o valor total de pedido (order_amount) no channel 'FOOD PLACE'?
# 10- Quantos pagamentos foram cancelados (chargeback)?
# 11- Qual foi o valor médio dos pagamentos cancelados (chargeback)?
# 12- Qual a média do valor de pagamento por método de pagamento 
# (payment_method) em ordem decrescente?
# 13- Quais métodos de pagamento tiveram valor médio superior a 100?
# 14- Qual a média de valor de pedido (order_amount) por estado do hub (hub_state),
# segmento da loja (store_segment) e tipo de canal (channel_type)?
# 15- Qual estado do hub (hub_state), segmento da loja (store_segment) 
# e tipo de canal (channel_type) teve média de valor de pedido (order_amount) maior que 450?
# 16- Qual o valor total de pedido (order_amount) por estado do hub (hub_state), 
# segmento da loja (store_segment) e tipo de canal (channel_type)? Demonstre os totais
# intermediários e formate o resultado.
# 17- Quando o pedido era do Hub do Rio de Janeiro (hub_state), segmento de loja
# 'FOOD', tipo de canal Marketplace e foi cancelado, qual foi a média de valor do pedido (order_amount)?
# 18- Quando o pedido era do segmento de loja 'GOOD', tipo de canal Marketplace e foi
# cancelado, algum hub_state teve total de valor do pedido superior a 100.000?
# 19- Em que data houve a maior média de valor do pedido (order_amount)? Dica:
# Pesquise e use a função SUBSTRING().
# 20- Em quais datas o valor do pedido foi igual a zero (ou seja, não houve venda)? Dica:
# Use a função SUBSTRING().