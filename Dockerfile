FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y nginx-light supervisor && \
    apt-get install -y php5-fpm php5-cgi php5-cli php5-curl php5-gd php5-json php5-ldap php5-mysql php5-odbc php5-pgsql php5-readline php5-sqlite php5-tidy php5-xmlrpc php5-geoip php5-imagick php5-imap php5-mcrypt php5-memcache php5-memcached php5-ming php5-mongo php5-oauth php5-redis php5-sasl && \
    rm -rf /var/lib/apt/lists/* /usr/share/nginx/html/index.html && \
    echo 'daemon off;' >> /etc/nginx/nginx.conf

# Supervisor confs
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf
ADD supervisor-nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD supervisor-phpfpm.conf /etc/supervisor/conf.d/phpfpm.conf
ADD default /etc/nginx/sites-enabled/default
ADD info.php /usr/share/nginx/html/index.php

# Startup tasks

ENTRYPOINT ["supervisord"]

EXPOSE 80
EXPOSE 443

