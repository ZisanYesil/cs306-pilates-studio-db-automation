DROP PROCEDURE IF EXISTS calculate_total_payments;

DELIMITER $$

CREATE PROCEDURE calculate_total_payments(
    IN p_customer_id INT
)
BEGIN
    DECLARE v_total_amount INT DEFAULT 0;

    -- Calculate sum of all "paid" payments of the customer
    SELECT IFNULL(SUM(amount), 0)
    INTO v_total_amount
    FROM customer_buying_payment
    WHERE customer_id = p_customer_id
      AND pstatus = 'paid';

    -- Return result
    SELECT p_customer_id AS customer,
           v_total_amount AS total_payments;
END$$

DELIMITER ;

SELECT * FROM customer_buying_payment WHERE customer_id = 1;

CALL calculate_total_payments(1);

