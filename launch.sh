docker system prune
docker build -t nginx .
docker run -it --rm -p 80:80 -p 443:443 nginx
#docker run -it --env AUTOINDEX=off -p 443:443 -p 80:80 nginx
# https://github.com/vvarodi/ft_server/tree/master/ft_server
