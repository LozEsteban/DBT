WITH SRC AS (
    SELECT * FROM {{ source('pos', 'order_header') }}  -- Llamas a los datos desde la tabla order_header
),
TRANSFORMED AS (
    SELECT
        ORDER_ID,
        TRUCK_ID,
        LOCATION_ID,  -- FLOAT se mantiene igual
        CUSTOMER_ID,
        DISCOUNT_ID,
        SHIFT_ID,
        SHIFT_START_TIME,
        SHIFT_END_TIME,
        ORDER_CHANNEL,
        ORDER_TS,  -- Mantienes el TIMESTAMP sin cambios
        SERVED_TS,
        ORDER_CURRENCY,
        ORDER_AMOUNT,
        ORDER_TAX_AMOUNT,
        ORDER_DISCOUNT_AMOUNT,
        ORDER_TOTAL
    FROM SRC
)

SELECT * FROM TRANSFORMED
