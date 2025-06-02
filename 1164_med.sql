-- https://leetcode.com/problems/product-price-at-a-given-date/description/?envType=study-plan-v2&envId=top-sql-50

with cte as (SELECT change_date, product_id, new_price
FROM products
WHERE change_date <= '2019-08-16'
),

cte_2 as (select *
  from (
  select *, row_number() over (partition by product_id order by change_date desc) as rn
    from cte
  ) as sub
  where rn = 1  
),

cte_3 as (
SELECT DISTINCT product_id
FROM products

EXCEPT

SELECT DISTINCT product_id
FROM products
WHERE change_date <= '2019-08-16'
)


select product_id, new_price  as price
  from cte_2
  
 union 

select product_id, 10 as price
  from cte_3

 order by 1 asc