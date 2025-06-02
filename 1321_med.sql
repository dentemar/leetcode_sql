-- https://leetcode.com/problems/restaurant-growth/description/?envType=study-plan-v2&envId=top-sql-50

with amount_per_day as (select sum(amount) as amount, visited_on
  from customer
 group by visited_on
 order by 2 asc
 ),
 
 total_per_week as (select visited_on,
        sum(amount) over (order by visited_on rows between 6 preceding and current row) as amount,
        round(sum(amount) over (order by visited_on rows between 6 preceding and current row)::decimal / 7, 2) as average_amount
   from amount_per_day
  group by visited_on, amount
 )
 
 select *
   from total_per_week
  order by visited_on asc
  limit 100 
  offset 6