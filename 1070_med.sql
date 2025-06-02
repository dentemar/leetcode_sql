-- https://leetcode.com/problems/product-sales-analysis-iii/description/?envType=study-plan-v2&envId=top-sql-50

WITH cte AS (
  SELECT 
    product_id, 
    MIN(year) AS first_year
  FROM sales
  GROUP BY product_id
)

SELECT 
  s.product_id, 
  s.year AS first_year, 
  s.quantity, 
  s.price
FROM sales s
JOIN cte
  ON s.product_id = cte.product_id AND s.year = cte.first_year;