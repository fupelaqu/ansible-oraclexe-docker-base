set echo on
spool ./Create{{db_schema}}Tablespaces.log

drop tablespace {{db_schema}}_DATA01 INCLUDING CONTENTS and datafiles CASCADE CONSTRAINTS;

create tablespace {{db_schema}}_DATA01
	datafile '/u01/app/oracle/oradata/XE/{{db_schema}}_DATA01.dbf'
	size 32m 
	autoextend on 
	next 32m --maxsize 128m
	extent management local;

drop tablespace {{db_schema}}_TEMP01 INCLUDING CONTENTS and datafiles CASCADE CONSTRAINTS;

create temporary tablespace {{db_schema}}_TEMP01
	tempfile '/u01/app/oracle/oradata/XE/{{db_schema}}_TEMP01.dbf'
	size 32m 
	autoextend on 
	next 32m --maxsize 128m
	extent management local;

drop tablespace TBS_{{db_schema}}_INDX01 INCLUDING CONTENTS and datafiles CASCADE CONSTRAINTS;

CREATE TABLESPACE T{{db_schema}}_INDX01
	DATAFILE '/u01/app/oracle/oradata/XE/{{db_schema}}_INDX01.dbf'
	SIZE 32M REUSE
	AUTOEXTEND ON 
	NEXT 32M --MAXSIZE 128M
	EXTENT MANAGEMENT LOCAL UNIFORM SIZE 4M
	SEGMENT SPACE MANAGEMENT AUTO;

select * from v$tablespace;

exit 0
