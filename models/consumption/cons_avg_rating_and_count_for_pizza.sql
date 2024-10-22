WITH ANS AS (SELECT 

    t1.PIZZA_NAME as PIZZA_NAME,
    
    ROUND(AVG(t1.STARS), 2) as avg_ratings,

FROM 
{{ ref('cons_practice') }} as t1

GROUP BY PIZZA_NAME)


SELECT 
t1.PIZZA_NAME as PIZZA_NAME,
avg_ratings,
PIZZA_COUNTS,
AVG_PRICE_FOR_PIZZA 

FROM ANS AS t1
    JOIN
{{ ref('cons_highest_order_pizza') }} as t2
    ON t1.PIZZA_NAME = t2.PIZZA_NAME