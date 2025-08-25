#!/bin/bash
kubectl apply -f k8s/mysql/ns.yml
kubectl apply -f k8s/mysql/secret.yml
kubectl apply -f k8s/mysql/service.yml
kubectl apply -f k8s/mysql/statefulSet.yml

kubectl apply -f k8s/app/ns.yml
kubectl apply -f k8s/app/pv.yml
kubectl apply -f k8s/app/pvc.yml
kubectl apply -f k8s/app/secret.yml
kubectl apply -f k8s/app/configMap.yml
kubectl apply -f k8s/app/clusterIp.yml
kubectl apply -f k8s/app/hpa.yml
kubectl apply -f k8s/app/deployment.yml
kubectl apply -f k8s/app/ingress.yml
kubectl apply -f k8s/app/pdb.yml