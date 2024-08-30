select *
FROM
{{ source('raw_customer_products', 'CUSTOMER_PRODUCTS') }}