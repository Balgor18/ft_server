FROM debian:buster
# Up to date system
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get -y install wget
#install systeme
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
RUN apt-get -y install php7.3 php-mysql php-fpm php-pdo php-gd php-cli php-mbstring

#	https://forhjy.medium.com/how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-1-75ddf3ede861
#	https://forhjy.medium.com/how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-1-75ddf3ede861

# ---------------------- command line
#docker build -t nginx .
#docker run -it --rm -p 80:80 nginx
# -----------------------------------
