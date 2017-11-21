#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

. set_bosh.sh > /dev/null

pe "cat ops-files/stemcell.yml"
pe "bosh -e cfcr deploy -d kubecon initial.yml \
-o ops-files/stemcell.yml \
-v kubernetes_master_host=master.cfcr.internal"


