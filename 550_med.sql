-- https://leetcode.com/problems/game-play-analysis-iv/?envType=study-plan-v2&envId=top-sql-50

WITH first_login AS (
  SELECT 
    player_id,
    MIN(event_date) AS first_login_date
  FROM Activity
  GROUP BY player_id
),

next_day_login AS (
  SELECT 
    f.player_id
  FROM first_login f
  JOIN Activity a
    ON f.player_id = a.player_id
   AND a.event_date = f.first_login_date + INTERVAL '1 day'
)

SELECT 
  ROUND(COUNT(n.player_id) * 1.0 / COUNT(DISTINCT a.player_id), 2) AS fraction
FROM first_login a
left JOIN next_day_login n
  ON a.player_id = n.player_id;