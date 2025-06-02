-- https://leetcode.com/problems/movie-rating/description/?envType=study-plan-v2&envId=top-sql-50

WITH cte AS (
  SELECT user_id, COUNT(*) AS counter
  FROM MovieRating
  GROUP BY user_id
),

result_1 AS (
  SELECT users.name AS results
  FROM cte
  JOIN users ON cte.user_id = users.user_id
  WHERE counter = (SELECT MAX(counter) FROM cte)
  ORDER BY users.name ASC
  LIMIT 1
),

cte_2 AS (
  SELECT movie_id, ROUND(AVG(rating), 2) AS avg_rating
  FROM MovieRating
  WHERE DATE_PART('month', created_at) = 2 AND DATE_PART('year', created_at) = 2020
  GROUP BY movie_id
),

result_2 AS (
  SELECT m.title AS results
  FROM movies AS m
  JOIN cte_2 ON m.movie_id = cte_2.movie_id
  WHERE avg_rating = (SELECT MAX(avg_rating) FROM cte_2)
  ORDER BY m.title ASC
  LIMIT 1
)

SELECT results FROM result_1
UNION all
SELECT results FROM result_2;