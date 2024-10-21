-- TRUCK
with
    stg_truck as (select * from {{ ref("stg_truck") }}),
    deduped as (
        select *
        from stg_truck
        qualify
            row_number() over (partition by truck_id order by truck_opening_date) = 1
    )
select *
from deduped
