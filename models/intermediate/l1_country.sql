-- COUNTRY
with
    stg_country as (select * from {{ ref("stg_country") }}),
    deduped as (
        select *
        from stg_country
        qualify row_number() over (partition by country_id order by city_id) = 1  -- Ordena por CITY_ID para seleccionar la primera ciudad
    )
select *
from deduped

