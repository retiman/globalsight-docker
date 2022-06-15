# globalsight-docker

Dockerfiles for quickly getting a demo of [GlobalSight](http://www.globalsight.com/wiki/index.php/Main_Page) up and running.  Also runs phpMyAdmin in case you want to quickly
inspect the database.

![GlobalSight](globalsight.png?raw=true "GlobalSight")

## Usage

1. Run `docker-compose up`.
1. View the [GlobalSight UI](http://localhost:8080).  Login with user `superadmin` and password `password`.
1. View the database with [phpMyAdmin](http://localhost:8081).

GlobalSight's installer creates the MySQL tables when it first runs; to wipe the database and recreate the tables,
remove the `./data/init/database-created` file and start the container again.

## License

This project is under the MIT license.  It uses [wait-for-it.sh](https://github.com/vishnubob/wait-for-it), which is
also MIT licensed.
