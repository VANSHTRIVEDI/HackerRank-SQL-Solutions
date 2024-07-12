--https://www.hackerrank.com/challenges/sql-projects/problem?isFullScreen=true

WITH start_date_table AS(
SELECT 
start_date,
RANK() OVER (ORDER BY start_date ) AS rank

FROM Projects WHERE start_date NOT IN (Select end_date from Projects )
 ),
 
 end_date_table AS(
SELECT 
end_date,
RANK() OVER (ORDER BY end_date ) AS rank

FROM Projects WHERE end_date NOT IN (Select start_date from Projects )
)

SELECT S.start_date,E.end_date 
FROM start_date_table AS S 
JOIN end_date_table AS E 
ON S.rank=E.rank 
ORDER BY 
DATEDIFF(day,S.start_date,E.end_date ),S.start_date;