#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

pe "cat ops-files/upgrade.yml"

pe "bosh -e cfcr deploy -d kubecon initial.yml \
-o ops-files/stemcell.yml \
-o ops-files/scale.yml \
-o ops-files/upgrade.yml \
-v kubernetes_master_host=10.240.0.2"


