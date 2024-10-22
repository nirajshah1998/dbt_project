SELECT 
    PIZZA_NAME,
    COUNT(PIZZA_NAME) as PIZZA_COUNTS ,
    ROUND(AVG(PRICE)) as AVG_PRICE_FOR_PIZZA
FROM
    {{ ref('cur_categories_of_pizzas_and_their_id') }} as tab1
JOIN
    {{ ref('cur_pizza_orders_from_side_orders') }} as tab2
ON tab1.PIZZA_ID = tab2.PIZZA_ID
JOIN
    {{ ref('cur_desserts_side_orders') }} as tab3
GROUP BY PIZZA_NAME
ORDER BY PIZZA_COUNTS DESC
