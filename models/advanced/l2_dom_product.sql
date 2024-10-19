WITH src AS (
    SELECT * FROM {{ ref('l1_product') }}  -- Refiere al modelo de la capa L1
)

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_CATEGORY,
    PRODUCT_SUBCATEGORY
FROM src
