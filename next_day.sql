DELIMITER //
 
  CREATE FUNCTION next_day(start_date DATETIME, weekday CHAR(20))
    RETURNS DATETIME
  BEGIN
    DECLARE start DATETIME;
    DECLARE i INT;
 
    SET start = ADDDATE(start_date, 1);
    SET i = 1;
 
    days: LOOP
          -- Compare the day names
        IF SUBSTR(DAYNAME(start), 1, 3) = SUBSTR(weekday, 1, 3) THEN	
	   LEAVE days;
        END IF;
 
        SET start = ADDDATE(start, 1);
        SET i = i + 1;
 
        -- Not valid weekday specified
        IF i > 7 THEN
	   SET start = NULL;
	   LEAVE days;
 	END IF;
 
     END LOOP days;
 
     RETURN start;
  END;
  //
 
   DELIMITER ;