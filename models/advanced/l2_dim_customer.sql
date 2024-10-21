-- L2_DIM_CUSTOMER.sql
WITH L1_franchise AS (
    SELECT * FROM {{ ref('l1_franchise') }}
)
SELECT
    FRANCHISE_ID AS CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME,
    COUNTRY AS CUSTOMER_COUNTRY,
    CITY AS CUSTOMER_CITY,
    'Unknown' AS GENDER,  -- Suponiendo que no tienes datos de género
    EMAIL
FROM L1_franchise;
