select distinct 
customer_id, name, cancel_date_time, SIGNUP_DATE_TIME,price, billing_cycle,
case when cancel_date_time = 'NA' then 0 else 1 end as cancelled,
{{ convert_str_to_timestamp('cancel_date_time') }} as new_cancel_date_time,
{{ convert_str_to_timestamp('SIGNUP_DATE_TIME') }} new_SIGNUP_DATE_TIME

from {{ ref('stg_CUSTOMER_PRODUCTS') }} cus
left join {{ ref('product_info') }} prod 
on cus.PRODUCT = prod.product_id
