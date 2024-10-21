-- COUNTRY
WITH stg_country AS (
    SELECT * FROM {{ ref('stg_country') }}
),
deduped AS (
    SELECT * 
    FROM stg_country
    QUALIFY ROW_NUMBER() OVER (PARTITION BY COUNTRY_ID ORDER BY COUNTRY_NAME) = 1
)
SELECT * FROM deduped;
