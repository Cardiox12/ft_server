FROM debian:buster

RUN apt-get update ; \
apt-get upgrade -y ; \
apt-get install -y nginx vim curl mariadb-server php-mbstring php-zip php-gd wget php-fpm

RUN wget -P /tmp https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -xvf /tmp/phpMyAdmin-4.9.0.1-all-languages.tar.gz --directory /tmp
RUN mv /tmp/phpMyAdmin-4.9.0.1-all-languages /usr/share/phpmyadmin
RUN mkdir -p /usr/share/phpmyadmin/tmp
COPY srcs/config.inc.php /usr/share/phpmyadmin
COPY srcs/config_users.sql /tmp
# RUN cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php
# RUN ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin
# RUN chown -R www-data:www-data /var/www/html/phpmyadmin 

COPY srcs/startup.sh /usr/local/bin/
RUN ln -s /usr/local/bin/startup.sh /
ENTRYPOINT ["/bin/bash", "startup.sh"]
