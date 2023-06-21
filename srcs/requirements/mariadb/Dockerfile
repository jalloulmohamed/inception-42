FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server 


RUN mkdir -p /var/run/mysqld \
&& chown -R mysql:mysql /var/run/mysqld \
&& chmod 777 /var/run/mysqld

COPY ./tools/script.sh /
COPY ./tools/db.sql /
RUN chmod 777 script.sh
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306
CMD  [ "./script.sh" ]
