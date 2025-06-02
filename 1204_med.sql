-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/description/?envType=study-plan-v2&envId=top-sql-50

with cte as (select person_id, person_name, sum(weight) over (order by turn asc) as total_weight
  from queue
  ),
  
  cte_2 as (select q1.turn, q1.person_name
    from queue as q1 
    join cte 
      on q1.person_id = cte.person_id 
   where total_weight <= 1000
   )
   
   select person_name
     from cte_2
    where turn = (select max(turn) from cte_2)