{% macro normalize_column_names(source_name, table_name) -%}
{% set column_names =  dbt_utils.star(from=source(source_name, table_name)) %}
{% set column_names =  column_names.lower()|replace("\n  ", "\n") %}
{% set column_array = column_names.split(',') %}
{% set normalized_column_array = [] %}

{% for column in column_array %}
    {% set normalized_column_array = normalized_column_array.append(column + ' as ' + column|replace(" ", "_")|replace("\n", "")|replace("`", "")) %}
{% endfor %}
{% set normalized_column_names= normalized_column_array|join(',') %}
{{normalized_column_names}}
{%- endmacro %}
