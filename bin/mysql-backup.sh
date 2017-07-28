#!/bin/bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.common.sh"

FILENAME="${MYSQL_DATABASE}_$(date +%Y%m%d-%H%M%S).sql.gz"

output "# Exporting your database..." -i
confirm_to_continue "Backup file will be saved to \"data/dumps/$FILENAME\" [Yn]? "

mysqldump -hmysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE | gzip -c > "/docker/dumps/$FILENAME"

output "Success." -s
