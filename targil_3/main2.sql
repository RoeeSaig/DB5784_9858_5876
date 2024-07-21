BEGIN
    BEGIN
        AssignTasksToMaintenanceRequests;
    END;
    
    BEGIN

    DECLARE
        remaining_tasks INT;
      BEGIN
          remaining_tasks := AssignTasksAndUpdateEmployees;
          DBMS_OUTPUT.PUT_LINE('Number of remaining tasks: ' || remaining_tasks);
      END;
    END;
END;
