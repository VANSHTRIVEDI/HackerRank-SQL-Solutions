--https://www.hackerrank.com/challenges/asian-population/problem?isFullScreen=true
WITH  CODES AS
(
SELECT CODE as CODED
    FROM COUNTRY
       WHERE CONTINENT='Asia'
)

SELECT SUM(POPULATION)
       FROM CITY 
            WHERE COUNTRYCODE IN (SELECT CODED FROM CODES);




--USING JOIN

SELECT SUM(A.POPULATION)
    FROM CITY AS A JOIN COUNTRY AS B 
      ON A.COUNTRYCODE=B.CODE 
        WHERE B.CONTINENT='Asia';