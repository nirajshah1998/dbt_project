{{ config(
    materialized='table'
) }}

SELECT
    cop.PIZZA_NAME AS PIZZA_NAME,
    ras.PIZZA_ID AS PIZZA_ID,
    ras.CATEGORY AS CATEGORY,
    ras.REVIEWS,
    ras.STARS
FROM {{ ref('stg_reviews_and_stars') }} AS ras
JOIN {{ ref('stg_price_and_size') }} AS pas
    ON ras.PIZZA_ID = pas.PIZZA_TYPE_ID
JOIN {{ ref('cur_categories_of_pizzas_and_their_id') }} AS cop
    ON pas.PIZZA_ID = cop.PIZZA_ID
ORDER BY ras.STARS DESC