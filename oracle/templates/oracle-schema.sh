#!/bin/bash

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID={{oracle_sid}}
export ORACLE_BASE=/u01/app/oracle
export PATH=$ORACLE_HOME/bin:$PATH

############################################################################################################
# Heure de démarrage du script en secondes pour nous permettre de calucler la durée d'exécution du script ##
############################################################################################################
START_TIME=$SECONDS
echo DEBUT TRAITEMENT: `date "+%Y-%m-%d %H:%M:%S"`

# 0 indique succès, 1 indique erreur du script
CODERETOK=0
CODERETKO=1

sqlplus sys/{{ oracle_system_pwd }} as sysdba @ $PWD/sql/role.sql
sqlplus sys/{{ oracle_system_pwd }} as sysdba @ $PWD/sql/tablespaces.sql
sqlplus sys/{{ oracle_system_pwd }} as sysdba @ $PWD/sql/user.sql
sqlplus sys/{{ oracle_system_pwd }} as sysdba @ $PWD/sql/io.sql

echo FIN TRAITEMENT: `date "+%Y-%m-%d %H:%M:%S"`
ELAPSED_TIME=$(($SECONDS - $START_TIME))
echo "DURATION=$ELAPSED_TIME"
exit $CODERETOK
