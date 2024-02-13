SELECT 
    *
FROM
    cap06.TB_BIKES;
SELECT 
    data_inicio
    ,DATE(data_inicio)
    ,TIMESTAMP(data_inicio)
    ,YEAR(data_inicio)
    ,MONTH(data_inicio)
    ,DAY(data_inicio)
FROM
    cap06.TB_BIKES 
WHERE numero_estacao_inicio = 31000;

SELECT 
    data_inicio,
    DATE_ADD(data_inicio, INTERVAL 10 DAY) AS novoMes
FROM
    cap06.TB_BIKES;
    
SELECT 
    data_inicio, DATE_FORMAT(data_inicio, '%d/%m/%Y')
FROM
    cap06.TB_BIKES
WHERE
    numero_estacao_inicio = 31000;
    
SELECT 
    data_inicio
FROM
    cap06.TB_BIKES
WHERE
    numero_estacao_inicio = 31000
        AND DATE_SUB('2012-03-31', INTERVAL 10 DAY) <= data_inicio;