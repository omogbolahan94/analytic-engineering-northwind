WITH source AS (
    SELECT * FROM {{source('northwind', 'inventory_transactions')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source