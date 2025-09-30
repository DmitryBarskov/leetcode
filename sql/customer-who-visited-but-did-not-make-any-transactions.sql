SELECT
  Visits.customer_id,
  COUNT(Visits.visit_id) AS count_no_trans
FROM Visits
LEFT OUTER JOIN Transactions ON Transactions.visit_id = Visits.visit_id
WHERE Transactions.transaction_id IS NULL
GROUP BY Visits.customer_id
;
