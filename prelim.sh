#!/bin/bash

SHELL=$(ps -p $$ | awk '{print $4}' | grep -v "CMD")
SHELLRC_PATH=$HOME"/."$SHELL"rc"

if [[ $# -eq 1 ]] && [[ $1 == "CODAM" ]]
then
	echo "" >> $SHELLRC_PATH
	echo "rm -rf ~/.minikube" >> $SHELLRC_PATH
	echo "mkdir -p ~/goinfre/.minikube" >> $SHELLRC_PATH
	echo "ln -s ~/goinfre/.minikube ~/.minikube" >> $SHELLRC_PATH
fi

cat ./bash_functions >> $SHELLRC_PATH

source $SHELLRC_PATH