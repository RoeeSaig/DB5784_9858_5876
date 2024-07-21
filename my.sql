/*
CREATE TABLE Department (
    DeptID INT,
    DeptName VARCHAR(50) NOT NULL,
    Budget INT NOT NULL,
    MaxCapacity INT NOT NULL,
    CurrentSize INT NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DeptID)
);

CREATE TABLE Employee (
    EmployeeID INT,
    Name VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    CONSTRAINT Phone_Format CHECK (
    REGEXP_LIKE(PhoneNumber, '^(\d{3}-\d{3}-\d{4})$')),
        
    StartWork DATE NOT NULL,
    Salary INT NOT NULL,
    WorkingHours INT NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
    CONSTRAINT FK_Employee_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Equipment (
    EquipmentID INT,
    EquipmentName VARCHAR(50) NOT NULL,
    Place VARCHAR(50) NOT NULL,
    PurchaseDate DATE NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Equipment PRIMARY KEY (EquipmentID),
    CONSTRAINT FK_Equipment_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Location_ (
    LocationID INT,
    FloorID INT NOT NULL,
    AreaID VARCHAR(15) NOT NULL,
    Availability VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Location PRIMARY KEY (LocationID)
);

CREATE TABLE MaintenanceRequest (
    RequestID INT,
    Urgency VARCHAR(10) NOT NULL,
    DeptID INT NOT NULL,
    LocationID INT NOT NULL,
    CONSTRAINT PK_MaintenanceRequest PRIMARY KEY (RequestID),
    CONSTRAINT FK_MaintenanceRequest_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    CONSTRAINT FK_MaintenanceRequest_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Task (
    RequestID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Task PRIMARY KEY (RequestID),
    CONSTRAINT FK_Task_MaintenanceRequest FOREIGN KEY (RequestID) REFERENCES MaintenanceRequest_(RequestID),
    CONSTRAINT FK_Task_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
*/


/*DELETE FROM Task
    WHERE Status = 'Completed'
    AND EndDate < TO_DATE('12-12-2023', 'DD-MM-YYYY')*/

/*DELETE FROM Employee
WHERE EmployeeID IN (
    SELECT e.EmployeeID
    FROM Employee e
    JOIN Department d ON e.DeptID = d.DeptID
    LEFT JOIN Equipment eq ON eq.DeptID = d.DeptID
    LEFT JOIN MaintenanceRequest_ mr ON mr.DeptID = d.DeptID
    LEFT JOIN Task t ON t.DeptID = d.DeptID
    WHERE d.Budget < 100000
    AND e.Salary > (SELECT AVG(Salary) FROM Employee)
    AND eq.EquipmentID IS NULL
    AND mr.RequestID IS NULL
    AND t.RequestID IS NULL
    AND d.CurrentSize > d.MaxCapacity * 0.8
);*/


/*select *
from Employee
--SET Salary = Salary * 1.10 -- Increase salary by 10%
WHERE DeptID = (
    SELECT DeptID
    FROM Department
    WHERE DeptID = Employee.DeptID
    AND Budget >= (
        SELECT SUM(Salary) * 1.10
        FROM Employee
        WHERE DeptID = Department.DeptID
    )
);*/


/*UPDATE MaintenanceRequest
SET Urgency = 'High'
WHERE RequestID IN (
    SELECT RequestID
    FROM Task
    WHERE EndDate < TO_DATE('01-12-2023', 'DD-MM-YYYY')
);*/
/*
SELECT e.Place
FROM Equipment e
JOIN Department d ON e.DeptID = d.DeptID
WHERE d.DeptName = '&Department'
AND e.EquipmentName = '&Equipment';
*/

/*ALTER TABLE Employee
ADD CONSTRAINT Check_Salary CHECK (Salary > 0);

ALTER TABLE Location_
MODIFY Availability VARCHAR(10) DEFAULT 'Available';

ALTER TABLE Equipment
ADD CONSTRAINT Check_PurchaseDate CHECK (PurchaseDate <= TO_DATE('07-07-2024', 'DD-MM-YYYY'));*/



--DELIMITER
/*
CREATE PROCEDURE AdjustDepartmentSizes()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE depID INT;
    DECLARE cur CURSOR FOR
        SELECT DeptID
        FROM Department
        WHERE CurrentSize > MaxCapacity;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO depID;
        IF done THEN
            LEAVE read_loop;
        END IF;

        delete_loop: LOOP
            DECLARE current_size INT;
            DECLARE max_capacity INT;

            SELECT CurrentSize, MaxCapacity
            INTO current_size, max_capacity
            FROM Department
            WHERE DeptID = depID;

            IF current_size <= max_capacity THEN
                LEAVE delete_loop;
            END IF;

            DELETE FROM Employee
            WHERE EmployeeID = (
                SELECT EmployeeID
                FROM Employee
                WHERE DeptID = depID
                ORDER BY StartWork ASC
                LIMIT 1
            );

            UPDATE Department
            SET CurrentSize = CurrentSize - 1
            WHERE DeptID = depID;
        END LOOP delete_loop;
    END LOOP read_loop;

    CLOSE cur;
END //

DELIMITER ;
*/


