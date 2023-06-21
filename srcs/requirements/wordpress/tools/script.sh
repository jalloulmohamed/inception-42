#!/bin/bash

chown www-data:www-data /var/www/wordpress
chmod -R 775 /var/www/wordpress


mkdir -p /run/php/
chmod -R 775 /run/php/
chown root:root /run/php/

if [ ! -f /var/www/wordpress/wp-config.php ]; then
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress

mv /var/www/wp-config.php /var/www/wordpress/

sed -i "23s/db_name/$DB_NAME/" wp-config.php
sed -i "26s/db_user/$DB_USER/" wp-config.php
sed -i "29s/db_user_password/$DB_USER_PASSWORD/" wp-config.php
sed -i "32s/db_host/$DB_HOST/" wp-config.php

wp core download  --allow-root


wp core install --allow-root --url=${HOST} --title=${Titel} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASSWORD} --admin_email=${ADMIN_EMAIL}  --allow-root
wp user create ${_USER} ${_EMAIL} --user_pass=${_PASSWORD} --role=author --allow-root
wp plugin update --all --allow-root


fi

/usr/sbin/php-fpm7.4 -F 