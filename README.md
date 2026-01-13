_This project has been created as part of the 42 curriculum by mde-beer_

# Description

Inception is the second dive into system administration within your typical
journey through the 42 curriculum. In it you must run a simple wordpress website
using docker and docker compose.

development of this project has happened almost exclusively over ssh while the
VM has been headless. as such, testing has also happened with w3m exclusively :3

# Instructions

## requirements
root privileges, gnu make (or similar) and docker

## how-to
To start the server, run
```bash
make
```
after some moments, the server should be up and running and the website
available at localhost:443 (or mde-beer.42.fr if /etc/hosts is configured)

# Resources

[Dockerfile reference documentation](docs.docker.com/reference/dockerfile)
[Alpine linux wiki](wiki.alpinelinux.org/wiki)
