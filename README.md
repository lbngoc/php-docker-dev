# Docker Based Environment For PHP Developer

A simple Docker based development environment for PHP with some installer scripts for *NIX.

## Requirements

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [NodeJS, NPM](https://nodejs.org) (for running scripts cross platforms)

## Components

* Nginx
* PHPFPM
* MySQL
* Memcached (*)
* Elasticsearch (*)
* Mailcatcher (*)

(*) _Disabled by default in `docker-compose.yml`_

## Built-in Scripts

* SSH to docker container: `npm run ssh` or `npm run ssh-root`
* Install WordPress: `npm run setup-wordpress`
* Install Roots Bedrock: `npm run setup-bedrock`
* Backup MySQL databse: `npm run mysql-backup`
* Restore MySQL database: `npm run mysql-restore`

_Need more scripts ? Just create [new request here](http://github.com/lbngoc/php-docker-dev/issues)._

## Usage

* Create new project, remember to edit `<your_project_name>`

  - **NPM** (Windows, OSX, Linux)
  
  ```
  $ npm install -g create-project
  $ create-project <your_project_name> lbngoc/php-docker-dev
  ```

  - **Git & Bash** (*NIX)

  ```
  $ PROJECT_NAME=<your_project_name>; \
  git clone git@github.com:lbngoc/php-docker-dev.git $PROJECT_NAME; \
  cd $PROJECT_NAME; rm -rf .git
  ```

* Init source code

  - For existing source code, just copy it to `public_html`

  - To setup to new website, you can use [built-in setup scripts](#built-in-scripts).

* Start docker container `docker-compose up`

* Navigate to `http://localhost` in a browser to open your project.

  - If you want to use a domain other t
  han `http://localhost`, you'll need to:

    + Add an entry to your hosts file. Ex: `127.0.0.1 your_domain.dev`

    + Update `docker-local.dev` in `docker-compose.yml` and restart docker container.

## Referrences

* [wp-local-docker](https://github.com/10up/wp-local-docker)
* [Bedrock](https://github.com/roots/bedrock)

## Maintainer

* [Luong Bao Ngoc](http://ngoclb.com)
