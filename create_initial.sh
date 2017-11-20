#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

. set_bosh.sh > /dev/null

pe "bosh -e cfcr deploy -d kubecon initial.yml -v kubernetes_master_host=master.cfcr.internal"

pe "cat set_kube_config.sh"

pe "./set_kube_config.sh"


