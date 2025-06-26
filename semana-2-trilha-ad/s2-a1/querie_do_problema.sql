-- A equipe de marketing quer saber quais são os clientes mais valiosos para fazer uma campanha VIP
-- querem saber:
    -- ranking de clientes que mais gastaram
    -- valor que gastou
    -- tamanho do maior pedido que o cliente já fez

-- CTE 1 - calcular o total gasto por cada cliente

with total_por_cliente as (
    select cliente_id,
    sum(valor) as total
    from pedidos
    group by cliente_id
),

-- CTE 2: rank de clientes com base no total gasto por eles
rank_por_total as (
    select cliente_id,
    total,
    rank() over(
        order by total desc
    ) as posicao
    from total_por_cliente
),

-- CTE 3: encontrar a maior compra individual por cliente

maior_compra as (
    select cliente_id,
    max(valor) as maior_valor
    from pedidos
    group by cliente_id
)

-- Consulta final
select clientes.nome,
total_por_cliente.total,
ranking_por_total.posição,
maior_compra.maior_valor
from ranking_por_total
join clientes on clientes.id = ranking_por_total.cliente_id
left join maior_compra on clientes.id = maior_compra.id_cliente

