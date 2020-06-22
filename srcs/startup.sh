nginx -g deamon off;
service php7.3-fpm start
service nginx start
service mysql start
mysql < /usr/share/phpmyadmin/sql/create_tables.sql
mysql < /tmp/config_users.sql
bash