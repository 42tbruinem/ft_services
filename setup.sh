#!/bin/bash

#------------------------------------COLORS------------------------------------#
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
BLUE=$'\e[1;34m'
MAGENTA=$'\e[1;35m'
CYAN=$'\e[1;36m'
END=$'\e[0m'

#------------------------------------FUNCTIONS------------------------------------#

# $1 = name, $2 = docker-location, $3 = yml-location, $4 = DEBUG
start_app () {
	printf "$1: "
	if [ $4 -eq 0 ]
	then
		docker build -t $1 $2 > /dev/null 2>>errlog.txt && kubectl apply -f $3 > /dev/null 2>>errlog.txt
	else
		docker build -t $1 $2 && kubectl apply -f $3
	fi
    RET=$?
	if [ $RET -eq 1 ]
	then
		echo "[${RED}NO${END}]"
	else
		echo "[${GREEN}OK${END}]"
	fi
}

#------------------------------------CLEANUP------------------------------------#

#rm -rf ~/.minikube
#mkdir -p ~/goinfre/.minikube
#ln -s ~/goinfre/.minikube ~/.minikube

:> errlog.txt
:> log.log
#sh cleanup.sh >> log.log 2>> /dev/null

#---------------------------------CLUSTER START---------------------------------#

minikube start	--vm-driver=virtualbox \
				--cpus=2 --memory=3000 --disk-size=10g \
				--addons metallb \
				--addons default-storageclass \
				--addons dashboard \
				--addons storage-provisioner \
				--addons metrics-server \
  				--extra-config=kubelet.authentication-token-webhook=true

#minikube start --vm-driver=virtualbox --cpus=2 --memory=3000 --disk-size=10g --addons metrics-server --addons metallb --addons default-storageclass --addons storage-provisioner --addons dashboard --extra-config=kubelet.authentication-token-webhook=true

#----------------------------------BUILD AND DEPLOY----------------------------------#

eval $(minikube docker-env)
export MINIKUBE_IP=$(minikube ip)

DEUBUG=""
if [ $# -eq 1 ]
then
	DEBUG=1
else
	DEBUG=0
fi

#docker build -t nginx_alpine ./srcs/nginx

kubectl apply -f ./srcs/metallb-config.yml
start_app "nginx_alpine" "./srcs/nginx" "./srcs/nginx.yml" "$DEBUG"
start_app "ftps" "./srcs/ftps" "./srcs/ftps.yml" "$DEBUG"
#kubectl apply -f ./srcs/nginx.yml
#docker build -t nginx_alpine ./srcs/containers/nginx > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; \
#kubectl apply -f ./srcs/deployments/nginx-deployment.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# printf "Building and deploying ftps:\n"
# docker build -t ftps_alpine ./srcs/ftps > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f ./srcs/ftps.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# printf "Building and deploying mysql:\n"
# docker build -t mysql_alpine ./srcs/mysql > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f ./srcs/mysql.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# printf "Building and deploying wordpress:\n"
# docker build -t wordpress_alpine ./srcs/wordpress > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f ./srcs/wordpress.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# printf "Building and deploying phpmyadmin:\n"
# docker build -t phpmyadmin_alpine ./srcs/phpmyadmin > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f ./srcs/phpmyadmin.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n";

# printf "Building and deploying influxdb:\n"
# docker build -t influxdb_alpine srcs/influxdb > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f srcs/influxdb.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# printf "Building and deploying telegraf:\n"
# docker build -t telegraf_alpine --build-arg INCOMING=${MINIKUBE_IP} srcs/telegraf > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f srcs/telegraf.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# printf "Building and deploying grafana:\n"
# docker build -t grafana_alpine ./srcs/grafana > /dev/null 2>>errlog.txt && { printf "[${GREEN}OK${END}]\n"; kubectl apply -f ./srcs/grafana.yaml >> log.log 2>> errlog.txt; } || printf "[${RED}NO${END}]\n"

# sleep 3;
# WORDPRESS_IP=`kubectl get services | awk '/wordpress-svc/ {print $4}'`
# PHPMYADMIN_IP=`kubectl get services | awk '/phpmyadmin-svc/ {print $4}'`
# GRAFANA_IP=`kubectl get services | awk '/grafana-svc/ {print $4}'`
# sed -e "s/GRAFANA_IP/$GRAFANA_IP/g" -e "s/WORDPRESS_IP/$WORDPRESS_IP/g" -e "s/PHPMYADMIN_IP/$PHPMYADMIN_IP/g" srcs/nginx/homepage-pde-bakk/beforesed.html > srcs/nginx/homepage-pde-bakk/index.html

# printf "Building and deploying nginx:\t\t"
# docker build -t nginx_alpine ./srcs/nginx > /dev/null 2>>errlog.txt && printf "[${GREEN}OK${END}]\n" || printf "[${RED}NO${END}]\n"; kubectl apply -f ./srcs/nginx.yaml >> log.log 2>> errlog.txt

# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" >> log.log 2>> errlog.txt