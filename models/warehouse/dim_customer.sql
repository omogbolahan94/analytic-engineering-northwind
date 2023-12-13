-- We will be use jinja ref function instead of source to reference
-- the staging layer since the staging layer from created from 
-- our DBT project. 

-- create and load a customer_dim table in data warehouse 
-- from the stg_customer table in staging. We can reference this 
-- stg_customer table since it was first created from our DBT project
WITH source AS (
        SELECT id,
                first_name
                last_name,
                company,
                email_address,
                address,
                city
        FROM {{ ref('stg_customer') }}
),
unique_source AS (
        SELECT *, ROW_NUMBER() OVER(PARTITION BY id) AS row_number
        FROM source
)
SELECT * EXCEPT (row_number), FROM unique_source
WHERE row_number = 1
