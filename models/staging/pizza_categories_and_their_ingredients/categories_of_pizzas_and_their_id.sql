select 
upper(PIZZA_ID) as PIZZA_ID, 
initcap(PIZZA_NAME) as PIZZA_NAME, 
upper(CATEGORY) as CATEGORY 
from distinct_category_and_ingredients