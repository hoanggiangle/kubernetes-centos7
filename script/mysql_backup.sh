#!/bin/bash

USER="user"
PASSWORD="password"
OUTPUT="/home/backup_directory"

rm -rf "$OUTPUT"/*.gz > /dev/null 2>&1

databases=`mysql --user=$USER --password=$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump --force --opt --user=$USER --password=$PASSWORD --databases $db > $OUTPUT/`date +%Y-%m-%d`.$db.sql
        gzip $OUTPUT/`date +%Y-%m-%d`.$db.sql
    fi
done