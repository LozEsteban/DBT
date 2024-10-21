-- ORDER HEADER
WITH stg_order_header AS (
    SELECT * FROM {{ ref('stg_order_header') }}
),
deduped AS (
    SELECT * 
    FROM stg_order_header
    QUALIFY ROW_NUMBER() OVER (PARTITION BY ORDER_ID ORDER BY ORDER_TS) = 1
)
SELECT * FROM deduped;
