#!/bin/bash

if [[ "$1" == "--update-root"  ]]; then
	sed -i "s/root \/var\/www\/html;/root \/var\/www\/html\/web;/g" ./config/nginx/default.conf
	exit 0
fi

####################
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.common.sh"

# check_depedencies

if [ -f "/var/www/html/web/wp-config.php" ];
then
	output "Bedrock has already installed at \"$SOURCE_DIR\"." -i
	output "If you want to install the new one, please rename or remove this folder."
else
	confirm_to_continue "Are you sure want to install Bedrock to \"$SOURCE_DIR\" [Yn]? "

	rm -f "/var/www/html/.gitkeep"
	check_empty_dir "/var/www/html" "Sorry, but \"$SOURCE_DIR\" is not empty, please backup your data before continue."

	output "# Running install scripts..." -i
  composer create-project roots/bedrock /var/www/html && \

  output "Bedrock is installed successfully." -s && \
  output "Please update your \".env\" file before run wordpress installer." && \
  touch /var/www/html/.gitkeep
fi
