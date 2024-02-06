SELECT 
    *
FROM
    cap06.TB_VENDAS;
SELECT 
    SUM(valor_venda)
FROM
    cap06.TB_VENDAS;

SELECT 
    ano_fiscal Fiscal, SUM(valor_venda) Vendas
FROM
    cap06.TB_VENDAS
GROUP BY Fiscal;

SELECT 
    SUM(valor_venda) Vendas, nome_funcionario Funcionario
FROM
    cap06.TB_VENDAS
GROUP BY Funcionario;

SELECT 
    nome_funcionario Funcionario,
    ano_fiscal Ano,
    SUM(valor_venda) Vendas
FROM
    cap06.TB_VENDAS
GROUP BY Funcionario , Ano;

SELECT 
    nome_funcionario Funcionario,
    ano_fiscal Ano,
    valor_venda Vendas,
    SUM(valor_venda) over (partition by ano_fiscal) Vendas_Func
FROM
    cap06.TB_VENDAS
    order by Ano;