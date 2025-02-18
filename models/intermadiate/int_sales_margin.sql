with 

sales as (
    select * from {{ ref('stg_sales') }}
),

product as (
    select * from {{ ref('stg_product') }}
)

select
    sales.orders_id,
    sales.pdt_id,
    sales.quantity,
    sales.revenue,
    product.purchase_price,
    cast(sales.date_date as DATE) as date_date,
    cast(sales.quantity * product.purchase_price as FLOAT64) as purchase_cost,
    cast(sales.revenue - (sales.quantity * product.purchase_price) as FLOAT64) as margin
from sales
left join product
on sales.pdt_id = product.products_id