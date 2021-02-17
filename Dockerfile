FROM debian:buster
# Up to date system
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget
#install systeme
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /etc/nginx/sites-available
COPY nginx.conf nginx.conf

WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

COPY config.inc.php phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
COPY wp-config.php /var/www/html

RUN openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Korea/L=Seoul/O=innoaca/OU=42seoul/CN=forhjy" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

RUN chown -R www-data:www-data *
RUN chmod -R 755 /var/www/*
COPY init.sh ./
CMD bash init.sh


# Perso

# -----
#	https://forhjy.medium.com/how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-1-75ddf3ede861
#	https://forhjy.medium.com/42-ft-server-how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-2-4042adb2ab2c

# ---------------------- command line
#docker build -t nginx .
#docker run -it --rm -p 80:80 nginx
# -----------------------------------
