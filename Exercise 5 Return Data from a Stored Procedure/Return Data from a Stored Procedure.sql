
USE sys;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Sample data
INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John', 'Doe', 1, 5000.00, '2020-01-15'),
('Jane', 'Smith', 2, 6000.00, '2019-03-22'),
('Bob', 'Johnson', 3, 5500.00, '2021-07-01');

-
-- EXERCISE 1
DROP FUNCTION IF EXISTS fn_CalculateAnnualSalary;
DELIMITER $$
CREATE FUNCTION fn_CalculateAnnualSalary(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 12;
END $$
DELIMITER ;
SELECT 
    FirstName, Salary, fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;
-- EXERCISE 2
DROP PROCEDURE IF EXISTS fn_GetEmployeesByDepartment;
DELIMITER $$
CREATE PROCEDURE fn_GetEmployeesByDepartment(IN dept_id INT)
BEGIN
    SELECT * FROM Employees WHERE DepartmentID = dept_id;
END $$
DELIMITER ;
-- EXERCISE 3
DROP FUNCTION IF EXISTS fn_CalculateBonus;
DELIMITER $$
CREATE FUNCTION fn_CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END $$
DELIMITER ;

-- EXERCISE 4: 
DROP FUNCTION IF EXISTS fn_CalculateBonus;
DELIMITER $$
CREATE FUNCTION fn_CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.15;
END $$
DELIMITER ;


-- EXERCISE 5

DROP FUNCTION IF EXISTS fn_CalculateBonus;


-- EXERCISE 6 

SELECT 
    EmployeeID, FirstName, LastName, Salary,
    fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees;

-- EXERCISE 7

SELECT 
    EmployeeID, FirstName, LastName, Salary,
    fn_CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employees
WHERE EmployeeID = 1;

-- EXERCISE 8

CALL fn_GetEmployeesByDepartment(3); 

-- EXERCISE 9

DROP FUNCTION IF EXISTS fn_CalculateBonus;
DELIMITER $$
CREATE FUNCTION fn_CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.15;
END $$
DELIMITER ;

-- Create Total Compensation Function
DROP FUNCTION IF EXISTS fn_CalculateTotalCompensation;
DELIMITER $$
CREATE FUNCTION fn_CalculateTotalCompensation(emp_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    DECLARE sal DECIMAL(10,2);

    SELECT Salary INTO sal FROM Employees WHERE EmployeeID = emp_id;
    SET total = fn_CalculateAnnualSalary(sal) + fn_CalculateBonus(sal);
    RETURN total;
END $$
DELIMITER ;

-- Test it
SELECT 
    EmployeeID,
    fn_CalculateTotalCompensation(EmployeeID) AS TotalCompensation
FROM Employees;
-- EXERCISE 10
DROP FUNCTION IF EXISTS fn_CalculateTotalCompensation;
DELIMITER $$
CREATE FUNCTION fn_CalculateTotalCompensation(emp_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    DECLARE sal DECIMAL(10,2);

    SELECT Salary INTO sal FROM Employees WHERE EmployeeID = emp_id;
    SET total = fn_CalculateAnnualSalary(sal) + (fn_CalculateBonus(sal) * 1.5);
    RETURN total;
END $$
DELIMITER ;

-- Test it again
SELECT 
    EmployeeID,
    fn_CalculateTotalCompensation(EmployeeID) AS ModifiedTotalCompensation
FROM Employees;



