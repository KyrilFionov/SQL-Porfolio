WITH date_rank_table AS (
SELECT
player_id
,event_date
,RANK() OVER(PARTITION BY player_id ORDER BY event_date) as date_rank
FROM Activity
GROUP BY 1,2
ORDER BY 1,2
)
,player_consecutive_dates_table AS (
SELECT
player_id
,MAX(CASE WHEN date_rank = 1 THEN event_date END) as first_date 
,MAX(CASE WHEN date_rank = 2 THEN event_date END) as second_date 
,DATEDIFF(
    MAX(CASE WHEN date_rank = 2 THEN event_date END)
    ,MAX(CASE WHEN date_rank = 1 THEN event_date END) 
) as interval_between_games
FROM date_rank_table
GROUP BY 1
)
SELECT 
ROUND(
    COUNT(CASE WHEN interval_between_games<=1 THEN player_id END)
    /
    COUNT(player_id)
    ,2) as fraction
FROM player_consecutive_dates_table
