FROM debian:buster

RUN apt-get update ; \
apt-get upgrade -y ; \
apt-get install -y nginx vim curl mariadb-server php-mbstring php-zip php-gd wget php-fpm php-mysql php7.3-mysql

RUN wget -P /tmp https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz --directory /tmp
RUN mv /tmp/phpMyAdmin-4.9.0.1-all-languages /usr/share/phpmyadmin
RUN mkdir -p /usr/share/phpmyadmin/tmp
COPY srcs/config.inc.php /usr/share/phpmyadmin
COPY srcs/config_users.sql /tmp

RUN rm /etc/nginx/sites-enabled/default
COPY srcs/default /etc/nginx/sites-available
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
COPY srcs/startup.sh /usr/local/bin/
RUN ln -s /usr/local/bin/startup.sh /
RUN ln -s /usr/share/phpmyadmin /var/www/html
RUN echo "extension=mysqli.so" >> /etc/php/7.3/fpm/php.ini
ENTRYPOINT ["/bin/bash", "startup.sh"]
