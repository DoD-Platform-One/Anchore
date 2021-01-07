# Anchore Package Chart

This is a modified upstream chart. Custom templates and values are added to support SSO, VirtualServices, and other Big Bang features.

Temporarily the subchart dependency for redis is downloaded as a tar archive in the chart/charts/ directory. This should be replaced by a Big Bang package.

To update the redis dependency:
```
helm dependency update
```

To deploy Anchore apart from Umbrella:
```
helm upgrade -i anchore chart -n anchore --create-namespace -f chart/values.yaml
```

To delete Anchore when deployed this way:
```
helm delete anchore -n anchore
```

## Initial admin login

The initial admin login is user ```admin```.  The password is available in the values file, defaulted to ```foobar```.

##  Deployment

For production deployments you must externalize Postgres. See the `values.yaml` file section `postgresql` for more details.

If using the Anchore UI you must also externalize Redis. See the `values.yaml` file section `anchore-ui-redis` for more details.
