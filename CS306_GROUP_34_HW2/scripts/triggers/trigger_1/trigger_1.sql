USE pilates_management_studio;

DELIMITER $$

CREATE TRIGGER prevent_overbooking
BEFORE INSERT ON reservation_belongs_to_session
FOR EACH ROW
BEGIN
    DECLARE current_count INT;
    DECLARE max_capacity INT;

    -- Get number of confirmed reservations for this session
    SELECT COUNT(*)
    INTO current_count
    FROM reservation_belongs_to_session
    WHERE session_id = NEW.session_id
      AND rstatus = 'confirmed';

    -- Get this session's capacity
    SELECT capacity
    INTO max_capacity
    FROM session
    WHERE session_id = NEW.session_id;

    -- If full, interrupt insertion
    IF current_count >= max_capacity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Session capacity exceeded. Reservation cannot be added.';
    END IF;

END $$

DELIMITER ;


