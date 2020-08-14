```
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
helm template anchore stable/anchore-engine -f values.yaml > template.yml
```
ANCHORE_ADMIN_PASSWORD: "foobar"
ANCHORE_DB_PASSWORD: "anchore,supersecretpass"

#Applying Patches
Due to using the Helm Generator and how kustomize handles ordering, we need to place patches in the environment-level kustomization. The following should be placed there:
```
patchesJSON6902:
  - target:
      group: apps
      version: v1
      kind: Deployment
      name: anchore-anchore-engine-analyzer
    path: [path-to-base]/app/main/patches/patch.deployment.yaml
  - target:
      group: apps
      version: v1
      kind: Deployment
      name: anchore-anchore-engine-api
    path: [path-to-base]/app/main/patches/patch.deployment.yaml
  - target:
      group: apps
      version: v1
      kind: Deployment
      name: anchore-anchore-engine-catalog
    path: [path-to-base]/app/main/patches/patch.deployment.yaml
  - target:
      group: apps
      version: v1
      kind: Deployment
      name: anchore-anchore-engine-policy
    path: [path-to-base]/app/main/patches/patch.deployment.yaml
  - target:
      group: apps
      version: v1
      kind: Deployment
      name: anchore-anchore-engine-simplequeue
    path: [path-to-base]/app/main/patches/patch.deployment.yaml
  - target:
      group: batch
      version: v1
      kind: Job
      name: anchore-engine-upgrade
    path: [path-to-base]/app/main/patches/patch.job.yaml
```