#!/bin/sh

envsubst < /init.sql > /docker-entrypoint-initdb.d/init.sql

#mysql -u root -p"${MYSQL_ROOT_PASSWORD}" < /docker-entrypoint-initdb.d/init.sql
