BEGIN
DBMS_REDACT.ADD_POLICY(
     object_schema         => 'TEST',
     object_name           => 'Clients',
     column_name           => 'PHONE',
     policy_name           => 'redact_client_info',
     function_type         => DBMS_REDACT.REGEXP, /* Маскирование с помощью регулярного выражения */
     regexp_pattern	   => '\d+(\d{5})$', 
     regexp_replace_string => '******\1',
     regexp_position       => DBMS_REDACT.RE_BEGINNING,
     regexp_occurrence     => DBMS_REDACT.RE_ALL,
     expression            => 'SYS_CONTEXT(''SYS_SESSION_ROLES'',''SYSADMIN_ROLE'') = ''FALSE''',
     action                => DBMS_REDACT.ADD_COLUMN
);
END;

BEGIN
DBMS_REDACT.ALTER_POLICY(
     object_schema         => 'TEST',
     object_name           => 'Clients',
     column_name           => 'Adress',
     policy_name           => 'redact_client_info',
     function_type         => DBMS_REDACT.REGEXP, /* Маскирование с помощью регулярного выражения */
     regexp_pattern	   => '\d+(\d{0})$', 
     regexp_replace_string => '******\1',
     regexp_position       => DBMS_REDACT.RE_BEGINNING,
     regexp_occurrence     => DBMS_REDACT.RE_ALL,
     expression            => 'SYS_CONTEXT(''SYS_SESSION_ROLES'',''SYSADMIN_ROLE'') = ''FALSE''',
     action                => DBMS_REDACT.ADD_COLUMN
);
END;

BEGIN
DBMS_REDACT.ALTER_POLICY(
     object_schema         => 'TEST',
     object_name           => 'Clients',
     column_name           => 'Login',
     policy_name           => 'redact_client_info',
     function_type         => DBMS_REDACT.REGEXP, /* Маскирование с помощью регулярного выражения */
     regexp_pattern	   => '\d+(\d{0})$', 
     regexp_replace_string => '******\1',
     regexp_position       => DBMS_REDACT.RE_BEGINNING,
     regexp_occurrence     => DBMS_REDACT.RE_ALL,
     expression            => 'SYS_CONTEXT(''SYS_SESSION_ROLES'',''SYSADMIN_ROLE'') = ''FALSE''',
     action                => DBMS_REDACT.ADD_COLUMN
);
END;

BEGIN
DBMS_REDACT.ALTER_POLICY(
     object_schema         => 'TEST',
     object_name           => 'Clients',
     column_name           => 'Password',
     policy_name           => 'redact_client_info',
     function_type         => DBMS_REDACT.REGEXP, /* Маскирование с помощью регулярного выражения */
     regexp_pattern	   => '\d+(\d{0})$', 
     regexp_replace_string => '******\1',
     regexp_position       => DBMS_REDACT.RE_BEGINNING,
     regexp_occurrence     => DBMS_REDACT.RE_ALL,
     expression            => 'SYS_CONTEXT(''SYS_SESSION_ROLES'',''SYSADMIN_ROLE'') = ''FALSE''',
     action                => DBMS_REDACT.ADD_COLUMN
);
END;