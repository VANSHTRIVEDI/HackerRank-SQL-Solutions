//https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true

SELECT CASE
WHEN  P IS NULL THEN CONCAT(N," Root ")
WHEN  N IN(SELECT P FROM BST) THEN CONCAT(N," Inner ")
ELSE CONCAT(N," Leaf ")
END
FROM BST 
ORDER BY N ASC;