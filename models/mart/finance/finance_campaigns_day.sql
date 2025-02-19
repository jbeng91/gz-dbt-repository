WITH combined_data AS (
    SELECT 
        f.date_date,
        ROUND((f.operational_margin - IFNULL(c.ads_cost, 0)),1) AS ads_margin,
        ROUND(f.average_basket,1) AS average_basket,
        ROUND(f.operational_margin,1) AS operational_margin,
        IFNULL(c.ads_cost, 0) AS ads_cost,
        IFNULL(c.ads_impression, 0) AS ads_impression,
        IFNULL(c.ads_clicks, 0) AS ads_clicks,
        f.total_quantity_sold AS quantity,
        ROUND(f.revenue,1) AS revenue,
        ROUND(f.total_purchase_cost,1) AS purchase_cost,
        ROUND(f.margin,1) AS margin,
        ROUND(f.total_shipping_fees,1) AS shipping_fee,
        ROUND(f.total_log_costs,1) AS logcost,
        ROUND((f.total_shipping_fees + f.total_log_costs),1) AS ship_cost
    FROM {{ ref('finance_days') }} f
    LEFT JOIN {{ ref('int_campaigns_day') }} c
    ON f.date_date = c.date_date
)

SELECT * 
FROM combined_data
ORDER BY date_date DESC
