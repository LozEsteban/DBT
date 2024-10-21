with l1_menu as (select * from {{ ref("l1_menu") }})
select
    menu_item_id as product_id,  -- Renombramos MENU_ITEM_ID a PRODUCT_ID
    menu_item_name as product_name,  -- Renombramos MENU_ITEM_NAME a PRODUCT_NAME
    item_category as product_category,  -- Renombramos ITEM_CATEGORY a PRODUCT_CATEGORY
    item_subcategory as product_subcategory  -- Renombramos ITEM_SUBCATEGORY a PRODUCT_SUBCATEGORY
from l1_menu
