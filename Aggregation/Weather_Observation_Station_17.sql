//https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true
SELECT ROUND(LONG_W,4) FROM STATION WHERE LAT_N > 38.7780 ORDER BY LAT_N LIMIT 1;