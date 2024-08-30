--Are there any patterns in call center activity, such as peak hours or common issues reported?

select 
trunc( {{ convert_str_to_timestamp('DATE_TIME') }} , 'day') as case_date,
CHANNEL, REASON,
count(distinct case_id) as num_cases,
count(distinct CUSTOMER_ID) as num_customers

from {{ ref('stg_CUSTOMER_CASES') }}
group by trunc( {{ convert_str_to_timestamp('DATE_TIME') }} , 'day'), CHANNEL, REASON
order by trunc( {{ convert_str_to_timestamp('DATE_TIME') }} , 'day') 