<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# anchore-enterprise

![Version: 3.14.2-bb.5](https://img.shields.io/badge/Version-3.14.2--bb.5-informational?style=flat-square) ![AppVersion: 5.20.2](https://img.shields.io/badge/AppVersion-5.20.2-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

Anchore Enterprise is a complete container security workflow solution for professional teams. Easily integrating with CI/CD systems,
it allows developers to bolster security without compromising velocity and enables security teams to audit and verify compliance in real-time.
It is based on Anchore Engine, an open-source image inspection and scanning tool.

## Upstream References

- <https://anchore.com>
- <https://github.com/anchore/anchore-charts/tree/main/stable/enterprise>

## Upstream Release Notes

- [Find our upstream chart's CHANGELOG here](https://github.com/anchore/anchore-charts/tree/main)
- [and our upstream application release notes here](https://docs.anchore.com/current/docs/releasenotes/)

## Learn More

- [Application Overview](docs/overview.md)
- [Other Documentation](docs/)

## Pre-Requisites

- Kubernetes Cluster deployed
- Kubernetes config installed in `~/.kube/config`
- Helm installed

Kubernetes: `>=1.23.x || >=1.23.x-x`

Install Helm

<https://helm.sh/docs/intro/install/>

## Deployment

- Clone down the repository
- cd into directory

```bash
helm install anchore-enterprise chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| domain | string | `"dev.bigbang.mil"` |  |
| istio.enabled | bool | `false` |  |
| istio.hardened.enabled | bool | `false` |  |
| istio.hardened.outboundTrafficPolicyMode | string | `"REGISTRY_ONLY"` |  |
| istio.hardened.customServiceEntries | list | `[]` |  |
| istio.hardened.customAuthorizationPolicies | list | `[]` |  |
| istio.injection | string | `"disabled"` |  |
| istio.ui.enabled | bool | `true` |  |
| istio.ui.annotations | object | `{}` |  |
| istio.ui.labels | object | `{}` |  |
| istio.ui.gateways[0] | string | `"istio-system/main"` |  |
| istio.ui.hosts[0] | string | `"anchore.{{ .Values.domain }}"` |  |
| istio.api.enabled | bool | `true` |  |
| istio.api.annotations | object | `{}` |  |
| istio.api.labels | object | `{}` |  |
| istio.api.gateways[0] | string | `"istio-system/main"` |  |
| istio.api.hosts[0] | string | `"anchore-api.{{ .Values.domain }}"` |  |
| istio.api.service.apiVersion | string | `"v2"` |  |
| istio.mtls | object | `{"mode":"STRICT"}` | Default peer authentication |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| networkPolicies.additionalPolicies | list | `[]` |  |
| sso.enabled | bool | `false` |  |
| sso.name | string | `"keycloak"` |  |
| sso.acsHttpsPort | int | `-1` |  |
| sso.spEntityId | string | `"platform1_a8604cc9-f5e9-4656-802d-d05624370245_bb8-anchore"` |  |
| sso.acsUrl | string | `"https://anchore.bigbang.dev/service/sso/auth/keycloak"` |  |
| sso.defaultAccount | string | `"user"` |  |
| sso.defaultRole | string | `"read-write"` |  |
| sso.roleAttribute | string | `""` |  |
| sso.requireSignedAssertions | bool | `false` |  |
| sso.requireSignedResponse | bool | `true` |  |
| sso.idpMetadataUrl | string | `"https://login.dso.mil/auth/realms/baby-yoda/protocol/saml/descriptor"` |  |
| sso.host | string | `"login.dso.mil"` |  |
| sso.realm | string | `"baby-yoda"` |  |
| sso.resources.limits.cpu | string | `"100m"` |  |
| sso.resources.limits.memory | string | `"256Mi"` |  |
| sso.resources.requests.cpu | string | `"100m"` |  |
| sso.resources.requests.memory | string | `"256Mi"` |  |
| sso.containerSecurityContext.runAsUser | int | `1001` |  |
| sso.containerSecurityContext.runAsGroup | int | `1001` |  |
| sso.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| monitoring.serviceMonitor.scheme | string | `""` |  |
| monitoring.serviceMonitor.tlsConfig | object | `{}` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/anchore/cli/cli:0.9.4"` |  |
| bbtests.scripts.envs.ANCHORE_CLI_URL | string | `"http://{{ template \"enterprise.api.fullname\" . }}:{{ .Values.upstream.api.service.port }}/v1"` |  |
| bbtests.scripts.envs.ANCHORE_CLI_USER | string | `"admin"` |  |
| bbtests.scripts.envs.ANCHORE_SCAN_IMAGE | string | `"quay.io/prometheus/node-exporter:latest"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"ANCHORE_CLI_PASS"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ template \"enterprise.fullname\" . }}"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"ANCHORE_ADMIN_PASSWORD"` |  |
| bbtests.cypress.resources.requests.cpu | string | `"2"` |  |
| bbtests.cypress.resources.requests.memory | string | `"4Gi"` |  |
| bbtests.cypress.resources.limits.cpu | string | `"2"` |  |
| bbtests.cypress.resources.limits.memory | string | `"4Gi"` |  |
| bbtests.cypress.artifacts | bool | `true` |  |
| bbtests.cypress.envs.cypress_url | string | `"http://{{ template \"enterprise.ui.fullname\" . }}:{{ .Values.ui.service.port }}"` |  |
| bbtests.cypress.envs.cypress_user | string | `"admin"` |  |
| bbtests.cypress.envs.cypress_registry | string | `"docker.io"` |  |
| bbtests.cypress.envs.cypress_repository | string | `"anchore/grype"` |  |
| bbtests.cypress.envs.cypress_tag | string | `"latest"` |  |
| bbtests.cypress.secretEnvs[0].name | string | `"cypress_password"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ template \"enterprise.fullname\" . }}"` |  |
| bbtests.cypress.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"ANCHORE_ADMIN_PASSWORD"` |  |
| global.fullnameOverride | string | `"anchore-enterprise"` |  |
| global.nameOverride | string | `"anchore-enterprise"` |  |
| upstream | object | Upstream chart values | Values to pass to [the upstream Anchore Enterprise chart](https://github.com/anchore/anchore-charts/blob/main/stable/enterprise/values.yaml) |
| ui-redis.enabled | bool | `true` |  |
| ui-redis.istio.enabled | string | `"{{ .Values.istio.enabled }}"` |  |
| ui-redis.auth.password | string | `"anchore-redis,123"` |  |
| ui-redis.commonConfiguration | string | `"maxmemory 200mb\nsave \"\""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.externalDBCheckEnabled | bool | `false` |  |
| postgresql.primary.podSecurityContext.enabled | bool | `true` |  |
| postgresql.primary.podSecurityContext.fsGroup | int | `1001` |  |
| postgresql.primary.podSecurityContext.runAsUser | int | `1001` |  |
| postgresql.primary.podSecurityContext.runAsGroup | int | `1001` |  |
| postgresql.primary.containerSecurityContext.enabled | bool | `true` |  |
| postgresql.primary.containerSecurityContext.runAsUser | int | `1001` |  |
| postgresql.primary.containerSecurityContext.runAsGroup | int | `1001` |  |
| postgresql.primary.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| postgresql.primary.persistence.resourcePolicy | string | `"keep"` |  |
| postgresql.primary.persistence.subPath | string | `"data/pgdata"` |  |
| postgresql.primary.persistence.mountPath | string | `"/var/lib/postgresql"` |  |
| postgresql.primary.postgresqlDataDir | string | `"/var/lib/postgresql/data"` |  |
| postgresql.image.registry | string | `"registry1.dso.mil"` |  |
| postgresql.image.repository | string | `"ironbank/opensource/postgres/postgresql"` |  |
| postgresql.image.tag | string | `"16.2"` |  |
| postgresql.global.imagePullSecrets[0] | string | `"private-registry"` |  |
| postgresql.postgresqlConfiguration.listen_addresses | string | `"*"` |  |
| postgresql.pgHbaConfiguration | string | `"local all all scram-sha-256\nhost all all all scram-sha-256"` |  |
| postgresql.postgresUser | string | `"anchore"` |  |
| postgresql.postgresPassword | string | `"anchore-postgres,123"` |  |
| postgresql.postgresDatabase | string | `"anchore"` |  |
| postgresql.resources.limits.cpu | string | `"1000m"` |  |
| postgresql.resources.limits.memory | string | `"4096Mi"` |  |
| postgresql.resources.requests.cpu | string | `"1000m"` |  |
| postgresql.resources.requests.memory | string | `"4096Mi"` |  |
| postgresql.metrics.resources.limits.cpu | string | `"100m"` |  |
| postgresql.metrics.resources.limits.memory | string | `"256Mi"` |  |
| postgresql.metrics.resources.requests.cpu | string | `"100m"` |  |
| postgresql.metrics.resources.requests.memory | string | `"256Mi"` |  |
| postgresql.securityContext.enabled | bool | `true` |  |
| postgresql.securityContext.fsGroup | int | `1001` |  |
| postgresql.securityContext.runAsUser | int | `1001` |  |
| postgresql.securityContext.runAsGroup | int | `1001` |  |
| postgresql.containerSecurityContext.enabled | bool | `true` |  |
| postgresql.containerSecurityContext.runAsUser | int | `1001` |  |
| postgresql.containerSecurityContext.runAsGroup | int | `1001` |  |
| postgresql.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| postgresqlSuperUser.postgresUsername | string | `""` |  |
| postgresqlSuperUser.postgresPassword | string | `""` |  |
| postgresqlSuperUser.existingSecret | string | `nil` |  |
| ensureDbJobs.resources.limits.cpu | int | `2` |  |
| ensureDbJobs.resources.limits.memory | string | `"2G"` |  |
| ensureDbJobs.resources.requests.cpu | int | `2` |  |
| ensureDbJobs.resources.requests.memory | string | `"2G"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._
