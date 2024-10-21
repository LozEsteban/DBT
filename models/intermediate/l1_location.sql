-- LOCATION
WITH stg_location AS (
    SELECT * FROM {{ ref('stg_location') }}
),
dedupedloc AS (
    SELECT * 
    FROM stg_location
    QUALIFY ROW_NUMBER() OVER (PARTITION BY LOCATION_ID ORDER BY LOCATION_NAME) = 1
)
SELECT * 
FROM dedupedloc
