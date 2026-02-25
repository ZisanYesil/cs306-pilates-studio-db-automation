USE pilates_management_studio;

DELIMITER $$

CREATE TRIGGER auto_set_payment_status
BEFORE INSERT ON customer_buying_payment
FOR EACH ROW
BEGIN
    -- If amount is positive, auto-set status to 'paid'
    IF NEW.amount > 0 THEN
        SET NEW.pstatus = 'paid';
    ELSE
        SET NEW.pstatus = 'pending';
    END IF;
END $$

DELIMITER ;
