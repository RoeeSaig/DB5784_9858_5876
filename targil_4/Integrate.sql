-- Drop the Request table if it exists
DROP TABLE Request;

-- Drop constraints from the Booking and ROOM tables
ALTER TABLE Booking DROP CONSTRAINT PK_Booking;
ALTER TABLE Booking DROP CONSTRAINT FK_BOOKING_ROOM_NUMBER;
ALTER TABLE ROOM DROP CONSTRAINT PK_ROOM;

-- Drop constraints from the Inform, ReservationAgent, and Receptionist tables
ALTER TABLE Inform DROP CONSTRAINT PK_INFORM;
ALTER TABLE Inform DROP CONSTRAINT FK_EM_ID_INFORM;
ALTER TABLE ReservationAgent DROP CONSTRAINT FK_RESERVATIONAGENT_EM_ID;
ALTER TABLE ReservationAgent DROP CONSTRAINT PK_RESERVATIONAGENT;
ALTER TABLE Receptionist DROP CONSTRAINT FK_RECEPTIONIST_EM_ID;
ALTER TABLE Receptionist DROP CONSTRAINT PK_RECEPTIONIST;


-- Step 1: Add a default value constraint to PhoneNumber if not already present
ALTER TABLE Employee MODIFY PhoneNumber DEFAULT '000-000-0000';

-- Step 2: Merge Data from Employee2 into Employee
MERGE INTO Employee e
USING (
    SELECT em_id, first_name || ' ' || last_name AS full_name, salary
    FROM Employee2
) e2
ON (e.EmployeeID = e2.em_id)
WHEN MATCHED THEN
    UPDATE SET e.Name = e2.full_name, e.Salary = e2.salary
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, Name, PhoneNumber, StartWork, Salary, WorkingHours, DeptID)
    VALUES (e2.em_id, e2.full_name, '000-000-0000', SYSDATE, e2.salary, 0, 1); -- Provide a default phone number

-- Step 3: Drop the Employee2 Table
DROP TABLE Employee2;


-- Drop room_number columns from ROOM and Booking tables
ALTER TABLE ROOM DROP COLUMN room_number;
ALTER TABLE Booking DROP COLUMN room_number;

-- Add a temporary column to ROOM, Booking, and Location_ tables to store row numbers
ALTER TABLE ROOM ADD temp INT;
ALTER TABLE Location_ ADD temp INT;
ALTER TABLE Booking ADD temp INT;

-- Update the temporary columns with row numbers
UPDATE ROOM SET temp = rownum;
UPDATE Location_ SET temp = rownum;
UPDATE Booking SET temp = rownum;

-- Add a LocationID column to the ROOM table and set up a foreign key constraint
ALTER TABLE ROOM ADD LocationID INT;
ALTER TABLE ROOM ADD CONSTRAINT FK_ROOM_LocationID FOREIGN KEY (LocationID) REFERENCES Location_(LocationID);

DECLARE
    v_location_count NUMBER;
    v_updated_count NUMBER := 0;
