--https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true

WITH  temp AS
(  
    SELECT 
    
            H.hacker_id,
            H.name,
            S.challenge_id,
            MAX(S.SCORE) as M,
             MIN(S.SCORE) as P
    
    FROM 
            Hackers as H 
    
    JOIN 
            Submissions as S 
    
     ON 
            H.hacker_id=S.hacker_id
    
     Group by
             H.hacker_id, H.name,S.challenge_id
)


 SELECT
        hacker_id,
        name,
        SUM(M) as summ
    
  FROM 
          TEMP
      
  GROUP BY 
          hacker_id,name
      
   HAVING 
          SUM(M) > 0
       
  ORDER BY 
          summ DESC ,hacker_id;
