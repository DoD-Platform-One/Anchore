# postgresql

![Version: 13.12](https://img.shields.io/badge/Version-13.12-informational?style=flat-square) ![AppVersion: 13.12](https://img.shields.io/badge/AppVersion-13.12-informational?style=flat-square)

Chart for PostgreSQL, an object-relational database management system (ORDBMS) with an emphasis on extensibility and on standards-compliance.

## Upstream References
* <https://github.com/bitnami/charts/tree/master/bitnami/postgresql>

* <https://github.com/bitnami/bitnami-docker-postgresql>
* <https://www.postgresql.org/>

## Learn More
* [Application Overview](docs/overview.md)
* [Other Documentation](docs/)

## Pre-Requisites

* Kubernetes Cluster deployed
* Kubernetes config installed in `~/.kube/config`
* Helm installed

Install Helm

https://helm.sh/docs/intro/install/

## Deployment

* Clone down the repository
* cd into directory
```bash
helm install postgresql chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.postgresql | object | `{}` |  |
| image.registry | string | `"registry1.dso.mil"` |  |
| image.repository | string | `"ironbank/opensource/postgres/postgresql"` |  |
| image.tag | float | `13.12` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.pullSecrets[0] | string | `"private-registry"` |  |
| image.debug | bool | `false` |  |
| volumePermissions.enabled | bool | `false` |  |
| volumePermissions.image.registry | string | `"docker.io"` |  |
| volumePermissions.image.repository | string | `"bitnami/bitnami-shell"` |  |
| volumePermissions.image.tag | string | `"10"` |  |
| volumePermissions.image.pullPolicy | string | `"Always"` |  |
| volumePermissions.securityContext.runAsUser | int | `0` |  |
| volumePermissions.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.enabled | bool | `true` |  |
| securityContext.fsGroup | int | `26` |  |
| containerSecurityContext.enabled | bool | `true` |  |
| containerSecurityContext.runAsUser | int | `26` |  |
| containerSecurityContext.runAsGroup | int | `26` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| serviceAccount.enabled | bool | `false` |  |
| psp.create | bool | `false` |  |
| rbac.create | bool | `false` |  |
| replication.enabled | bool | `false` |  |
| replication.user | string | `"repl_user"` |  |
| replication.password | string | `"repl_password"` |  |
| replication.readReplicas | int | `1` |  |
| replication.synchronousCommit | string | `"off"` |  |
| replication.numSynchronousReplicas | int | `0` |  |
| replication.applicationName | string | `"my_application"` |  |
| postgresqlUsername | string | `"postgres"` |  |
| postgresqlDataDir | string | `"/var/lib/postgresql/pgdata/data"` |  |
| extraEnv | list | `[]` |  |
| primaryAsStandBy.enabled | bool | `false` |  |
| audit.logHostname | bool | `false` |  |
| audit.logConnections | bool | `false` |  |
| audit.logDisconnections | bool | `false` |  |
| audit.pgAuditLog | string | `""` |  |
| audit.pgAuditLogCatalog | string | `"off"` |  |
| audit.clientMinMessages | string | `"error"` |  |
| audit.logLinePrefix | string | `""` |  |
| audit.logTimezone | string | `""` |  |
| postgresqlSharedPreloadLibraries | string | `"pgaudit"` |  |
| postgresqlMaxConnections | string | `nil` |  |
| postgresqlPostgresConnectionLimit | string | `nil` |  |
| postgresqlDbUserConnectionLimit | string | `nil` |  |
| postgresqlTcpKeepalivesInterval | string | `nil` |  |
| postgresqlTcpKeepalivesIdle | string | `nil` |  |
| postgresqlTcpKeepalivesCount | string | `nil` |  |
| postgresqlStatementTimeout | string | `nil` |  |
| postgresqlPghbaRemoveFilters | string | `nil` |  |
| ldap.enabled | bool | `false` |  |
| ldap.url | string | `""` |  |
| ldap.server | string | `""` |  |
| ldap.port | string | `""` |  |
| ldap.prefix | string | `""` |  |
| ldap.suffix | string | `""` |  |
| ldap.baseDN | string | `""` |  |
| ldap.bindDN | string | `""` |  |
| ldap.bind_password | string | `nil` |  |
| ldap.search_attr | string | `""` |  |
| ldap.search_filter | string | `""` |  |
| ldap.scheme | string | `""` |  |
| ldap.tls | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `5432` |  |
| service.annotations | object | `{}` |  |
| shmVolume.enabled | bool | `true` |  |
| shmVolume.chmod.enabled | bool | `true` |  |
| persistence.enabled | bool | `true` |  |
| persistence.mountPath | string | `"/var/lib/postgresql"` |  |
| persistence.subPath | string | `""` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.size | string | `"8Gi"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.selector | object | `{}` |  |
| updateStrategy.type | string | `"RollingUpdate"` |  |
| primary.podAffinityPreset | string | `""` |  |
| primary.podAntiAffinityPreset | string | `"soft"` |  |
| primary.nodeAffinityPreset.type | string | `""` |  |
| primary.nodeAffinityPreset.key | string | `""` |  |
| primary.nodeAffinityPreset.values | list | `[]` |  |
| primary.affinity | object | `{}` |  |
| primary.nodeSelector | object | `{}` |  |
| primary.tolerations | list | `[]` |  |
| primary.labels | object | `{}` |  |
| primary.annotations | object | `{}` |  |
| primary.podLabels | object | `{}` |  |
| primary.podAnnotations | object | `{}` |  |
| primary.priorityClassName | string | `""` |  |
| primary.extraInitContainers | list | `[]` |  |
| primary.extraVolumeMounts | list | `[]` |  |
| primary.extraVolumes | list | `[]` |  |
| primary.sidecars | list | `[]` |  |
| primary.service | object | `{}` |  |
| readReplicas.podAffinityPreset | string | `""` |  |
| readReplicas.podAntiAffinityPreset | string | `"soft"` |  |
| readReplicas.nodeAffinityPreset.type | string | `""` |  |
| readReplicas.nodeAffinityPreset.key | string | `""` |  |
| readReplicas.nodeAffinityPreset.values | list | `[]` |  |
| readReplicas.affinity | object | `{}` |  |
| readReplicas.nodeSelector | object | `{}` |  |
| readReplicas.tolerations | list | `[]` |  |
| readReplicas.labels | object | `{}` |  |
| readReplicas.annotations | object | `{}` |  |
| readReplicas.podLabels | object | `{}` |  |
| readReplicas.podAnnotations | object | `{}` |  |
| readReplicas.priorityClassName | string | `""` |  |
| readReplicas.extraInitContainers | list | `[]` |  |
| readReplicas.extraVolumeMounts | list | `[]` |  |
| readReplicas.extraVolumes | list | `[]` |  |
| readReplicas.sidecars | list | `[]` |  |
| readReplicas.service | object | `{}` |  |
| readReplicas.persistence.enabled | bool | `true` |  |
| readReplicas.resources | object | `{}` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| resources.requests.cpu | string | `"250m"` |  |
| commonAnnotations | object | `{}` |  |
| networkPolicy.enabled | bool | `false` |  |
| networkPolicy.allowExternal | bool | `true` |  |
| networkPolicy.explicitNamespacesSelector | object | `{}` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.initialDelaySeconds | int | `30` |  |
| startupProbe.periodSeconds | int | `15` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| startupProbe.failureThreshold | int | `10` |  |
| startupProbe.successThreshold | int | `1` |  |
| livenessProbe.enabled | bool | `true` |  |
| livenessProbe.initialDelaySeconds | int | `30` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| livenessProbe.failureThreshold | int | `6` |  |
| livenessProbe.successThreshold | int | `1` |  |
| readinessProbe.enabled | bool | `true` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| readinessProbe.failureThreshold | int | `6` |  |
| readinessProbe.successThreshold | int | `1` |  |
| customStartupProbe | object | `{}` |  |
| customLivenessProbe | object | `{}` |  |
| customReadinessProbe | object | `{}` |  |
| tls.enabled | bool | `false` |  |
| tls.preferServerCiphers | bool | `true` |  |
| tls.certificatesSecret | string | `""` |  |
| tls.certFilename | string | `""` |  |
| tls.certKeyFilename | string | `""` |  |
| tls.certCAFilename | string | `nil` |  |
| tls.crlFilename | string | `nil` |  |
| metrics.enabled | bool | `false` |  |
| metrics.service.type | string | `"ClusterIP"` |  |
| metrics.service.annotations."prometheus.io/scrape" | string | `"true"` |  |
| metrics.service.annotations."prometheus.io/port" | string | `"9187"` |  |
| metrics.service.loadBalancerIP | string | `nil` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| metrics.prometheusRule.enabled | bool | `false` |  |
| metrics.prometheusRule.additionalLabels | object | `{}` |  |
| metrics.prometheusRule.namespace | string | `""` |  |
| metrics.prometheusRule.rules | list | `[]` |  |
| metrics.image.registry | string | `"docker.io"` |  |
| metrics.image.repository | string | `"bitnami/postgres-exporter"` |  |
| metrics.image.tag | string | `"0.9.0-debian-10-r6"` |  |
| metrics.image.pullPolicy | string | `"IfNotPresent"` |  |
| metrics.extraEnvVars | object | `{}` |  |
| metrics.securityContext.enabled | bool | `false` |  |
| metrics.securityContext.runAsUser | int | `26` |  |
| metrics.securityContext.runAsGroup | int | `26` |  |
| metrics.livenessProbe.enabled | bool | `true` |  |
| metrics.livenessProbe.initialDelaySeconds | int | `5` |  |
| metrics.livenessProbe.periodSeconds | int | `10` |  |
| metrics.livenessProbe.timeoutSeconds | int | `5` |  |
| metrics.livenessProbe.failureThreshold | int | `6` |  |
| metrics.livenessProbe.successThreshold | int | `1` |  |
| metrics.readinessProbe.enabled | bool | `true` |  |
| metrics.readinessProbe.initialDelaySeconds | int | `5` |  |
| metrics.readinessProbe.periodSeconds | int | `10` |  |
| metrics.readinessProbe.timeoutSeconds | int | `5` |  |
| metrics.readinessProbe.failureThreshold | int | `6` |  |
| metrics.readinessProbe.successThreshold | int | `1` |  |
| extraDeploy | list | `[]` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
