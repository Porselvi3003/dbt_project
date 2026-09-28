select * from 
 {{ source('sources', 'fact_returns') }}