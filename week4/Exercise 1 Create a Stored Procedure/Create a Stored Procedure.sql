CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);




INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, 
JoinDate) VALUES
(1, 'John', 'Doe', 1, 5000.00, '2020-01-15'),
(2, 'Jane', 'Smith', 2, 6000.00, '2019-03-22'),
(3, 'Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
(4, 'Emily', 'Davis', 4, 5500.00, '2021-11-05');


-- exercise 1 
USE sys;
DELIMITER $$
CREATE PROCEDURE sp_GetEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT 
        EmployeeID,
        FirstName,
        LastName,
        DepartmentID,
        Salary,
        JoinDate
    FROM Employees
    WHERE DepartmentID = dept_id;
END $$

DELIMITER ;
CALL sp_GetEmployeesByDept(2);

DROP PROCEDURE IF EXISTS sp_GetEmployeesByDept;
CALL sp_GetEmployeesByDept(3);
-- exercise 5 
DROP PROCEDURE IF EXISTS sp_CountEmployeesByDept;
DELIMITER $$
CREATE PROCEDURE sp_CountEmployeesByDept(IN dept_id INT)
BEGIN
    SELECT COUNT(*) AS TotalEmployees
    FROM Employees
    WHERE DepartmentID = dept_id;
END $$
DELIMITER ;

-- 6
DROP PROCEDURE IF EXISTS sp_TotalSalaryByDept;
DELIMITER $$
CREATE PROCEDURE sp_TotalSalaryByDept(
    IN dept_id INT,
    OUT total_salary DECIMAL(10,2)
)
BEGIN
    SELECT SUM(Salary) INTO total_salary
    FROM Employees
    WHERE DepartmentID = dept_id;
END $$
DELIMITER ;
 -- 7
 DROP PROCEDURE IF EXISTS sp_UpdateEmployeeSalary;
DELIMITER $$
CREATE PROCEDURE sp_UpdateEmployeeSalary(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET Salary = new_salary
    WHERE EmployeeID = emp_id;
END $$
DELIMITER ;

 -- 8
 DROP PROCEDURE IF EXISTS sp_GiveBonus;
DELIMITER $$
CREATE PROCEDURE sp_GiveBonus(
    IN dept_id INT,
    IN bonus DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET Salary = Salary + bonus
    WHERE DepartmentID = dept_id;
END $$
DELIMITER ;

-- 9
DROP PROCEDURE IF EXISTS sp_TransactionalSalaryUpdate;
DELIMITER $$
CREATE PROCEDURE sp_TransactionalSalaryUpdate(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
    END;

    START TRANSACTION;

    UPDATE Employees
    SET Salary = new_salary
    WHERE EmployeeID = emp_id;

    COMMIT;
END $$
DELIMITER ;
CALL sp_TransactionalSalaryUpdate(1, 5900.00);

-- 10

DROP PROCEDURE IF EXISTS sp_GetEmployeesByFilter;
DELIMITER $$
CREATE PROCEDURE sp_GetEmployeesByFilter(
    IN column_name VARCHAR(64),
    IN filter_value VARCHAR(100)
)
BEGIN
    SET @sql = CONCAT(
        'SELECT * FROM Employees WHERE ', 
        column_name, 
        ' = ?'
    );

    PREPARE stmt FROM @sql;
   
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;

-- 11

DROP PROCEDURE IF EXISTS sp_UpdateSalaryWithError;
DELIMITER $$
CREATE PROCEDURE sp_UpdateSalaryWithError(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        SELECT 'Error: Could not update salary.' AS Message;
    END;

    UPDATE Employees
    SET Salary = new_salary
    WHERE EmployeeID = emp_id;

    SELECT 'Salary updated successfully.' AS Message;
END $$
DELIMITER ;
CALL sp_UpdateSalaryWithError(100, 9000.00);





