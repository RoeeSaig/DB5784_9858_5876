CREATE OR REPLACE PROCEDURE UpdateAndAdjustDepartmentSizes IS
    depID INT;
    current_size INT;
    max_capacity INT;
BEGIN

    UPDATE Department d
    SET CurrentSize = (
        SELECT COUNT(*)
        FROM Employee e
        WHERE e.DeptID = d.DeptID
    );

    FOR cur IN (
        SELECT DeptID
        FROM Department
        WHERE CurrentSize > MaxCapacity
    ) LOOP
        depID := cur.DeptID;

        --<<delete_loop>>
        LOOP

            SELECT CurrentSize, MaxCapacity
            INTO current_size, max_capacity
            FROM Department
            WHERE DeptID = depID;

            EXIT WHEN current_size <= max_capacity;

            DELETE FROM Employee
            WHERE EmployeeID = (
                SELECT EmployeeID
                FROM Employee
                WHERE DeptID = depID
                ORDER BY StartWork ASC
                FETCH FIRST 1 ROWS ONLY  
            );

            UPDATE Department
            SET CurrentSize = CurrentSize - 1
            WHERE DeptID = depID;
        END LOOP;
    END LOOP;
END UpdateAndAdjustDepartmentSizes;
/
