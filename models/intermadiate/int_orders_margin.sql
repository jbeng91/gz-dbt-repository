with 

sales_margin as (
    select * from {{ ref('int_sales_margin') }}
)

select 
    sales_margin.orders_id,
    max(sales_margin.date_date) as date_date,
    sum(sales_margin.revenue) as revenue,
    sum(sales_margin.quantity) as quantity,
    sum(sales_margin.purchase_cost) as purchase_cost,
    sum(sales_margin.margin) as margin
from sales_margin
group by sales_margin.orders_id