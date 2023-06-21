CREATE DATABASE db_name;

CREATE USER 'db_user'@'%' IDENTIFIED BY 'db_user_password';

GRANT ALL PRIVILEGES ON db_name.* TO 'db_user'@'%';

FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'db_root_password';    
