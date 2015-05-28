set echo on
spool ./Create{{db_schema}}User.log

DROP USER {{db_username}} CASCADE;

-- --------------------------------------
-- Utilisateur : {{db_username}}
-- Proprietaire de tout le schema
-- --------------------------------------
CREATE USER {{db_username}} IDENTIFIED BY {{db_password}} DEFAULT TABLESPACE {{db_schema}}_DATA01 TEMPORARY TABLESPACE {{db_schema}}_TEMP01;

GRANT {{db_username}}_ROLE, UNLIMITED TABLESPACE TO {{db_username}};

spool off
exit 0
