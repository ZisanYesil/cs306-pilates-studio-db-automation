USE pilates_management_studio;

DELIMITER $$

CREATE TRIGGER auto_set_expiration_date
BEFORE INSERT ON customer_purchases_Cust_package
FOR EACH ROW
BEGIN
    SET NEW.expiring_date = DATE_ADD(NEW.cdate, INTERVAL 30 DAY);
END $$

DELIMITER ;


