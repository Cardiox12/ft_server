cp /etc/nginx/sites-available/default.conf /tmp
envsubst '$AUTO_INDEX' < /etc/nginx/sites-available/default.conf > /tmp/default.conf
cat /tmp/default.conf > /etc/nginx/sites-available/default.conf
rm /tmp/default.conf

nginx -g deamon off;
service php7.3-fpm start
service nginx start
service mysql start
mysql < /usr/share/phpmyadmin/sql/create_tables.sql
mysql < /tmp/config_users.sql
bash