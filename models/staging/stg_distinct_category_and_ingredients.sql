{{
    config(
        materialized='ephemeral'
    )
}}

select distinct *
from {{ source('dominos_pizza', 'category_and_ingredients') }}