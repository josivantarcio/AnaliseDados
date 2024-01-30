CREATE TABLE deliveries (
	delivery_id INT,
    delivery_order_id INT,
    driver_id INT,
    delivery_distance_meters INT,
    delivery_status VARCHAR(200)
);

CREATE TABLE hubs(
	hub_id INT,
    hub_name VARCHAR(200),
    hub_city VARCHAR(200),
    hub_state VARCHAR(200),
    hub_latitude FLOAT,
    hub_longitude FLOAT
);

CREATE TABLE orders(
	order_id INT,
    store_id INT,
    channel_id INT,
    payment_order_id INT,
    delivery_order_id INT,
    order_status VARCHAR(200),
    order_amount FLOAT,
    order_delivery_fee INT,
    order_delivery_cost VARCHAR(200),
    order_created_hour VARCHAR(200),
	order_created_minute VARCHAR(200),
	order_created_day VARCHAR(200),
	order_created_month VARCHAR(200),
	order_created_year VARCHAR(200),
	order_moment_created VARCHAR(200),
	order_moment_accepted VARCHAR(200),
	order_moment_ready VARCHAR(200),
	order_moment_collected VARCHAR(200),
	order_moment_in_expedition VARCHAR(200),
	order_moment_delivering VARCHAR(200),
	order_moment_delivered VARCHAR(200),
	order_moment_finished VARCHAR(200),
	order_metric_collected_time VARCHAR(200),
	order_metric_paused_time VARCHAR(200),
	order_metric_production_time VARCHAR(200),
	order_metric_walking_time VARCHAR(200),
	order_metric_expediton_speed_time VARCHAR(200),
	order_metric_transit_time VARCHAR(200),
	order_metric_cycle_time VARCHAR(200)
);

CREATE TABLE payments(
	payment_id INT,
    payment_order_id INT,
    payment_amount FLOAT,
    payment_fee VARCHAR(200),
    payment_method VARCHAR(200),
    payment_status VARCHAR(200)
    );
    
CREATE TABLE stores(
	store_id INT,
    hub_id INT,
    store_name VARCHAR(200),
    store_segment VARCHAR(200),
    store_plan_price VARCHAR(200),
    store_latitude VARCHAR(200),
    store_longitude VARCHAR(200)
);