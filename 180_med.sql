-- https://leetcode.com/problems/consecutive-numbers/?envType=study-plan-v2&envId=top-sql-50

Select distinct(num) as ConsecutiveNums
from(
Select id,num,
lag(num) over(order by id) as prev_num,
lead(num) over(order by id) as next_num
from Logs
) sq
where sq.num = sq.prev_num and sq.prev_num = sq.next_num