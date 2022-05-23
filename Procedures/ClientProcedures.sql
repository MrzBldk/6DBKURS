CREATE OR REPLACE PACKAGE HardwareClientPackage
IS
    PROCEDURE AddOrder(pHardware Orders.HARDWARE%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE);
END;

CREATE OR REPLACE PACKAGE BODY HardwareClientPackage
IS
    PROCEDURE AddOrder(pHardware Orders.HARDWARE%TYPE, pClient Orders.CLIENT%TYPE, pStaff Orders.STAFF%TYPE, pDate Orders.ORDER_DATE%TYPE) IS
    BEGIN
        GamesAdminPackage.AddOrder(pHardware, pClient, pStaff, pDate);
        EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.put_line(sqlerrm);
    END;
END;

commit;