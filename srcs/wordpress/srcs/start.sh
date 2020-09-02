curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chown -R www:www /var/lib/nginx
chown -R www:www /www

envsubst '${MYSQL_DB_NAME} ${MYSQL_USER} ${MYSQL_PASSWORD} ${MYSQL_DB_HOST}' < /tmp/wp-config.php > /www/wp-config.php
rm /tmp/wp-config.php
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

cd /www
su www -c "/tmp/wpinstall.sh"
rm -rf /root/.wp-cli
