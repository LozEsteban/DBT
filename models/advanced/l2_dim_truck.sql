with l1_truck as (select * from {{ ref("l1_truck") }})
select
    truck_id,
    truck_brand_name,  -- Original de L1
    make as car_brand,  -- Renombramos MAKE a CAR_BRAND
    model,  -- Original de L1
    year  -- Original de L1
from l1_truck
