SELECT
    Users.name,
    COALESCE(SUM(Rides.distance), 0) AS travelled_distance
FROM Users
LEFT JOIN Rides ON Rides.user_id = Users.id
GROUP BY Users.id, Users.name
ORDER BY travelled_distance DESC, Users.name ASC;
