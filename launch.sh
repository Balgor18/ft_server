docker build -t nginx .
docker run -it --rm -p 80:80 -p 443:443 nginx