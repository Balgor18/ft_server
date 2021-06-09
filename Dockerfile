FROM debian:buster
# Up to date system

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install php7.3-fpm php7.3-mysql
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server

COPY ./srcs/init.sh ./
COPY ./srcs/auto_index.sh /tmp/
COPY ./srcs/edf.php /var/www/html
COPY ./srcs/nginx.conf /tmp/nginx.conf
COPY ./srcs/serv_auto_off.conf /tmp/serv_auto_off.conf
COPY ./srcs/config.inc.php /tmp/config.inc.php
COPY ./srcs/wp-config.php /tmp/wp-config.php

ENV AUTOINDEX on
CMD bash init.sh

EXPOSE 443 80

# docker system prune
# docker build -t nginx .
# docker run -it --rm -p 80:80 -p 443:443 nginx
# docker run -it --env AUTOINDEX=off -p 443:443 -p 80:80 nginx
