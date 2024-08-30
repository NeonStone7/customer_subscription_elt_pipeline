select *
FROM
{{ source('raw_CUSTOMER_CASES', 'CUSTOMER_CASES') }}