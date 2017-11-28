#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

. set_bosh.sh > /dev/null

clear

pe "cat nginx.yml"

pe "kubectl apply -f nginx.yml"

pe "kubectl rollout status deployment/nginx -w"

pe "kubectl get all"

pe "while [[ true ]]; do curl -I -s -L worker.cfcr.internal:31000 | grep HTTP; sleep .5; done"
