-- How does the timing of sign-up and cancellations relate to customer support interactions?
with case_days as (select *,
datediff('day', SIGNUP_DATE_TIME, CASE_DATE_TIME) as case_days_after_signup,
datediff('day', CASE_DATE_TIME, CANCEL_DATE_TIME) as case_days_before_cancellation

from {{ ref('cases_customers') }}
)

select * from case_days
where case_days_after_signup < 30 or case_days_before_cancellation<30