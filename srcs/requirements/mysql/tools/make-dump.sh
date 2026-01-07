#!/bin/bash


set -a  # Exporte automatiquement les variables
source srcs/.env
set +a

docker exec mysql mysqldump --all-databases --triggers --routines --events --single-transaction -uroot -p${MYSQL_ROOT_PASSWORD} > srcs/requirements/mysql/dump/dump.sql
git add --all
git commit -m "new dump"
git push
