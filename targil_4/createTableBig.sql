CREATE TABLE Guest
(
  guest_id INT NOT NULL,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  phone VARCHAR(11) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (guest_id)
);

CREATE TABLE Location
(
  FlootID INT NOT NULL,
  AreaID VARCHAR(15) NOT NULL,
  Availability VARCHAR(10) NOT NULL,
  LocationID INT NOT NULL,
  PRIMARY KEY (LocationID)
);

CREATE TABLE Department
(
  DeptID INT NOT NULL,
  DeptName VARCHAR(50) NOT NULL,
  Budget INT NOT NULL,
  MaxCapacity INT NOT NULL,
  CurrentSize INT NOT NULL,
  PRIMARY KEY (DeptID)
);

CREATE TABLE Equipment
(
  EquipmentID INT NOT NULL,
  EquipmentName VARCHAR(50) NOT NULL,
  Place VARCHAR(50) NOT NULL,
  PurchaseDate DATE NOT NULL,
  DeptID INT NOT NULL,
  PRIMARY KEY (EquipmentID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Room
(
  price INT NOT NULL,
  balcony VARCHAR(4) NOT NULL,
  beds INT NOT NULL,
  LocationID INT NOT NULL,
  PRIMARY KEY (LocationID),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

CREATE TABLE Employee
(
  EmployeeID INT NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Salary INT NOT NULL,
  PhoneNumber VARCHAR(20) NOT NULL,
  StartWork DATE NOT NULL,
  WorkingHours INT NOT NULL,
  DeptID INT NOT NULL,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE ReservationAgent
(
  tech_proficiency VARCHAR(15) NOT NULL,
  rating INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Receptionist
(
  shift VARCHAR(10) NOT NULL,
  lang VARCHAR(20) NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Booking
(
  days INT NOT NULL,
  entry_date DATE NOT NULL,
  guest_id INT NOT NULL,
  LocationID INT NOT NULL,
  EmployeeID INT NOT NULL,
  PRIMARY KEY (entry_date, guest_id, LocationID),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
  FOREIGN KEY (LocationID) REFERENCES Room(LocationID),
  FOREIGN KEY (EmployeeID) REFERENCES Receptionist(EmployeeID)
);

CREATE TABLE MaintenaceRequest
(
  Urgency VARCHAR(10) NOT NULL,
  RequestID INT NOT NULL,
  guest_id INT,
  LocationID INT NOT NULL,
  DeptID INT NOT NULL,
  PRIMARY KEY (RequestID),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Task
(
  StartDate DATE NOT NULL,
  EndDate DATE NOT NULL,
  Status VARCHAR(20) NOT NULL,
  RequestID INT NOT NULL,
  DeptID INT NOT NULL,
  PRIMARY KEY (RequestID),
  FOREIGN KEY (RequestID) REFERENCES MaintenaceRequest(RequestID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Inform
(
  EmployeeID INT NOT NULL,
  guest_id INT NOT NULL,
  PRIMARY KEY (EmployeeID, guest_id),
  FOREIGN KEY (EmployeeID) REFERENCES ReservationAgent(EmployeeID),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id)
);
