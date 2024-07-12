--https://www.hackerrank.com/challenges/african-cities/problem?isFullScreen=true

SELECT A.NAME
    FROM CITY AS A JOIN COUNTRY AS B 
      ON A.COUNTRYCODE=B.CODE 
        WHERE B.CONTINENT='AFRICA';