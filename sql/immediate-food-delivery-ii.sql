WITH FirstOrder AS (
  SELECT customer_id, MIN(order_date) AS order_date
  FROM Delivery
  GROUP BY customer_id
)
SELECT
  ROUND(
    SUM(
      CASE
      WHEN Delivery.order_date = customer_pref_delivery_date THEN 1
      ELSE 0
      END
    ) / COUNT(1) * 100,
    2
  ) AS immediate_percentage
FROM Delivery
INNER JOIN FirstOrder
        ON FirstOrder.customer_id = Delivery.customer_id
       AND FirstOrder.order_date = Delivery.order_date
;
