#!/bin/bash



if [ ! -d /var/lib/mysql/db ]; then
    sed -i "1s/db_name/$DB_NAME/" db.sql
    sed -i "3s/db_user/$DB_USER/" db.sql
    sed -i "3s/db_user_password/$DB_USER_PASSWORD/" db.sql
    sed -i "5s/db_name/$DB_NAME/" db.sql
    sed -i "5s/db_user/$DB_USER/" db.sql
    sed -i "8s/db_root_password/$DB_ROOT_PASSWORD/" db.sql
    service  mariadb start
    sleep 5;
    mysql < db.sql
    mysqladmin shutdown -p$DB_ROOT_PASSWORD
fi

mysqld
