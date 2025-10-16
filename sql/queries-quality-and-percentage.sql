SELECT
  Queries.query_name,
  ROUND(AVG(Queries.rating / Queries.position), 2) AS quality,
  ROUND(
    AVG(
      CASE
      WHEN Queries.rating < 3 THEN 100
      ELSE 0
      END
    ),
    2
  ) AS poor_query_percentage
FROM Queries
GROUP BY Queries.query_name
;
