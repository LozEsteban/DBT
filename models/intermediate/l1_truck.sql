WITH stg_truck AS (
    SELECT * FROM {{ ref('stg_truck') }}
),
deduped AS (
    SELECT * 
    FROM stg_franchise
    QUALIFY ROW_NUMBER() OVER (PARTITION BY FRANCHISE_ID ORDER BY OWNER_CITY) = 1
)

SELECT * FROM deduped