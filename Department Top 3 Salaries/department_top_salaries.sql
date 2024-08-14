WITH base_table as (
SELECT
e.id
,e.name as employee
,salary
,departmentId
,d.name as department
,DENSE_RANK() OVER(PARTITION BY d.id ORDER BY salary DESC) as salary_rank
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
)
SELECT 
department
,employee
,salary
FROM base_table
WHERE salary_rank <=3
ORDER BY department,salary DESC
