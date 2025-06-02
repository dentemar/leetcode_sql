-- https://leetcode.com/problems/exchange-seats/description/?envType=study-plan-v2&envId=top-sql-50

select case
       when id % 2 = 0 then id - 1
       when id=(select max(id) from seat) then id
       when id % 2 = 1 then id + 1
       end as id, student
  from seat
 order by id asc
 