WITH source AS (
    SELECT * FROM {{source('northwind', 'employee_privileges')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source