with
    stg_franchise as (select * from {{ ref("stg_franchise") }}),
    deduped as (
        select *
        from stg_franchise
        qualify row_number() over (partition by franchise_id order by owner_city) = 1
    )

select *
from deduped
