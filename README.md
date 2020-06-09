## Template Generation

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
helm template anchore stable/anchore-engine -f values.yaml > template.yml
```

## Template Usage

Database host is pregenerated in `template.yml`. So, you gotta patch changes in via kustomize.
Not so for database and admin secrets!


### Anchore Database Host Patch
```yaml
kind: ConfigMap
apiVersion: v1
metadata:
  name: anchore-anchore-engine-env
data:
  ANCHORE_DB_HOST: "db.fences.dsop.io"
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