DROP PROCEDURE IF EXISTS make_reservation;
USE pilates_management_studio;

DELIMITER $$

CREATE PROCEDURE make_reservation(
  IN p_customer_id INT,
  IN p_session_id INT
)
BEGIN
  DECLARE v_new_res_id INT;
  DECLARE v_now DATETIME;
  DECLARE v_current_count INT;
  DECLARE v_max_capacity INT;

  SET v_now = NOW();

  -- Get session capacity
  SELECT `capacity` INTO v_max_capacity
  FROM `session`
  WHERE `session_id` = p_session_id;

  -- Count existing reservations for that session
  SELECT COUNT(*) INTO v_current_count
  FROM `reservation`
  WHERE `session_id` = p_session_id;

  IF v_current_count >= v_max_capacity THEN
    SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Session is full';
  ELSE
    INSERT INTO `reservation` (`customer_id`, `session_id`, `reservation_time`)
    VALUES (p_customer_id, p_session_id, v_now);

    SET v_new_res_id = LAST_INSERT_ID();
    SELECT v_new_res_id AS reservation_id;
  END IF;
END$$

DELIMITER ;

SELECT * FROM session;

