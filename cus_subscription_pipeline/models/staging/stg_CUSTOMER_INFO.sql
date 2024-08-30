select *
FROM
{{ source('raw_CUSTOMER_INFO', 'CUSTOMER_INFO') }}