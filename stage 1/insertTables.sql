-- Insert into Department
INSERT INTO Department (DeptID, DeptName, Budget, MaxCapacity, CurrentSize) VALUES 
(1, 'Engineering', 100000, 50, 30);
INSERT INTO Department (DeptID, DeptName, Budget, MaxCapacity, CurrentSize) VALUES 
(2, 'Human Resources', 50000, 10, 7);
INSERT INTO Department (DeptID, DeptName, Budget, MaxCapacity, CurrentSize) VALUES 
(3, 'Maintenance', 75000, 20, 15);

-- Insert into Employee
INSERT INTO Employee (EmployeeID, Name, PhoneNumber, StartWork, Salary, WorkingHours, DeptID) VALUES 
(1, 'John Doe', '123-456-7890', DATE '2020-01-15', 60000, 40, 1);
INSERT INTO Employee (EmployeeID, Name, PhoneNumber, StartWork, Salary, WorkingHours, DeptID) VALUES 
(2, 'Jane Smith', '234-567-8901', DATE '2018-06-01', 55000, 40, 2);
INSERT INTO Employee (EmployeeID, Name, PhoneNumber, StartWork, Salary, WorkingHours, DeptID) VALUES 
(3, 'Emily Johnson', '345-678-9012', DATE '2019-03-20', 50000, 40, 3);

-- Insert into Equipment
INSERT INTO Equipment (EquipmentID, EquipmentName, Place, PurchaseDate, DeptID) VALUES 
(1, 'Laptop', 'Office', DATE '2022-02-15', 1);
INSERT INTO Equipment (EquipmentID, EquipmentName, Place, PurchaseDate, DeptID) VALUES 
(2, 'Projector', 'Conference Room', DATE '2021-11-05', 2);
INSERT INTO Equipment (EquipmentID, EquipmentName, Place, PurchaseDate, DeptID) VALUES 
(3, 'Air Conditioner', 'Maintenance Room', DATE '2020-07-25', 3);

-- Insert into Location_
INSERT INTO Location_ (LocationID, FloorID, AreaID, Availability) VALUES 
(1, 1, 'North Wing', 'Available');
INSERT INTO Location_ (LocationID, FloorID, AreaID, Availability) VALUES 
(2, 2, 'South Wing', 'Occupied');
INSERT INTO Location_ (LocationID, FloorID, AreaID, Availability) VALUES 
(3, 3, 'East Wing', 'Available');

-- Insert into MaintenanceRequest_
INSERT INTO MaintenanceRequest_ (RequestID, Urgency, DeptID, LocationID) VALUES 
(1, 'High', 1, 1);
INSERT INTO MaintenanceRequest_ (RequestID, Urgency, DeptID, LocationID) VALUES 
(2, 'Medium', 2, 2);
INSERT INTO MaintenanceRequest_ (RequestID, Urgency, DeptID, LocationID) VALUES 
(3, 'Low', 3, 3);

-- Insert into Task
INSERT INTO Task (RequestID, StartDate, EndDate, Status, DeptID) VALUES 
(1, DATE '2023-05-01', DATE '2023-05-05', 'Completed', 1);
INSERT INTO Task (RequestID, StartDate, EndDate, Status, DeptID) VALUES 
(2, DATE '2023-06-10', DATE '2023-06-15', 'In Progress', 2);
INSERT INTO Task (RequestID, StartDate, EndDate, Status, DeptID) VALUES 
(3, DATE '2023-07-20', DATE '2023-07-25', 'Pending', 3);
