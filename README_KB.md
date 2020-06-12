## Anchore Engine  Version 0.7.1

This repo contains manifests that deploy the Anchore Engine container image analysis system. Anchore Engine requires a PostgreSQL database for which the connection information needs to be provided. Anchore executes in a service based architecture utilizing the following Anchore Engine services: External API, SimpleQueue, Catalog, Policy Engine, and Analyzer.


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

## Contributing

To contribute to Anchore, see the [Contributing Guide](CONTRIBUTING.md).

