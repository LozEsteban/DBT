WITH L1_truck AS (
    SELECT * FROM {{ ref('l1_truck') }}
)
SELECT
    TRUCK_ID,
    TRUCK_BRAND_NAME,  -- Original de L1
    MAKE AS CAR_BRAND,  -- Renombramos MAKE a CAR_BRAND
    MODEL,              -- Original de L1
    YEAR                -- Original de L1
FROM L1_truck;
