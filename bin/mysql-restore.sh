#!/bin/bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.common.sh"

BACKUP_DIR=/docker/dumps
FILENAME="${MYSQL_DATABASE}_$(date +%Y%m%d-%H%M%S).sql.gz"

output "# List of backup files in \"data/dumps\":" -i
ls $BACKUP_DIR | grep -E "\.sql(\.gz)?$"
FILENAME=$(input "Select backup file: ")

if [[ ! -f "$BACKUP_DIR/$FILENAME" ]]; then
	output "File does not exits." -e &&	exit 1
fi

confirm_to_continue "Are you sure want to restore this file and OVERRIDE CURRENT DATABASE [Yn]? "

output "Restoring your database..."

if [[ $FILENAME =~  ^.*\.sql\.gz$ ]]; then
	gunzip < "$BACKUP_DIR/$FILENAME" | mysql -hmysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
else
	mysql -hmysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE < "$BACKUP_DIR/$FILENAME"
fi

output "Success." -s
