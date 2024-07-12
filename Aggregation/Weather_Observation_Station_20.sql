--https://www.hackerrank.com/challenges/weather-observation-station-20/problem
WITH CTE AS (
SELECT 
        LAT_N, 
        COUNT(*) OVER () AS TOTAL_COUNT,
        ROW_NUMBER() OVER (ORDER BY LAT_N ASC) AS ROLL_NUMBER
       FROM STATION
),
 CTE2 AS ( 
    SELECT LAT_N AS ODD
    FROM CTE 
    WHERE ROLL_NUMBER=(TOTAL_COUNT+1)/2
),
CTE3 AS 
(
SELECT LAT_N AS EVEN
    FROM CTE 
    WHERE ROLL_NUMBER=(TOTAL_COUNT)/2
)
    
    SELECT 
         CASE 
                WHEN TOTAL_COUNT%2=1 THEN 
                   ROUND((SELECT ODD FROM CTE2),4) 
                    ELSE 
                    ROUND(((SELECT EVEN FROM CTE3)+(SELECT ODD FROM CTE2))/2,4)
                    END AS MEDIAN_LAT_N
     FROM CTE
     LIMIT 1;