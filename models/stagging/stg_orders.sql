WITH source AS (
    SELECT * FROM {{source('northwind', 'orders')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source