/*WITH src AS (
    SELECT * FROM {{ ref('stg_menu') }}  -- Llamas a los datos desde la tabla menu en la capa staging (stg)
)

SELECT
    MENU_ITEM_ID AS PRODUCT_ID,  -- Renombramos MENU_ITEM_ID a PRODUCT_ID
    MENU_ITEM_NAME AS PRODUCT_NAME,  -- Renombramos MENU_ITEM_NAME a PRODUCT_NAME
    ITEM_CATEGORY AS PRODUCT_CATEGORY,
    ITEM_SUBCATEGORY AS PRODUCT_SUBCATEGORY
FROM src
