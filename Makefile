NAME = docker

BUI = docker build -t nginx .

#build :
#		$(BUI)

$(NAME) :
		$(BUI)
#docker run -it --rm -p 80:80 nginx

all: $(NAME)
