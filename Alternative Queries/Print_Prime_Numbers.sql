--https://www.hackerrank.com/challenges/print-prime-numbers/problem?isFullScreen=true

DELIMITER $$
CREATE PROCEDURE dd()
BEGIN
 
    DECLARE i INT DEFAULT 2;
    DECLARE j INT;
    DECLARE r VARCHAR(2000) DEFAULT ' ';
    DECLARE isprime BOOLEAN;
    
    
    WHILE i <=1000 DO    
            SET j = 2;
            SET isprime = TRUE;
            
             WHILE j <= SQRT(i) DO
                        IF i % j = 0 THEN
                                SET isprime = FALSE;
                                
                        END IF;
                             SET j = j + 1;
              END WHILE;
         
             IF(isprime)THEN 
                 SET r = CONCAT(r, CAST(i AS CHAR), '&');
            END IF;
            
                SET i=i+1;
     END WHILE;
     
     SET r=SUBSTRING(r, 1, length(r)-1);
     SELECT r;
END $$

DELIMITER ;
CALL dd();
     
