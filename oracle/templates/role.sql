set echo on
spool ./Create{{db_username}}Role.log

-- --------------------------------------
-- {{db_username}}
-- --------------------------------------
DROP ROLE {{db_username}}_ROLE;

CREATE ROLE {{db_username}}_ROLE NOT IDENTIFIED;
GRANT CREATE SESSION TO {{db_username}}_ROLE;
GRANT ALTER SESSION TO {{db_username}}_ROLE;
GRANT CONNECT TO {{db_username}}_ROLE;

GRANT CREATE ANY TABLE TO {{db_username}}_ROLE;
GRANT DROP ANY TABLE TO {{db_username}}_ROLE;
GRANT ALTER ANY TABLE TO {{db_username}}_ROLE;
GRANT CREATE ANY TYPE TO {{db_username}}_ROLE;
GRANT CREATE ANY VIEW TO {{db_username}}_ROLE;

GRANT CREATE SYNONYM TO {{db_username}}_ROLE;
GRANT DROP ANY SYNONYM TO {{db_username}}_ROLE;
GRANT CREATE PUBLIC SYNONYM TO {{db_username}}_ROLE;
GRANT DROP PUBLIC SYNONYM TO {{db_username}}_ROLE;

GRANT CREATE CLUSTER TO {{db_username}}_ROLE;
GRANT CREATE DIMENSION TO {{db_username}}_ROLE;
GRANT CREATE PUBLIC DATABASE LINK TO {{db_username}}_ROLE;
GRANT CREATE ROLE TO {{db_username}}_ROLE;
GRANT CREATE SEQUENCE TO {{db_username}}_ROLE;
GRANT CREATE SNAPSHOT TO {{db_username}}_ROLE;

GRANT CREATE PROCEDURE TO {{db_username}}_ROLE;
GRANT CREATE ANY TRIGGER TO {{db_username}}_ROLE;

GRANT RESOURCE TO {{db_username}}_ROLE;

spool off
exit 0
