-- utilizing jinja template instead of using normal sql syntax directly
-- using CTE with name source:

WITH source AS (
    SELECT * FROM {{source('northwind', 'customer')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source -- select all the records from the CTE table and load 
            -- to google bigquery and add a new column to keep track 
            -- of when the data was loaded

/*
    The source DB is 'northwind' and the table is 'customer'.
    Where does the 'northwind' DB came from. It came from a 
    source.yml we created inside the same directory as this SQL
    file. It is in this file we defined northwind DB. 

    Tne result of this query will be stored in the bigquery data
    warehouse with this file name.
*/