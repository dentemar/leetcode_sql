-- https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50

SELECT 
    s.user_id,
    COALESCE(
      ROUND(
        SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 /
        NULLIF(COUNT(c.action), 0),
      2),
    0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id
ORDER BY s.user_id;