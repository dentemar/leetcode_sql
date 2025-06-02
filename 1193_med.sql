-- https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50

select to_char(trans_date::date, 'YYYY-mm') as month,
       country, 
       count(trans_date) as trans_count,
       count(trans_date) filter (where state like 'approved') as approved_count,
       sum(amount) as trans_total_amount,
       COALESCE(sum(amount) filter (where state like 'approved'), 0) as approved_total_amount
  from transactions
 group by country, to_char(trans_date::date, 'YYYY-mm')
 order by 1 asc;