select 

    DATE,
    TIME,
    ORDER_DETAILS_ID,
    ORDER_ID,
    PIZZA_ID,
    PIZZA_TYPE_ID,
    SIZE,
    CATEGORY,
    QUANTITY,
    PRICE

from {{ ref('stg_side_orders') }}