select 

    DATE,

    TIME,

    ORDER_DETAILS_ID,

    ORDER_ID,

    DRINKS,

    DRINKS_QUANTITY,

    DRINKS_PRICE

from {{ ref('stg_side_orders') }}