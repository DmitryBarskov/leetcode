SELECT
  Signups.user_id,
  ROUND(
    SUM(
      CASE
        WHEN Confirmations.action = 'confirmed' THEN 1.0
        ELSE 0.0
      END
    ) / COUNT(1),
    2
  ) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id
;
