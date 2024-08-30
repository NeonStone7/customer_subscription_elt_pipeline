-- What is the churn rate for each subscription type (annual vs. digital), and what trends can be observed over time?

select name, avg(cancelled) as cancellation_rate 
from {{ ref('customer_product_types') }}
group by name



