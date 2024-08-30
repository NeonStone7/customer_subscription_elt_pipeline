-- What is the average customer lifetime for each subscription type?
with cus_lifetime as 
(select customer_id, NAME, NEW_SIGNUP_DATE_TIME,
case when NEW_CANCEL_DATE_TIME is not null  then datediff('day', NEW_SIGNUP_DATE_TIME, NEW_CANCEL_DATE_TIME)
else datediff('day', NEW_SIGNUP_DATE_TIME, current_date()) end as days_active
from {{ ref('customer_product_types') }}
)

select {{ trunc_date('NEW_SIGNUP_DATE_TIME') }} as NEW_SIGNUP_DATE_TIME, 
NAME, avg(days_active) as avg_lifetime_value
from cus_lifetime
group by {{ trunc_date('NEW_SIGNUP_DATE_TIME') }}, NAME