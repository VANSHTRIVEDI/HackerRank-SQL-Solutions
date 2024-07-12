//https://www.hackerrank.com/challenges/occupations/problem

SELECT 
MAX(CASE WHEN OCCUPATION="Doctor" THEN NAME ELSE NULL END), 
MAX(CASE WHEN OCCUPATION="Professor" THEN NAME ELSE NULL END) ,
MAX(CASE WHEN OCCUPATION="Singer" THEN NAME ELSE NULL END) ,
MAX(CASE WHEN OCCUPATION="Actor" THEN NAME ELSE NULL END) 
FROM
(
SELECT NAME,OCCUPATION ,
ROW_NUMBER() OVER(PARTITION BY OCCUPATION ORDER BY NAME ASC) AS rn
FROM OCCUPATIONS
) as PivotTable
GROUP BY rn;