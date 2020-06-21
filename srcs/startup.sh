nginx -g deamon off;
service nginx start
service mysql start
mysql < /usr/share/phpmyadmin/sql/create_tables.sql
mysql < /tmp/config_users.sql
bash
