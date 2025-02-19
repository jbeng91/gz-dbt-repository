WITH monthly_data AS (
    SELECT 
        DATE_TRUNC(f.date_date, MONTH) AS datemonth,
        ROUND(SUM(f.ads_margin),1) AS ads_margin,
        ROUND(AVG(f.average_basket),1) AS average_basket, 
        ROUND(SUM(f.operational_margin),1) AS operational_margin,
        ROUND(SUM(IFNULL(f.ads_cost, 0)),1) AS ads_cost,
        ROUND(SUM(IFNULL(f.ads_impression, 0)),1) AS ads_impression,
        ROUND(SUM(IFNULL(f.ads_clicks, 0)),1) AS ads_clicks,
        SUM(f.quantity) AS quantity,
        ROUND(SUM(f.revenue),1) AS revenue,
        ROUND(SUM(f.purchase_cost),1) AS purchase_cost,
        ROUND(SUM(f.margin),1) AS margin,
        ROUND(SUM(f.shipping_fee),1) AS shipping_fee,
        ROUND(SUM(f.logcost),1) AS logcost,
        ROUND(SUM(f.ship_cost),1) AS ship_cost
    FROM {{ ref('finance_campaigns_day') }} f
    GROUP BY datemonth 
)

SELECT * 
FROM monthly_data
ORDER BY datemonth DESC
