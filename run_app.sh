RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
BLUE=$'\e[1;34m'
MAGENTA=$'\e[1;35m'
CYAN=$'\e[1;36m'
END=$'\e[0m'

#------------------------------------FUNCTIONS------------------------------------#

# $1 = name, $2 = docker-location, $3 = yml-location
start_app () {
	printf "$1: "
    echo "docker build -t $1 $2 > /dev/null 2>>errlog.txt && kubectl apply -f $3 > /dev/null 2>>errlog.txt"
	docker build -t $1 $2 > /dev/null 2>>errlog.txt && kubectl apply -f $3 > /dev/null 2>>errlog.txt
    RET=$?
    echo $RET
	if [ $RET -eq 1 ]
	then
		echo "[${RED}NO${END}]"
	else
		echo "[${GREEN}OK${END}]"
	fi
}

start_app "nginx_alpine" "./srcs/nginx/" "./srcs/nginx.yml"