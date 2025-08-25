FROM mariadb:10.5

COPY ./conf/config.cnf /etc/mysql/my.cnf
COPY ./tools/init.sql /init.sql
COPY ./tools/init.sh /docker-entrypoint-initdb.d/init.sh

RUN chmod +x /docker-entrypoint-initdb.d/init.sh
