-- these procedures can only be executed on admin side
CREATE OR REPLACE PACKAGE GamesAdminPackage
IS
    PROCEDURE AddHardware(pManufacturer Hardware.MANUFACTURER%type, pHardwareType Hardware.HARDWARE_TYPE%type, pName Hardware.NAME%type, pCost Hardware.COST%type);
    PROCEDURE RemoveHardware(pId Hardware.ID%type);
    PROCEDURE UpdateHardware(pId Hardware.ID%type, pManufacturer Hardware.MANUFACTURER%type, pHardwareType Games.HARDWARE_TYPE%type, pName Hardware.NAME%type, pCost Hardware.COST%type);

    PROCEDURE AddHardwareType(pName HardwareTypes.NAME%Type);
    PROCEDURE RemoveHardwareType(pId HardwareTypes.ID%type);
    PROCEDURE UpdateHardwareType(pId HardwareTypes.ID%type, pName HardwareTypes.NAME%Type);

    PROCEDURE AddManufacturer(pName Manufacturers.NAME%TYPE, pAddress Manufacturers.ADDRESS%TYPE, pPhone Manufacturers.PHONE_NUMBER%TYPE);
    PROCEDURE RemoveManufacturer(pId Manufacturers.ID%TYPE);
    PROCEDURE UpdateManufacturer(pId Manufacturers.ID%TYPE, pName Manufacturers.NAME%TYPE, pAddress Manufacturers.ADDRESS%TYPE, pPhone Manufacturers.PHONE_NUMBER%TYPE);

    PROCEDURE AddOrder(pHardware Orders.HARDWARE%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE);
    PROCEDURE RemoveOrder(pId Orders.ID%TYPE);
    PROCEDURE UpdateOrder(pId Orders.ID%TYPE, pHardware Orders.HARDWARE%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE);

    PROCEDURE AddClient(pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE);
    PROCEDURE RemoveClient(pId Clients.ID%TYPE);
    PROCEDURE UpdateClient(pId Clients.ID%TYPE, pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE);

    PROCEDURE AddStaff(pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE);
    PROCEDURE RemoveStaff(pId Staff.ID%TYPE);
    PROCEDURE UpdateStaff(pId Staff.ID%TYPE, pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE);

    PROCEDURE AddPosition(pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE);
    PROCEDURE RemovePosition(pId Positions.ID%TYPE);
    PROCEDURE UpdatePosition(pId Positions.ID%TYPE, pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE);
END;

CREATE OR REPLACE PACKAGE BODY GamesAdminPackage
IS
    PROCEDUREAddHardware(pManufacturer Hardware.MANUFACTURER%type, pHardwareType Hardware.HARDWARE_TYPE%type, pName Hardware.NAME%type, pCost Hardware.COST%type) IS
    BEGIN
        INSERT INTO Games(MANUFACTURER, HARDWARE_TYPE, NAME, COST) VALUES (pManufacturer, pHardwareType, pName, pCost);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveHardware(pId Hardware.ID%type) IS
    BEGIN
        DELETE FROM HARDWARE WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateHardware(pId Hardware.ID%type, pManufacturer Hardware.MANUFACTURER%type, pHardwareType Games.HARDWARE_TYPE%type, pName Hardware.NAME%type, pCost Hardware.COST%type) IS
    BEGIN
        UPDATE HARDWARE SET MANUFACTURER = pManufacturer, HARDWARE_TYPE = pHardwareType, NAME = pName, COST = pCost
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddHardwareType(pName HardwareTypes.NAME%Type) IS
    BEGIN
        INSERT INTO HardwareTypes(NAME) VALUES (pName);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveHardwareType(pId HardwareTypes.ID%type) IS
    BEGIN
        DELETE FROM HardwareTypes WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateHardwareType(pId HardwareTypes.ID%type, pName HardwareTypes.NAME%Type) IS
    BEGIN
        UPDATE HardwareTypes SET NAME = pName
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddManufacturer(pName Manufacturers.NAME%TYPE, pAddress Manufacturers.ADDRESS%TYPE, pPhone Manufacturers.PHONE_NUMBER%TYPE) IS
    BEGIN
        INSERT INTO Manufacturers(NAME, ADDRESS, PHONE_NUMBER) VALUES (pName, pAddress, pPhone);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveManufacturer(pId Manufacturers.ID%TYPE) IS
    BEGIN
        DELETE FROM Manufacturers WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    PROCEDURE UpdateManufacturer(pId Manufacturers.ID%TYPE, pName Manufacturers.NAME%TYPE, pAddress Manufacturers.ADDRESS%TYPE, pPhone Manufacturers.PHONE_NUMBER%TYPE) IS
    BEGIN
        UPDATE Manufacturers SET NAME = pName, ADDRESS = pAddress, PHONE_NUMBER = pPhone
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddOrder(pHardware Orders.HARDWARE%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE) IS
    BEGIN
        INSERT INTO Orders(HARDWARE, CLIENT, STAFF, ORDER_DATE) VALUES (pHardware, pClient, pStaff, pDate);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveOrder(pId Orders.ID%TYPE) IS
    BEGIN
        DELETE FROM Orders WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateOrder(pId Orders.ID%TYPE, pHardware Orders.HARDWARE%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE) IS
    BEGIN
        UPDATE Orders SET HARDWARE = pHardware, CLIENT = pClient, STAFF = pStaff, ORDER_DATE = pDate
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddClient(pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE) IS
    BEGIN
        INSERT INTO Clients (NAME, ADDRESS, PHONE_NUMBER, LOGIN, PASSWORD) VALUES (pName, pAddress, pPhone, pLogin, pPassword);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    PROCEDURE RemoveClient(pId Clients.ID%TYPE) IS
    BEGIN
        DELETE FROM Clients WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    PROCEDURE UpdateClient(pId Clients.ID%TYPE, pName Clients.NAME%TYPE, pAddress Clients.ADDRESS%TYPE, pPhone Clients.PHONE_NUMBER%TYPE, pLogin Clients.LOGIN%TYPE, pPassword Clients.PASSWORD%TYPE) IS
    BEGIN
        UPDATE Clients SET NAME = pName, ADDRESS = pAddress, PHONE_NUMBER = pPhone, LOGIN = pLogin, PASSWORD = pPassword
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ----
    PROCEDURE AddStaff(pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE) IS
    BEGIN
        INSERT INTO Staff(POSITION, PHONE_NUMBER, NAME) VALUES (pPosition, pPhone, pName);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemoveStaff(pId Staff.ID%TYPE) IS
    BEGIN
        DELETE FROM Staff WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdateStaff(pId Staff.ID%TYPE, pPosition Staff.POSITION%TYPE, pPhone Staff.PHONE_NUMBER%TYPE, pName Staff.NAME%TYPE) IS
    BEGIN
        UPDATE Staff SET POSITION = pPosition, PHONE_NUMBER = pPhone, NAME = pName
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
    ---
    PROCEDURE AddPosition(pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE) AS
    BEGIN
        INSERT INTO Positions(NAME, SALARY) VALUES (pName, pSalary);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE RemovePosition(pId Positions.ID%TYPE) AS
    BEGIN
        DELETE FROM Positions WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE UpdatePosition(pId Positions.ID%TYPE, pName Positions.NAME%TYPE, pSalary Positions.SALARY%TYPE) AS
    BEGIN
        UPDATE Positions SET NAME = pName, SALARY = pSalary
        WHERE ID = pId;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

END;

