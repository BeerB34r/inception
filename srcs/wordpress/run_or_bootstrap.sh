#!/bin/sh

_info() {
	echo "[INFO]" "$@"
}

_bootstrap() {
	cd /var/www/html

	wp core download
	wp config create \
		--dbname="${WORDPRESS_DB_NAME}" \
		--dbuser="${WORDPRESS_ADMIN_USER}" \
		--dbpass="${WORDPRESS_ADMIN_PASSWORD}" \
		--dbhost="mariadb:3306"
	wp core install \
		--url=localhost \
		--title=Inception \
		--admin_user="${WORDPRESS_ADMIN_USER}" \
		--admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
		--admin_email="${WORDPRESS_ADMIN_MAIL}" \
		--skip-email
	wp user create \
		--user_pass="${WORDPRESS_USER_PASSWORD}" \
		"${WORDPRESS_USER}" \
		"${WORDPRESS_USER_MAIL}"
}

_main() {
	if [ ! -f /var/www/html/index.php ]; then
		_info "Wordpress not initialised, bootstrapping..."
		_bootstrap
		_info "Bootstrapping complete!"
	else
		_info "Wordpress already initialised, skipping bootstrap..."
	fi

	exec php-fpm84 -F -O
}

_main
