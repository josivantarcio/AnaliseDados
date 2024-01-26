CREATE TABLE cap03.TB_DADOS2 AS
SELECT
	CASE
		WHEN classe = 'no-recurrence-events' THEN 0		
        WHEN classe = 'recurrence-events' THEN 1
	END as classe,
    idade,
    menopausa,
    
	CASE
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' OR  tamanho_tumor =  '10-14' THEN 'muito pequeno'
        WHEN tamanho_tumor = '15-19' OR tamanho_tumor = '20-24' THEN 'pequeno'
        WHEN tamanho_tumor = '25-29' OR tamanho_tumor = '30-34' THEN 'medio'
        WHEN tamanho_tumor = '35-39' OR tamanho_tumor = '40-44' THEN 'grande'
        WHEN tamanho_tumor = '45-49' THEN 'muito grande'
        ELSE 'tratamento urgente'
	END as tamanho_tumor,
    inv_nodes,
	
    CASE 
		WHEN node_caps = 'no' THEN 0
        WHEN node_caps = 'yes' THEN 1
        ELSE 2 
	END as node_caps,
    deg_malig,

	CASE
		WHEN seio = 'left' THEN 'E'
        WHEN seio = 'right' THEN 'D'
	END  as seio,

	CASE
		WHEN quadrante = 'left_low' THEN 1 
        WHEN quadrante = 'right_up' THEN 2
        WHEN quadrante = 'left_up' THEN 3
        WHEN quadrante = 'right_low' THEN 4
        WHEN quadrante = 'central' THEN 5
        ELSE 0 
	END as quadrante,
    
    CASE
		WHEN irradiando = 'no' THEN 0
        WHEN irradiando = 'yes' THEN 1
	END as irradiando
FROM cap03.TB_DADOS;