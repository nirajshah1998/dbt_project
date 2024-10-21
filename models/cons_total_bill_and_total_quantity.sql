select 

oso.ORDER_ID as ORDER_ID,

SIDE_ORDER, DESSERTS, DRINKS, PIZZA_NAME, 

SIDE_ORDERS_QUANTITY + DESSERTS_QUANTITY + DRINKS_QUANTITY + QUANTITY as TOTAL_QUANTITY,

SIDE_ORDER_PRICE + DESSERTPRICE + DRINKS_PRICE + PRICE as TOTAL_PRICE



from 

{{ ref('cur_other_side_orders') }} as oso 
join
{{ ref('cur_desserts_side_orders') }} as dso on (
    (oso.ORDER_DETAILS_ID = dso.ORDER_DETAILS_ID) and (oso.ORDER_ID = dso.ORDER_ID))
join
{{ ref('cur_drinks_side_orders') }} as drso on (
    (drso.ORDER_DETAILS_ID = dso.ORDER_DETAILS_ID) and (drso.ORDER_ID = dso.ORDER_ID))
join
{{ ref('cur_pizza_orders_from_side_orders') }} as pzso on (
    (pzso.ORDER_DETAILS_ID = drso.ORDER_DETAILS_ID) and (pzso.ORDER_ID = drso.ORDER_ID))
join
{{ ref('cur_categories_of_pizzas_and_their_id') }} as cop on (
    (cop.PIZZA_ID = pzso.PIZZA_ID) and (cop.CATEGORY = pzso.CATEGORY))


order by TOTAL_PRICE DESC, TOTAL_QUANTITY DESC