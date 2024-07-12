
--https://www.hackerrank.com/challenges/draw-the-triangle-1/problem?isFullScreen=true
DELIMITER $$
CREATE PROCEDURE while_proc()
BEGIN
DECLARE i INT DEFAULT 20;
    WHILE i>0 DO
            SELECT IF(i=1,'*',REPEAT('* ',i));
            SET i=i-1;
    END WHILE;
END $$
DELIMITER ;
CALL while_proc();