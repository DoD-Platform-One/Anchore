# Anchore Enterprise v2.3.1

This repo contains manifests that deploy the Anchore Engine container image analysis system. Anchore Engine requires a PostgreSQL database for which the connection information needs to be provided. Anchore executes in a service based architecture utilizing the following Anchore Engine services: External API, UI, SimpleQueue, Catalog, Policy Engine, and Analyzer.

## Table Of contents

- [Metrics](./metrics.md)

### Pre-requisites

* Kubernetes cluster deployed
* kubectl configuration installed

Install kubectl

```
brew install kubectl
```

Install kustomize

```
brew install kustomize
```

# Structure and Sources
## Manifests
This folder consists of two pulled packages using KPT:
1. The anchore helm chart from https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine (currently pinned to chart v1.7.0)
2. The redis helm chart from https://github.com/bitnami/charts/tree/master/bitnami/redis into the anchore chart's 'charts' folder (Current Anchore chart doesn't include redis charts directly and we need to avoid requiring a `helm dependency update` to use Helm generator)

## Components
Any Kustomize Components to apply on top of the chart. Included components:

* Istio Sidecar and ArgoCD hook patches for the upgrade job.
* Upgrade job deletion patch
* Database provisioner jobs

These need to be specifically called out in the environment-specific `kustomize.yaml`.

## Integrations
### Metrics - Prometheus

Deploys a Prometheus Operator ServiceMonitor

# How to Deploy 
## Component Model
For bootstraps that use the Kustomize container for generation in ArgoCD, the most flexible way to is to use Kustomize Components to layer the resources.
```
namespace: anchore-enterprise

bases:
  - ../base/

components:
  - chart/
  - ../base/anchore-pkg/deployment/components/remove-upgrade-jobs
  - secrets/

resources:
  - [etc, etc]
```

This allows downstream bootstraps to apply their own values files in the Helm chart and still apply patches or other resources from this repository in the correct order.

### Chart Component
The charts component configures a Helm Generator to generate the Helm chart with values.yaml files as determined by the needs of the environment.
```
Dev
|-chart
  |-generator.yaml
  |-kustomization.yaml
  |-values.yaml
  |-values.enc.yaml
```

### Anchore Secrets
db-credentials are the root credentials of the PSQL instance. This is consumed by the next step to create the database.
```yaml
apiVersion: goabout.com/v1beta1
kind: SopsSecretGenerator
metadata:
  name: db-credentials
disableNameSuffixHash: true
envs:
  - db-creds.enc.env
---
apiVersion: goabout.com/v1beta1
kind: SopsSecretGenerator
metadata:
  name: anchore-secret
disableNameSuffixHash: true
envs:
  - anchore.enc.env
```

db-creds.enc.env is the POST ENCRYPTED form of:
```text
PGDATABASE=
PGHOST=
PGPASSWORD
PGUSER=
```

anchore.enc.env is the POST ENCRYPTED form of:
```text
ANCHORE_ADMIN_PASSWORD=
ANCHORE_DB_PASSWORD=
```

### Anchore Database Creation
Consumes pre-existing admin database credentials to create an anchore specific database.
```yaml
apiVersion: batch/v1
kind: Job
metadata:
  name: ensure-anchore-rds-db
  annotations:
    argocd.argoproj.io/hook: Sync
    argocd.argoproj.io/hook-delete-policy: HookSucceeded
spec:
  template:
    metadata:
      name: ensure-anchore-rds-db
      annotations:
        sidecar.istio.io/inject: 'false'
    spec:
      containers: 
      - name: psql
        image: "bitnami/postgresql"
        command:
        - /bin/bash
        - -exc
        - |
          psql -tc "SELECT 1 FROM pg_database WHERE datname = '$ANCHORE_DB_NAME'" | grep -q 1 || psql -c "CREATE DATABASE $ANCHORE_DB_NAME"
          psql -tc "SELECT 1 FROM pg_roles WHERE rolname = '$ANCHORE_DB_USER'" | grep -q 1 && psql -c "ALTER USER $ANCHORE_DB_USER WITH PASSWORD '$ANCHORE_DB_PASSWORD'; GRANT ALL PRIVILEGES ON DATABASE $ANCHORE_DB_NAME TO $ANCHORE_DB_USER;" | grep -q GRANT || psql -c "CREATE USER $ANCHORE_DB_USER WITH PASSWORD '$ANCHORE_DB_PASSWORD'; GRANT ALL PRIVILEGES ON DATABASE $ANCHORE_DB_NAME TO $ANCHORE_DB_USER;" 
        env:
        - name: ANCHORE_DB_NAME
          valueFrom:
            configMapKeyRef:
              name: anchore-anchore-engine-env
              key: ANCHORE_DB_NAME
        - name: ANCHORE_DB_USER
          valueFrom:
            configMapKeyRef:
              name: anchore-anchore-engine-env
              key: ANCHORE_DB_USER
        - name: ANCHORE_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: anchore-secret
              key: ANCHORE_DB_PASSWORD
        envFrom:
        - secretRef:
            name: db-credentials
      restartPolicy: OnFailure

```
# Contributing

To contribute to Anchore, see the [Contributing Guide](CONTRIBUTING.md).
