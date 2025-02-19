
with

orders as (
    select * from {{ ref('int_orders_margin') }}
),

shipping as (
    select * from {{ ref('stg_ship') }}
),

operational as (
    select * from {{ ref('int_orders_operational') }}
)

select 
    cast(orders.date_date as DATE) as date_date,
    count(distinct orders.orders_id) as nb_transactions,
    round(sum(orders.revenue), 2) as revenue,
    round(sum(orders.revenue) / count(distinct orders.orders_id), 2) as average_basket,
    round(sum(orders.margin), 2) as margin,
    round(sum(operational.operational_margin), 2) as operational_margin,
    round(sum(orders.purchase_cost), 2) as total_purchase_cost,
    round(sum(shipping.shipping_fee), 2) as total_shipping_fees,
    round(sum(shipping.logcost), 2) as total_log_costs,
    sum(orders.quantity) as total_quantity_sold
from orders
left join operational on orders.orders_id = operational.orders_id
left join shipping on orders.orders_id = shipping.orders_id
group by date_date
order by date_date