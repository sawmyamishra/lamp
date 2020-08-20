FROM ubuntu:latest

ENV TZ=Asia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install php php-fpm apache2 apache2-utils mariadb-server -y && \
    apt install wget -y && \
    apt-get clean
    
RUN systemctl enable apache2 && \
    systemctl is-enabled apache2
RUN echo "<?php echo 'Hello World! ' ?>" > /var/www/html/index.php

EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
