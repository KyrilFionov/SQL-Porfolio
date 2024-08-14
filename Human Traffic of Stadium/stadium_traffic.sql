WITH classified_people AS (
SELECT 
id
,visit_date
,people
,CASE WHEN people >= 100 THEN 'yes' ELSE 'no' END as people_at_target
,ROW_NUMBER() OVER (ORDER BY visit_date) as ranked_date
FROM Stadium
)
,ranked_dataset AS (
SELECT 
id
,visit_date
,people
,people_at_target
,ranked_date
,ranked_date - RANK() OVER (PARTITION BY people_at_target ORDER BY visit_date) as rank_diff
FROM classified_people
ORDER BY visit_date
)
,filter_dataset AS (
SELECT 
id
,visit_date
,people
,people_at_target
,COUNT(people_at_target) OVER (PARTITION BY people_at_target,rank_diff) as consec_count
FROM ranked_dataset
ORDER BY visit_date
)
SELECT 
s.id
,s.visit_date
,s.people
FROM Stadium s
JOIN filter_dataset f ON s.id = f.id
WHERE TRUE
  AND consec_count >=3
