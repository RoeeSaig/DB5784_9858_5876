SELECT Department.DeptID, Department.DeptName, AVG(Employee.Salary) AS AvgSalary
FROM Employee
JOIN Department ON Employee.DeptID = Department.DeptID
GROUP BY Department.DeptID, Department.DeptName
ORDER BY AvgSalary DESC


SELECT Task.RequestID, Task.StartDate, Task.EndDate, Task.Status, Department.DeptName
FROM Task
JOIN Department ON Task.DeptID = Department.DeptID
WHERE Task.EndDate < TO_DATE('01-07-2024', 'DD-MM-YYYY')
AND Task.Status != 'Completed';


SELECT d.DeptName, COUNT(t.RequestID) AS TotalTasks, d.CurrentSize
FROM Department d
JOIN Task t ON d.DeptID = t.DeptID
GROUP BY d.DeptName, d.CurrentSize
ORDER BY TotalTasks DESC


select *
FROM Department d
WHERE NOT EXISTS (
  SELECT 1 
  FROM Employee e 
  WHERE e.DeptID = d.DeptID
);


DELETE FROM Task
    WHERE Status = 'Completed'
    AND EndDate < TO_DATE('12-12-2023', 'DD-MM-YYYY')

DELETE FROM Employee
WHERE EmployeeID IN (
    SELECT e.EmployeeID
    FROM Employee e
    JOIN Department d ON e.DeptID = d.DeptID
    LEFT JOIN Equipment eq ON eq.DeptID = d.DeptID
    LEFT JOIN MaintenanceRequest mr ON mr.DeptID = d.DeptID
    LEFT JOIN Task t ON t.DeptID = d.DeptID
    WHERE d.Budget < 100000
    AND e.Salary > (SELECT AVG(Salary) FROM Employee)
    AND eq.EquipmentID IS NULL
    AND mr.RequestID IS NULL
    AND t.RequestID IS NULL
    AND d.CurrentSize > d.MaxCapacity * 0.8
);


UPDATE Employee
SET Salary = Salary * 1.10 -- Increase salary by 10%
WHERE DeptID = (
    SELECT DeptID
    FROM Department
    WHERE DeptID = Employee.DeptID
    AND Budget >= (
        SELECT SUM(Salary) * 1.10
        FROM Employee
        WHERE DeptID = Department.DeptID
    )
);


UPDATE MaintenanceRequest
SET Urgency = 'High'
WHERE RequestID IN (
    SELECT RequestID
    FROM Task
    WHERE EndDate < TO_DATE('01-12-2023', 'DD-MM-YYYY')
);
