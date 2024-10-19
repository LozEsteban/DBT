WITH src AS (
    SELECT * FROM {{ ref('l1_truck') }}  -- Refiere al modelo de la capa L1
)

SELECT
    TRUCK_ID,
    TRUCK_BRAND_NAME,
    CAR_BRAND,
    MODEL,
    YEAR
FROM src