/*
-- Step 1: Update CurrentSize for each department
UPDATE Department d
SET CurrentSize = (
    SELECT COUNT(*)
    FROM Employee e
    WHERE e.DeptID = d.DeptID
);

-- Step 2: Adjust Department Sizes
DELIMITER //

CREATE PROCEDURE AdjustDepartmentSizes()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE depID INT;
    DECLARE current_size INT;
    DECLARE max_capacity INT;

    DECLARE cur CURSOR FOR
        SELECT DeptID
        FROM Department
        WHERE CurrentSize > MaxCapacity;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO depID;
        IF done THEN
            LEAVE read_loop;
        END IF;

        delete_loop: LOOP
            SELECT CurrentSize, MaxCapacity
            INTO current_size, max_capacity
            FROM Department
            WHERE DeptID = depID;

            IF current_size <= max_capacity THEN
                LEAVE delete_loop;
            END IF;

            DELETE FROM Employee
            WHERE EmployeeID = (
                SELECT EmployeeID
                FROM Employee
                WHERE DeptID = depID
                ORDER BY StartWork ASC
                LIMIT 1
            );

            UPDATE Department
            SET CurrentSize = CurrentSize - 1
            WHERE DeptID = depID;
        END LOOP delete_loop;
    END LOOP read_loop;

    CLOSE cur;
END //

DELIMITER ;

-- Call the procedure to adjust department sizes
CALL AdjustDepartmentSizes();
*/

--select *
--from employee



/*
DELIMITER //

CREATE FUNCTION UpdateBudgetForTopWorkingHoursDept()
RETURNS INT
BEGIN
    DECLARE topDeptID INT;
    DECLARE totalSalary INT;
    DECLARE totalEquipmentCost INT;
    DECLARE newBudget INT;

    -- Step 1: Identify the department with the highest average working hours
    SELECT DeptID
    INTO topDeptID
    FROM (
        SELECT DeptID, AVG(WorkingHours) AS AvgWorkingHours
        FROM Employee
        GROUP BY DeptID
        ORDER BY AvgWorkingHours DESC
        LIMIT 1
    ) AS TopDept;

    -- Step 2: Increase the salaries of all employees in that department by 1.25 times
    UPDATE Employee
    SET Salary = Salary * 1.25
    WHERE DeptID = topDeptID;

    -- Step 3: Sum up the new salaries
    SELECT SUM(Salary)
    INTO totalSalary
    FROM Employee
    WHERE DeptID = topDeptID;

    -- Step 4: Sum the cost of equipment in that department
    SELECT Count(*) * 300
    INTO totalEquipmentCost
    FROM Equipment
    WHERE DeptID = topDeptID;

    -- Step 5: Calculate the new budget
    SET newBudget = totalSalary + totalEquipmentCost;

    -- Step 6: Update the Budget field in the Department table
    UPDATE Department
    SET Budget = newBudget
    WHERE DeptID = topDeptID;

    -- Return the new budget
    RETURN newBudget;
END //

DELIMITER ;
*/
/*
SELECT *
FROM Department
WHERE DeptID = (
    SELECT DeptID
    FROM (
        SELECT DeptID, AVG(WorkingHours) AS AvgWorkingHours
        FROM Employee
        GROUP BY DeptID
    ) AvgDeptWorkingHours
    WHERE AvgWorkingHours = (
        SELECT MAX(AvgWorkingHours)
        FROM (
            SELECT AVG(WorkingHours) AS AvgWorkingHours
            FROM Employee
            GROUP BY DeptID
        ) MaxAvgWorkingHours
    )
);*/
/*
SELECT *
FROM Employee
WHERE DeptID = (
    SELECT DeptID
    FROM (
        SELECT DeptID, AVG(WorkingHours) AS AvgWorkingHours
        FROM Employee
        GROUP BY DeptID
    ) AvgDeptWorkingHours
    WHERE AvgWorkingHours = (
        SELECT MAX(AvgWorkingHours)
        FROM (
            SELECT AVG(WorkingHours) AS AvgWorkingHours
            FROM Employee
            GROUP BY DeptID
        ) MaxAvgWorkingHours
    )
);
*/

/*SELECT *
FROM MaintenanceRequest_ m
WHERE NOT EXISTS (
    SELECT 1
    FROM Task t
    WHERE t.RequestID = m.RequestID
);*/

select *
from employee
where workinghours = 0

