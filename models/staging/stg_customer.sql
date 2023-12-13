-- Utilizing jinja template instead of using normal sql syntax directly
-- We will use source function of jinja template to reference the 
-- datalake schema (aeCore dataset) we have in bigquery.
-- This is because schema (aeCore dataset) was not built from DBT
-- This is the reason we must create source.yml in the staging model.
-- This source.yml file will contain the datalake info such as:
-- * Name of the Bigquery datalake schema (aeCore dataset in our case), 
-- * Names of all tables in that dataset scheme
-- * Name of the source file itself
-- Note: we use the term datalake here because we move all our tables
-- exactly as they are to the Bigquery aeCore dataset.This dataset
-- now acts as the source of our data from the cloud

-- using CTE with name source:

WITH source AS (
    SELECT * FROM {{source('northwind', 'customer')}} 
)
SELECT *, current_timestamp() AS ingestion_timestamp 
FROM source -- select all the records from the CTE table and load 
            -- to google bigquery and add a new column to keep track 
            -- of the time data was loaded

/*
    The source DB is 'northwind' and the table is 'customer'.
    Where does the 'northwind' DB came from. It came from a 
    source.yml we created inside the same directory as this SQL
    file. It is in this file we defined northwind DB. 

    Tne result of this query will be stored in the bigquery data
    warehouse with this file name.
*/