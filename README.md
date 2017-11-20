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

## Deploy Initial version of CFCR 0.8.0

```bash
./create_initial.sh
```

## Connect via KubeCtl

```bash
./set_kube_config.sh
```

## Update Stemcells

```bash
./upgrade_stemcell.sh
```

## Scale Workers

```bash
./scale_cluster.sh
```

## Update CFCR to 0.8.1

```bash
./upgrade_version.sh
```




