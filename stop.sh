#!/usr/bin/env bash

helm delete jenkins --purge
#helm delete nginx-ingress --purge
kubectl delete -f config_files/jenkins-namespace.yaml
kubectl delete secret jenkins-ingress-ssl
rm tls.key tls.crt
