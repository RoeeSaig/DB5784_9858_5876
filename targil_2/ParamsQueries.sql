select * from Equipment t
where PurchaseDate
between date &<name=Purchase1 type=string> and date &<name=Purchase2 type=string>


SELECT RequestID, LocationID
FROM MaintenanceRequest
WHERE Urgency = &<name = "level" list="High, Medium, Low" type="string">;


SELECT e.Place
FROM Equipment e
JOIN Department d ON e.DeptID = d.DeptID
WHERE d.DeptName = '&Department'
AND e.EquipmentName = '&Equipment';


SELECT e.EmployeeID, e.Name, e.salary, e.workinghours
FROM Employee e
WHERE WorkingHours  = &<name = "Hours" hint="hours value between 5-15">











