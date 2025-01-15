WITH cte_grouped_events AS (
SELECT
event_id 
,ROW_NUMBER() OVER (PARTITION BY user_id,event_type ORDER BY user_id,event_datetime) 			      as row_num
,event_id - ROW_NUMBER() OVER (PARTITION BY user_id,event_type ORDER BY user_id,event_datetime) as island
,user_id 
,event_datetime 
,event_type
FROM projects.main.events
WHERE TRUE
AND event_type = 'login failed'
)
SELECT 
user_id
,COUNT(event_type) as consecutive_failures
FROM cte_grouped_events 
GROUP BY user_id,island
HAVING consecutive_failures >=5
QUALIFY consecutive_failures = MAX(consecutive_failures) OVER (PARTITION BY user_id)
