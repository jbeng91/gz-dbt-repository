



{% macro margin_percent(revenue, purchase_cost, decimal_places=2) %}
    ROUND(SAFE_DIVIDE(({{ revenue }} - {{ purchase_cost }}), {{ revenue }}), {{ decimal_places }})
{% endmacro %}

# to test it in a model use this exemple : 

#SELECT 
#   date_date,
#   revenue,
#   purchase_cost,
#   {{ margin_percent('revenue', 'purchase_cost') }} AS margin_pct_default,  -- Default 2 decimal places
#   {{ margin_percent('revenue', 'purchase_cost', 4) }} AS margin_pct_4_decimals  -- Custom decimal places
#FROM {{ ref('finance_campaigns_day') }}