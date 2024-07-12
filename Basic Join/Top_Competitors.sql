--https://www.hackerrank.com/challenges/full-score/problem?isFullScreen=true
SELECT MAX(S.hacker_id), MAX(H.name)
FROM Submissions as S
JOIN Hackers as H on S.hacker_id = H.hacker_id
JOIN Challenges as C on S.challenge_Id = C.challenge_Id
JOIN Difficulty as D on C.difficulty_level = D.difficulty_level
WHERE D.score = S.score 
GROUP BY S.hacker_id HAVING COUNT( DISTINCT C.challenge_Id)>1
ORDER BY COUNT(DISTINCT S.challenge_Id) DESC, S.hacker_id ASC;