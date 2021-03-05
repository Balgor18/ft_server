service mysql start

# website
touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

# SSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhostkey.key -subj "/C=FR/ST=France/L=Paris/O=Me/OU=42Paris/CN=fcatinau/emailAddress=fcatinau@student.42.fr"

# NGINX
mv ./tmp/nginx-conf /etc/nginx/sites-available/default

# MYSQL
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

# phpmyadmin
mkdir /var/www/html/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz --strip-components 1 -C /var/www/html/phpmyadmin
mv /tmp/config.inc.php /var/www/html/phpmyadmin/config.inc.php
rm -f /var/www/html/phpmyadmin/config.sample.inc.php

# wordpress
cd /tmp/
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv wordpress/ /var/www/html
mv /tmp/wp-config.php /var/www/html/wordpress
rm -f /var/www//html/wordpress/wp-config-sample.php
service php7.3-fpm start
service nginx start

sh /autoindex.sh
# Access
chown -R www-data /var/www/*
chmod -R 755 /var/www/*
#zsh
bash
