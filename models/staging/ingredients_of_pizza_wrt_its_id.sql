WITH source_data AS (
    SELECT 
        PIZZA_ID, 
        PIZZA_NAME, 
        CATEGORY, 
        SPLIT(INGREDIENTS, ',') AS ingredient_list  
    FROM distinct_category_and_ingredients  -- Replace with your actual table name
),

unnested_ingredients AS (
    -- Unnest the ingredients array to get individual ingredients
    SELECT
        PIZZA_ID,
        TRIM(value) AS INGREDIENT  -- Use 'value' as FLATTEN returns a 'value' column by default
    FROM source_data,
    LATERAL FLATTEN(input => ingredient_list) as value -- No need to alias 'FLATTEN' itself
)

SELECT 
    PIZZA_ID,
    INGREDIENT
FROM unnested_ingredients
ORDER BY PIZZA_ID, INGREDIENT
