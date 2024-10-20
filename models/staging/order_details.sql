select 

    distinct
        CAST(ORDER_DETAILS_ID AS NUMBER) AS ORDER_DETAILS_ID,
        CAST(ORDER_ID AS NUMBER) AS ORDER_ID,
        upper(PIZZA_ID) as PIZZA_ID,
        CAST(QUANTITY AS NUMBER) AS QUANTITY

from
{{ source('dominos_pizza', 'order_details') }}