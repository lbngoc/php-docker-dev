#!/bin/bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.common.sh"

check_depedencies

if [ -f "./$SOURCE_DIR/wp-config.php" ];
then
	output "Wordpress has already installed at \"$SOURCE_DIR\"."
	output "If you want to install the new one, please rename or remove this folder."
else
	confirm_to_continue "Are you sure want to install Wordpress to \"$SOURCE_DIR\" [Yn]? "

	prepare_empty_dir $SOURCE_DIR
	output "# Running install scripts..." -i

	docker-compose run --rm --user "1000:1000" phpfpm wp core download
	docker-compose run --rm --user "1000:1000" phpfpm wp core config --dbhost=mysql --dbname=wordpress --dbuser=root --dbpass=password
fi
