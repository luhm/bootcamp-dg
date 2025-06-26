--queries seguindo o schema que a prof passou na aula

-- Quais clientes fizeram pedidos acima da média geral.
-- com subquerie

select *
from pedidos
where valor > (select avg(valor) from pedidos)

-- outra forma de fazer, ainda com subquerie

select cliente_id, media
from (
    select cliente_id, avg(valor) as media
    from pedidos
    group by cliente_id
)
where media > 50

-- com subquerie correlacionada

select nome
from clientes
where exists (
    select 1 from pedidos
    where pedidos.cliente_id = clientes.id and pedidos.valor > 1000
)

-- com CTE para ver o valor total gasto por cliente

with total_por_cliente as (
    select cliente_id,
        sum(valor) as total_dos_pedidos
    from pedidos
    group by cliente_id
)
select cliente.nome
    total_dos_pedidos
from total_por_cliente
join cliente on cliente.id = total_dos_pedidos.cliente_id 

-- evolução das compras de cada cliente ao longo do tempo
-- a compra atual foi maior ou menor que antes? qual o ranking de gastos total?

select cliente.nome,
    coalesce(sum(produto.valor),0) as total --para evitar vir algum dado nulo
    rank() over (
        order by coalesce(sum(produto.valor),0) desc --cria um ranking baseado no total gasto
    ) as posicao
from clientes
left join pedidos on clientes.id = pedidos.clientes_id
group by nome

--analisar o comportamento de compra dos clientes ao longo do tempo
--o valor está aumentando ou diminuindo? está oscilando entre compras?

select cliente_id,
    data,
    valor,
    lag(valor) over
        (partition by cliente_id --ele faz a comparação dentro de cada cliente. É o group by dentro da window function
        order by data) as anterior
from pedidos

-- O cliente aumentou ou diminuiu o valor da compra? Qual o intervalo entre as compras e a recorrencia do consumo?
-- ajuda, por exemplo, em bolar planos de ação para fazer a pessoa comprar mais.
select cliente_id,
    data,
    valor,
    lead(valor) over (
        partition by cliente_id
        order by data
    ) as proxima_compra
from pedidos


-- filtrar produtos que foram vendidos mais de uma vez.


