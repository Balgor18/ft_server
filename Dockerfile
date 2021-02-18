FROM debian:buster
# Up to date system

RUN apt-get update && apt-get install -y procps && apt-get install nano && apt-get install -y wget
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server

COPY ./srcs/init.sh ./
COPY ./srcs/nginx-conf /tmp/nginx-conf
COPY ./srcs/config.inc.php /tmp/config.inc.php
COPY ./srcs/wp-config.php /tmp/wp-config.php

CMD bash init.sh

# For me
RUN apt-get install git -y
RUN apt-get install zsh -y
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y
# Perso

# -----
#	https://forhjy.medium.com/how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-1-75ddf3ede861
#	https://forhjy.medium.com/42-ft-server-how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-2-4042adb2ab2c

# ---------------------- command line
# docker build -t nginx .
# docker run -it --rm -p 80:80 nginx
# docker system prune
# -----------------------------------


# when -y is here = -yes for all question
