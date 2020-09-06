#!/bin/bash

kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l tier=general --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=nginx --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=ftps --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=mysql --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=wordpress --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=phpmyadmin --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=influxdb --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=telegraf --wait=false
kubectl delete svc,deployments,pv,pvc,pods,configmaps,role,rolebinding,secret,serviceaccount \
	-l app=grafana --wait=false