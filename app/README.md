# Structure
## Anchore-Engine
This folder consists of two pulled packages using KPT:
1. The anchore helm chart from https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine (currently pinned to chart v1.7.0)
2. The redis helm chart from https://github.com/bitnami/charts/tree/master/bitnami/redis into the anchore chart's 'charts' folder (Current anchore chart doesn't include redis charts directly and we need to avoid the `helm dependency update` to use helm generator)

## Components
Any base level Kustomize Components to apply on top of the chart. Included are the Istio Sidecar and ArgoCD hook patches for certain deployments and jobs. These need to be specifically called out in the environment-specific `kustomize.yaml`.

## Monitoring
Resources needed for prometheus service monitor.

# How to Use This Repo
## Component Model
For bootstraps that use the Kustomize container for generation in ArgoCD, the most flexible way to is to use Kustomize Components to layer the resources.
```
namespace: anchore-enterprise

bases:
  - ../base/

components:
  - chart/
  - ../base/anchore-pkg/components/argo-istio-patch
  - secrets/

resources:
  - [etc, etc]
```

This allows downstream bootstraps to apply their own values files in the Helm chart and still apply patches or other resources from this repository in the correct order.

### Chart Component
The charts component configures a Helm Generator to generate the Helm chart with values.yaml files as determined by the needs of the environment
```
Dev
|-chart
  |-generator.yaml
  |-kustomization.yaml
  |-values.yaml
```

### Base Components
Components from the base repo should be directly referenced in the components section for the environment