select 
    INGREDIENT, count(INGREDIENT) as counts
from {{ ref('cur_ingredients_of_pizza_wrt_its_id') }}
group by INGREDIENT
order by counts desc