--https://www.hackerrank.com/challenges/the-report/problem


SELECT CASE
   WHEN b.grade>=8 THEN a.name 
        ELSE NULL 
        END  AS PP
       ,b.grade
       ,a.marks
                FROM Students as a 
                      JOIN Grades as b 
                              ON 
                                    a.marks >=b.MIN_MARK AND a.marks<=b.MAX_MARK
                                            ORDER BY  
                                            b.grade DESC,
                                               CASE 
                                                WHEN b.grade >= 8 THEN a.name
                                                ELSE NULL
                                            END ASC,
                                                a.marks ASC;