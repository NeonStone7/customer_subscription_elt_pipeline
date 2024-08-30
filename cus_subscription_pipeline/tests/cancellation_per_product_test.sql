select * from 
{{ ref('cancellation_per_product') }}
where name not in ('prd_1', 'prd_2')