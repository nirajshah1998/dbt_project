select 

    DATE,
    TIME,
    ORDER_DETAILS_ID,
    ORDER_ID,
    initcap(DESSERTS) as DESSERTS,
    DESSERTS_QUANTITY,
    DESSERTPRICE

from {{ ref('stg_side_orders') }}