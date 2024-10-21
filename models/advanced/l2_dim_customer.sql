/*WITH src AS (
    SELECT * FROM {{ ref('l1_customer') }}  -- Refiere al modelo de la capa L1
)

SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME,  -- Calcula el nombre completo
    COUNTRY,
    CITY,
    GENDER,
    EMAIL
FROM src
