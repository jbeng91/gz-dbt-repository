


WITH 
sales AS (
    SELECT * FROM {{ ref('stg_sales') }}
),

product AS (
    SELECT * FROM {{ ref('stg_product') }}
)

SELECT
    sales.orders_id,
    sales.pdt_id,
    sales.quantity,
    sales.revenue,
    product.purchase_price,
    CAST(sales.date_date AS DATE) AS date_date,
    CAST(sales.quantity * product.purchase_price AS FLOAT64) AS purchase_cost,
    CAST(sales.revenue - (sales.quantity * product.purchase_price) AS FLOAT64) AS margin,
    {{ margin_percent('sales.revenue', '(sales.quantity * product.purchase_price)') }} AS margin_percent
FROM sales
LEFT JOIN product
ON sales.pdt_id = product.products_id
