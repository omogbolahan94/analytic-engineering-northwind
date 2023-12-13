WITH source AS (
    SELECT * FROM {{source('northwind', 'employees')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source