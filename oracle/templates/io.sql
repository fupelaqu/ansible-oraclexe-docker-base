set echo on
spool ./Create{{db_schema}}IO.log

create or replace directory import{{db_schema}}DB as '/u01/app/oracle/import{{db_schema}}DB';
grant read,write on DIRECTORY import{{db_schema}}DB to {{db_username}};
grant imp_full_database to {{db_username}};
grant exp_full_database to {{db_username}};

spool off
exit 0
