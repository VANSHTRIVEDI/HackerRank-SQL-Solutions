--https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
SELECT   SALARY*MONTHS ,COUNT(name)   FROM EMPLOYEE 
GROUP BY SALARY*MONTHS 
ORDER BY SALARY*MONTHS DESC 
LIMIT 1;