#!/bin/bash

set +x

DEPLOYMENT=${1:-kubecon-stemcell}
DIRECTOR_NAME=${2:-kubecon}

CREDHUB_PWD=$(bosh int --path /credhub_cli_password cfcr/creds.yml)
CREDHUB_CA_CERT=$(bosh int --path /credhub_tls/ca cfcr/creds.yml)
credhub login -u credhub-cli -p ${CREDHUB_PWD} -s https://192.168.50.6:8844 --skip-tls-validation

bosh int <(credhub get -n "/${DIRECTOR_NAME}/${DEPLOYMENT}/tls-kubernetes" --output-json) --path=/value/ca > cfcr/kubernetes.crt
kubectl config set-cluster ${DEPLOYMENT} --server https://10.240.0.2:8443 --embed-certs=true --certificate-authority=cfcr/kubernetes.crt

KUBERNETES_PWD=$(bosh int <(credhub get -n "/${DIRECTOR_NAME}/${DEPLOYMENT}/kubo-admin-password" --output-json) --path=/value)
kubectl config set-credentials "${DIRECTOR_NAME}-admin" --token=${KUBERNETES_PWD}
kubectl config set-context "${DIRECTOR_NAME}" --cluster="${DEPLOYMENT}" --user="${DIRECTOR_NAME}-admin"
kubectl config use-context "${DIRECTOR_NAME}"
kubectl get all

