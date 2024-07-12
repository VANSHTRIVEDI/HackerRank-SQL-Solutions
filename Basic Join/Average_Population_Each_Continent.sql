--https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true

SELECT CONTINENT,FLOOR(AVG(A.POPULATION))
    FROM CITY AS A JOIN COUNTRY AS B 
      ON A.COUNTRYCODE=B.CODE 
       GROUP BY B.CONTINENT;