# Node Affinity & Anti-Affinity with Anchore

Affinity is exposed through values options for Anchore. If you want to schedule your pods to deploy on specific nodes you can do that through the `nodeSelector` value and as needed the `affinity` value. Additional info is provided below as well to help in configuring this.

It is good to have a basic knowledge of node affinity and available options to you before customizing in this way - the upstream kubernetes documentation [has a good walk-through of this](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity).

## Values for NodeSelector

The `nodeSelector` value at the top level can be set to do basic node selection for deployments. See the below example for an example to schedule pods to only nodes with the label `node-type` equal to `anchore`:

```yaml
nodeSelector:
  node-type: anchore
```

## Values for Affinity

The `affinity.nodeAffinity` value for Anchore should be used to specify node affinity. The format to include follows what you'd specify at a pod level. See the example below for scheduling the pods only to nodes with the label `node-type` equal to `anchore`:

```yaml
affinity:
  nodeAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      nodeSelectorTerms:
      - matchExpressions:
        - key: node-type
          operator: In
          values:
          - anchore
```

## Values for Anti-Affinity

The `affinity.podAntiAffinity` value for Anchore can also be used to set anti-affinity. Setting this will ensure that your replicas do not deploy to the same node (or at least try to not deploy to the same node if using a "soft" style anti-affinity). See the below example for specifying a hard anti affinity:

```yaml
affinity:
  podAntiAffinity:
    requiredDuringSchedulingIgnoredDuringExecution:
      - topologyKey: "kubernetes.io/hostname"
        labelSelector:
          matchLabels:
            app.kubernetes.io/instance: anchore
            app.kubernetes.io/name: anchore
```

## Example

The following example provides where the Anchore nodeSelector and affinity values can be overridden.

**NOTE:** Analyzer pods perform image analysis. There may be many of these analyzers but best practice is to not have more than one per node since analysis is very IO intensive.

```yaml
anchoreAnalyzer:
  nodeSelector: {}
  affinity: {}
anchoreApi:
  nodeSelector: {}
  affinity: {}
anchoreCatalog:
  nodeSelector: {}
  affinity: {}
anchorePolicyEngine:
  nodeSelector: {}
  affinity: {}
anchoreSimpleQueue:
  nodeSelector: {}
  affinity: {}
anchoreEngineUpgradeJob:
  nodeSelector: {}
  affinity: {}
anchoreEnterpriseFeedsUpgradeJob:
  nodeSelector: {}
  affinity: {}
anchoreEnterpriseReports:
  nodeSelector: {}
  affinity: {}
anchoreEnterpriseNotifications:
  nodeSelector: {}
  affinity: {}
anchoreEnterpriseUi:
  nodeSelector: {}
  affinity: {}
anchoreEnterpriseEngineUpgradeJob:
  nodeSelector: {}
  affinity: {}
```
