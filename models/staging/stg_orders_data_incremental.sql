    {{ config(
    materialized='incremental',
    unique_key='ORDER_ID',
    on_schema_change='sync_all_columns') 
}}
-- ORDER_ID is unique for each order
-- Allows schema changes for new columns.



WITH source_data AS (
    -- Pulling all data when running for the first time (full refresh)
    SELECT 
        CAST(ORDER_ID AS NUMBER) AS ORDER_ID,
        TO_DATE(DATE, 'YYYY-MM-DD') AS DATE,
        TO_TIME(TIME) AS TIME
    FROM {{ source('dominos_pizza', 'orders_data') }}

    {% if is_incremental() %}
    -- Only new data is loaded if the model is incremental

        WHERE TO_TIMESTAMP(DATE || ' ' || TIME, 'YYYY-MM-DD HH24:MI:SS') > 
        (
            SELECT MAX(TO_TIMESTAMP(DATE || ' ' || TIME, 'YYYY-MM-DD HH24:MI:SS')) 
            FROM {{ this }}
        )

    {% endif %}
)


SELECT * FROM source_data