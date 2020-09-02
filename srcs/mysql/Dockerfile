FROM alpine:3.12

RUN	apk add mysql mysql-client gettext

COPY ./srcs/startup.sh /tmp/startup.sh
COPY ./srcs/my.cnf /tmp/

RUN envsubst ${MYSQL_USER} ${MYSQL_PASSWORD} < /tmp/my.cnf > /etc/my.cnf

COPY ./srcs/create_tables.sql /tmp/

RUN chmod +x /tmp/startup.sh
VOLUME /var/lib/mysql

ENTRYPOINT ["/bin/sh", "/tmp/startup.sh"]
