# Changes needed for Big Bang and Ironbank Images

Due to how Big Bang is making use of Anchore (from within Umbrella) there were values and chart changes that needed to be made.
Additionally, the Ironbank images function in slightly different ways than upstream Dockerhub images, so additional 
modifications were made to support their use.

This provides a log of these changes to make updates from upstream faster.

## Big Bang Modifications

Added at the top of the values file are changes to support Istio and automated license creation.

```yaml
# Big Bang Values
# ---------------
hostname: bigbang.dev

istio:
  enabled: false

enterpriseLicenseYaml: |
  FULL LICENSE YAML (must be indented)
```

All chart changes are located under the `chart/templates/bigbang` directory. In summary:

- Creation of virtual services for the UI and API
- Automated creation of the license secret
- Automated creation of an OAuth cert secret if needed (and this secret name is referenced under `anchoreGlobal.saml`)

As additional Big Bang changes are made they should be added in these spots and this doc updated to reflect that.

## Ironbank Modifications

All images were updated to be from Ironbank. Additionally, an image pull secret was specified to enable Umbrella to pull them correctly. In the values file:

```yaml
postgresql:
  image: registry1.dso.mil/ironbank/opensource/postgres/postgresql96:9.6.18
  imagePullSecrets: private-registry

anchoreGlobal:
  image: registry1.dso.mil/ironbank/anchore/enterprise/enterprise:2.4.1
  imagePullSecretName: private-registry

anchoreEnterpriseGlobal:
  image: registry1.dso.mil/ironbank/anchore/enterprise/enterprise:2.4.1
  imagePullSecretName: private-registry

anchore-feeds-db:
  image: registry1.dso.mil/ironbank/opensource/postgres/postgresql96:9.6.18
  imagePullSecrets: private-registry

anchoreEnterpriseUi:
  image: registry1.dso.mil/ironbank/anchore/enterpriseui/enterpriseui:2.4.1
  imagePullSecretName: private-registry

anchore-ui-redis:
  image:
    registry: registry1.dso.mil/ironbank
    repository: opensource/redis/redis6
    tag: 6.0.4
    pullSecrets:
      - private-registry
```

To support the Ironbank Postgres image, additional configuration has to be set in the values file:

```yaml
postgresql:
  persistence:
    resourcePolicy: nil
    size: 20Gi
    subPath: "pgdata"
    mountPath: /var/lib/pgsql
  # Set the PGDATA var to an allowed directory for the IB image
  # Match this above for the mountPath and subPath
  extraEnv:
  - name: PGDATA
    value: "/var/lib/pgsql/pgdata"
  # Set the configs to allow listening and connecting from other pods
  postgresConfig: {"listen_addresses": "*"}
  pgHbaConf: |-
    local all all md5
    host all all all md5

anchore-feeds-db:
  persistence:
    resourcePolicy: nil
    size: 20Gi
    mountPath: /var/lib/pgsql
  # Set the PGDATA var to an allowed directory for the IB image
  # Match this above for the mountPath and subPath
  extraEnv:
  - name: PGDATA
    value: "/var/lib/pgsql/pgdata"
  # Set the configs to allow listening and connecting from other pods
  postgresConfig: {"listen_addresses": "*"}
  pgHbaConf: |-
    local all all md5
    host all all all md5
```

Finally the redis startup command must be edited to use the Ironbank entrypoint:

```yaml
anchore-ui-redis:
  # Use Ironbank start-up script
  master:
    command: "docker-entrypoint.sh"
```
