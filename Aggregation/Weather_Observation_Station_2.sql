--https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true

SELECT 
    ROUND(SUM(LAT_N), 2) AS sum_lat_n_rounded,
    ROUND(SUM(LONG_W), 2) AS sum_long_w_rounded
FROM 
    STATION;