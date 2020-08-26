#!/bin/bash

kubectl delete pods --all
kubectl delete deployments --all
kubectl delete configmaps config -n metallb-system
kubectl delete pvc --all
kubectl delete svc ftps
kubectl delete svc mysql
kubectl delete svc nginx-svc
kubectl delete svc phpmyadmin-svc
kubectl delete svc wordpress-svc
kubectl delete svc telegraf-svc
kubectl delete svc grafana-svc
kubectl delete svc influxdb-svc

eval $(minikube docker-env -u)