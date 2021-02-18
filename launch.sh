docker build -t nginx .
docker run -it --rm -p 80:80 nginx
#docker run -it --rm -p 80:8080 nginx