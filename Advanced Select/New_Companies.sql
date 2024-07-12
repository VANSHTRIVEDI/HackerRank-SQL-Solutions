//https://www.hackerrank.com/challenges/the-company/problem?isFullScreen=true

SELECT     DISTINCT C.company_code
,                 C.founder
,                 (
                        SELECT COUNT(DISTINCT LM.lead_manager_code)
                        FROM Lead_Manager LM 
                        WHERE LM.company_code = C.company_code) as CNT_LM
,                 (
                        SELECT COUNT(DISTINCT SM.senior_manager_code)
                        FROM Senior_Manager SM 
                        WHERE SM.company_code = C.company_code) as CNT_SM
,                 (
                        SELECT COUNT(DISTINCT M.manager_code)
                        FROM Manager M 
                        WHERE M.company_code = C.company_code) as CNT_M
,                 (
                        SELECT COUNT(DISTINCT E.employee_code)
                        FROM Employee E
                        WHERE E.company_code = C.company_code) as CNT_E
FROM        Company C
ORDER BY C.company_code ASC
;
