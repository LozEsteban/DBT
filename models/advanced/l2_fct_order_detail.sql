-- Tabla de hechos que conecta las dimensiones creadas en L2

WITH L1_order_detail AS (
    SELECT * FROM {{ ref('stg_order_detail') }}
),
L2_customer AS (
    SELECT CUSTOMER_ID FROM {{ ref('l2_dim_customer') }}
),
L2_truck AS (
    SELECT TRUCK_ID FROM {{ ref('l2_dim_truck') }}
),
L2_product AS (
    SELECT PRODUCT_ID FROM {{ ref('l2_dim_product') }}
)

SELECT
    ORDER_DETAIL_ID,
    od.ORDER_ID AS CUSTOMER_ID,   -- FK que conecta con L2_DIM_CUSTOMER
    od.TRUCK_ID,                  -- FK que conecta con L2_DIM_TRUCK
    od.MENU_ITEM_ID AS PRODUCT_ID, -- FK que conecta con L2_DIM_PRODUCT
    UNIT_PRICE,                   -- Original de L1
    QUANTITY                      -- Original de L1
FROM L1_order_detail od
LEFT JOIN L2_customer c ON od.ORDER_ID = c.CUSTOMER_ID
LEFT JOIN L2_truck t ON od.TRUCK_ID = t.TRUCK_ID
LEFT JOIN L2_product p ON od.MENU_ITEM_ID = p.PRODUCT_ID;
