with 

orders_margin as (
    select * from {{ ref('int_orders_margin') }}
),

shipping as (
    select * from {{ ref('stg_ship') }}
)

select 
    orders_margin.orders_id,
    orders_margin.date_date,
    cast(
        orders_margin.margin 
        + shipping.shipping_fee 
        - shipping.logcost 
        - shipping.ship_cost 
        as FLOAT64
    ) as operational_margin

from orders_margin
left join shipping
on orders_margin.orders_id = shipping.order_id