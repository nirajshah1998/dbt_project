select 
    DATE,
    TIME,
    ORDER_DETAILS_ID,
    ORDER_ID,
    SIDE_ORDER,
    SIDE_ORDERS_QUANTITY,
    SIDE_ORDER_PRICE

from {{ ref('stg_side_orders') }}