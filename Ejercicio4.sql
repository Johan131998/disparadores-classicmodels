use classicmodels;

DELIMITER $$
DROP TRIGGER IF EXISTS Before_delete_order;
CREATE TRIGGER Before_delete_order
   BEFORE DELETE ON orders
FOR EACH ROW
BEGIN
   If Old.orderNumber is not null then
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'No puede eliminar el registro de la tabla orders';
End If;
END$$
DELIMITER ;

use classicmodels;

Delete 
from orders
where orders.orderNumber=14101;

use classicmodels;
DELIMITER $$
DROP TRIGGER IF EXISTS Before_delete_payments;
CREATE TRIGGER Before_delete_payments
   BEFORE DELETE ON payments
FOR EACH ROW
BEGIN
   If Old.checkNumber is not null then
   SIGNAL SQLSTATE '45000'
   SET MESSAGE_TEXT = 'No puede eliminar el registro de la tabla payments';
End If;
END$$
DELIMITER ;

Delete 
from payments
where payments.customerNumber=103;