select 

    ORDER_DETAILS_ID,

    ORDER_ID,

    DRINKS,

    DRINKS_QUANTITY,

    DRINKS_PRICE

from {{ ref('side_orders_incremental') }}