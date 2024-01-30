SELECT * FROM gf.hubs;

UPDATE gf.hubs
SET hub_city = REPLACE(hub_city, 'S?O PAULO', 'SAO PAULO')
WHERE hub_city LIKE '%S?O PAULO%';

SET SQL_SAFE_UPDATES = 0;

UPDATE gf.hubs 
SET hub_city = REPLACE(hub_city, 'S?O PAULO', 'SAO PAULO') 
WHERE hub_city 
LIKE '%S?O PAULO%';

SET SQL_SAFE_UPDATES = 1;
