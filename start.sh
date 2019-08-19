#!/usr/bin/env bash

minikube addons enable ingress

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./tls.key -out ./tls.crt -subj "/CN=jenkins.etc.com"
kubectl create secret tls jenkins-ingress-ssl --key ./tls.key --cert ./tls.crt
kubectl create -f config_files/jenkins-namespace.yaml

#helm install --name nginx-ingress stable/nginx-ingress --namespace jenkins-project --set controller.publishService.enabled=true --wait
helm install --name jenkins -f config_files/jenkins-values.yaml stable/jenkins --namespace jenkins-project --wait
kubectl scale --replicas=2 deployment/jenkins --namespace=jenkins-project
kubectl apply -f config_files/nginx-ingress.yaml
echo 'Below is the admin password'
printf $(kubectl get secret --namespace jenkins-project jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
