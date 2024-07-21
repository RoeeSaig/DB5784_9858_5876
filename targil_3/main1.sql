DECLARE
    updatedBudget INT;
BEGIN
  
    UpdateAndAdjustDepartmentSizes;
    --UpdateBudgetForTopWorkingHoursDept();
    
    updatedBudget := UpdateBudgetForTopWorkingHoursDept();

    DBMS_OUTPUT.PUT_LINE('Updated Budget: ' || updatedBudget);
    
END;
