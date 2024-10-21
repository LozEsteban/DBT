-- MENU
WITH stg_menu AS (
    SELECT * FROM {{ ref('stg_menu') }}
),
deduped AS (
    SELECT * 
    FROM stg_menu
    QUALIFY ROW_NUMBER() OVER (PARTITION BY MENU_ID ORDER BY MENU_ITEM_NAME) = 1
)
SELECT * FROM deduped;