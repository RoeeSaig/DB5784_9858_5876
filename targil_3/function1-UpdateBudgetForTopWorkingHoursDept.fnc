-- what does this do
CREATE OR REPLACE FUNCTION UpdateBudgetForTopWorkingHoursDept
RETURN INT AS
    newBudget INT;
    topDeptID INT;
BEGIN

    SELECT DeptID
    INTO topDeptID
    FROM (
        SELECT DeptID, AVG(WorkingHours) AS AvgWorkingHours
        FROM Employee
        GROUP BY DeptID
        ORDER BY AvgWorkingHours DESC
        FETCH FIRST 1 ROWS ONLY
    );

    --r := '&raise';
    UPDATE Employee
    SET Salary = Salary * 1.25
    WHERE DeptID = topDeptID;


    SELECT SUM(Salary)
    INTO newBudget
    FROM Employee
    WHERE DeptID = topDeptID;


    /*SELECT COUNT(*) * 300
    INTO totalEquipmentCost
    FROM Equipment
    WHERE DeptID = topDeptID;*/


    --newBudget := totalSalary + totalEquipmentCost;


    UPDATE Department
    SET Budget = newBudget
    WHERE DeptID = topDeptID;


    RETURN newBudget;
END;
--newBudgetnewBudget
/
