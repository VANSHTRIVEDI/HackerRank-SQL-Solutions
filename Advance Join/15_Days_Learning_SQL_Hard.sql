--https://www.hackerrank.com/challenges/15-days-of-learning-sql/problem
WITH CTE1 AS (
SELECT submission_date, hacker_id, name
FROM (
    SELECT 
    s.submission_date, s.hacker_id, h.name, COUNT(s.submission_id) subs,
         ROW_NUMBER () OVER (
            PARTITION BY s.submission_date
            ORDER BY s.submission_date, COUNT(s.submission_id) DESC, s.hacker_id
        ) row_num
    FROM Submissions s
    JOIN hackers h ON s.hacker_id = h.hacker_id
    GROUP BY s.submission_date, s.hacker_id, h.name) AS day_lead
    WHERE  row_num = 1
),
udate AS (
    SELECT DISTINCT hacker_id, submission_date FROM submissions
),
lagdate AS (
    SELECT hacker_id, submission_date,
        LAG(submission_date) OVER(
            PARTITION BY hacker_id 
            ORDER BY submission_date
        ) pdate
    FROM udate
), 
condate AS (
    SELECT hacker_id, submission_date,
        CASE
            WHEN submission_date = DATEADD(DAY, 1, pdate) THEN 1
            ELSE 0
        END AS iscon
    FROM lagdate
),
sum_condate AS (
    SELECT hacker_id, submission_date,
        SUM(iscon) OVER (
            PARTITION BY hacker_id 
            ORDER BY submission_date) AS condays
    FROM condate
),
CTE2 AS (
    SELECT submission_date, COUNT(DISTINCT hacker_id) countid
    FROM sum_condate
    WHERE condays = DATEDIFF(DAY, (SELECT MIN(submission_date) FROM submissions), submission_date)
    GROUP BY submission_date
)
SELECT c1.submission_date, c2.countid, c1.hacker_id, c1.name 
FROM CTE1 c1
JOIN CTE2 c2 ON c1.submission_date = c2.submission_date
ORDER BY c1.submission_date
;