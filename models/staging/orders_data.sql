select 

DISTINCT
CAST(ORDER_ID AS NUMBER) as ORDER_ID,
to_date(DATE, 'YYYY-MM-DD') AS DATE,
to_time(TIME) as TIME


from
{{ source('dominos_pizza', 'orders_data') }}