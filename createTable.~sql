CREATE TABLE Department (
    DeptID INT,
    DeptName VARCHAR(50) NOT NULL,
    Budget INT NOT NULL,
    MaxCapacity INT NOT NULL,
    CurrentSize INT NOT NULL,
    CONSTRAINT PK_Department PRIMARY KEY (DeptID)
);

CREATE TABLE Employee (
    EmployeeID INT,
    Name VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(20) NOT NULL,
    CONSTRAINT Phone_Format CHECK (
    REGEXP_LIKE(PhoneNumber, '^(\d{3}-\d{3}-\d{4})$')),
        
    StartWork DATE NOT NULL,
    Salary INT NOT NULL,
    WorkingHours INT NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID),
    CONSTRAINT FK_Employee_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Equipment (
    EquipmentID INT,
    EquipmentName VARCHAR(50) NOT NULL,
    Place VARCHAR(50) NOT NULL,
    PurchaseDate DATE NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Equipment PRIMARY KEY (EquipmentID),
    CONSTRAINT FK_Equipment_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Location_ (
    LocationID INT,
    FloorID INT NOT NULL,
    AreaID VARCHAR(15) NOT NULL,
    Availability VARCHAR(10) NOT NULL,
    CONSTRAINT PK_Location PRIMARY KEY (LocationID)
);

CREATE TABLE MaintenanceRequest (
    RequestID INT,
    Urgency VARCHAR(10) NOT NULL,
    DeptID INT NOT NULL,
    LocationID INT NOT NULL,
    CONSTRAINT PK_MaintenanceRequest PRIMARY KEY (RequestID),
    CONSTRAINT FK_MaintenanceRequest_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID),
    CONSTRAINT FK_MaintenanceRequest_Location FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Task (
    RequestID INT,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,
    DeptID INT NOT NULL,
    CONSTRAINT PK_Task PRIMARY KEY (RequestID),
    CONSTRAINT FK_Task_MaintenanceRequest FOREIGN KEY (RequestID) REFERENCES MaintenanceRequest_(RequestID),
    CONSTRAINT FK_Task_Dept FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);
