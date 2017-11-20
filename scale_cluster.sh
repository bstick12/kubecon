#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

pe "cat ops-files/scale.yml"

pe "bosh -e cfcr deploy -d kubecon initial.yml \
-o ops-files/stemcell.yml \
-o ops-files/scale.yml \
-v kubernetes_master_host=10.240.0.2"


