# jinja_macros
List of jinja macros I made to use in dbt projects with databricks.

normalize_column_names: utilizes dbt_utils.star to get column names from source, then values are normalized with lowercase and underscores instead of spaces so they can be created in databricks
