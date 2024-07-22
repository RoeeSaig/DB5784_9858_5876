CREATE VIEW EmployeeDetails AS
SELECT 
    e.EmployeeID,
    e.Name,
    e.Salary,
    e.PhoneNumber,
    e.StartWork,
    e.WorkingHours,
    d.DeptName,
    d.Budget,
    d.MaxCapacity,
    d.CurrentSize,
    r.shift AS ReceptionistShift,
    r.lang AS ReceptionistLanguage,
    ra.tech_proficiency AS ReservationAgentTechProficiency,
    ra.rating AS ReservationAgentRating
FROM 
    Employee e
JOIN 
    Department d ON e.DeptID = d.DeptID
LEFT JOIN 
    Receptionist r ON e.EmployeeID = r.EmployeeID
LEFT JOIN 
    ReservationAgent ra ON e.EmployeeID = ra.EmployeeID;
    
SELECT 
    EmployeeID, 
    Name, 
    DeptName, 
    Salary
FROM 
    EmployeeDetails;
    
    
SELECT 
    EmployeeID, 
    Name, 
    ReceptionistShift, 
    ReceptionistLanguage
FROM 
    EmployeeDetails
WHERE 
    ReceptionistShift IS NOT NULL;
    
    
    
CREATE VIEW GuestDetails AS
SELECT 
    g.guest_id,
    g.first_name,
    g.last_name,
    g.phone,
    g.date_of_birth,
    b.days AS BookingDays,
    b.entry_date AS BookingEntryDate,
    b.LocationID AS BookingLocationID,
    l.FloorID,
    l.AreaID,
    l.Availability
FROM 
    Guest g
LEFT JOIN 
    Booking b ON g.guest_id = b.guest_id
LEFT JOIN 
    Location_ l ON b.LocationID = l.LocationID;
    
    
SELECT 
    guest_id, 
    first_name, 
    last_name, 
    BookingEntryDate, 
    BookingDays, 
    AreaID
FROM 
    GuestDetails;
    
    
SELECT 
    guest_id, 
    first_name, 
    last_name, 
    phone
FROM 
    GuestDetails
WHERE 
    BookingEntryDate IS NULL;
