set timing on serveroutput on

begin
for Lcntr IN 1..100000
loop
    HardwareAdminPackage.AddStaff( SEN, '375257554327', 'Andrey');
end loop;
end;


select * from staff;

declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from staff where id > 50000 and id < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;

create index staff_id on staff(id, name);



declare
    t1 number := dbms_utility.get_time();
begin
    for r in (select * from staff where id > 50000 and id < 70000) loop null; end loop; 
    dbms_output.put_line('query elapsed: '||(dbms_utility.get_time() - t1)/100); 
end;
drop index staff_id;


select * from staff;