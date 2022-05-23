BEGIN
    HardwareAdminPackage.AddPosition('Junior', 500);
    HardwareAdminPackage.AddPosition('Middle', 1500);
    HardwareAdminPackage.AddPosition('Senior', 4000);
END;
SELECT * FROM POSITIONS;

DECLARE
    JUN Positions.ID%TYPE;
    MID Positions.ID%TYPE;
    SEN Positions.ID%TYPE;
BEGIN
    Util.GETPOSITIONBYNAME('Junior', JUN);
    Util.GETPOSITIONBYNAME('Middle', MID);
    Util.GETPOSITIONBYNAME('Senior', SEN);

    HardwareAdminPackage.AddStaff( JUN, '375257554325', 'Miron');
    HardwareAdminPackage.AddStaff( MID, '375257554326', 'Slava');
    HardwareAdminPackage.AddStaff( SEN, '375257554327', 'Andrey');
END;
SELECT * FROM STAFF;

BEGIN
    HardwareAdminPackage.AddHarwareType('CPU');
    HardwareAdminPackage.AddHarwareType('GPU');
    HardwareAdminPackage.AddHarwareType('RAM');
    HardwareAdminPackage.AddHarwareType('HDD');
    HardwareAdminPackage.AddHarwareType('SDD');
end;
SELECT * FROM HARDWARETYPES;

BEGIN
   HardwareAdminPackage.AddManufacturer('Intel', 'Gercena, gastronom 22', '88005553535');
   HardwareAdminPackage.AddManufacturer('AMD', 'Pushkina, dom Kolotushkina', '88005553636');
   HardwareAdminPackage.AddManufacturer('Nvidia', 'Somewhere', '88005553737');
   HardwareAdminPackage.AddManufacturer('WD', 'Sverdlova 13a', '88005553838');
END;
SELECT * FROM SUPPLIERS;

BEGIN
    HardwareAdminPackage.AddHardware(1, 1, 'Core i5', 440);
    HardwareAdminPackage.AddHardware(2, 1, 'Ryzen 5', 610);
    HardwareAdminPackage.AddHardware(3, 2, 'RTX 3060', 2800);
    HardwareAdminPackage.AddHardware(4, 4, 'WD Blue', 140);
    HardwareAdminPackage.AddHardware(4, 5, 'WD Blue', 280);
end;
SELECT * FROM HARDWARE;

BEGIN
    HardwareAdminPackage.AddClient('Putin', 'Kremlin', '111111', 'putin', 'russia');
END;

SELECT * FROM CLIENTS;

commit;