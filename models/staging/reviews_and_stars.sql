select
distinct
    CAST(ORDER_ID AS NUMBER) ORDER_ID,
    CAST(ORDER_DETAILS_ID AS NUMBER) ORDER_DETAILS_ID,
    upper(PIZZA_ID) as PIZZA_ID,
    upper(CATEGORY) as CATEGORY,
    REVIEWS,
    CAST(STARS AS NUMBER) STARS

from {{ source('dominos_pizza', 'reviews_and_stars') }}