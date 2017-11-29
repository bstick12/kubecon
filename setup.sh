#!/bin/bash

if [ ! -d "bosh-deployment" ]; then
  git clone git@github.com:cloudfoundry/bosh-deployment.git
fi
git -C bosh-deployment pull

if [ ! -d "kubo-bosh-lite" ]; then
  git clone git@github.com:bstick12/kubo-bosh-lite.git
fi

git -C kubo-bosh-lite pull

brew install haproxy
brew install pv

wget -q --show-progress -nc https://github.com/cloudfoundry-incubator/kubo-release/releases/download/v0.8.0/kubo-release-0.8.0.tgz
wget -q --show-progress -nc https://github.com/cloudfoundry-incubator/kubo-release/releases/download/v0.8.1/kubo-release-0.8.1.tgz

wget -q --show-progress -nc https://github.com/pivotal-cf-experimental/kubo-etcd/releases/download/v4/kubo-etcd.4.tgz

wget -q --show-progress -nc --content-disposition https://bosh.io/d/github.com/cf-platform-eng/docker-boshrelease?v=28.0.1
wget -q --show-progress -nc --content-disposition https://bosh.io/d/github.com/cloudfoundry/bosh-dns-release?v=0.0.11

wget -q --show-progress -nc https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3468.5-warden-boshlite-ubuntu-trusty-go_agent.tgz
wget -q --show-progress -nc https://s3.amazonaws.com/bosh-core-stemcells/warden/bosh-stemcell-3445.16-warden-boshlite-ubuntu-trusty-go_agent.tgz


