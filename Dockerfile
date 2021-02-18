FROM debian:buster
# Up to date system
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget
# Install systeme
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /etc/nginx/
RUN rm sites-available/default
RUN rm sites-enabled/default
COPY nginx.conf sites-enabled/default
RUN ln sites-enabled/default sites-available/default

RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=France/L=Paris/O=Me/OU=42Paris/CN=fcatinau/emailAddress=fcatinau@student.42.fr" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

#RUN apt-get install git -y
#RUN apt-get install zsh -y
#RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" -y
# Perso

# -----
#	https://forhjy.medium.com/how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-1-75ddf3ede861
#	https://forhjy.medium.com/42-ft-server-how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-2-4042adb2ab2c

# ---------------------- command line
#docker build -t nginx .
#docker run -it --rm -p 80:80 nginx
# -----------------------------------


# when -y is here = -yes for all question
