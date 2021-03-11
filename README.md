# Anchore Package Chart

This is a modified upstream chart. Custom templates and values are added to support SSO, VirtualServices, Ironbank images, and other Big Bang features.

Temporarily the subchart dependencies for postgres and redis are downloaded under the `dependencies` folder. These should be replaced by Big Bang packages in the future.

To update the dependency tgz(s) under the `chart/charts` folder:
```
helm dependency update chart
```

To deploy Anchore apart from Umbrella:
```
helm upgrade -i anchore chart -n anchore --create-namespace -f chart/values.yaml
```

To get the admin password (generated if you did not specify one):
```
kubectl get secrets -n anchore anchore-anchore-engine -o go-template='{{.data.ANCHORE_ADMIN_PASSWORD | base64decode}}' | xargs
```

To delete Anchore when deployed this way:
```
helm delete anchore -n anchore
```

## Usage

For additional information and documentation help, start with the [documents folder](./docs/README.md).

Within this folder there is documentation on the chart, keycloak, metrics, and the big bang specific changes from upstream.
