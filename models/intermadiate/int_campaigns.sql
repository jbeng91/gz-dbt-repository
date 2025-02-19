WITH all_campaigns AS (
    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_adwords_google') }}

    UNION ALL

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_bing_microsoft') }}

    UNION ALL

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_criteo_ads') }}

    UNION ALL

    SELECT
        date_date,
        paid_source,
        campaign_key,
        campaign_name,
        ads_cost,
        impression,
        click
    FROM {{ ref('stg_facebook_ads') }}
)

SELECT * FROM all_campaigns
