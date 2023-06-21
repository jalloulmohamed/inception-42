FROM debian:bullseye

RUN apt-get update && apt-get install -y php7.4 php-mysqli php-fpm  curl 

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./tools/script.sh /var/www/
COPY ./conf/wp-config.php /var/www/


RUN chmod +x /var/www/script.sh
RUN mkdir /var/www/wordpress


EXPOSE 9000

CMD ["./var/www/script.sh"]