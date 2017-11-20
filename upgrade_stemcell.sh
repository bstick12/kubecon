#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

pe "cat ops-files/stemcell.yml"
pe "bosh -e cfcr deploy -d kubecon initial.yml \
-o ops-files/stemcell.yml \
-v kubernetes_master_host=10.240.0.2"


