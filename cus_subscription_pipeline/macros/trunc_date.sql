{% macro trunc_date(date, format = 'day') %}

(trunc({{ date }}, '{{ format }}'))

{% endmacro %}
