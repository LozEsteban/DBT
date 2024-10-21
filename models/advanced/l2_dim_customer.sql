-- L2_DIM_CUSTOMER.sql
with l1_franchise as (select * from {{ ref("l1_franchise") }})
select
    franchise_id as customer_id,
    first_name,
    last_name,
    concat(first_name, ' ', last_name) as full_name,
    country as customer_country,
    city as customer_city,
    'Unknown' as gender,
    email
from l1_franchise
