WITH SRC AS (
    SELECT * FROM {{ source('pos', 'country') }}  -- Llamas a los datos desde la tabla country
),
TRANSFORMED AS (
    SELECT
        COUNTRY_ID,
        COUNTRY AS COUNTRY_NAME,  -- Renombrando la columna COUNTRY
        ISO_CURRENCY,
        ISO_COUNTRY,
        CITY_ID,
        CITY AS CITY_NAME,  -- Renombrando la columna CITY
        CAST(CITY_POPULATION AS INT) AS CITY_POPULATION  -- Convertir CITY_POPULATION de VARCHAR a INT
    FROM SRC
)

SELECT * FROM TRANSFORMED