BEGIN
    -- Get the count of locations
    SELECT COUNT(*) INTO v_location_count FROM Location_;
    DBMS_OUTPUT.PUT_LINE('Location count: ' || v_location_count);

    -- Update the LocationID in ROOM table based on temp columns
    UPDATE ROOM r
    SET LocationID = (
        SELECT LocationID
        FROM Location_ l
        WHERE l.temp = MOD(r.temp - 1, v_location_count) + 1
    )
    WHERE r.LocationID IS NULL;

    v_updated_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Updated ' || v_updated_count || ' rooms.');

    -- Add primary key constraint to the ROOM table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE ROOM ADD CONSTRAINT PK_ROOM PRIMARY KEY (LocationID)';
        DBMS_OUTPUT.PUT_LINE('Primary key constraint added to ROOM table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2260 THEN  -- ORA-02260: table can have only one primary key
                DBMS_OUTPUT.PUT_LINE('Primary key constraint already exists on ROOM table.');
            ELSE
                RAISE;
            END IF;
    END;

    -- Add LocationID column to Booking table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Booking ADD LocationID INT';
        DBMS_OUTPUT.PUT_LINE('Column LocationID added successfully to Booking table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1430 THEN  -- ORA-01430: column being added already exists in table
                DBMS_OUTPUT.PUT_LINE('Column LocationID already exists in Booking table.');
            ELSE
                RAISE;
            END IF;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All operations completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;

ALTER TABLE Booking ADD CONSTRAINT FK_Booking_LocationID FOREIGN KEY (LocationID) REFERENCES Location_(LocationID);
DECLARE
    v_location_count NUMBER;
    v_updated_count NUMBER;
BEGIN
    -- Get the count of locations
    SELECT COUNT(*) INTO v_location_count FROM Location_;
    DBMS_OUTPUT.PUT_LINE('Location count: ' || v_location_count);
    
    -- Update the LocationID in Booking table based on temp columns
    UPDATE Booking b
    SET b.LocationID = (
        SELECT l.LocationID
        FROM Location_ l
        WHERE l.temp = CASE 
            WHEN MOD(b.temp - 1, v_location_count) = 0 THEN v_location_count 
            ELSE MOD(b.temp - 1, v_location_count)
        END
    )
    WHERE b.LocationID IS NULL;  -- Only update rows where LocationID is not set
    
    v_updated_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Update completed. ' || v_updated_count || ' bookings updated.');

    -- Add primary key constraint to the Booking table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Booking ADD CONSTRAINT PK_Booking PRIMARY KEY (LocationID, guest_id, entry_date)';
        DBMS_OUTPUT.PUT_LINE('Primary key constraint added to Booking table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2260 THEN  -- ORA-02260: table can have only one primary key
                DBMS_OUTPUT.PUT_LINE('Primary key constraint already exists on Booking table.');
            ELSE
                RAISE;
            END IF;
    END;
    
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All operations completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;


-- Drop the em_id columns from ReservationAgent, Receptionist, Booking, and Inform tables
ALTER TABLE ReservationAgent DROP COLUMN em_id;
ALTER TABLE Receptionist DROP COLUMN em_id;
ALTER TABLE Booking DROP COLUMN em_id;
ALTER TABLE Inform DROP COLUMN em_id;

-- Add a temporary column to EmployeeID, ReservationAgent, Receptionist, and Inform tables to store row numbers
ALTER TABLE Employee ADD temp INT;
ALTER TABLE ReservationAgent ADD temp INT;
ALTER TABLE Receptionist ADD temp INT;
ALTER TABLE Inform ADD temp INT;

-- Update the temporary columns with row numbers
UPDATE Employee SET temp = rownum;
UPDATE ReservationAgent SET temp = rownum;
UPDATE Receptionist SET temp = rownum;
UPDATE Inform SET temp = rownum;

-- Add an EmployeeID column to ReservationAgent table and set up a foreign key constraint
ALTER TABLE ReservationAgent ADD EmployeeID INT;
ALTER TABLE ReservationAgent ADD CONSTRAINT FK_ReservationAgent_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID);

DECLARE
    v_employee_count NUMBER;
    v_reservation_agent_count NUMBER;
    v_count NUMBER;
    v_updated_count NUMBER := 0;
BEGIN
    -- Get the count of employees
    SELECT COUNT(*) INTO v_employee_count FROM Employee;
    DBMS_OUTPUT.PUT_LINE('Employee count: ' || v_employee_count);
    
    -- Get the count of reservation agents
    SELECT COUNT(*) INTO v_reservation_agent_count FROM ReservationAgent;
    DBMS_OUTPUT.PUT_LINE('ReservationAgent count: ' || v_reservation_agent_count);
    
    -- Determine which count to use for the modulo operation
    v_count := LEAST(v_employee_count, v_reservation_agent_count);
    DBMS_OUTPUT.PUT_LINE('Count used for modulo: ' || v_count);
    
    -- Update the EmployeeID in ReservationAgent table
    UPDATE ReservationAgent ra
    SET EmployeeID = (
        SELECT e.EmployeeID
        FROM Employee e
        WHERE e.temp = CASE 
            WHEN MOD(ra.temp - 1, v_count) = 0 THEN v_count 
            ELSE MOD(ra.temp - 1, v_count)
        END
    )
    WHERE ra.EmployeeID IS NULL;
    
    v_updated_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Update completed. ' || v_updated_count || ' reservation agents updated.');

    -- Add primary key constraint to the ReservationAgent table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE ReservationAgent ADD CONSTRAINT PK_ReservationAgent PRIMARY KEY (EmployeeID)';
        DBMS_OUTPUT.PUT_LINE('Primary key constraint added to ReservationAgent table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2260 THEN  -- ORA-02260: table can have only one primary key
                DBMS_OUTPUT.PUT_LINE('Primary key constraint already exists on ReservationAgent table.');
            ELSE
                RAISE;
            END IF;
    END;

    -- Add an EmployeeID column to Receptionist table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Receptionist ADD EmployeeID INT';
        DBMS_OUTPUT.PUT_LINE('EmployeeID column added to Receptionist table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1430 THEN  -- ORA-01430: column being added already exists in table
                DBMS_OUTPUT.PUT_LINE('EmployeeID column already exists in Receptionist table.');
            ELSE
                RAISE;
            END IF;
    END;

    -- Set up a foreign key constraint on Receptionist table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Receptionist ADD CONSTRAINT Receptionist_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)';
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint added to Receptionist table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2275 THEN  -- ORA-02275: such a referential constraint already exists in the table
                DBMS_OUTPUT.PUT_LINE('Foreign key constraint already exists on Receptionist table.');
            ELSE
                RAISE;
            END IF;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All operations completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;


DECLARE
    v_employee_count NUMBER;
    v_receptionist_count NUMBER;
    v_count NUMBER;
    v_updated_count NUMBER := 0;
BEGIN
    -- Get the count of employees
    SELECT COUNT(*) INTO v_employee_count FROM Employee;
    DBMS_OUTPUT.PUT_LINE('Employee count: ' || v_employee_count);
    
    -- Get the count of receptionists
    SELECT COUNT(*) INTO v_receptionist_count FROM Receptionist;
    DBMS_OUTPUT.PUT_LINE('Receptionist count: ' || v_receptionist_count);
    
    -- Determine which count to use for the modulo operation
    v_count := LEAST(v_employee_count, v_receptionist_count);
    DBMS_OUTPUT.PUT_LINE('Count used for modulo: ' || v_count);
    
    -- Update the EmployeeID in Receptionist table
    UPDATE Receptionist r
    SET EmployeeID = (
        SELECT e.EmployeeID
        FROM Employee e
        WHERE e.temp = CASE 
            WHEN MOD(r.temp - 1, v_count) = 0 THEN v_count 
            ELSE MOD(r.temp - 1, v_count)
        END
    )
    WHERE r.EmployeeID IS NULL;
    
    v_updated_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Update completed. ' || v_updated_count || ' receptionists updated.');

    -- Add primary key constraint to the Receptionist table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Receptionist ADD CONSTRAINT PK_Receptionist PRIMARY KEY (EmployeeID)';
        DBMS_OUTPUT.PUT_LINE('Primary key constraint added to Receptionist table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2260 THEN  -- ORA-02260: table can have only one primary key
                DBMS_OUTPUT.PUT_LINE('Primary key constraint already exists on Receptionist table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add primary key constraint to Receptionist table: ' || SQLERRM);
            END IF;
    END;

    -- Add an EmployeeID column to Booking table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Booking ADD EmployeeID INT';
        DBMS_OUTPUT.PUT_LINE('EmployeeID column added to Booking table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1430 THEN  -- ORA-01430: column being added already exists in table
                DBMS_OUTPUT.PUT_LINE('EmployeeID column already exists in Booking table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add EmployeeID column to Booking table: ' || SQLERRM);
            END IF;
    END;

    -- Set up a foreign key constraint on Booking table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Booking ADD CONSTRAINT FK_Booking_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)';
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint added to Booking table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2275 THEN  -- ORA-02275: such a referential constraint already exists in the table
                DBMS_OUTPUT.PUT_LINE('Foreign key constraint already exists on Booking table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add foreign key constraint to Booking table: ' || SQLERRM);
            END IF;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All operations completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during the process: ' || SQLERRM);
        ROLLBACK;
END;


DECLARE
    v_employee_count NUMBER;
    v_booking_count NUMBER;
    v_count NUMBER;
    v_updated_count NUMBER := 0;
BEGIN
    -- Get the count of employees
    SELECT COUNT(*) INTO v_employee_count FROM Employee;
    DBMS_OUTPUT.PUT_LINE('Employee count: ' || v_employee_count);
    
    -- Get the count of bookings
    SELECT COUNT(*) INTO v_booking_count FROM Booking;
    DBMS_OUTPUT.PUT_LINE('Booking count: ' || v_booking_count);
    
    -- Determine which count to use for the modulo operation
    v_count := LEAST(v_employee_count, v_booking_count);
    DBMS_OUTPUT.PUT_LINE('Count used for modulo: ' || v_count);
    
    -- Update the EmployeeID in Booking table
    UPDATE Booking b
    SET EmployeeID = (
        SELECT e.EmployeeID
        FROM Employee e
        WHERE e.temp = CASE 
            WHEN MOD(b.temp - 1, v_count) = 0 THEN v_count 
            ELSE MOD(b.temp - 1, v_count)
        END
    )
    WHERE b.EmployeeID IS NULL;
    
    v_updated_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Update completed. ' || v_updated_count || ' bookings updated.');

    -- Add an EmployeeID column to Inform table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Inform ADD EmployeeID INT';
        DBMS_OUTPUT.PUT_LINE('EmployeeID column added to Inform table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1430 THEN  -- ORA-01430: column being added already exists in table
                DBMS_OUTPUT.PUT_LINE('EmployeeID column already exists in Inform table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add EmployeeID column to Inform table: ' || SQLERRM);
            END IF;
    END;

    -- Set up a foreign key constraint on Inform table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Inform ADD CONSTRAINT FK_Inform_EmployeeID FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)';
        DBMS_OUTPUT.PUT_LINE('Foreign key constraint added to Inform table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2275 THEN  -- ORA-02275: such a referential constraint already exists in the table
                DBMS_OUTPUT.PUT_LINE('Foreign key constraint already exists on Inform table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add foreign key constraint to Inform table: ' || SQLERRM);
            END IF;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All operations completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during the process: ' || SQLERRM);
        ROLLBACK;
END;

DECLARE
    v_employee_count NUMBER;
    v_inform_count NUMBER;
    v_count NUMBER;
    v_updated_count NUMBER := 0;
BEGIN
    -- Get the count of employees
    SELECT COUNT(*) INTO v_employee_count FROM Employee;
    DBMS_OUTPUT.PUT_LINE('Employee count: ' || v_employee_count);
    
    -- Get the count of inform records
    SELECT COUNT(*) INTO v_inform_count FROM Inform;
    DBMS_OUTPUT.PUT_LINE('Inform record count: ' || v_inform_count);
    
    -- Determine which count to use for the modulo operation
    v_count := LEAST(v_employee_count, v_inform_count);
    DBMS_OUTPUT.PUT_LINE('Count used for modulo: ' || v_count);
    
    -- Update the EmployeeID in Inform table
    UPDATE Inform i
    SET EmployeeID = (
        SELECT e.EmployeeID
        FROM Employee e
        WHERE e.temp = CASE 
            WHEN MOD(i.temp - 1, v_count) = 0 THEN v_count 
            ELSE MOD(i.temp - 1, v_count)
        END
    )
    WHERE i.EmployeeID IS NULL;
    
    v_updated_count := SQL%ROWCOUNT;
    DBMS_OUTPUT.PUT_LINE('Update completed. ' || v_updated_count || ' inform records updated.');

    -- Add primary key constraint to the Inform table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Inform ADD CONSTRAINT PK_Inform PRIMARY KEY (EmployeeID)';
        DBMS_OUTPUT.PUT_LINE('Primary key constraint added to Inform table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -2260 THEN  -- ORA-02260: table can have only one primary key
                DBMS_OUTPUT.PUT_LINE('Primary key constraint already exists on Inform table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add primary key constraint to Inform table: ' || SQLERRM);
            END IF;
    END;

    -- Add a temporary column to MaintenanceRequest_ table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE MaintenanceRequest_ ADD temp INT';
        DBMS_OUTPUT.PUT_LINE('Temporary column added to MaintenanceRequest_ table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1430 THEN  -- ORA-01430: column being added already exists in table
                DBMS_OUTPUT.PUT_LINE('Temporary column already exists in MaintenanceRequest_ table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add temporary column to MaintenanceRequest_ table: ' || SQLERRM);
            END IF;
    END;

    -- Add a temporary column to Guest table
    BEGIN
        EXECUTE IMMEDIATE 'ALTER TABLE Guest ADD temp INT';
        DBMS_OUTPUT.PUT_LINE('Temporary column added to Guest table.');
    EXCEPTION
        WHEN OTHERS THEN
            IF SQLCODE = -1430 THEN  -- ORA-01430: column being added already exists in table
                DBMS_OUTPUT.PUT_LINE('Temporary column already exists in Guest table.');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Failed to add temporary column to Guest table: ' || SQLERRM);
            END IF;
    END;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('All operations completed successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred during the process: ' || SQLERRM);
        ROLLBACK;
END;


-- Update the temporary columns with row numbers
UPDATE MaintenanceRequest_ SET temp = rownum;
UPDATE Guest SET temp = rownum;

-- Add a guest_id column to MaintenanceRequest_ table and set up a foreign key constraint
ALTER TABLE MaintenanceRequest_ ADD guest_id INT;
ALTER TABLE MaintenanceRequest_ ADD CONSTRAINT FK_MaintenanceRequest_Guest FOREIGN KEY (guest_id) REFERENCES Guest(guest_id);

DECLARE
    v_guest_count NUMBER;
    v_maintenance_request_count NUMBER;
    v_count NUMBER;
BEGIN
    -- Get the count of guests
    SELECT COUNT(*) INTO v_guest_count FROM Guest;
    
    -- Get the count of maintenance requests
    SELECT COUNT(*) INTO v_maintenance_request_count FROM MaintenanceRequest_;
    
    -- Determine which count to use for the modulo operation
    v_count := LEAST(v_guest_count, v_maintenance_request_count);

    -- Update the guest_id in MaintenanceRequest_ table
    FOR mr IN (SELECT temp FROM MaintenanceRequest_)
    LOOP
        UPDATE MaintenanceRequest_
        SET guest_id = (
            SELECT g.guest_id
            FROM Guest g
            WHERE g.temp = MOD(mr.temp - 1, v_count) + 1
        )
        WHERE temp = mr.temp;
    END LOOP;

    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        ROLLBACK;
END;
