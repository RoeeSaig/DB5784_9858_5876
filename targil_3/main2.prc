create or replace procedure AssignTasksToMaintenanceRequests is
begin
  FOR req IN (
        SELECT RequestID, DeptID
        FROM MaintenanceRequest_
        WHERE RequestID NOT IN (SELECT RequestID FROM Task)
    ) LOOP
        INSERT INTO Task (RequestID, StartDate, EndDate, Status, DeptID)
        VALUES (req.RequestID, TO_DATE('2024-07-14', 'YYYY-MM-DD'), TO_DATE('2024-07-28', 'YYYY-MM-DD'), 'Pending', req.DeptID);
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
end AssignTasksToMaintenanceRequests;
/
