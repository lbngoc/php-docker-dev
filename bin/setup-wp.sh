#!/bin/bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.common.sh"

# check_depedencies

if [ -f "/var/www/html/wp-config.php" ];
then
	output "Wordpress has already installed at \"$SOURCE_DIR\"." -i
	output "If you want to install the new one, please rename or remove this folder."
else
	confirm_to_continue "Are you sure want to install Wordpress to \"$SOURCE_DIR\" [Yn]? "

	# prepare_empty_dir "/var/www/html"
	rm -f "/var/www/html/.gitkeep"
	check_empty_dir "/var/www/html" "Sorry, but \"$SOURCE_DIR\" is not empty, please backup your data before continue."
	output "# Running install scripts..." -i

	wp core download && \
	wp core config --dbhost=mysql --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD && \
	output "Wordpress is installed successfully." -s && \
	touch /var/www/html/.gitkeep
fi
