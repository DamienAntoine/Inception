#!/bin/bash

#wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

#chmod +x wp-cli.phar

#mv wp-cli.phar /usr/local/bin/wp

chmod 777 /var/www/html

chmod 777 /var/www/

cd /var/www/html

until mysql -h mariadb -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "SELECT 1;" "$MYSQL_DATABASE"; do
    echo "Waiting for MariaDB to be ready..."
    sleep 2
done

su www-data -s /bin/bash -c "
    cd /var/www/html
    wp core download
    wp core config --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$WORDPRESS_DB_HOST
    wp core install --url=$DOMAIN_NAME --title=$DOMAIN_NAME --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL
    wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD || echo 'User creation failed'

"

exec php-fpm -F
