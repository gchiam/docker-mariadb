docker-mariadb
==============

MariaDB on Docker

Docker index page: https://index.docker.io/u/gchiam/mariadb/

Includes a bunch of cool features such as:

 - Exporting volumes so your data persists.
 - Not running as root.
 - Printing log output.
 - Setting a root password.
 - Creating a user and database.
 - Passing extra parameters to mysqld.

Here's how it works:

    Build
    $ sudo docker build --tag=musashi/mariadb .
    RUN
    $ sudo docker run -d -v /var/lib/mariadb:/var/lib/mariadb:rw -name mariadb -e MYSQL_DATABASE=dashboard_prod -e MYSQL_ROOT_PASSWORD=ki9eingi musashi/mariadb

    $ mysql -h 127.0.0.1 -u root -p
    Enter password:
    Welcome to the MariaDB monitor.  Commands end with ; or \g.
    Your MariaDB connection id is 1
    Server version: 5.5.36-MariaDB-1~precise-log mariadb.org binary distribution

    Copyright (c) 2000, 2013, Oracle, Monty Program Ab and others.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    MariaDB [(none)]>

(Example assumes MySQL client is installed on Docker host.)

Environment variables
---------------------

 - `MYSQL_ROOT_PASSWORD`: The password for the root user, set every time the server starts. Defaults to a blank password, which is handy for development, but you should set this to something in production.
 - `MYSQL_DATABASE`: A database to automatically create if it doesn't exist. If not provided, does not create a database.
 - `MYSQL_USER`: A user to create that has access to the database specified by `MYSQL_DATABASE`.
 - `MYSQL_PASSWORD`: The password for `MYSQL_USER`. Defaults to a blank password.
 - `MYSQLD_ARGS`: extra parameters to pass to the mysqld process
