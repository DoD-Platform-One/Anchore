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

To delete Anchore when deployed this way:
```
helm delete anchore -n anchore
```

## Usage

For additional details on using this chart, view the README under the `chart` folder. It provides details on installation along with values that are important to update.
