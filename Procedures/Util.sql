CREATE OR REPLACE PACKAGE Util
IS
    PROCEDURE GetPositionByName(pName Positions.NAME%TYPE, outId OUT Positions.ID%TYPE);
    PROCEDURE GetGameTypeByName(pName GameTypes.NAME%TYPE, outId OUT GameTypes.ID%TYPE);
    PROCEDURE GetAuthorByName(pName Authors.NAME%TYPE, outId OUT Authors.ID%TYPE);
    PROCEDURE GetSupplierByName(pName Suppliers.NAME%TYPE, outId OUT Suppliers.ID%TYPE);
    PROCEDURE GetGameByName(pName Games.NAME%TYPE, outId OUT Games.ID%TYPE);

    -- -- For HudeData.sql
    -- FUNCTION RandomString(length int) RETURN VARCHAR2;
    -- FUNCTION RandomChar RETURN CHAR;
END;

REATE OR REPLACE PACKAGE BODY Util
IS
    PROCEDURE GetPositionByName(pName Positions.NAME%TYPE, outId OUT Positions.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Positions WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetHardwareTypeByName(pName HardwareTypes.NAME%TYPE, outId OUT HardwareTypes.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM HardwareTypes WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetManufacturerByName(pName Manufacturer.NAME%TYPE, outId OUT Manufacturer.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Manufacturers WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    PROCEDURE GetHardwareByName(pName Hardware.NAME%TYPE, outId OUT Hardware.ID%TYPE) IS
        CURSOR cur IS SELECT ID FROM Hardware WHERE NAME = pName;
    BEGIN
        OPEN cur;
        FETCH cur INTO outID ;
        CLOSE cur;
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;

    -- FUNCTION RandomChar RETURN CHAR IS
    -- BEGIN
    --     RETURN chr(dbms_random.value(65, 90));
    -- END;

    -- FUNCTION RandomString(length int) RETURN VARCHAR2 IS
    --     OUTPUT VARCHAR2(50);
    -- BEGIN
    --     FOR I IN 1..length LOOP
    --         OUTPUT := OUTPUT || RandomChar();
    --     END LOOP;
    --     RETURN OUTPUT;
    -- END;
END;