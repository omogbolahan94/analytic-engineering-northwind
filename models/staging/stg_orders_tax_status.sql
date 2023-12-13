WITH source AS (
    SELECT * FROM {{source('northwind', 'orders_tax_status')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source