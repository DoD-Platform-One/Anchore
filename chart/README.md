# Anchore Engine Helm Chart

This chart deploys the Anchore Engine docker container image analysis system + several Big Bang modifications as desired. Anchore Engine requires a PostgreSQL database (>=9.6) which may be handled by the chart or supplied externally, and executes in a service based architecture utilizing the following Anchore Engine services: External API, SimpleQueue, Catalog, Policy Engine, and Analyzer.

This chart can also be used to install the following Anchore Enterprise services: GUI, RBAC, Reporting, Notifications & On-premises Feeds. Enterprise services require a valid Anchore Enterprise License as well as credentials with access to the private DockerHub repository hosting the images. These are not enabled by default.

Each of these services can be scaled and configured independently.

See [Anchore Engine](https://github.com/anchore/anchore-engine) for more project details.

NOTE: Big Bang's implementation is designed to be enabled and consumed from within a customer implementation of the Umbrella Big Bang release. It is fully functional as a standalone Helm install, but Umbrella will enable best integration for Big Bang "extras" and ease of use. 

## Chart Details

The chart is split into global and service specific configurations for the OSS Anchore Engine, as well as global and services specific configurations for the Enterprise components. Additionally included are Big Bang specific configs.

  * The top section provides customizable Big Bang values for SSO, Istio, and automating the license secret creation for enterprise.
  * The `anchoreGlobal` section is for configuration values required by all Anchore Engine components.
  * The `anchoreEnterpriseGlobal` section is for configuration values required by all Anchore Engine Enterprise components.
  * Service specific configuration values allow customization for each individual service.

For a description of each component, view the official documentation at: [Anchore Enterprise Service Overview](https://docs.anchore.com/current/docs/overview/architecture/)

## Installing the Anchore Engine Helm Chart

### Install Standalone

First clone this repository, then navigate to it from your terminal. Assuming you have a k8s cluster created and pointed to in your kubeconfig, use Helm to install the chart.

```bash
helm upgrade -i anchore chart -n anchore --create-namespace
```

NOTE: As with any other Helm chart there is an included values file that can be customized to your needs prior to installation.

### Install with Umbrella

Assuming you have read through documentation on how to use Umbrella and have it set up in your k8s cluster, enabling Anchore can be done through a change to your values `configmap.yaml`.

```yaml
addons:
  anchore:
    enabled: true
```

This will enable the "basic" install of Anchore with no enterprise components.

At this point you can also include other values to customize your install. The main password and email should be updated from their defaults for a prod environment. In your `secrets.enc.yaml` file you can include the below and encrypt them:

```yaml
stringData:
  values.yaml: |-
    addons:
      anchore:
        adminPassword: ""
```

## Adding Enterprise Components

 The following features are available to Anchore Enterprise customers. Please contact the Anchore team for more information about getting a license for the enterprise features. [Anchore Enterprise Demo](https://anchore.com/demo/)

    * Role based access control
    * LDAP integration
    * Graphical user interface
    * Customizable UI dashboards
    * On-premises feeds service
    * Proprietary vulnerability data feed (vulnDB, MSRC)
    * Anchore reporting API
    * Notifications - Slack, GitHub, Jira, etc
    * Microsoft image vulnerability scanning

### Enabling Enterprise Services

Once you have decided on Enterprise services to make use of, make sure to add the proper configs to your `configmap.yaml` and as needed any secret values to the `secrets.enc.yaml` file. The below walks through a minimal configuration to enable Global Enterprise and externalize dependencies as is often desired in a prod environment.

Anchore Enterprise requires a license secret to be created as well as enabling the Enterprise values through Helm. Big Bang has implemented automated creation of the license secret as follows.

Within an encrypted "values" file - `secrets.enc.yaml` - add the following to set the license to be added as a secret. Note that you only need to set one of "licenseYaml" or "b64encYaml". The base64 encoded version is included to simplify any issues you may have passing the license as a full yaml value.

```yaml
stringData:
  values.yaml: |-
    addons:
      anchore:
        enterprise:
          licenseYaml: "" # This is your full license file
          b64encYaml: "" # This is the base64 encoded license file
```

P1 has a license that can be used for dev - this license is located [here](https://repo1.dso.mil/platform-one/big-bang/apps/security-tools/anchore-enterprise/-/snippets/73). To make use of it you will need to SOPS decrypt it with your AWS Coder credentials.

Once you have added the license to this location make sure to re-encrypt your secret file.

In your un-encrypted values file - `configmap.yaml` add the following to enable Enterprise Global:

```yaml
addons:
  anchore:
    enterprise:
      enabled: true
```

## Handling Dependencies

Anchore relies on a single Postgres instance by default, as well as an additional Postgres database and Redis server if certain Enterprise configs are enabled. For development work and non-production workflows you can use the embedded dependency charts to set these dependencies up. In this case you will need to provide a username, password, and database name to create the postgres instance with:

```yaml
stringData:
  values.yaml: |-
    addons:
      anchore:
        postgresql:
          enabled: true # This enables the built in postgres
          user: "username"
          password: "password" 
          mainDB: "databaseName"
          enterpriseFeedsDB: "databaseName" # Only used if you want the enterprise feeds database
```

Big Bang does not currently provide a production solution to be utilized, so it is recommended that you connect to existing external instances. Using the embedded instances in production is AT YOUR OWN RISK.

To externalize the dependency on postgres see the values below. Since some of these values are sensitive they should be added to your encrypted `secrets.enc.yaml` file.

```yaml
stringData:
  values.yaml: |-
    addons:
      anchore:
        postgresql:
          enabled: false # This disables the built in postgres
          endpoint: "host:port" # This is your (already existing) external postgres instance
          user: "username"
          password: "password"
          mainDB: "databaseName"
          enterpriseFeedsDB: "databaseName" # Only used if you want the enterprise feeds database
```

If you plan to use the UI:

For development, you need to set a password for the redis instance:

```yaml
stringData:
  values.yaml: |-
    addons:
      anchore:
        enterpriseUiRedis:
          enabled: true # Enable the built in redis
          password: "password"
```

For production, you will want to externalize your Redis instance:

```yaml
stringData:
  values.yaml: |-
    addons:
      anchore:
        enterpriseUiRedis:
          enabled: true # Enable the built in redis
          password: "password"
          endpoint: "host:port" # This is your already existing external redis instance
```

### Enable SSO

Big Bang has provided an automated way to configure SSO with Keycloak via the Helm chart. To enable and configure SSO follow the instructions in the main KEYCLOAK document.

## Installing on OpenShift

The [upstream chart README](https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine#installing-on-openshift) provides additional details on how to deploy to OpenShift. Necessary values are also included in the values file in this repo.

## Upstream Chart Updates

See the anchore-engine [CHANGELOG](https://github.com/anchore/anchore-engine/blob/master/CHANGELOG.md) for updates to the upstream chart. Big Bang will fork from these updates and add necessary additions, and then a new tagged release will be provided and Umbrella will be updated to use the new release.
