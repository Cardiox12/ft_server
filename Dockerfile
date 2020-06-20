FROM debian:buster

RUN apt-get update ; \
apt-get upgrade -y ; \
apt-get install -y nginx vim curl mariadb-server

RUN service nginx start
CMD ["nginx", "-g", "daemon off;"]
