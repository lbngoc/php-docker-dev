#!/bin/bash

source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/.common.sh"

check_depedencies
check_command_exists "composer --version" "Composer is not found. Please install composer first."

if [ -f "./$SOURCE_DIR/web/wp-config.php" ];
then
	output "Bedrock has already installed at \"$SOURCE_DIR\"."
	output "If you want to install the new one, please rename or remove this folder."
else
	confirm_to_continue "Are you sure want to install Bedrock to \"$SOURCE_DIR\" [Yn]? "

 #  composer --version 2>&1 >/dev/null
	# COMPOSER_IS_AVAILABLE=$?
	COMPOSER_CMD="composer"
	# if [ ! $COMPOSER_IS_AVAILABLE -eq 0 ]; then
	# 	echo "...downloading composer"
	# 	# Download and install composer
	# 	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	# 	php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
 #    php composer-setup.php --install-dir=bin
 #    php -r "unlink('composer-setup.php');"
 #    COMPOSER_CMD="php ./bin/composer.phar"
 # fi

	prepare_empty_dir $SOURCE_DIR

	output "# Running install scripts..." -i
  $COMPOSER_CMD create-project roots/bedrock ./$SOURCE_DIR

	# Change document root of nginx
	sed -i "s/root \/var\/www\/html;/root \/var\/www\/html\/web;/g" ./config/nginx/default.conf

  output "Bedrock is installed successfully !" -s
  output "Please update your \".env\" file before run wordpress installer."
fi
