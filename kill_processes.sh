#!/bin/bash

kubectl exec deployments/ftps -- pkill vsftpd
kubectl exec deployments/grafana -- pkill grafana-server
kubectl exec deployments/influxdb -- pkill influxd
kubectl exec deployments/mysql -- pkill /usr/bin/mysqld
kubectl exec deployments/nginx -- pkill nginx
#kubectl exec deployments/nginx -- pkill sshd
kubectl exec deployments/phpmyadmin -- pkill nginx
#kubectl exec deployments/phpmyadmin -- pkill {php-fpm7}
kubectl exec deployments/telegraf -- pkill telegraf
kubectl exec deployments/wordpress -- pkill nginx
#kubectl exec deployments/wordpress -- pkill {php-fpm7}