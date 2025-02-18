 with

 source as (

     select * from {{ source('raw', 'sales') }}

 ),

 stg_sales as (

     select
         date_date,
         orders_id,
         pdt_id,
         revenue,
         quantity

     from source

 )

 select * from stg_sales