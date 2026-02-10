_This project has been created as part of the 42 curriculum by mde-beer_

# Description

Inception is the second dive into system administration within your typical
journey through the 42 curriculum. In it you must run a simple wordpress website
using docker and docker compose.

Development of this project has happened almost exclusively over ssh while the
VM has been headless. As such, testing has also happened with w3m, curl and wget
exclusively :3

# Instructions

## requirements
Root privileges, gnu make (or similar) and docker

## how-to
To start the server, run
```bash
make
```
After some moments, the server should be up and running and the website
available at https://localhost:443 (or https://mde-beer.42.fr:443 if /etc/hosts
is configured, see `DEV_DOC.md`)

# Project description
## VMs vs Docker containers
While both virtual machines and docker containers create isolated environments
from the host, docker containers are orders of magnitude smaller. The main
reason why is because docker containers generally share more resources with
eachother and the host than virtual machines do.

## Secrets vs environment variables
Secrets and environment variables (when handled properly) solve the same
problem, that is letting processes access protected resources (password
protected databases for instance). The main difference is that secrets are often
encrypted and environment variables tend not to be, and as such are a bit less
secure. For the purposes of this project however, environment variables are
sufficient.

## Docker network vs Host network
When docker is spun up with a network, this is only made available to the
containers themselves, so that they may communicate with eachother. Containers
(unless otherwise specified) only have limited access to the host network, and
can't directly communicate with the host. This can be remedied by exposing ports
to the host.

## Docker volumes vs Bind mounts
Bind mounts take a directory on the host system and exposes it to the docker
container at a given location within the container. In general, this makes it
slightly more difficult to manage the data using dockers tools. Named volumes
make the management of the volumes themselves a breeze, but makes it harder to
fiddle around with the contained files manually. The local driver is capable of
bridging this gap and giving you essentially the best of both worlds.

# Resources

- [Dockerfile reference documentation](docs.docker.com/reference/dockerfile)
- [Alpine linux wiki](wiki.alpinelinux.org/wiki)
- [Nginx documentation](nginx.org/en/docs)
- [Wordpress documentation](wordpress.org/documentation)
- [Mariadb documentation](mariadb.com/docs)

AI was not used for this project. RTFM.
