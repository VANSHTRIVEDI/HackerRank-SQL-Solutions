--https://www.hackerrank.com/challenges/symmetric-pairs/problem?isFullScreen=true
SELECT A.X,A.Y
FROM Functions AS A 
JOIN Functions AS B
ON A.X=B.Y AND A.Y=B.X WHERE A.X<>A.Y AND A.X<A.Y
UNION
SELECT X,Y
FROM Functions 
WHERE X=Y
GROUP BY X,Y
HAVING COUNT(1)>1
ORDER BY X ASC;