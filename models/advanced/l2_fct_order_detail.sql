-- Tabla de hechos que conecta las dimensiones creadas en L2
with
    l1_order_detail as (select * from {{ ref("l1_order_detail") }}),
    l2_customer as (select customer_id from {{ ref("l2_dim_customer") }}),
    l2_truck as (select truck_id from {{ ref("l2_dim_truck") }}),
    l2_product as (select product_id from {{ ref("l2_dim_product") }})

select
    order_detail_id,
    od.order_id as customer_id,  -- FK que conecta con L2_DIM_CUSTOMER
    od.truck_id,  -- FK que conecta con L2_DIM_TRUCK
    od.menu_item_id as product_id,  -- FK que conecta con L2_DIM_PRODUCT
    unit_price,  -- Original de L1
    quantity  -- Original de L1
from l1_order_detail od
left join l2_customer c on od.order_id = c.customer_id
left join l2_truck t on od.truck_id = t.truck_id
left join l2_product p on od.menu_item_id = p.product_id
