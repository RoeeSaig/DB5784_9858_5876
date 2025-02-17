CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    Budget INT NOT NULL,
    MaxCapacity INT NOT NULL,
    CurrentSize INT NOT NULL,
    CONSTRAINT UQ_DeptName UNIQUE (DeptName) 
);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    CONSTRAINT Phone_Format CHECK (REGEXP_LIKE(PhoneNumber, '^\d{3}-\d{3}-\d{4}$')),
    StartWork DATE NOT NULL,
    Salary INT NOT NULL,
    WorkingHours INT NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT FK_Employee_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(50) NOT NULL,
    Place VARCHAR(50) NOT NULL,
    PurchaseDate DATE NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT FK_Equipment_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Location_ (
    LocationID INT PRIMARY KEY,
    FloorID INT NOT NULL,
    AreaID VARCHAR(15) NOT NULL,
    Availability VARCHAR(10) NOT NULL,
    CONSTRAINT UQ_Location UNIQUE (FloorID, AreaID) 
);

CREATE TABLE MaintenanceRequest (
    RequestID INT PRIMARY KEY,
    Urgency VARCHAR(10) NOT NULL,
    DeptID INT NOT NULL,
    LocationID INT NOT NULL,
    CONSTRAINT FK_MaintenanceRequest_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    CONSTRAINT FK_MaintenanceRequest_Location FOREIGN KEY (LocationID) REFERENCES Location_(LocationID)
);

CREATE TABLE Task (
    RequestID INT PRIMARY KEY,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT FK_Task_MaintenanceRequest FOREIGN KEY (RequestID) REFERENCES MaintenanceRequest(RequestID),
    CONSTRAINT FK_Task_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
