#!/bin/bash

# Update HOST with actual value, uniquely generated by Docker on each start
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /u01/app/oracle/product/11.2.0/xe/network/admin/tnsnames.ora

while true; do
    pmon=`ps -ef | grep pmon_XE | grep -v grep`

    if [ "$pmon" == "" ]
        then
            date
            echo "Starting Oracle ..."
            /etc/init.d/oracle-xe start
        else
            echo "Oracle started"
    fi
    sleep 1m
done;
