select * from 
{{ source('sources', 'fact_sales') }}
