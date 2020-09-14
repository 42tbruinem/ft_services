#!/bin/sh

. /tmp/get_external-ip-address.sh WORDPRESS_SVC wordpress-svc
. /tmp/get_external-ip-address.sh PHPMYADMIN_SVC phpmyadmin-svc
. /tmp/get_external-ip-address.sh GRAFANA_SVC grafana-svc

envsubst '${WORDPRESS_SVC} ${PHPMYADMIN_SVC} ${GRAFANA_SVC}' < /tmp/index.html > /www/index.html

adduser --disabled-password ${SSH_USERNAME}
echo "${SSH_USERNAME}:${SSH_PASSWORD}" | chpasswd