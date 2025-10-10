SELECT
  starts.machine_id,
  ROUND(
    CAST(AVG(ends.timestamp - starts.timestamp) AS numeric),
    3
  ) AS processing_time
FROM Activity starts
INNER JOIN Activity ends
        ON starts.machine_id = ends.machine_id
       AND starts.process_id = ends.process_id
       AND starts.activity_type = 'start'
       AND ends.activity_type = 'end'
GROUP BY starts.machine_id
;
