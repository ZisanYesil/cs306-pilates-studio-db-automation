DROP PROCEDURE IF EXISTS activate_instructor;

DELIMITER $$

CREATE PROCEDURE activate_instructor (
    IN p_instructor_id INT,
    IN p_new_status BOOLEAN
)
BEGIN
    UPDATE instructor
    SET active = p_new_status
    WHERE instructor_id = p_instructor_id;

    SELECT CONCAT('Instructor ', p_instructor_id, ' status updated to ', p_new_status) 
           AS message;
END$$

DELIMITER ;

SELECT * FROM instructor WHERE instructor_id = 5;

CALL activate_instructor(5, 1);

SELECT * FROM instructor WHERE instructor_id = 5;

