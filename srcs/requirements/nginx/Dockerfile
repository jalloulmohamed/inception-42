FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx &&  apt-get install openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/ssl.pem \
        -keyout /etc/nginx/ssl/ssl.key \
        -subj "/C=MO/ST=KH/L=KH/O=1337 School/OU=ssl/CN=ssl/"

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default


EXPOSE 443  
CMD ["nginx", "-g", "daemon off;"]