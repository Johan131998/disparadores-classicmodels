use classicmodels;

drop table if exists logProducts;
create table logProducts(
id int auto_increment,
productCode VARCHAR(15),
dateLog TIMESTAMP DEFAULT NOW(),
descripcion VARCHAR(255) NOT NULL,
PRIMARY KEY (id, productCode));

use classicmodels;
DELIMITER $$
DROP TRIGGER IF EXISTS after_inserts_products;
create trigger after_inserts_products
after insert on products
for each row
Begin
		INSERT INTO logProducts(productCode, descripcion)
        VALUES (new.productCode, CONCAT('Agregando Producto: ', NEW.productName));
End$$
DELIMITER ; 

INSERT INTO products(productCode, productName, productLine, productScale, productVendor, productDescription, quantityInStock, buyPrice, MSRP)
VALUES('B66_999','Capsula','Planes','1:9','Singapur','Best Ever',122,999.51,1500.22);
SELECT * FROM classicmodels. logProducts;

DELIMITER $$
DROP TRIGGER IF EXISTS after_update_products;
create trigger after_update_products
after update on products
for each row
Begin
		INSERT INTO logProducts(productCode, descripcion)
        VALUES (new.productCode, CONCAT('Actualizacion de producto: ', NEW.productName));
End$$
DELIMITER ; 

UPDATE products
SET productVendor = 'B66_999'
WHERE productCode = 'A75_1563';



