#!/bin/sh

bootstrap() {
	chown -R mysql:mysql /var/lib/mysql
	mariadb-install-db --datadir=/var/lib/mysql/ --skip-test-db

	mariadbd --bootstrap << EOF
FLUSH PRIVILEGES;
CREATE USER ${DB_USER}@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* to ${DB_USER}@'%' WITH GRANT OPTION;
CREATE DATABASE ${DB_NAME};
USE ${DB_NAME};
FLUSH PRIVILEGES;
EOF
}

# database doesn't exist
if [ ! -d "/var/lib/mysql/mysql/" ]; then
	echo "Bootstrapping database..."
	bootstrap
else
	echo "Bootstrap not necessary, skipping..."
fi

export MARIADB_TLS_DISABLE_PEER_VERIFICATION=1
exec mariadbd --general-log-file=/dev/stderr
