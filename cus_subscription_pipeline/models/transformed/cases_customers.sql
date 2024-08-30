-- Join cases and customers

SELECT cases.*,
       prod.PRODUCT, 
       {{ convert_str_to_timestamp('prod.SIGNUP_DATE_TIME') }} AS SIGNUP_DATE_TIME,
       {{ convert_str_to_timestamp('cases.DATE_TIME') }} AS CASE_DATE_TIME,
       {{ convert_str_to_timestamp('prod.CANCEL_DATE_TIME') }} AS CANCEL_DATE_TIME

FROM {{ ref('stg_CUSTOMER_CASES') }} cases
LEFT JOIN {{ ref('stg_CUSTOMER_PRODUCTS') }} prod
ON cases.customer_id = prod.customer_id
