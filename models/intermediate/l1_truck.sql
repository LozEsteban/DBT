-- TRUCK
WITH stg_truck AS (
    SELECT * FROM {{ ref('stg_truck') }}
),
deduped AS (
    SELECT * 
    FROM stg_truck
    QUALIFY ROW_NUMBER() OVER (PARTITION BY TRUCK_ID ORDER BY TRUCK_OPENING_DATE) = 1
)
SELECT * FROM deduped;