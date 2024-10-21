{{ config(
    materialized='incremental',
    unique_key='ORDER_DETAILS_ID',  
    on_schema_change='sync_all_columns'
) }}
-- Assuming ORDER_DETAILS_ID is unique



WITH source_data AS (
    SELECT 

        DISTINCT

        TO_DATE(DATE, 'YYYY-MM-DD') AS DATE,
        TO_TIME(RIGHT(TRIM(TIME), 8)) AS TIME,

        CAST(ORDER_DETAILS_ID AS NUMBER) AS ORDER_DETAILS_ID,
        CAST(ORDER_ID AS NUMBER) AS ORDER_ID,

        UPPER(PIZZA_ID) AS PIZZA_ID,
        UPPER(PIZZA_TYPE_ID) AS PIZZA_TYPE_ID,
        UPPER(SIZE) AS SIZE,
        UPPER(CATEGORY) AS CATEGORY,
        CAST(QUANTITY AS NUMBER) AS QUANTITY,
        CAST(PRICE AS FLOAT) AS PRICE,

        DESSERTS,
        CAST(DESSERTS_QUANTITY AS NUMBER) AS DESSERTS_QUANTITY,
        CAST(DESSERTPRICE AS FLOAT) AS DESSERTPRICE,

        SIDE_ORDER,
        CAST(SIDE_ORDERS_QUANTITY AS NUMBER) AS SIDE_ORDERS_QUANTITY,
        CAST(SIDE_ORDER_PRICE AS FLOAT) AS SIDE_ORDER_PRICE,

        DRINKS,
        CAST(DRINKS_QUANTITY AS NUMBER) AS DRINKS_QUANTITY,
        CAST(DRINKS_PRICE AS FLOAT) AS DRINKS_PRICE
    FROM 
        {{ source('dominos_pizza', 'side_orders') }}

    {% if is_incremental() %}
        -- Load only new records or updates based on date and time

        WHERE TO_TIMESTAMP(DATE || ' ' || TIME, 'YYYY-MM-DD HH24:MI:SS') > 
            (
                SELECT MAX(TO_TIMESTAMP(DATE || ' ' || TIME, 'YYYY-MM-DD HH24:MI:SS'))
                FROM {{ this }}
            )

    {% endif %}
)

SELECT * FROM source_data