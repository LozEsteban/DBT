WITH SRC AS (
    SELECT * FROM {{ source('pos', 'order_detail') }}  -- Llamas a los datos desde la tabla order_detail
),
TRANSFORMED AS (
    SELECT
        ORDER_DETAIL_ID,
        ORDER_ID,
        MENU_ITEM_ID,
        DISCOUNT_ID,
        LINE_NUMBER,
        QUANTITY,
        UNIT_PRICE,
        PRICE,
        ORDER_ITEM_DISCOUNT_AMOUNT  -- Mantienes la columna tal como está
    FROM SRC
)

SELECT * FROM TRANSFORMED
