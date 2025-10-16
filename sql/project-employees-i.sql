SELECT
  Project.project_id,
  ROUND(AVG(Employee.experience_years), 2) AS average_years
FROM Project
NATURAL JOIN Employee
GROUP BY Project.project_id
;
