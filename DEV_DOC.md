# Dev documentation

read `USER_DOC.md` first, most things are explained there.

# Requirements
docker, make
# What isnt covered by `USER_DOC.md`

to have your url match the default server name, append the following line to the
`/etc/hosts/` file:
```/etc/hosts
127.0.0.1   mde-beer.42.fr
```
to change the server name, edit the `server_name` variable in
`srcs/nginx/default.conf` and change `'/CN=mde-beer.42.fr'` to
`'/CN=<your server name>'`. the values should match. if you are changing the
server name, you might as well change it in `/etc/hosts` as well.

if for some god-forsaken reason you want to run the project directly, run:
```sh
mkdir -p /home/mde-beer/data/db
mkdir -p /home/mde-beer/data/website
docker compose --project-directory srcs up -d
```
and to close:
```sh
docker compose --project-directory srcs down
```
and finally to clean:
```sh
docker compose --project-directory srcs down --rmi local
sudo rm -rf /home/mde-beer/data
```

to change the data directory to somewhere else, edit the variables
`DB_DIR` and `WP_DIR` in the file `makefile`, and the values of
`volumes.website.driver_opts.device` and `volumes.db.driver_opts.device` in the
file `srcs/docker-compose.yml`.

`DB_DIR` and `volumes.db.driver_opts.device` should match.

`WP_DIR` and `volumes.website.driver_opts.device` should match.

if you are running the project manually (using docker compose), replace the
final arguments to `mkdir` with your new directories.

all persistent data is stored in these directories.

## docker mini-tutorial
check running containers:
`docker ps`

to create and access a shell in a running container:
`docker exec -i <container> sh`

to remove a running container:
`docker rm <container>`

check local images:
`docker images`

to remove an image:
`docker rmi <image>`

check local volumes:
`docker volume ls`

to remove a volume:
`docker volume rm <volume>`

for further information:
`docker help`

or run any of the previous commands with the `--help` flag
