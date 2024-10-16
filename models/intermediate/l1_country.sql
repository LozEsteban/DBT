WITH stg_country AS (
    SELECT * FROM {{ ref('stg_country') }}
),
deduped AS (
    SELECT * 
    FROM stg_franchise
    QUALIFY ROW_NUMBER() OVER (PARTITION BY FRANCHISE_ID ORDER BY OWNER_CITY) = 1
)

SELECT * FROM deduped