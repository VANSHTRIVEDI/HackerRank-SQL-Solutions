//https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true

SELECT  ROUND(ABS(MIN(LAT_N)-MAX(LAT_N)) + ABS(MAX(LONG_W)-MIN(LONG_W)),4) FROM STATION;