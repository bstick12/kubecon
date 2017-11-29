# Kubecon Demo

## Initial Setup

Configures local environment with Tarballs and required repositories

```bash
./setup.sh
```

## Setup BOSH Lite

```bash
./configure_bosh.sh
source ./set_bosh.sh
```

## Setup HAProxy locally

In a different terminal window

```bash
haproxy -f haproxy.cfg
```

Put these two entries in your /etc/hosts

```bash
127.0.0.1 master.cfcr.internal
127.0.0.1 worker.cfcr.internal
```

## Deploy Initial version of CFCR 0.8.0

```bash
./create_initial.sh
```

## Once a single worker nodes is created by BOSH

### Deploy an application

Open another terminal and run

```bash
./set_kube_config.sh
./deploy_app.sh
```

In another terminal run 

```bash
watch kubectl get nodes
```

## Upgrade the version of K8s and Stemcell

```bash
./upgrade_version.sh
```

## Scale Workers

```bash
./scale_cluster.sh
```




