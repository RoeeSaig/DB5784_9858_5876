CREATE OR REPLACE FUNCTION AssignTasksAndUpdateEmployees
RETURN INT
IS
    CURSOR task_cursor IS
        SELECT t.RequestID, t.DeptID
        FROM Task t
        JOIN MaintenanceRequest_ m ON t.RequestID = m.RequestID
        ORDER BY m.Urgency DESC, t.EndDate ASC;

    TYPE DeptEmployeeCount IS TABLE OF INT INDEX BY PLS_INTEGER;
    available_employees DeptEmployeeCount;
    remaining_tasks INT := 0;
BEGIN

    FOR dept_rec IN (SELECT DeptID, COUNT(*) AS EmployeeCount FROM Employee GROUP BY DeptID) LOOP
        available_employees(dept_rec.DeptID) := dept_rec.EmployeeCount;
    END LOOP;


    FOR task_rec IN task_cursor LOOP
        IF available_employees.EXISTS(task_rec.DeptID) AND available_employees(task_rec.DeptID) > 0 THEN
            available_employees(task_rec.DeptID) := available_employees(task_rec.DeptID) - 1;
        ELSE
            remaining_tasks := remaining_tasks + 1;
        END IF;
    END LOOP;


    FOR dept_id IN available_employees.FIRST..available_employees.LAST LOOP
        IF available_employees.EXISTS(dept_id) AND available_employees(dept_id) > 0 THEN
            UPDATE Employee
            SET WorkingHours = 0
            WHERE DeptID = dept_id
            AND EmployeeID IN (
                SELECT EmployeeID
                FROM (
                    SELECT EmployeeID
                    FROM Employee
                    WHERE DeptID = dept_id
                    AND ROWNUM <= available_employees(dept_id)
                )
            );
        END IF;
    END LOOP;

    RETURN remaining_tasks;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
        RETURN NULL;
END;
/
