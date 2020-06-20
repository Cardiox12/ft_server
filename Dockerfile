FROM debian:buster

RUN apt-get update ; \
apt-get upgrade -y ; \
apt-get install -y nginx vim curl mariadb-server

COPY srcs/startup.sh /usr/local/bin/
RUN ln -s /usr/local/bin/startup.sh /
ENTRYPOINT ["/bin/bash", "startup.sh"]
