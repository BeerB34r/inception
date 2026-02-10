# User documentation

This project provides a simple LEMP (Linux, nginx, mariadb, php) stack. Three
docker containers speak to eachother over an isolated docker network, with port
443 exposed to the outside world.

# How to use

You are to provide a .env file in the root of the project containing (at least)
the following key-value pairs (replace `<placeholder>` with actual values):
```sh
DB_ROOT_PASSWORD="<placeholder>"
DB_NAME="<placeholder>"
DB_USER="<placeholder>"
DB_PASSWORD="<placeholder>"
WORDPRESS_DB_NAME="<placeholder>"
WORDPRESS_ADMIN_USER="<placeholder>"
WORDPRESS_ADMIN_PASSWORD="<placeholder>"
WORDPRESS_ADMIN_MAIL="<placeholder>"
WORDPRESS_USER="<placeholder>"
WORDPRESS_USER_PASSWORD="<placeholder>"
WORDPRESS_USER_MAIL="<placeholder>"
```
To start the project, run `make`. this will create a directory
`/home/mde-beer/data` which contains the persistent storage for the containers.
To stop the project without deleting persistent data, run `make down`.
To stop the project and delete persistent data, run `make clean`.

Once the project is up and running, you can access the website through
`https://localhost:443` (`https://mde-beer.42.fr:443` if `/etc/hosts` is
correctly configured, see `DEV_DOC.md` for how to configured `/etc/hosts`).

Your browser will say it is unsafe, ignore it.

to access the administrator page go to `https://localhost:443/wp-admin`
(`https://mde-beer.42.fr:443/wp-admin`) and log in using the admin user and
password as specified in the .env file.

to check if the services are running correctly, run `docker ps` in your
terminal. your output should look similar to this:
```sh
CONTAINER ID   IMAGE            COMMAND                  CREATED              STATUS     PORTS                                     NAMES
<hash>         srcs-nginx       "nginx -g 'daemon of…"   <time since start>   <uptime>   0.0.0.0:443->443/tcp, [::]:443->443/tcp   nginx
<hash>         srcs-wordpress   "/run_or_bootstrap.sh"   <time since start>   <uptime>   9000/tcp                                  wp-php
<hash>         srcs-mariadb     "/bootstrap_or_run.sh"   <time since start>   <uptime>   3306/tcp                                  mariadb
```


# Services
## Linux
Linux is a kernel that many operating systems use to handle the hardware
abstractions of a given computer. For this project, all of the services are
built upon the Alpine Linux distribution, which is minimal by design. Alpine was
chosen to reduce file sizes. It is otherwise arbitrary what Linux distribution
(OS) to use for the project.
## Nginx
Pronounced "engine x", nginx is a webserver. this means that it listens to
incoming traffic, and asks the other services to fulfill the requests it
recieves from the end user.
## Mariadb
Mariadb is there to manage the SQL database that the website requires to
function. It is here where user information, comments and posts are stored.
## Wordpress
Wordpress is essentially a toolbox for creating and managing websites. By
default it contains all of the infrastructure necessary to run a simple blogging
website. For this project, the default has not been changed.
### PHP
Wordpress is written in PHP, a general-purpose scripting language.
