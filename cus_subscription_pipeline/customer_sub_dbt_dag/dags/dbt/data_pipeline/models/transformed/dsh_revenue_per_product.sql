-- What is the total revenue generated from each subscription type, and how does it compare over different time periods?

with grouped_total_prices as 
(select *,
sum(price) over (partition by CUSTOMER_ID) as total_price 
from {{ ref('customer_product_types') }}
)

select 
trunc(NEW_SIGNUP_DATE_TIME, 'day') as sign_up_date, NAME, sum(total_price) as total_revenue
from grouped_total_prices
group by trunc(NEW_SIGNUP_DATE_TIME, 'day'), NAME
order by trunc(NEW_SIGNUP_DATE_TIME, 'day'), NAME
