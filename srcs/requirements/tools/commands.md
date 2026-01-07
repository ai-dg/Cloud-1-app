
create a dump of the database

mysqldump --all-databases --triggers --routines --events --single-transaction -uroot -p${MYSQL_ROOT_PASSWORD} > dump.sql 


copy in the project directory

docker cp mysql:/dump.sql ~/cloud-I/files/srcs/requirements/mysql/dump/