select 
    distinct
    PIZZA_ID,
    upper(PIZZA_TYPE_ID) as PIZZA_TYPE_ID,
    SIZE,
    CAST(PRICE AS FLOAT) as PRICE,
from 
{{ source('dominos_pizza', 'price_and_size') }}