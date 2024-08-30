-- How do customer demographics (age, location, income level) correlate with the type of subscription they choose?
select name,GENDER,
avg(age) as avg_age,
min(age) as youngest_age,
max(age) as oldest_age,
count(CUSTOMER_ID) / (select count(distinct CUSTOMER_ID) from {{ ref('join_product_demo') }}) as percentage_of_customers

from {{ ref('join_product_demo') }}

group by name,GENDER 