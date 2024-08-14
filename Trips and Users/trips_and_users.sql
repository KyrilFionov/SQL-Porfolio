WITH drivers AS (
    SELECT * FROM Users WHERE role = 'driver' AND banned = 'No'
)
,clients AS (
    SELECT * FROM Users WHERE role = 'client' AND banned = 'No'
)
,base_table AS (
SELECT
id
,client_id
,driver_id
,status
,request_at as day
FROM Trips
JOIN clients c ON client_id = c.users_id
JOIN drivers d ON driver_id = d.users_id
)
SELECT
day
,ROUND(
    COUNT(
        CASE
            WHEN status IN ('cancelled_by_driver','cancelled_by_client')
            THEN id END
    )
    /
    COUNT(id)
    ,2
) as 'Cancellation Rate'
FROM base_table
WHERE day BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY 1
