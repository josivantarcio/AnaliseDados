select ano_fiscal Ano, nome_funcionario Funcionario, valor_venda Vendas,
sum(valor_venda) over(partition by ano_fiscal) VendasAnual,
sum(valor_venda) over() VendasGeral
 from cap06.TB_VENDAS
 order by ano_fiscal;
 
 SELECT 
    ano_fiscal Ano,
    nome_funcionario Nome,
    COUNT(*) num_vendas_ano,
    count(*) over(partition by nome_funcionario) num_geral_vendas 
FROM
    cap06.TB_VENDAS group by ano_fiscal, nome_funcionario order by ano_fiscal;
 
 