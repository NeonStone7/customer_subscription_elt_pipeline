select pt.*, info.age, info.gender
from {{ ref('customer_product_types') }} pt
left join {{ ref('stg_CUSTOMER_INFO') }} info
    on info.customer_id = pt.customer_id
    