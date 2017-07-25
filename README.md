# Docker Based Environment For PHP Developer

A simple Docker based development environment for PHP with some installer scripts for *NIX.

## Requirements

* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)

## Components

* Nginx
* PHPFPM
* MySQL
* Memcached (*)
* Elasticsearch (*)
* Mailcatcher (*)

(*) _Disabled by default in `docker-compose.yml`_

## Installer scripts

* WordPress: `./bin/setup-wp.sh`
* Roots Bedrock: `./bin/setup-bedrock.sh`

_Need more scripts ? Just create [new request here](http://github.com/lbngoc/php-docker-dev/issues)._

## Usage

* Create new project, remember to edit `<your_project_name>`

  ```
  $ PROJECT_NAME=<your_project_name>; \
  git clone git@github.com:lbngoc/php-docker-dev.git $PROJECT_NAME; \
  cd $PROJECT_NAME; \
  rm -rf .git; rm public_html/.gitkeep
  ```

* Init source code

  - For existing source code, just copy it to `public_html`

  - To setup to new website, you can call supported installer scripts.

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
