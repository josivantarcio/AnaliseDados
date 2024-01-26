SELECT * FROM cap03.TB_DADOS2;
CREATE TABLE cap03.TB_DADOS3 as
SELECT
	classe,
    idade,

	CASE 
		WHEN menopausa = 'premono' THEN 1
        WHEN menopausa = 'ge40' THEN 2
        WHEN menorpausa = 'lt40' THEN 3
	END as menopausa,
    
    tamanho_tumor,
    inv_nodes,
    node_caps,
    deg_malig,
    seio,
    quadrante,
    irradiando
FROM cap03.TB_DADOS2;

## 2- [Desafio] Crie uma nova coluna chamada posicao_tumor concatenando as colunas inv_nodes e quadrante.
CREATE TABLE cap03.TB_DADOS4 as
SELECT 
	classe,
    idade,
    menopausa,
    tamanho_tumor, 
    node_caps,
    deg_malig,
    CONCAT( inv_nodes, '-' , quadrante) as posicao_tumor,
    seio,
    irradiando
FROM cap03.TB_DADOS2;

## 3- [Desafio] Aplique One-Hot-Encoding à coluna deg_malig.
CREATE TABLE cap03.TB_DADOS5 as
SELECT 
	classe,
    idade,
    menopausa,
    tamanho_tumor,
    inv_nodes
    node_caps,
    
	CASE 
		WHEN deg_malig = 3 THEN 1 ELSE 0 
	END as deg_malig_3,
    
    CASE 
		WHEN deg_malig = 2 THEN 1 ELSE 0
	END as deg_malig_2,
    
    CASE 
		WHEN deg_malig = 1 THEN 1 ELSE 0
	END as deg_malig_1,
    
    seio,
    quadrante,
    irradiando
FROM cap03.TB_DADOS2;

## 4- Crie um novo dataset com todas as variáveis após as transformações anteriores.
CREATE TABLE cap03.TB_DADOS4_full AS
SELECT 
	classe, 
    idade, 
	CASE
		WHEN menopausa = 'premeno' THEN 1
        WHEN menopausa = 'ge40' THEN 2
        WHEN menopausa = 'lt40' THEN 3
	END as menoPausa,
    tamanho_tumor,
    inv_nodes,
    node_caps,
    deg_malig,
    seio,
    quadrante,
    irradiando,
    CONCAT(inv_nodes, ' ', quadrante) as posicaoTumor,
    
    CASE
		WHEN deg_malig = 3 THEN 1 ELSE 0
	END as deg_malig3,
    CASE
		WHEN deg_malig = 2 THEN 1 ELSE 0
	END as deg_malig2,
    CASE
		WHEN deg_malig = 1 THEN 1 ELSE 0
	END as deg_malig1
FROM cap03.TB_DADOS2;
