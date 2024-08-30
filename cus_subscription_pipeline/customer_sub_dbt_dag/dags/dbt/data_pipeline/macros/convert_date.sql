{% macro convert_str_to_timestamp(date, format = 'DD/MM/YYYY HH24:MI') %}

(TO_TIMESTAMP(CASE WHEN {{ date }} = 'NA' THEN null ELSE {{ date }} END, '{{ format }}'))

{% endmacro %}
