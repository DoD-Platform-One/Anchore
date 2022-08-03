# anchore-engine

![Version: 1.18.6-bb.11](https://img.shields.io/badge/Version-1.18.6--bb.11-informational?style=flat-square) ![AppVersion: 1.1.0](https://img.shields.io/badge/AppVersion-1.1.0-informational?style=flat-square)

Anchore container analysis and policy evaluation engine service

## Upstream References
* <https://anchore.com>

* <https://github.com/anchore/anchore-engine>

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
helm install anchore-engine chart/
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| domain | string | `"bigbang.dev"` |  |
| istio.enabled | bool | `false` |  |
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
| istio.mtls | object | `{"mode":"STRICT"}` | Default peer authentication |
| istio.mtls.mode | string | `"STRICT"` | STRICT = Allow only mutual TLS traffic, PERMISSIVE = Allow both plain text and mutual TLS traffic |
| networkPolicies.enabled | bool | `false` |  |
| networkPolicies.ingressLabels.app | string | `"istio-ingressgateway"` |  |
| networkPolicies.ingressLabels.istio | string | `"ingressgateway"` |  |
| postgresqlSuperUser.postgresUsername | string | `""` |  |
| postgresqlSuperUser.postgresPassword | string | `""` |  |
| postgresqlSuperUser.existingSecret | string | `nil` |  |
| ensureDbJobs.resources.limits.cpu | string | `"100m"` |  |
| ensureDbJobs.resources.limits.memory | string | `"256Mi"` |  |
| ensureDbJobs.resources.requests.cpu | string | `"100m"` |  |
| ensureDbJobs.resources.requests.memory | string | `"256Mi"` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| enterpriseLicenseYaml | string | `""` |  |
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
| postgresql.image.registry | string | `"registry1.dso.mil"` |  |
| postgresql.image.repository | string | `"ironbank/opensource/postgres/postgresql12"` |  |
| postgresql.image.tag | float | `12.11` |  |
| postgresql.global.imagePullSecrets[0] | string | `"private-registry"` |  |
| postgresql.externalEndpoint | string | `nil` |  |
| postgresql.postgresUser | string | `"anchoreengine"` |  |
| postgresql.postgresPassword | string | `"anchore-postgres,123"` |  |
| postgresql.postgresDatabase | string | `"anchore"` |  |
| postgresql.securityContext.enabled | bool | `true` |  |
| postgresql.securityContext.fsGroup | int | `26` |  |
| postgresql.securityContext.runAsUser | int | `26` |  |
| postgresql.securityContext.runAsGroup | int | `26` |  |
| postgresql.containerSecurityContext.enabled | bool | `true` |  |
| postgresql.containerSecurityContext.runAsUser | int | `26` |  |
| postgresql.containerSecurityContext.runAsGroup | int | `26` |  |
| postgresql.persistence.resourcePolicy | string | `"keep"` |  |
| postgresql.persistence.size | string | `"20Gi"` |  |
| postgresql.persistence.subPath | string | `"data/pgdata"` |  |
| postgresql.persistence.mountPath | string | `"/var/lib/postgresql"` |  |
| postgresql.postgresqlDataDir | string | `"/var/lib/postgresql/data"` |  |
| postgresql.resources.limits.cpu | string | `"200m"` |  |
| postgresql.resources.limits.memory | string | `"1024Mi"` |  |
| postgresql.resources.requests.cpu | string | `"200m"` |  |
| postgresql.resources.requests.memory | string | `"1024Mi"` |  |
| postgresql.metrics.resources.limits.cpu | string | `"100m"` |  |
| postgresql.metrics.resources.limits.memory | string | `"256Mi"` |  |
| postgresql.metrics.resources.requests.cpu | string | `"100m"` |  |
| postgresql.metrics.resources.requests.memory | string | `"256Mi"` |  |
| postgresql.postgresConfiguration.listen_addresses | string | `"*"` |  |
| postgresql.pgHbaConfiguration | string | `"local all all md5\nhost all all all md5"` |  |
| cloudsql.enabled | bool | `false` |  |
| cloudsql.instance | string | `""` |  |
| cloudsql.image.repository | string | `"gcr.io/cloudsql-docker/gce-proxy"` |  |
| cloudsql.image.tag | string | `"1.22.0"` |  |
| cloudsql.image.pullPolicy | string | `"IfNotPresent"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.labels | object | `{}` |  |
| ingress.apiPath | string | `"/v1/"` |  |
| ingress.uiPath | string | `"/"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| ingress.tls | list | `[]` |  |
| anchoreGlobal.image | string | `"registry1.dso.mil/ironbank/anchore/engine/engine:1.1.0"` |  |
| anchoreGlobal.imagePullPolicy | string | `"IfNotPresent"` |  |
| anchoreGlobal.imagePullSecretName | string | `"private-registry"` |  |
| anchoreGlobal.serviceAccountName | string | `nil` |  |
| anchoreGlobal.openShiftDeployment | bool | `false` |  |
| anchoreGlobal.labels | object | `{}` |  |
| anchoreGlobal.annotations | object | `{}` |  |
| anchoreGlobal.deploymentAnnotations | object | `{}` |  |
| anchoreGlobal.extraEnv | list | `[]` |  |
| anchoreGlobal.existingSecret | string | `nil` |  |
| anchoreGlobal.scratchVolume.fixGroupPermissions | bool | `false` |  |
| anchoreGlobal.scratchVolume.mountPath | string | `"/analysis_scratch"` |  |
| anchoreGlobal.scratchVolume.details | object | `{}` |  |
| anchoreGlobal.certStoreSecretName | string | `nil` |  |
| anchoreGlobal.securityContext.runAsUser | int | `1000` |  |
| anchoreGlobal.securityContext.runAsGroup | int | `1000` |  |
| anchoreGlobal.securityContext.fsGroup | int | `1000` |  |
| anchoreGlobal.serviceDir | string | `"/anchore_service"` |  |
| anchoreGlobal.logLevel | string | `"INFO"` |  |
| anchoreGlobal.imageAnalyzeTimeoutSeconds | int | `36000` |  |
| anchoreGlobal.allowECRUseIAMRole | bool | `false` |  |
| anchoreGlobal.serverRequestTimeout | int | `60` |  |
| anchoreGlobal.enableMetrics | bool | `false` |  |
| anchoreGlobal.metricsAuthDisabled | bool | `false` |  |
| anchoreGlobal.defaultAdminPassword | string | `nil` |  |
| anchoreGlobal.defaultAdminEmail | string | `"example@email.com"` |  |
| anchoreGlobal.saml.secret | string | `nil` |  |
| anchoreGlobal.saml.useExistingSecret | bool | `false` |  |
| anchoreGlobal.saml.privateKeyName | string | `nil` |  |
| anchoreGlobal.saml.publicKeyName | string | `nil` |  |
| anchoreGlobal.oauthEnabled | bool | `true` |  |
| anchoreGlobal.oauthTokenExpirationSeconds | int | `3600` |  |
| anchoreGlobal.hashedPasswords | bool | `true` |  |
| anchoreGlobal.dbConfig.timeout | int | `120` |  |
| anchoreGlobal.dbConfig.ssl | bool | `false` |  |
| anchoreGlobal.dbConfig.sslMode | string | `"verify-full"` |  |
| anchoreGlobal.dbConfig.sslRootCertName | string | `nil` |  |
| anchoreGlobal.dbConfig.connectionPoolSize | int | `30` |  |
| anchoreGlobal.dbConfig.connectionPoolMaxOverflow | int | `100` |  |
| anchoreGlobal.dbConfig.engineArgs | object | `{}` |  |
| anchoreGlobal.internalServicesSsl.enabled | bool | `false` |  |
| anchoreGlobal.internalServicesSsl.verifyCerts | bool | `false` |  |
| anchoreGlobal.internalServicesSsl.certSecretKeyName | string | `nil` |  |
| anchoreGlobal.internalServicesSsl.certSecretCertName | string | `nil` |  |
| anchoreGlobal.webhooksEnabled | bool | `true` |  |
| anchoreGlobal.webhooks.webhook_user | string | `nil` |  |
| anchoreGlobal.webhooks.webhook_pass | string | `nil` |  |
| anchoreGlobal.webhooks.ssl_verify | bool | `true` |  |
| anchoreGlobal.webhooks.general | object | `{}` |  |
| anchoreGlobal.policyBundles | string | `nil` |  |
| anchoreGlobal.probes.liveness.initialDelaySeconds | int | `120` |  |
| anchoreGlobal.probes.liveness.timeoutSeconds | int | `10` |  |
| anchoreGlobal.probes.liveness.periodSeconds | int | `10` |  |
| anchoreGlobal.probes.liveness.failureThreshold | int | `6` |  |
| anchoreGlobal.probes.liveness.successThreshold | int | `1` |  |
| anchoreGlobal.probes.readiness.timeoutSeconds | int | `10` |  |
| anchoreGlobal.probes.readiness.periodSeconds | int | `10` |  |
| anchoreGlobal.probes.readiness.failureThreshold | int | `3` |  |
| anchoreGlobal.probes.readiness.successThreshold | int | `1` |  |
| anchoreAnalyzer.replicaCount | int | `2` |  |
| anchoreAnalyzer.containerPort | int | `8084` |  |
| anchoreAnalyzer.extraEnv | list | `[]` |  |
| anchoreAnalyzer.cycleTimers.image_analyzer | int | `5` |  |
| anchoreAnalyzer.concurrentTasksPerWorker | int | `1` |  |
| anchoreAnalyzer.layerCacheMaxGigabytes | int | `0` |  |
| anchoreAnalyzer.enableHints | bool | `false` |  |
| anchoreAnalyzer.enableOwnedPackageFiltering | bool | `true` |  |
| anchoreAnalyzer.configFile.retrieve_files.file_list[0] | string | `"/etc/passwd"` |  |
| anchoreAnalyzer.configFile.secret_search.match_params[0] | string | `"MAXFILESIZE=10000"` |  |
| anchoreAnalyzer.configFile.secret_search.match_params[1] | string | `"STOREONMATCH=n"` |  |
| anchoreAnalyzer.configFile.secret_search.regexp_match[0] | string | `"AWS_ACCESS_KEY=(?i).*aws_access_key_id( *=+ *).*(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9]).*"` |  |
| anchoreAnalyzer.configFile.secret_search.regexp_match[1] | string | `"AWS_SECRET_KEY=(?i).*aws_secret_access_key( *=+ *).*(?<![A-Za-z0-9/+=])[A-Za-z0-9/+=]{40}(?![A-Za-z0-9/+=]).*"` |  |
| anchoreAnalyzer.configFile.secret_search.regexp_match[2] | string | `"PRIV_KEY=(?i)-+BEGIN(.*)PRIVATE KEY-+"` |  |
| anchoreAnalyzer.configFile.secret_search.regexp_match[3] | string | `"DOCKER_AUTH=(?i).*\"auth\": *\".+\""` |  |
| anchoreAnalyzer.configFile.secret_search.regexp_match[4] | string | `"API_KEY=(?i).*api(-\|_)key( *=+ *).*(?<![A-Z0-9])[A-Z0-9]{20,60}(?![A-Z0-9]).*"` |  |
| anchoreAnalyzer.resources.limits.cpu | int | `1` |  |
| anchoreAnalyzer.resources.limits.memory | string | `"4G"` |  |
| anchoreAnalyzer.resources.requests.cpu | int | `1` |  |
| anchoreAnalyzer.resources.requests.memory | string | `"4G"` |  |
| anchoreAnalyzer.labels | object | `{}` |  |
| anchoreAnalyzer.annotations | object | `{}` |  |
| anchoreAnalyzer.deploymentAnnotations | object | `{}` |  |
| anchoreAnalyzer.nodeSelector | object | `{}` |  |
| anchoreAnalyzer.tolerations | list | `[]` |  |
| anchoreAnalyzer.affinity | object | `{}` |  |
| anchoreApi.replicaCount | int | `1` |  |
| anchoreApi.extraEnv | list | `[]` |  |
| anchoreApi.service.type | string | `"ClusterIP"` |  |
| anchoreApi.service.port | int | `8228` |  |
| anchoreApi.service.annotations | object | `{}` |  |
| anchoreApi.service.label | object | `{}` |  |
| anchoreApi.resources.limits.cpu | int | `1` |  |
| anchoreApi.resources.limits.memory | string | `"4G"` |  |
| anchoreApi.resources.requests.cpu | int | `1` |  |
| anchoreApi.resources.requests.memory | string | `"4G"` |  |
| anchoreApi.labels | object | `{}` |  |
| anchoreApi.annotations | object | `{}` |  |
| anchoreApi.deploymentAnnotations | object | `{}` |  |
| anchoreApi.nodeSelector | object | `{}` |  |
| anchoreApi.tolerations | list | `[]` |  |
| anchoreApi.affinity | object | `{}` |  |
| anchoreCatalog.replicaCount | int | `1` |  |
| anchoreCatalog.extraEnv | list | `[]` |  |
| anchoreCatalog.cycleTimers.image_watcher | int | `3600` |  |
| anchoreCatalog.cycleTimers.policy_eval | int | `3600` |  |
| anchoreCatalog.cycleTimers.vulnerability_scan | int | `14400` |  |
| anchoreCatalog.cycleTimers.analyzer_queue | int | `1` |  |
| anchoreCatalog.cycleTimers.archive_tasks | int | `43200` |  |
| anchoreCatalog.cycleTimers.notifications | int | `30` |  |
| anchoreCatalog.cycleTimers.service_watcher | int | `15` |  |
| anchoreCatalog.cycleTimers.repo_watcher | int | `60` |  |
| anchoreCatalog.cycleTimers.image_gc | int | `60` |  |
| anchoreCatalog.cycleTimers.k8s_watcher | int | `300` |  |
| anchoreCatalog.cycleTimers.k8s_image_watcher | int | `150` |  |
| anchoreCatalog.cycleTimers.resource_metrics | int | `60` |  |
| anchoreCatalog.cycleTimers.events_gc | int | `43200` |  |
| anchoreCatalog.events.max_retention_age_days | int | `0` |  |
| anchoreCatalog.events.notification.enabled | bool | `false` |  |
| anchoreCatalog.events.notification.level[0] | string | `"error"` |  |
| anchoreCatalog.analysis_archive.compression.enabled | bool | `true` |  |
| anchoreCatalog.analysis_archive.compression.min_size_kbytes | int | `100` |  |
| anchoreCatalog.analysis_archive.storage_driver.name | string | `"db"` |  |
| anchoreCatalog.analysis_archive.storage_driver.config | object | `{}` |  |
| anchoreCatalog.object_store.compression.enabled | bool | `true` |  |
| anchoreCatalog.object_store.compression.min_size_kbytes | int | `100` |  |
| anchoreCatalog.object_store.storage_driver.name | string | `"db"` |  |
| anchoreCatalog.object_store.storage_driver.config | object | `{}` |  |
| anchoreCatalog.createServiceAccount | bool | `true` |  |
| anchoreCatalog.runtimeInventory.imageTTLDays | int | `1` |  |
| anchoreCatalog.runtimeInventory.reportAnchoreCluster.enabled | bool | `true` |  |
| anchoreCatalog.runtimeInventory.reportAnchoreCluster.clusterName | string | `"anchore-k8s"` |  |
| anchoreCatalog.runtimeInventory.reportAnchoreCluster.namespaces[0] | string | `"all"` |  |
| anchoreCatalog.service.type | string | `"ClusterIP"` |  |
| anchoreCatalog.service.port | int | `8082` |  |
| anchoreCatalog.service.annotations | object | `{}` |  |
| anchoreCatalog.service.labels | object | `{}` |  |
| anchoreCatalog.resources.limits.cpu | int | `1` |  |
| anchoreCatalog.resources.limits.memory | string | `"2G"` |  |
| anchoreCatalog.resources.requests.cpu | int | `1` |  |
| anchoreCatalog.resources.requests.memory | string | `"2G"` |  |
| anchoreCatalog.labels | object | `{}` |  |
| anchoreCatalog.annotations | object | `{}` |  |
| anchoreCatalog.deploymentAnnotations | object | `{}` |  |
| anchoreCatalog.nodeSelector | object | `{}` |  |
| anchoreCatalog.tolerations | list | `[]` |  |
| anchoreCatalog.affinity | object | `{}` |  |
| anchorePolicyEngine.replicaCount | int | `1` |  |
| anchorePolicyEngine.extraEnv | list | `[]` |  |
| anchorePolicyEngine.cycleTimers.feed_sync | int | `14400` |  |
| anchorePolicyEngine.cycleTimers.feed_sync_checker | int | `3600` |  |
| anchorePolicyEngine.cycleTimers.grypedb_sync | int | `60` |  |
| anchorePolicyEngine.vulnerabilityProvider | string | `"grype"` |  |
| anchorePolicyEngine.cacheTTL | int | `3600` |  |
| anchorePolicyEngine.service.type | string | `"ClusterIP"` |  |
| anchorePolicyEngine.service.port | int | `8087` |  |
| anchorePolicyEngine.service.annotations | object | `{}` |  |
| anchorePolicyEngine.service.labels | object | `{}` |  |
| anchorePolicyEngine.resources.limits.cpu | int | `1` |  |
| anchorePolicyEngine.resources.limits.memory | string | `"4G"` |  |
| anchorePolicyEngine.resources.requests.cpu | int | `1` |  |
| anchorePolicyEngine.resources.requests.memory | string | `"4G"` |  |
| anchorePolicyEngine.labels | object | `{}` |  |
| anchorePolicyEngine.annotations | object | `{}` |  |
| anchorePolicyEngine.deploymentAnnotations | object | `{}` |  |
| anchorePolicyEngine.nodeSelector | object | `{}` |  |
| anchorePolicyEngine.tolerations | list | `[]` |  |
| anchorePolicyEngine.affinity | object | `{}` |  |
| anchoreSimpleQueue.replicaCount | int | `1` |  |
| anchoreSimpleQueue.extraEnv | list | `[]` |  |
| anchoreSimpleQueue.service.type | string | `"ClusterIP"` |  |
| anchoreSimpleQueue.service.port | int | `8083` |  |
| anchoreSimpleQueue.service.annotations | object | `{}` |  |
| anchoreSimpleQueue.service.labels | object | `{}` |  |
| anchoreSimpleQueue.resources.limits.cpu | int | `1` |  |
| anchoreSimpleQueue.resources.limits.memory | string | `"1G"` |  |
| anchoreSimpleQueue.resources.requests.cpu | int | `1` |  |
| anchoreSimpleQueue.resources.requests.memory | string | `"1G"` |  |
| anchoreSimpleQueue.labels | object | `{}` |  |
| anchoreSimpleQueue.annotations | object | `{}` |  |
| anchoreSimpleQueue.deploymentAnnotations | object | `{}` |  |
| anchoreSimpleQueue.nodeSelector | object | `{}` |  |
| anchoreSimpleQueue.tolerations | list | `[]` |  |
| anchoreSimpleQueue.affinity | object | `{}` |  |
| anchoreEngineUpgradeJob.enabled | bool | `true` |  |
| anchoreEngineUpgradeJob.resources.limits.cpu | int | `1` |  |
| anchoreEngineUpgradeJob.resources.limits.memory | string | `"1G"` |  |
| anchoreEngineUpgradeJob.resources.requests.cpu | int | `1` |  |
| anchoreEngineUpgradeJob.resources.requests.memory | string | `"1G"` |  |
| anchoreEngineUpgradeJob.nodeSelector | object | `{}` |  |
| anchoreEngineUpgradeJob.tolerations | list | `[]` |  |
| anchoreEngineUpgradeJob.affinity | object | `{}` |  |
| anchoreEngineUpgradeJob.annotations | object | `{}` |  |
| anchoreEnterpriseGlobal.enabled | bool | `false` |  |
| anchoreEnterpriseGlobal.licenseSecretName | string | `"anchore-enterprise-license"` |  |
| anchoreEnterpriseGlobal.image | string | `"registry1.dso.mil/ironbank/anchore/enterprise/enterprise:4.0.2"` |  |
| anchoreEnterpriseGlobal.imagePullPolicy | string | `"IfNotPresent"` |  |
| anchoreEnterpriseGlobal.imagePullSecretName | string | `"private-registry"` |  |
| anchore-feeds-db.image.registry | string | `"registry1.dso.mil"` |  |
| anchore-feeds-db.image.repository | string | `"ironbank/opensource/postgres/postgresql12"` |  |
| anchore-feeds-db.image.tag | float | `12.11` |  |
| anchore-feeds-db.global.imagePullSecrets[0] | string | `"private-registry"` |  |
| anchore-feeds-db.externalEndpoint | string | `nil` |  |
| anchore-feeds-db.postgresUser | string | `"anchoreengine"` |  |
| anchore-feeds-db.postgresPassword | string | `"anchore-postgres,123"` |  |
| anchore-feeds-db.postgresDatabase | string | `"anchore-feeds"` |  |
| anchore-feeds-db.persistence.resourcePolicy | string | `"keep"` |  |
| anchore-feeds-db.persistence.size | string | `"20Gi"` |  |
| anchore-feeds-db.persistence.subPath | string | `"pgdata"` |  |
| anchore-feeds-db.persistence.mountPath | string | `"/var/lib/postgresql"` |  |
| anchore-feeds-db.postgresqlDataDir | string | `"/var/lib/postgresql/data"` |  |
| anchore-feeds-db.resources.limits.cpu | string | `"100m"` |  |
| anchore-feeds-db.resources.limits.memory | string | `"256Mi"` |  |
| anchore-feeds-db.resources.requests.cpu | string | `"100m"` |  |
| anchore-feeds-db.resources.requests.memory | string | `"256Mi"` |  |
| anchore-feeds-db.metrics.resources.limits.cpu | string | `"100m"` |  |
| anchore-feeds-db.metrics.resources.limits.memory | string | `"256Mi"` |  |
| anchore-feeds-db.metrics.resources.requests.cpu | string | `"100m"` |  |
| anchore-feeds-db.metrics.resources.requests.memory | string | `"256Mi"` |  |
| anchore-feeds-db.securityContext.enabled | bool | `true` |  |
| anchore-feeds-db.securityContext.fsGroup | int | `26` |  |
| anchore-feeds-db.securityContext.runAsUser | int | `26` |  |
| anchore-feeds-db.securityContext.runAsGroup | int | `26` |  |
| anchore-feeds-db.containerSecurityContext.enabled | bool | `true` |  |
| anchore-feeds-db.containerSecurityContext.runAsUser | int | `26` |  |
| anchore-feeds-db.containerSecurityContext.runAsGroup | int | `26` |  |
| anchore-feeds-db.postgresqlConfiguration.listen_addresses | string | `"*"` |  |
| anchore-feeds-db.pgHbaConfiguration | string | `"local all all md5\nhost all all all md5"` |  |
| anchore-feeds-gem-db.externalEndpoint | string | `nil` |  |
| anchore-feeds-gem-db.postgresUser | string | `"postgres"` |  |
| anchore-feeds-gem-db.postgresPassword | string | `"anchore-postgres,123"` |  |
| anchore-feeds-gem-db.postgresDatabase | string | `"gems"` |  |
| anchore-feeds-gem-db.persistence.enabled | bool | `false` |  |
| anchore-feeds-gem-db.postgresqlDataDir | string | `"/var/lib/postgresql/data"` |  |
| anchore-feeds-gem-db.securityContext.enabled | bool | `true` |  |
| anchore-feeds-gem-db.securityContext.fsGroup | int | `26` |  |
| anchore-feeds-gem-db.securityContext.runAsUser | int | `26` |  |
| anchore-feeds-gem-db.securityContext.runAsGroup | int | `26` |  |
| anchore-feeds-gem-db.containerSecurityContext.enabled | bool | `true` |  |
| anchore-feeds-gem-db.containerSecurityContext.runAsUser | int | `26` |  |
| anchore-feeds-gem-db.containerSecurityContext.runAsGroup | int | `26` |  |
| anchoreEnterpriseFeeds.enabled | bool | `true` |  |
| anchoreEnterpriseFeeds.url | string | `""` |  |
| anchoreEnterpriseFeeds.vulndbDriverEnabled | bool | `false` |  |
| anchoreEnterpriseFeeds.npmDriverEnabled | bool | `false` |  |
| anchoreEnterpriseFeeds.gemDriverEnabled | bool | `false` |  |
| anchoreEnterpriseFeeds.githubDriverEnabled | bool | `false` |  |
| anchoreEnterpriseFeeds.githubDriverToken | string | `nil` |  |
| anchoreEnterpriseFeeds.msrcDriverEnabled | bool | `false` |  |
| anchoreEnterpriseFeeds.rhelDriverConcurrency | int | `5` |  |
| anchoreEnterpriseFeeds.extraEnv | list | `[]` |  |
| anchoreEnterpriseFeeds.cycleTimers.driver_sync | int | `7200` |  |
| anchoreEnterpriseFeeds.existingSecret | string | `nil` |  |
| anchoreEnterpriseFeeds.dbConfig.timeout | int | `120` |  |
| anchoreEnterpriseFeeds.dbConfig.ssl | bool | `false` |  |
| anchoreEnterpriseFeeds.dbConfig.sslMode | string | `"verify-full"` |  |
| anchoreEnterpriseFeeds.dbConfig.sslRootCertName | string | `nil` |  |
| anchoreEnterpriseFeeds.dbConfig.connectionPoolSize | int | `30` |  |
| anchoreEnterpriseFeeds.dbConfig.connectionPoolMaxOverflow | int | `100` |  |
| anchoreEnterpriseFeeds.dbConfig.engineArgs | object | `{}` |  |
| anchoreEnterpriseFeeds.persistence.enabled | bool | `true` |  |
| anchoreEnterpriseFeeds.persistence.resourcePolicy | string | `"keep"` |  |
| anchoreEnterpriseFeeds.persistence.accessMode | string | `"ReadWriteOnce"` |  |
| anchoreEnterpriseFeeds.persistence.size | string | `"40Gi"` |  |
| anchoreEnterpriseFeeds.persistence.subPath | string | `"postgresql-db"` |  |
| anchoreEnterpriseFeeds.persistence.mountPath | string | `"/workspace"` |  |
| anchoreEnterpriseFeeds.service.type | string | `"ClusterIP"` |  |
| anchoreEnterpriseFeeds.service.port | int | `8448` |  |
| anchoreEnterpriseFeeds.service.annotations | object | `{}` |  |
| anchoreEnterpriseFeeds.service.labels | object | `{}` |  |
| anchoreEnterpriseFeeds.resources.limits.cpu | int | `1` |  |
| anchoreEnterpriseFeeds.resources.limits.memory | string | `"10G"` |  |
| anchoreEnterpriseFeeds.resources.requests.cpu | int | `1` |  |
| anchoreEnterpriseFeeds.resources.requests.memory | string | `"10G"` |  |
| anchoreEnterpriseFeeds.labels | object | `{}` |  |
| anchoreEnterpriseFeeds.annotations | object | `{}` |  |
| anchoreEnterpriseFeeds.deploymentAnnotations | object | `{}` |  |
| anchoreEnterpriseFeeds.nodeSelector | object | `{}` |  |
| anchoreEnterpriseFeeds.tolerations | list | `[]` |  |
| anchoreEnterpriseFeeds.affinity | object | `{}` |  |
| anchoreEnterpriseFeedsUpgradeJob.enabled | bool | `true` |  |
| anchoreEnterpriseFeedsUpgradeJob.resources.limits.cpu | int | `1` |  |
| anchoreEnterpriseFeedsUpgradeJob.resources.limits.memory | string | `"1G"` |  |
| anchoreEnterpriseFeedsUpgradeJob.resources.requests.cpu | int | `1` |  |
| anchoreEnterpriseFeedsUpgradeJob.resources.requests.memory | string | `"1G"` |  |
| anchoreEnterpriseFeedsUpgradeJob.nodeSelector | object | `{}` |  |
| anchoreEnterpriseFeedsUpgradeJob.tolerations | list | `[]` |  |
| anchoreEnterpriseFeedsUpgradeJob.affinity | object | `{}` |  |
| anchoreEnterpriseFeedsUpgradeJob.annotations | object | `{}` |  |
| anchoreEnterpriseRbac.enabled | bool | `true` |  |
| anchoreEnterpriseRbac.extraEnv[0].name | string | `"AUTHLIB_INSECURE_TRANSPORT"` |  |
| anchoreEnterpriseRbac.extraEnv[0].value | string | `"true"` |  |
| anchoreEnterpriseRbac.service.managerPort | int | `8229` |  |
| anchoreEnterpriseRbac.service.authPort | int | `8089` |  |
| anchoreEnterpriseRbac.service.type | string | `"ClusterIP"` |  |
| anchoreEnterpriseRbac.service.annotations | object | `{}` |  |
| anchoreEnterpriseRbac.service.labels | object | `{}` |  |
| anchoreEnterpriseRbac.authResources.limits.cpu | int | `1` |  |
| anchoreEnterpriseRbac.authResources.limits.memory | string | `"1G"` |  |
| anchoreEnterpriseRbac.authResources.requests.cpu | int | `1` |  |
| anchoreEnterpriseRbac.authResources.requests.memory | string | `"1G"` |  |
| anchoreEnterpriseRbac.managerResources.limits.cpu | int | `1` |  |
| anchoreEnterpriseRbac.managerResources.limits.memory | string | `"4G"` |  |
| anchoreEnterpriseRbac.managerResources.requests.cpu | int | `1` |  |
| anchoreEnterpriseRbac.managerResources.requests.memory | string | `"4G"` |  |
| anchoreEnterpriseRbac.deploymentAnnotations | object | `{}` |  |
| anchoreEnterpriseReports.enabled | bool | `true` |  |
| anchoreEnterpriseReports.extraEnv | list | `[]` |  |
| anchoreEnterpriseReports.enableGraphiql | bool | `true` |  |
| anchoreEnterpriseReports.enableDataIngress | bool | `true` |  |
| anchoreEnterpriseReports.enableDataEgress | bool | `false` |  |
| anchoreEnterpriseReports.dataEgressWindow | int | `0` |  |
| anchoreEnterpriseReports.dataRefreshMaxWorkers | int | `10` |  |
| anchoreEnterpriseReports.dataLoadMaxWorkers | int | `10` |  |
| anchoreEnterpriseReports.cycleTimers.reports_data_load | int | `600` |  |
| anchoreEnterpriseReports.cycleTimers.reports_data_refresh | int | `7200` |  |
| anchoreEnterpriseReports.cycleTimers.reports_metrics | int | `3600` |  |
| anchoreEnterpriseReports.cycleTimers.reports_data_egress | int | `600` |  |
| anchoreEnterpriseReports.service.type | string | `"ClusterIP"` |  |
| anchoreEnterpriseReports.service.apiPort | int | `8558` |  |
| anchoreEnterpriseReports.service.workerPort | int | `8778` |  |
| anchoreEnterpriseReports.service.annotations | object | `{}` |  |
| anchoreEnterpriseReports.service.labels | object | `{}` |  |
| anchoreEnterpriseReports.resources.limits.cpu | int | `1` |  |
| anchoreEnterpriseReports.resources.limits.memory | string | `"1G"` |  |
| anchoreEnterpriseReports.resources.requests.cpu | int | `1` |  |
| anchoreEnterpriseReports.resources.requests.memory | string | `"1G"` |  |
| anchoreEnterpriseReports.labels | object | `{}` |  |
| anchoreEnterpriseReports.annotations | object | `{}` |  |
| anchoreEnterpriseReports.deploymentAnnotations | object | `{}` |  |
| anchoreEnterpriseReports.nodeSelector | object | `{}` |  |
| anchoreEnterpriseReports.tolerations | list | `[]` |  |
| anchoreEnterpriseReports.affinity | object | `{}` |  |
| anchoreEnterpriseNotifications.enabled | bool | `true` |  |
| anchoreEnterpriseNotifications.extraEnv | list | `[]` |  |
| anchoreEnterpriseNotifications.cycleTimers.notifications | int | `30` |  |
| anchoreEnterpriseNotifications.service.type | string | `"ClusterIP"` |  |
| anchoreEnterpriseNotifications.service.port | int | `8668` |  |
| anchoreEnterpriseNotifications.service.annotations | object | `{}` |  |
| anchoreEnterpriseNotifications.service.labels | object | `{}` |  |
| anchoreEnterpriseNotifications.resources.limits.cpu | int | `1` |  |
| anchoreEnterpriseNotifications.resources.limits.memory | string | `"1G"` |  |
| anchoreEnterpriseNotifications.resources.requests.cpu | int | `1` |  |
| anchoreEnterpriseNotifications.resources.requests.memory | string | `"1G"` |  |
| anchoreEnterpriseNotifications.labels | object | `{}` |  |
| anchoreEnterpriseNotifications.annotations | object | `{}` |  |
| anchoreEnterpriseNotifications.deploymentAnnotations | object | `{}` |  |
| anchoreEnterpriseNotifications.nodeSelector | object | `{}` |  |
| anchoreEnterpriseNotifications.tolerations | list | `[]` |  |
| anchoreEnterpriseNotifications.affinity | object | `{}` |  |
| anchoreEnterpriseUi.enabled | bool | `true` |  |
| anchoreEnterpriseUi.image | string | `"registry1.dso.mil/ironbank/anchore/enterpriseui/enterpriseui:4.0.0"` |  |
| anchoreEnterpriseUi.imagePullPolicy | string | `"IfNotPresent"` |  |
| anchoreEnterpriseUi.imagePullSecretName | string | `"private-registry"` |  |
| anchoreEnterpriseUi.extraEnv | list | `[]` |  |
| anchoreEnterpriseUi.existingSecret | string | `nil` |  |
| anchoreEnterpriseUi.appDBConfig.native | bool | `true` |  |
| anchoreEnterpriseUi.appDBConfig.pool.max | int | `10` |  |
| anchoreEnterpriseUi.appDBConfig.pool.min | int | `0` |  |
| anchoreEnterpriseUi.appDBConfig.pool.acquire | int | `30000` |  |
| anchoreEnterpriseUi.appDBConfig.pool.idle | int | `10000` |  |
| anchoreEnterpriseUi.ldapsRootCaCertName | string | `nil` |  |
| anchoreEnterpriseUi.enableProxy | bool | `false` |  |
| anchoreEnterpriseUi.enableSsl | bool | `false` |  |
| anchoreEnterpriseUi.enableSharedLogin | bool | `true` |  |
| anchoreEnterpriseUi.redisFlushdb | bool | `true` |  |
| anchoreEnterpriseUi.forceWebsocket | bool | `false` |  |
| anchoreEnterpriseUi.authenticationLock.count | int | `5` |  |
| anchoreEnterpriseUi.authenticationLock.expires | int | `300` |  |
| anchoreEnterpriseUi.service.type | string | `"ClusterIP"` |  |
| anchoreEnterpriseUi.service.port | int | `80` |  |
| anchoreEnterpriseUi.service.annotations | object | `{}` |  |
| anchoreEnterpriseUi.service.labels | object | `{}` |  |
| anchoreEnterpriseUi.service.sessionAffinity | string | `"ClientIP"` |  |
| anchoreEnterpriseUi.resources.limits.cpu | int | `1` |  |
| anchoreEnterpriseUi.resources.limits.memory | string | `"1G"` |  |
| anchoreEnterpriseUi.resources.requests.cpu | int | `1` |  |
| anchoreEnterpriseUi.resources.requests.memory | string | `"1G"` |  |
| anchoreEnterpriseUi.labels | object | `{}` |  |
| anchoreEnterpriseUi.annotations | object | `{}` |  |
| anchoreEnterpriseUi.deploymentAnnotations | object | `{}` |  |
| anchoreEnterpriseUi.nodeSelector | object | `{}` |  |
| anchoreEnterpriseUi.tolerations | list | `[]` |  |
| anchoreEnterpriseUi.affinity | object | `{}` |  |
| anchore-ui-redis.istio.enabled | string | `"{{ .Values.istio.enabled }}"` |  |
| anchore-ui-redis.auth.password | string | `"anchore-redis,123"` |  |
| anchore-ui-redis.externalEndpoint | string | `nil` |  |
| anchore-ui-redis.commonConfiguration | string | `"maxmemory 200mb\nsave \"\""` |  |
| anchoreEnterpriseEngineUpgradeJob.enabled | bool | `true` |  |
| anchoreEnterpriseEngineUpgradeJob.resources.limits.cpu | int | `1` |  |
| anchoreEnterpriseEngineUpgradeJob.resources.limits.memory | string | `"1G"` |  |
| anchoreEnterpriseEngineUpgradeJob.resources.requests.cpu | int | `1` |  |
| anchoreEnterpriseEngineUpgradeJob.resources.requests.memory | string | `"1G"` |  |
| anchoreEnterpriseEngineUpgradeJob.nodeSelector | object | `{}` |  |
| anchoreEnterpriseEngineUpgradeJob.tolerations | list | `[]` |  |
| anchoreEnterpriseEngineUpgradeJob.affinity | object | `{}` |  |
| anchoreEnterpriseEngineUpgradeJob.annotations | object | `{}` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/anchore/cli/cli:0.9.4"` |  |
| bbtests.scripts.envs.ANCHORE_CLI_URL | string | `"http://{{ template \"anchore-engine.api.fullname\" . }}:{{ .Values.anchoreApi.service.port }}/v1"` |  |
| bbtests.scripts.envs.ANCHORE_CLI_USER | string | `"admin"` |  |
| bbtests.scripts.envs.ANCHORE_SCAN_IMAGE | string | `"registry.dso.mil/platform-one/big-bang/apps/security-tools/anchore-enterprise/centos:latest"` |  |
| bbtests.scripts.secretEnvs[0].name | string | `"ANCHORE_CLI_PASS"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.name | string | `"{{ template \"anchore-engine.fullname\" . }}-admin-pass"` |  |
| bbtests.scripts.secretEnvs[0].valueFrom.secretKeyRef.key | string | `"ANCHORE_ADMIN_PASSWORD"` |  |
| bbtests.scripts.resources.requests.cpu | string | `"1"` |  |
| bbtests.scripts.resources.requests.memory | string | `"1Gi"` |  |
| bbtests.scripts.resources.limits.cpu | string | `"1"` |  |
| bbtests.scripts.resources.limits.memory | string | `"1Gi"` |  |

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.
