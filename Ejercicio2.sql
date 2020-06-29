use classicmodels;
DROP TABLE IF EXISTS employeesEx;
CREATE TABLE employeesEx
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employeeNumber int(11) not null,
    lastName varchar(50) not null,
    firstName varchar(50) not null,
    extension varchar(10) not null,
    email varchar(100) not null,
    officeCode varchar(10) not null,
    reportsTo int(11),
    jobTitle varchar(50) not null,
    deletedAt TIMESTAMP DEFAULT NOW()
);
DELIMITER $$
DROP TRIGGER IF EXISTS before_employee_delete;
CREATE TRIGGER before_employee_delete
    BEFORE DELETE
    ON employees
    FOR EACH ROW
BEGIN
    INSERT INTO employeesEx(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
    VALUES (OLD.employeeNumber, OLD.lastName, OLD.firstName, OLD.extension, OLD.email, OLD.officeCode, OLD.reportsTo, OLD.jobTitle);
END$$

DELIMITER ;

delete
from employees
where employeeNumber=1105;