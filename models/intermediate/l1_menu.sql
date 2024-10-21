-- MENU
with
    stg_menu as (select * from {{ ref("stg_menu") }}),
    deduped as (
        select *
        from stg_menu
        qualify row_number() over (partition by menu_id order by menu_item_name) = 1
    )
select *
from deduped
