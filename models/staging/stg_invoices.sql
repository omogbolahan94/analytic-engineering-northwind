WITH source AS (
    SELECT * FROM {{source('northwind', 'invoices')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source