WITH SRC AS (
    SELECT * FROM {{ source('pos', 'truck') }}  -- Llamas a los datos desde la tabla truck
),
TRANSFORMED AS (
    SELECT
        TRUCK_ID,
        MENU_TYPE_ID,
        PRIMARY_CITY,
        REGION,
        ISO_REGION,
        COUNTRY,
        ISO_COUNTRY_CODE,
        FRANCHISE_FLAG,
        YEAR,
        MAKE,
        MODEL,
        EV_FLAG,
        FRANCHISE_ID,
        TRUCK_OPENING_DATE  -- Mantienes la columna DATE sin cambios
    FROM SRC
)

SELECT * FROM TRANSFORMED
