SELECT * 
FROM {{ dbt_utils.union_relations(
    relations=[
        ref('stg_adwords_google'),
        ref('stg_bing_microsoft'),
        ref('stg_criteo_ads'),
        ref('stg_facebook_ads')
    ])
}}
