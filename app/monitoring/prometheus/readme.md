## Pre-requisites

* Kubernetes cluster with prometheus and anchore deployed
* kubectl configuration installed

Install kubectl

```
brew install kubectl
```

Install kustomize

```
brew install kustomize
```

## Deployment

To deploy anchore, clone the repository and deploy the manifests with kubectl as follows:

```
git clone https://repo1.dsop.io/platform-one/apps/anchore.git
```

```
cd anchore
```

```
kubectl apply -k app/main/
```
# How to configure prometheus integation

(Note: Configuration has already been done in this instance)

There are four services that can be integrated from anchore to Prometheus.

To get these services configured, run the following steps:

1. Create a directory 'monitoring' in your anchore directory
2. Make files named 'anchoreServiceMonitoring.yaml', 'kustomization.yaml', 'role.yaml', 'roleBinding.yaml'
3. Copy the following code into 'anchoreServiceMonitoring.yaml'
```
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  labels:
    prometheus: k8s
  name: anchore
  namespace: monitoring
spec:
  selector:
    matchLabels:
      app: anchore-anchore-engine
  namespaceSelector:
    matchNames:
      - anchore
  endpoints:
    - interval: 30s
      path: /metrics
      params:
        format: 
          - prometheus
      port: anchore-external-api
      scheme: http
      jobLabel: anchore-metrics-external-api

    - interval: 30s
      path: /metrics
      params:
        format: 
          - prometheus
      port: anchore-catalog-api
      scheme: http
      jobLabel: anchore-metrics-catalog-api

    - interval: 30s
      path: /metrics
      params:
        format: 
          - prometheus
      port: anchore-policy-api
      scheme: http
      jobLabel: anchore-metrics-policy-api

    - interval: 30s
      path: /metrics
      params:
        format: 
          - prometheus
      port: anchore-simplequeue-api
      scheme: http
      jobLabel: anchore-metrics-simplequeue-api
```
4. Copy the following code into role.yaml:
```
apiVersion: rbac.authorization.k8s.io/v1
items:
- apiVersion: rbac.authorization.k8s.io/v1
  kind: Role
  metadata:
    name: prometheus-k8s
    namespace: anchore
  rules:
  - apiGroups:
    - ""
    resources:
    - services
    - endpoints
    - pods
    verbs:
    - get
    - list
    - watch
kind: RoleList
```
5. Copy the following code into roleBinding.yaml
```
apiVersion: rbac.authorization.k8s.io/v1
items:
- apiVersion: rbac.authorization.k8s.io/v1
  kind: RoleBinding
  metadata:
    name: prometheus-k8s
    namespace: anchore
  roleRef:
    apiGroup: rbac.authorization.k8s.io
    kind: Role
    name: prometheus-k8s
  subjects:
  - kind: ServiceAccount
    name: prometheus-k8s
    namespace: monitoring
kind: RoleBindingList
```
6. Copy the following code into kustomization.yaml
```
namespace: anchore

resources:
  - anchoreServiceMonitor.yaml
  - role.yaml
  - roleBinding.yaml
```
7. Add /monitoring/ to the kustomization.yaml that is NOT in monitoring.
8. In your values.yaml, set `enableMetrics` to `true` and `metricsAuthDisabled` to `true`
9. In your template.yaml, Go to the `metrics` section, and set `enabled` and `auth_disabled` to true.
10. Once all steps are done, run your pipeline.
11. Once the pipeline is built, go to your prometheus URL, and check the steps for verification detailed below. 

## Verification

Prometheus has been sucessfully integrated if the following occured
* All of anchore's pods appear in the targets page and display with a status of UP
    * Targets page is found by first clicking on 'Status', then clicking on 'Targets'
* Anchore's commands appear in the query
    * This can be verified by typing in 'anchore' in the expression field. A list of anchore associated commands should appear after typing 'anchore', including but not limted to: anchore_db_read_seconds_count, anchore_db_read_seconds_created, anchore_db_read_seconds_sum, etc...
    * Each of anchore's commands must be able to execute without error. 