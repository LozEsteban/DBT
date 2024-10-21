WITH L1_menu AS (
    SELECT * FROM {{ ref('l1_menu') }}
)
SELECT
    MENU_ITEM_ID AS PRODUCT_ID,         -- Renombramos MENU_ITEM_ID a PRODUCT_ID
    MENU_ITEM_NAME AS PRODUCT_NAME,     -- Renombramos MENU_ITEM_NAME a PRODUCT_NAME
    ITEM_CATEGORY AS PRODUCT_CATEGORY,  -- Renombramos ITEM_CATEGORY a PRODUCT_CATEGORY
    ITEM_SUBCATEGORY AS PRODUCT_SUBCATEGORY -- Renombramos ITEM_SUBCATEGORY a PRODUCT_SUBCATEGORY
FROM L1_menu;
