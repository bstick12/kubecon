#!/bin/bash

export BOSH_ENVIRONMENT=cfcr
export BOSH_CLIENT=admin
export BOSH_CLIENT_SECRET=$(bosh int cfcr/creds.yml --path /admin_password)

bosh -e 192.168.50.6 login --ca-cert <(bosh int cfcr/creds.yml --path /director_ssl/ca)
