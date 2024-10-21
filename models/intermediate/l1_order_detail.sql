-- ORDER HEADER
with
    stg_order_header as (select * from {{ ref("stg_order_header") }}),
    deduped as (
        select *
        from stg_order_header
        qualify row_number() over (partition by order_id order by order_ts) = 1
    )
select *
from deduped
