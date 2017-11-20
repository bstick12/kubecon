#!/bin/bash

source setup_demo_magic.sh

setup_demo_magic

NO_WAIT=true

pe "mkdir -p cfcr"

pe "bosh create-env bosh-deployment/bosh.yml \
--state cfcr/state.json \
-o bosh-deployment/virtualbox/cpi.yml \
-o bosh-deployment/virtualbox/outbound-network.yml \
-o bosh-deployment/bosh-lite.yml \
-o bosh-deployment/bosh-lite-runc.yml \
-o bosh-deployment/jumpbox-user.yml \
-o bosh-deployment/local-dns.yml \
-o kubo-bosh-lite/ops/dns-addresses.yml \
-o bosh-deployment/uaa.yml \
-o bosh-deployment/credhub.yml \
--vars-store cfcr/creds.yml \
-v director_name=\"kubecon\" \
-v internal_ip=192.168.50.6 \
-v internal_gw=192.168.50.1 \
-v internal_cidr=192.168.50.0/24 \
-v dns_recursor_ip=192.168.50.6 \
-v outbound_network_name=NatNetwork"

source set_bosh.sh

pe "bosh -e 192.168.50.6 login --ca-cert <(bosh int cfcr/creds.yml --path /director_ssl/ca)"
pe "bosh -e 192.168.50.6 alias-env cfcr --ca-cert <(bosh int cfcr/creds.yml --path /director_ssl/ca)"
pe "bosh -e cfcr update-runtime-config -n bosh-deployment/runtime-configs/dns.yml --non-interactive"
pe "bosh -e cfcr update-cloud-config kubo-bosh-lite/cloud-config.yml --non-interactive"

pe "bosh -e cfcr upload-stemcell bosh-stemcell-3445.16-warden-boshlite-ubuntu-trusty-go_agent.tgz --non-interactive"
pe "bosh -e cfcr upload-stemcell bosh-stemcell-3468.5-warden-boshlite-ubuntu-trusty-go_agent.tgz --non-interactive"

pe "bosh -e cfcr upload-release kubo-etcd.4.tgz --non-interactive"
pe "bosh -e cfcr upload-release kubo-release-0.8.0.tgz --non-interactive"
pe "bosh -e cfcr upload-release kubo-release-0.8.1.tgz --non-interactive"
pe "bosh -e cfcr upload-release docker-boshrelease-28.0.1.tgz --non-interactive"

pe "sudo route add -net 10.240.0.0/16 192.168.50.6"











