/*
https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true
*/
WITH  tble_name_challenges  AS(
SELECT
    
    H.hacker_id,
    H.name,
    COUNT(C.challenge_id)as number_of_challenges

    FROM Hackers as H 
    JOIN 
     Challenges As C  
    ON H.hacker_id =C.hacker_id
    
  GROUP BY H.hacker_id,H.name
),

challengeId_count AS
(
    
SELECT 
     number_of_challenges,
     COUNT(number_of_challenges) as count_of_same_no_challenges
    
FROM tble_name_challenges 
    
GROUP BY number_of_challenges
)

SELECT 

T.hacker_id , 
T.name  , 
T.number_of_challenges

FROM tble_name_challenges as T 
JOIN challengeId_count as CO 
ON T.number_of_challenges=CO.number_of_challenges
WHERE CO.count_of_same_no_challenges<=1 
OR 
T .number_of_challenges=(SELECT MAX(number_of_challenges)FROM tble_name_challenges)
ORDER BY T.number_of_challenges DESC,T.hacker_id ASC;
