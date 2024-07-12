
--first way (we dont have to use group by where then see in the 2nd way)
Select  W.id,WP.age,W.coins_needed,W.power
from WANDS AS  W 
JOIN WANDS_PROPERTY AS WP ON W.code = WP.code
GROUP BY W.power,WP.age,W.coins_needed,W.id
HAVING W.coins_needed=
(SELECT MIN(W2.coins_needed)  
 FROM WANDS AS W2 
 JOIN WANDS_PROPERTY AS WP2   ON W2.code = WP2.code
WHERE W2.power=W.power AND WP.age=WP2.age AND WP2.is_evil=0
)
ORDER BY W.power DESC, WP.age DESC;


--second way 
SELECT w.id, wp.age, w.coins_needed, w.power
FROM wands w
JOIN wands_property wp ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w2.coins_needed)
    FROM wands w2
    JOIN wands_property wp2 ON w2.code = wp2.code
    WHERE w2.power = w.power AND wp2.age = wp.age AND wp2.is_evil = 0
)
ORDER BY w.power DESC, wp.age DESC;



--best way will only run in mysql server in hackerank not regular Mysql casue it doesnt support partition by rownumber
--version 8 and above supports it and mysql is version 5 something
SELECT id, age, coins_needed, power
FROM (
    SELECT 
        w.id,
        wp.age,
        w.coins_needed,
        w.power,
        ROW_NUMBER() OVER(PARTITION BY w.power, wp.age ORDER BY w.coins_needed) as row_num
    FROM wands w
    JOIN wands_property wp ON w.code = wp.code
    WHERE wp.is_evil = 0
    ) AS ranked
WHERE row_num = 1
ORDER BY power DESC, age DESC;