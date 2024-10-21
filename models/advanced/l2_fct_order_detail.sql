/*WITH order_detail AS (
    SELECT * FROM {{ ref('l1_order_detail') }}  -- Refiere al modelo de la capa L1
),
customer AS (
    SELECT * FROM {{ ref('l2_dim_customer') }}  -- Refiere al modelo L2 para la dimensión customer
),
truck AS (
    SELECT * FROM {{ ref('l2_dim_truck') }}  -- Refiere al modelo L2 para la dimensión truck
),
product AS (
    SELECT * FROM {{ ref('l2_dim_product') }}  -- Refiere al modelo L2 para la dimensión product
)

SELECT
    od.ORDER_DETAIL_ID,
    od.CUSTOMER_ID,
    c.FULL_NAME AS CUSTOMER_FULL_NAME,
    t.TRUCK_ID,
    t.TRUCK_BRAND_NAME,
    t.CAR_BRAND,
    t.MODEL,
    t.YEAR,
    p.PRODUCT_ID,
    p.PRODUCT_NAME,
    p.PRODUCT_CATEGORY,
    p.PRODUCT_SUBCATEGORY,
    od.UNIT_PRICE,
    od.QUANTITY,
    od.UNIT_PRICE * od.QUANTITY AS TOTAL_PRICE  -- Calculo el total
FROM
    order_detail od
    LEFT JOIN customer c ON od.CUSTOMER_ID = c.CUSTOMER_ID
    LEFT JOIN truck t ON od.TRUCK_ID = t.TRUCK_ID
    LEFT JOIN product p ON od.PRODUCT_ID = p.PRODUCT_ID
