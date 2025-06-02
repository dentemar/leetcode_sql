-- https://leetcode.com/problems/count-salary-categories/submissions/?envType=study-plan-v2&envId=top-sql-50

with cte as (select account_id, income, 
        case 
        when income < 20000 then 'Low Salary'
        when income >= 20000 and income <= 50000 then 'Average Salary'
        when income > 50000 then 'High Salary'
        end as category
  from accounts
  ),
  
  
  category_counts as (select count(category) as accounts_count, category
    from cte
   group by category
  ),
  
  all_categories AS (
  SELECT 'Low Salary' AS category
  UNION ALL
  SELECT 'Average Salary'
  UNION ALL
  SELECT 'High Salary'
 )
  
  SELECT 
  a.category,
  COALESCE(c.accounts_count, 0) AS accounts_count
  FROM all_categories a
  LEFT JOIN category_counts c ON a.category = c.category