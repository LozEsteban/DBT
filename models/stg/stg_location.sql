WITH SRC AS (
    SELECT * FROM {{ source('pos', 'location') }}  -- Llamas a los datos desde la tabla location
),
TRANSFORMED AS (
    SELECT
        LOCATION_ID,
        PLACEKEY,
        LOCATION AS LOCATION_NAME,  -- Renombrando la columna LOCATION a LOCATION_NAME
        CITY AS CITY_NAME,  -- Renombrando la columna CITY
        REGION,
        ISO_COUNTRY_CODE AS COUNTRY_CODE,
        COUNTRY AS COUNTRY_NAME  -- Renombrando la columna COUNTRY a COUNTRY_NAME
    FROM SRC
)

SELECT * FROM TRANSFORMED
