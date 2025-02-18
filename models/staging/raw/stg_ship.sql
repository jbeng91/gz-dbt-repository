with 

source as (

    select * from {{ source('raw', 'ship') }}

),

stg_ship as (

    select
        orders_id,
        shipping_fee,
        logcost,
        cast(ship_cost as FLOAT64) as ship_cost

    from source

)

select * from stg_ship
