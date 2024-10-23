select * 
from {{ ref('cur_other_side_orders') }}
WHERE SIDE_ORDERS_QUANTITY <= 0 OR SIDE_ORDERS_QUANTITY IS NULL
