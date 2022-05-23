-- All hardware
CREATE SEQUENCE HardwareIdSequence;
CREATE TABLE Hardware
(
    ID INT DEFAULT HardwareIdSequence.nextval PRIMARY KEY,
    MANUFACTURER INT NOT NULL,
    HARDWARE_TYPE INT NOT NULL,
    NAME NVARCHAR2 (50) NOT NULL,
    COST NUMBER CHECK ( COST > 0 ) NOT NULL
);

-- Hardware types
CREATE SEQUENCE HardwareTypesIdSequence;
CREATE TABLE HardwareTypes
(
    ID INT DEFAULT HardwareTypesIdSequence.nextval PRIMARY KEY,
    NAME NVARCHAR2 (50) UNIQUE,
);

-- Hardware manufaturers
CREATE SEQUENCE ManufacturersIdSequence;
CREATE TABLE Manufacturers
(
    ID INT DEFAULT ManufacturersIdSequence.nextval PRIMARY KEY,
    NAME NVARCHAR2 (50) UNIQUE,
    ADDRESS NVARCHAR2 (70) NOT NULL,
    PHONE_NUMBER NVARCHAR2 (20) NOT NULL
);

-- Client's orders
CREATE SEQUENCE OrdersIdSequence;
CREATE TABLE Orders
(
    ID INT DEFAULT OrdersIdSequence.nextval PRIMARY KEY,
    HARDWARE INT NOT NULL,
    CLIENT INT NOT NULL,
    STAFF INT NOT NULL,
    ORDER_DATE DATE DEFAULT SYSDATE NOT NULL
);

-- Shop clients
CREATE SEQUENCE ClientsSequence;
CREATE TABLE Clients
(
    ID INT DEFAULT ClientsSequence.nextval PRIMARY KEY,
    NAME NVARCHAR2(50) NOT NULL,
    ADDRESS NVARCHAR2(70) NOT NULL,
    PHONE_NUMBER NVARCHAR2(50) NOT NULL,
    LOGIN NVARCHAR2(50) UNIQUE NOT NULL,
    PASSWORD NVARCHAR2(50) CHECK ( LENGTH(PASSWORD) > 8 )
);

-- Staff data
CREATE SEQUENCE StaffSequence;
CREATE TABLE Staff
(
    ID INT DEFAULT StaffSequence.nextval PRIMARY KEY,
    POSITION INT NOT NULL,
    PHONE_NUMBER NVARCHAR2 (50) NOT NULL,
    NAME NVARCHAR2(50) NOT NULL
);

-- Positions
CREATE SEQUENCE PositionSequence;
CREATE TABLE Positions
(
    ID INT DEFAULT PositionSequence.nextval PRIMARY KEY,
    NAME NVARCHAR2(50) NOT NULL,
    SALARY INT NOT NULL CHECK ( SALARY > 0 )
);

ALTER TABLE Hardware ADD CONSTRAINT HardwareFkManufacturer FOREIGN KEY (MANUFACTURER) REFERENCES Manufacturers(ID); -- Hardware + manufacturers
ALTER TABLE Hardware ADD CONSTRAINT HarwareFkType FOREIGN KEY (HARDWARE_TYPE) REFERENCES HardwareTypes(ID); -- Hardware + types

ALTER TABLE Orders ADD CONSTRAINT OrdersFkHardware FOREIGN KEY (Hardware) REFERENCES Games(ID); -- Orders + games
ALTER TABLE Orders ADD CONSTRAINT OrdersFkClient FOREIGN KEY (CLIENT) REFERENCES Clients(ID); -- Orders + clients
ALTER TABLE Orders ADD CONSTRAINT OrdersFkStaff FOREIGN KEY (STAFF) REFERENCES Staff(ID); -- Orders + staff

ALTER TABLE Staff ADD CONSTRAINT StaffFkPosition FOREIGN KEY (POSITION) REFERENCES Positions(ID); -- Staff + positions

ALTER TABLE Staff DROP CONSTRAINT StaffFkPosition;
ALTER TABLE Hardware DROP CONSTRAINT HardwareFkManufacturer;
ALTER TABLE Hardware DROP CONSTRAINT HarwareFkType;
ALTER TABLE Orders DROP CONSTRAINT OrdersFkGame;
ALTER TABLE Orders DROP CONSTRAINT OrdersFkClient;
ALTER TABLE Orders DROP CONSTRAINT OrdersFkStaff;

commit;

DROP TABLE Staff;
DROP TABLE Positions;
DROP TABLE Clients;
DROP TABLE Orders;
DROP TABLE Manufacturers;
DROP TABLE HardwareTypes;
DROP TABLE Hardware;

DROP SEQUENCE HardwareIdSequence;
DROP SEQUENCE HardwareTypesIdSequence;
DROP SEQUENCE ManufacturersIdSequence;
DROP SEQUENCE OrdersIdSequence;
DROP SEQUENCE ClientsSequence;
DROP SEQUENCE StaffSequence;
DROP SEQUENCE PositionSequence;