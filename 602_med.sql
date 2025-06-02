-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/?envType=study-plan-v2&envId=top-sql-50

WITH combined AS (
  SELECT requester_id AS id FROM RequestAccepted
  UNION ALL
  SELECT accepter_id AS id FROM RequestAccepted
)

SELECT
  id,
  COUNT(*) AS num
FROM combined
GROUP BY id
ORDER BY num DESC, id DESC
LIMIT 1;