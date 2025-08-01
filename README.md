<!-- Warning: Do not manually edit this file. See notes on gluon + helm-docs at the end of this file for more information. -->
# anchore-enterprise

![Version: 3.10.0-bb.1](https://img.shields.io/badge/Version-3.10.0--bb.1-informational?style=flat-square) ![AppVersion: 5.18.0](https://img.shields.io/badge/AppVersion-5.18.0-informational?style=flat-square) ![Maintenance Track: bb_integrated](https://img.shields.io/badge/Maintenance_Track-bb_integrated-green?style=flat-square)

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

https://helm.sh/docs/intro/install/

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
| datasyncerHosts[0] | string | `"data.anchore-enterprise.com"` |  |
| datasyncerHosts[1] | string | `"s3.us-west-2.amazonaws.com"` |  |
| openshift | bool | `false` | Openshift Container Platform Feature Toggle |
| postgresqlSuperUser.postgresUsername | string | `""` |  |
| postgresqlSuperUser.postgresPassword | string | `""` |  |
| postgresqlSuperUser.existingSecret | string | `nil` |  |
| ensureDbJobs.resources.limits.cpu | int | `2` |  |
| ensureDbJobs.resources.limits.memory | string | `"2G"` |  |
| ensureDbJobs.resources.requests.cpu | int | `2` |  |
| ensureDbJobs.resources.requests.memory | string | `"2G"` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.namespace | string | `"monitoring"` |  |
| monitoring.serviceMonitor.scheme | string | `""` |  |
| monitoring.serviceMonitor.tlsConfig | object | `{}` |  |
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
| sso.containerSecurityContext.runAsUser | int | `1001` |  |
| sso.containerSecurityContext.runAsGroup | int | `1001` |  |
| sso.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| global.fullnameOverride | string | `""` |  |
| global.nameOverride | string | `"anchore-enterprise"` |  |
| image | string | `"registry1.dso.mil/ironbank/anchore/enterprise/enterprise:5.18.0"` |  |
| imagePullPolicy | string | `"IfNotPresent"` |  |
| imagePullSecretName | string | `"private-registry"` |  |
| kubectlImage | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.30.8"` |  |
| useExistingPullCredSecret | bool | `true` |  |
| imageCredentials.registry | string | `""` |  |
| imageCredentials.username | string | `""` |  |
| imageCredentials.password | string | `""` |  |
| imageCredentials.email | string | `""` |  |
| startMigrationPod | bool | `false` |  |
| migrationPodImage | string | `"registry1.dso.mil/ironbank/opensource/postgres/postgresql:16.2"` |  |
| serviceAccountName | string | `""` |  |
| injectSecretsViaEnv | bool | `false` |  |
| license | object | `{}` |  |
| licenseSecretName | string | `"anchore-enterprise-license"` |  |
| useExistingLicenseSecret | bool | `true` |  |
| certStoreSecretName | string | `""` |  |
| extraEnv | list | `[]` |  |
| useExistingSecrets | bool | `false` |  |
| existingSecretName | string | `"anchore-enterprise-env"` |  |
| labels | object | `{}` |  |
| annotations | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| topologySpreadConstraints | list | `[]` |  |
| scratchVolume.fixerInitContainerImage | string | `"alpine"` |  |
| scratchVolume.mountPath | string | `"/analysis_scratch"` |  |
| scratchVolume.fixGroupPermissions | bool | `false` |  |
| scratchVolume.details | object | `{}` |  |
| extraVolumes | list | `[]` |  |
| extraVolumeMounts | list | `[]` |  |
| securityContext.runAsUser | int | `1000` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.fsGroup | int | `1000` |  |
| containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| probes.liveness.initialDelaySeconds | int | `120` |  |
| probes.liveness.timeoutSeconds | int | `10` |  |
| probes.liveness.periodSeconds | int | `10` |  |
| probes.liveness.failureThreshold | int | `6` |  |
| probes.liveness.successThreshold | int | `1` |  |
| probes.readiness.timeoutSeconds | int | `10` |  |
| probes.readiness.periodSeconds | int | `10` |  |
| probes.readiness.failureThreshold | int | `3` |  |
| probes.readiness.successThreshold | int | `1` |  |
| doSourceAtEntry.enabled | bool | `false` |  |
| doSourceAtEntry.filePaths | list | `[]` |  |
| configOverride | string | `""` |  |
| scripts.anchore-config | string | `"#!/bin/bash\nwhile IFS= read -r line; do\n  while [[ \"$line\" =~ (\\$\\{[a-zA-Z_][a-zA-Z_0-9]*\\}) ]]; do\n    VAR_NAME=${BASH_REMATCH[1]#*\\{}; VAR_NAME=${VAR_NAME%\\}};\n    line=${line//${BASH_REMATCH[1]}/${!VAR_NAME}};\n  done;\n  printf '%s\\n' \"$line\";\ndone < /config/config.yaml\n"` |  |
| domainSuffix | string | `""` |  |
| anchoreConfig.service_dir | string | `"/anchore_service"` |  |
| anchoreConfig.log_level | string | `"<ALLOW_API_CONFIGURATION>"` |  |
| anchoreConfig.logging.colored_logging | bool | `false` |  |
| anchoreConfig.logging.exception_backtrace_logging | bool | `false` |  |
| anchoreConfig.logging.exception_diagnose_logging | bool | `false` |  |
| anchoreConfig.logging.file_rotation_rule | string | `"10 MB"` |  |
| anchoreConfig.logging.file_retention_rule | int | `10` |  |
| anchoreConfig.logging.log_level | string | `"<ALLOW_API_CONFIGURATION>"` |  |
| anchoreConfig.logging.server_access_logging | bool | `true` |  |
| anchoreConfig.logging.server_response_debug_logging | bool | `false` |  |
| anchoreConfig.logging.server_log_level | string | `"info"` |  |
| anchoreConfig.logging.structured_logging | bool | `false` |  |
| anchoreConfig.server.max_connection_backlog | int | `2048` |  |
| anchoreConfig.server.max_wsgi_middleware_worker_queue_size | int | `100` |  |
| anchoreConfig.server.max_wsgi_middleware_worker_count | int | `50` |  |
| anchoreConfig.server.timeout_graceful_shutdown | bool | `false` |  |
| anchoreConfig.server.timeout_keep_alive | int | `5` |  |
| anchoreConfig.audit.enabled | bool | `true` |  |
| anchoreConfig.allow_awsecr_iam_auto | bool | `true` |  |
| anchoreConfig.keys.secret | string | `""` |  |
| anchoreConfig.keys.privateKeyFileName | string | `""` |  |
| anchoreConfig.keys.publicKeyFileName | string | `""` |  |
| anchoreConfig.user_authentication.oauth.enabled | bool | `true` |  |
| anchoreConfig.user_authentication.oauth.default_token_expiration_seconds | int | `3600` |  |
| anchoreConfig.user_authentication.oauth.refresh_token_expiration_seconds | int | `86400` |  |
| anchoreConfig.user_authentication.allow_api_keys_for_saml_users | bool | `false` |  |
| anchoreConfig.user_authentication.max_api_key_age_days | int | `365` |  |
| anchoreConfig.user_authentication.max_api_keys_per_user | int | `100` |  |
| anchoreConfig.user_authentication.hashed_passwords | bool | `true` |  |
| anchoreConfig.user_authentication.sso_require_existing_users | bool | `false` |  |
| anchoreConfig.user_authentication.remove_deleted_user_api_keys_older_than_days | int | `365` |  |
| anchoreConfig.user_authentication.disallow_native_users | bool | `false` |  |
| anchoreConfig.user_authentication.log_saml_assertions | bool | `false` |  |
| anchoreConfig.metrics.enabled | bool | `false` |  |
| anchoreConfig.metrics.auth_disabled | bool | `false` |  |
| anchoreConfig.webhooks | object | `{}` |  |
| anchoreConfig.default_admin_password | string | `""` |  |
| anchoreConfig.default_admin_email | string | `"admin@myanchore"` |  |
| anchoreConfig.database.timeout | int | `120` |  |
| anchoreConfig.database.ssl | bool | `false` |  |
| anchoreConfig.database.sslMode | string | `"verify-full"` |  |
| anchoreConfig.database.sslRootCertFileName | string | `""` |  |
| anchoreConfig.database.db_pool_size | int | `30` |  |
| anchoreConfig.database.db_pool_max_overflow | int | `100` |  |
| anchoreConfig.database.engineArgs | object | `{}` |  |
| anchoreConfig.internalServicesSSL.enabled | bool | `false` |  |
| anchoreConfig.internalServicesSSL.verifyCerts | bool | `false` |  |
| anchoreConfig.internalServicesSSL.certSecretKeyFileName | string | `""` |  |
| anchoreConfig.internalServicesSSL.certSecretCertFileName | string | `""` |  |
| anchoreConfig.policyBundles | object | `{}` |  |
| anchoreConfig.apiext.external.enabled | bool | `false` |  |
| anchoreConfig.apiext.external.useTLS | bool | `true` |  |
| anchoreConfig.apiext.external.hostname | string | `""` |  |
| anchoreConfig.apiext.external.port | int | `8443` |  |
| anchoreConfig.apiext.image_content.remove_license_content_from_sbom_return | string | `"<ALLOW_API_CONFIGURATION>"` |  |
| anchoreConfig.analyzer.cycle_timers.image_analyzer | int | `1` |  |
| anchoreConfig.analyzer.layer_cache_max_gigabytes | int | `0` |  |
| anchoreConfig.analyzer.enable_hints | bool | `false` |  |
| anchoreConfig.analyzer.configFile.retrieve_files.file_list[0] | string | `"/etc/passwd"` |  |
| anchoreConfig.analyzer.configFile.secret_search.match_params[0] | string | `"MAXFILESIZE=10000"` |  |
| anchoreConfig.analyzer.configFile.secret_search.match_params[1] | string | `"STOREONMATCH=n"` |  |
| anchoreConfig.analyzer.configFile.secret_search.regexp_match[0] | string | `"AWS_ACCESS_KEY=(?i).*aws_access_key_id( *=+ *).*(?<![A-Z0-9])[A-Z0-9]{20}(?![A-Z0-9]).*"` |  |
| anchoreConfig.analyzer.configFile.secret_search.regexp_match[1] | string | `"AWS_SECRET_KEY=(?i).*aws_secret_access_key( *=+ *).*(?<![A-Za-z0-9/+=])[A-Za-z0-9/+=]{40}(?![A-Za-z0-9/+=]).*"` |  |
| anchoreConfig.analyzer.configFile.secret_search.regexp_match[2] | string | `"PRIV_KEY=(?i)-+BEGIN(.*)PRIVATE KEY-+"` |  |
| anchoreConfig.analyzer.configFile.secret_search.regexp_match[3] | string | `"DOCKER_AUTH=(?i).*\"auth\": *\".+\""` |  |
| anchoreConfig.analyzer.configFile.secret_search.regexp_match[4] | string | `"API_KEY=(?i).*api(-\|_)key( *=+ *).*(?<![A-Z0-9])[A-Z0-9]{20,60}(?![A-Z0-9]).*"` |  |
| anchoreConfig.analyzer.configFile.malware.clamav.enabled | string | `"<ALLOW_API_CONFIGURATION>"` |  |
| anchoreConfig.analyzer.configFile.malware.clamav.db_update_enabled | bool | `true` |  |
| anchoreConfig.analyzer.configFile.malware.clamav.max_scan_time | int | `180000` |  |
| anchoreConfig.catalog.account_prometheus_metrics | string | `"<ALLOW_API_CONFIGURATION>"` |  |
| anchoreConfig.catalog.sbom_vuln_scan.auto_scale | bool | `true` |  |
| anchoreConfig.catalog.sbom_vuln_scan.batch_size | int | `1` |  |
| anchoreConfig.catalog.sbom_vuln_scan.pool_size | int | `1` |  |
| anchoreConfig.catalog.cycle_timers.image_watcher | int | `3600` |  |
| anchoreConfig.catalog.cycle_timers.policy_eval | int | `3600` |  |
| anchoreConfig.catalog.cycle_timers.vulnerability_scan | int | `14400` |  |
| anchoreConfig.catalog.cycle_timers.analyzer_queue | int | `1` |  |
| anchoreConfig.catalog.cycle_timers.archive_tasks | int | `43200` |  |
| anchoreConfig.catalog.cycle_timers.notifications | int | `30` |  |
| anchoreConfig.catalog.cycle_timers.service_watcher | int | `15` |  |
| anchoreConfig.catalog.cycle_timers.policy_bundle_sync | int | `300` |  |
| anchoreConfig.catalog.cycle_timers.repo_watcher | int | `60` |  |
| anchoreConfig.catalog.cycle_timers.image_gc | int | `60` |  |
| anchoreConfig.catalog.cycle_timers.k8s_image_watcher | int | `150` |  |
| anchoreConfig.catalog.cycle_timers.resource_metrics | int | `60` |  |
| anchoreConfig.catalog.cycle_timers.events_gc | int | `43200` |  |
| anchoreConfig.catalog.cycle_timers.artifact_lifecycle_policy_tasks | int | `43200` |  |
| anchoreConfig.catalog.event_log.max_retention_age_days | int | `180` |  |
| anchoreConfig.catalog.event_log.notification.enabled | bool | `false` |  |
| anchoreConfig.catalog.event_log.notification.level[0] | string | `"error"` |  |
| anchoreConfig.catalog.analysis_archive | object | `{}` |  |
| anchoreConfig.catalog.object_store.verify_content_digests | bool | `true` |  |
| anchoreConfig.catalog.object_store.compression.enabled | bool | `true` |  |
| anchoreConfig.catalog.object_store.compression.min_size_kbytes | int | `100` |  |
| anchoreConfig.catalog.object_store.storage_driver.name | string | `"db"` |  |
| anchoreConfig.catalog.object_store.storage_driver.config | object | `{}` |  |
| anchoreConfig.catalog.runtime_inventory.inventory_ttl_days | int | `120` |  |
| anchoreConfig.catalog.runtime_inventory.inventory_ingest_overwrite | bool | `false` |  |
| anchoreConfig.catalog.integrations.integration_health_report_ttl_days | int | `2` |  |
| anchoreConfig.catalog.down_analyzer_task_requeue | bool | `true` |  |
| anchoreConfig.policy_engine.vulnerabilities.matching.exclude.providers | list | `[]` |  |
| anchoreConfig.policy_engine.vulnerabilities.matching.exclude.package_types | list | `[]` |  |
| anchoreConfig.policy_engine.enable_user_base_image | bool | `true` |  |
| anchoreConfig.notifications.cycle_timers.notifications | int | `30` |  |
| anchoreConfig.notifications.ui_url | string | `""` |  |
| anchoreConfig.reports.enable_graphiql | bool | `true` |  |
| anchoreConfig.reports.async_execution_timeout | string | `"48h"` |  |
| anchoreConfig.reports.cycle_timers.reports_scheduled_queries | int | `600` |  |
| anchoreConfig.reports.use_volume | bool | `false` |  |
| anchoreConfig.reports_worker.enable_data_ingress | bool | `true` |  |
| anchoreConfig.reports_worker.enable_data_egress | bool | `false` |  |
| anchoreConfig.reports_worker.data_egress_window | int | `0` |  |
| anchoreConfig.reports_worker.data_refresh_max_workers | int | `10` |  |
| anchoreConfig.reports_worker.data_load_max_workers | int | `10` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_image_load | int | `600` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_tag_load | int | `600` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_runtime_inventory_load | int | `600` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_extended_runtime_vuln_load | int | `1800` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_image_refresh | int | `7200` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_tag_refresh | int | `7200` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_metrics | int | `3600` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_image_egress | int | `600` |  |
| anchoreConfig.reports_worker.cycle_timers.reports_tag_egress | int | `600` |  |
| anchoreConfig.reports_worker.runtime_report_generation.use_legacy_loaders_and_queries | bool | `false` |  |
| anchoreConfig.ui.enable_proxy | bool | `false` |  |
| anchoreConfig.ui.enable_ssl | bool | `false` |  |
| anchoreConfig.ui.enable_shared_login | bool | `true` |  |
| anchoreConfig.ui.redis_flushdb | bool | `false` |  |
| anchoreConfig.ui.force_websocket | bool | `false` |  |
| anchoreConfig.ui.authentication_lock.count | int | `5` |  |
| anchoreConfig.ui.authentication_lock.expires | int | `300` |  |
| anchoreConfig.ui.sso_auth_only | bool | `false` |  |
| anchoreConfig.ui.custom_links | object | `{}` |  |
| anchoreConfig.ui.enable_add_repositories | object | `{}` |  |
| anchoreConfig.ui.custom_message | object | `{}` |  |
| anchoreConfig.ui.log_level | string | `"http"` |  |
| anchoreConfig.ui.enrich_inventory_view | bool | `true` |  |
| anchoreConfig.ui.appdb_config.native | bool | `true` |  |
| anchoreConfig.ui.appdb_config.pool.max | int | `10` |  |
| anchoreConfig.ui.appdb_config.pool.min | int | `0` |  |
| anchoreConfig.ui.appdb_config.pool.acquire | int | `30000` |  |
| anchoreConfig.ui.appdb_config.pool.idle | int | `10000` |  |
| anchoreConfig.ui.dbUser | string | `""` |  |
| anchoreConfig.ui.dbPassword | string | `""` |  |
| anchoreConfig.ui.dbHostname | string | `""` |  |
| anchoreConfig.ui.dbPort | int | `5432` |  |
| anchoreConfig.ui.dbDatabase | string | `""` |  |
| api.replicaCount | int | `1` |  |
| api.service.type | string | `"ClusterIP"` |  |
| api.service.port | int | `8228` |  |
| api.service.reportsPort | int | `8558` |  |
| api.service.annotations | object | `{}` |  |
| api.service.labels | object | `{}` |  |
| api.service.nodePort | string | `""` |  |
| api.extraEnv | list | `[]` |  |
| api.resources.limits.cpu | int | `1` |  |
| api.resources.limits.memory | string | `"4G"` |  |
| api.resources.requests.cpu | int | `1` |  |
| api.resources.requests.memory | string | `"4G"` |  |
| api.labels | object | `{}` |  |
| api.annotations | object | `{}` |  |
| api.nodeSelector | object | `{}` |  |
| api.tolerations | list | `[]` |  |
| api.affinity | object | `{}` |  |
| api.serviceAccountName | string | `""` |  |
| api.topologySpreadConstraints | list | `[]` |  |
| analyzer.replicaCount | int | `2` |  |
| analyzer.service.port | int | `8084` |  |
| analyzer.service.domainSuffix | string | `""` |  |
| analyzer.serviceType | string | `"ClusterIP"` |  |
| analyzer.extraEnv | list | `[]` |  |
| analyzer.extraVolumes | list | `[]` |  |
| analyzer.extraVolumeMounts | list | `[]` |  |
| analyzer.resources.limits.cpu | int | `1` |  |
| analyzer.resources.limits.memory | string | `"4G"` |  |
| analyzer.resources.requests.cpu | int | `1` |  |
| analyzer.resources.requests.memory | string | `"4G"` |  |
| analyzer.labels | object | `{}` |  |
| analyzer.annotations | object | `{}` |  |
| analyzer.nodeSelector | object | `{}` |  |
| analyzer.tolerations | list | `[]` |  |
| analyzer.affinity | object | `{}` |  |
| analyzer.serviceAccountName | string | `""` |  |
| analyzer.scratchVolume.details | object | `{}` |  |
| catalog.replicaCount | int | `1` |  |
| catalog.service.type | string | `"ClusterIP"` |  |
| catalog.service.port | int | `8082` |  |
| catalog.service.annotations | object | `{}` |  |
| catalog.service.labels | object | `{}` |  |
| catalog.service.nodePort | string | `""` |  |
| catalog.service.domainSuffix | string | `""` |  |
| catalog.extraEnv | list | `[]` |  |
| catalog.extraVolumes | list | `[]` |  |
| catalog.extraVolumeMounts | list | `[]` |  |
| catalog.resources.limits.cpu | int | `1` |  |
| catalog.resources.limits.memory | string | `"3G"` |  |
| catalog.resources.requests.cpu | int | `1` |  |
| catalog.resources.requests.memory | string | `"3G"` |  |
| catalog.labels | object | `{}` |  |
| catalog.annotations | object | `{}` |  |
| catalog.nodeSelector | object | `{}` |  |
| catalog.tolerations | list | `[]` |  |
| catalog.affinity | object | `{}` |  |
| catalog.topologySpreadConstraints | list | `[]` |  |
| catalog.serviceAccountName | string | `""` |  |
| catalog.scratchVolume.details | object | `{}` |  |
| dataSyncer.replicaCount | int | `1` |  |
| dataSyncer.service.type | string | `"ClusterIP"` |  |
| dataSyncer.service.port | int | `8778` |  |
| dataSyncer.service.annotations | object | `{}` |  |
| dataSyncer.service.labels | object | `{}` |  |
| dataSyncer.service.nodePort | string | `""` |  |
| dataSyncer.service.domainSuffix | string | `""` |  |
| dataSyncer.extraEnv | list | `[]` |  |
| dataSyncer.extraVolumes | list | `[]` |  |
| dataSyncer.extraVolumeMounts | list | `[]` |  |
| dataSyncer.resources | object | `{}` |  |
| dataSyncer.labels | object | `{}` |  |
| dataSyncer.annotations | object | `{}` |  |
| dataSyncer.nodeSelector | object | `{}` |  |
| dataSyncer.tolerations | list | `[]` |  |
| dataSyncer.affinity | object | `{}` |  |
| dataSyncer.topologySpreadConstraints | list | `[]` |  |
| dataSyncer.serviceAccountName | string | `""` |  |
| dataSyncer.scratchVolume.details | object | `{}` |  |
| notifications.replicaCount | int | `1` |  |
| notifications.service.type | string | `"ClusterIP"` |  |
| notifications.service.port | int | `8668` |  |
| notifications.service.annotations | object | `{}` |  |
| notifications.service.labels | object | `{}` |  |
| notifications.service.nodePort | string | `""` |  |
| notifications.service.domainSuffix | string | `""` |  |
| notifications.resources.limits.cpu | int | `1` |  |
| notifications.resources.limits.memory | string | `"1G"` |  |
| notifications.resources.requests.cpu | int | `1` |  |
| notifications.resources.requests.memory | string | `"1G"` |  |
| notifications.labels | object | `{}` |  |
| notifications.annotations | object | `{}` |  |
| notifications.nodeSelector | object | `{}` |  |
| notifications.tolerations | list | `[]` |  |
| notifications.affinity | object | `{}` |  |
| notifications.extraEnv | list | `[]` |  |
| notifications.extraVolumes | list | `[]` |  |
| notifications.extraVolumeMounts | list | `[]` |  |
| notifications.topologySpreadConstraints | list | `[]` |  |
| notifications.serviceAccountName | string | `""` |  |
| policyEngine.replicaCount | int | `1` |  |
| policyEngine.service.type | string | `"ClusterIP"` |  |
| policyEngine.service.port | int | `8087` |  |
| policyEngine.service.annotations | object | `{}` |  |
| policyEngine.service.labels | object | `{}` |  |
| policyEngine.service.nodePort | string | `""` |  |
| policyEngine.service.domainSuffix | string | `""` |  |
| policyEngine.extraEnv | list | `[]` |  |
| policyEngine.extraVolumes | list | `[]` |  |
| policyEngine.extraVolumeMounts | list | `[]` |  |
| policyEngine.resources.limits.cpu | int | `1` |  |
| policyEngine.resources.limits.memory | string | `"4G"` |  |
| policyEngine.resources.requests.cpu | int | `1` |  |
| policyEngine.resources.requests.memory | string | `"4G"` |  |
| policyEngine.labels | object | `{}` |  |
| policyEngine.annotations | object | `{}` |  |
| policyEngine.nodeSelector | object | `{}` |  |
| policyEngine.tolerations | list | `[]` |  |
| policyEngine.affinity | object | `{}` |  |
| policyEngine.topologySpreadConstraints | list | `[]` |  |
| policyEngine.serviceAccountName | string | `""` |  |
| policyEngine.scratchVolume.details | object | `{}` |  |
| simpleQueue.replicaCount | int | `1` |  |
| simpleQueue.service.type | string | `"ClusterIP"` |  |
| simpleQueue.service.port | int | `8083` |  |
| simpleQueue.service.annotations | object | `{}` |  |
| simpleQueue.service.labels | object | `{}` |  |
| simpleQueue.service.nodePort | string | `""` |  |
| simpleQueue.service.domainSuffix | string | `""` |  |
| simpleQueue.extraEnv | list | `[]` |  |
| simpleQueue.resources.limits.cpu | int | `1` |  |
| simpleQueue.resources.limits.memory | string | `"1G"` |  |
| simpleQueue.resources.requests.cpu | int | `1` |  |
| simpleQueue.resources.requests.memory | string | `"1G"` |  |
| simpleQueue.resources | object | `{}` |  |
| simpleQueue.labels | object | `{}` |  |
| simpleQueue.annotations | object | `{}` |  |
| simpleQueue.nodeSelector | object | `{}` |  |
| simpleQueue.tolerations | list | `[]` |  |
| simpleQueue.affinity | object | `{}` |  |
| simpleQueue.serviceAccountName | string | `""` |  |
| simpleQueue.topologySpreadConstraints | list | `[]` |  |
| reportsWorker.replicaCount | int | `1` |  |
| reportsWorker.service.type | string | `"ClusterIP"` |  |
| reportsWorker.service.port | int | `8559` |  |
| reportsWorker.service.annotations | object | `{}` |  |
| reportsWorker.service.labels | object | `{}` |  |
| reportsWorker.service.nodePort | string | `""` |  |
| reportsWorker.service.domainSuffix | string | `""` |  |
| reportsWorker.extraEnv | list | `[]` |  |
| reportsWorker.extraVolumes | list | `[]` |  |
| reportsWorker.extraVolumeMounts | list | `[]` |  |
| reportsWorker.resources.limits.cpu | int | `1` |  |
| reportsWorker.resources.limits.memory | string | `"1G"` |  |
| reportsWorker.resources.requests.cpu | int | `1` |  |
| reportsWorker.resources.requests.memory | string | `"1G"` |  |
| reportsWorker.labels | object | `{}` |  |
| reportsWorker.annotations | object | `{}` |  |
| reportsWorker.nodeSelector | object | `{}` |  |
| reportsWorker.tolerations | list | `[]` |  |
| reportsWorker.affinity | object | `{}` |  |
| reportsWorker.topologySpreadConstraints | list | `[]` |  |
| reportsWorker.serviceAccountName | string | `""` |  |
| reports.replicaCount | int | `1` |  |
| reports.service.type | string | `"ClusterIP"` |  |
| reports.service.port | int | `8558` |  |
| reports.service.annotations | object | `{}` |  |
| reports.service.labels | object | `{}` |  |
| reports.service.nodePort | string | `""` |  |
| reports.service.domainSuffix | string | `""` |  |
| reports.extraVolumes | list | `[]` |  |
| reports.extraVolumeMounts | list | `[]` |  |
| reports.topologySpreadConstraints | list | `[]` |  |
| reports.serviceAccountName | string | `""` |  |
| reports.scratchVolume.details | object | `{}` |  |
| ui.enabled | bool | `true` |  |
| ui.image | string | `"registry1.dso.mil/ironbank/anchore/enterpriseui/enterpriseui:5.18.0"` |  |
| ui.imagePullPolicy | string | `"IfNotPresent"` |  |
| ui.imagePullSecretName | string | `"private-registry"` |  |
| ui.existingSecretName | string | `"anchore-enterprise-ui-env"` |  |
| ui.ldapsRootCaCertName | string | `""` |  |
| ui.service.type | string | `"ClusterIP"` |  |
| ui.service.port | int | `3000` |  |
| ui.service.annotations | object | `{}` |  |
| ui.service.labels | object | `{}` |  |
| ui.service.sessionAffinity | string | `"ClientIP"` |  |
| ui.service.nodePort | string | `""` |  |
| ui.service.domainSuffix | string | `""` |  |
| ui.extraEnv | list | `[]` |  |
| ui.extraVolumes | list | `[]` |  |
| ui.extraVolumeMounts | list | `[]` |  |
| ui.resources.limits.cpu | int | `1` |  |
| ui.resources.limits.memory | string | `"1G"` |  |
| ui.resources.requests.cpu | int | `1` |  |
| ui.resources.requests.memory | string | `"1G"` |  |
| ui.labels | object | `{}` |  |
| ui.annotations | object | `{}` |  |
| ui.nodeSelector | object | `{}` |  |
| ui.tolerations | list | `[]` |  |
| ui.affinity | object | `{}` |  |
| ui.topologySpreadConstraints | list | `[]` |  |
| ui.serviceAccountName | string | `""` |  |
| upgradeJob.enabled | bool | `true` |  |
| upgradeJob.force | bool | `false` |  |
| upgradeJob.rbacCreate | bool | `true` |  |
| upgradeJob.serviceAccountName | string | `""` |  |
| upgradeJob.usePostUpgradeHook | bool | `false` |  |
| upgradeJob.kubectlImage | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.30.8"` |  |
| upgradeJob.nodeSelector | object | `{}` |  |
| upgradeJob.tolerations | list | `[]` |  |
| upgradeJob.affinity | object | `{}` |  |
| upgradeJob.topologySpreadConstraints | list | `[]` |  |
| upgradeJob.annotations | object | `{}` |  |
| upgradeJob.resources.limits.cpu | int | `1` |  |
| upgradeJob.resources.limits.memory | string | `"1G"` |  |
| upgradeJob.resources.requests.cpu | int | `1` |  |
| upgradeJob.resources.requests.memory | string | `"1G"` |  |
| upgradeJob.labels | object | `{}` |  |
| upgradeJob.ttlSecondsAfterFinished | int | `-1` |  |
| ingress.enabled | bool | `false` |  |
| ingress.labels | object | `{}` |  |
| ingress.annotations | object | `{}` |  |
| ingress.apiHosts | list | `[]` |  |
| ingress.apiPaths[0] | string | `"/v2/"` |  |
| ingress.apiPaths[1] | string | `"/version/"` |  |
| ingress.uiHosts | list | `[]` |  |
| ingress.uiPath | string | `"/"` |  |
| ingress.tls | list | `[]` |  |
| ingress.ingressClassName | string | `"nginx"` |  |
| cloudsql.enabled | bool | `false` |  |
| cloudsql.image | string | `"gcr.io/cloudsql-docker/gce-proxy:1.25.0"` |  |
| cloudsql.imagePullPolicy | string | `"IfNotPresent"` |  |
| cloudsql.instance | string | `""` |  |
| cloudsql.useExistingServiceAcc | bool | `false` |  |
| cloudsql.serviceAccSecretName | string | `""` |  |
| cloudsql.serviceAccJsonName | string | `""` |  |
| cloudsql.extraArgs | list | `[]` |  |
| ui-redis.enabled | bool | `true` |  |
| ui-redis.istio.enabled | string | `"{{ .Values.istio.enabled }}"` |  |
| ui-redis.externalEndpoint | string | `""` |  |
| ui-redis.auth.password | string | `"anchore-redis,123"` |  |
| ui-redis.architecture | string | `"standalone"` |  |
| ui-redis.master.persistence.enabled | bool | `false` |  |
| ui-redis.commonConfiguration | string | `"maxmemory 200mb\nsave \"\""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.externalEndpoint | string | `""` |  |
| postgresql.externalDBCheckEnabled | bool | `false` |  |
| postgresql.primary.resources | object | `{}` |  |
| postgresql.primary.service.ports.postgresql | int | `5432` |  |
| postgresql.primary.podSecurityContext.enabled | bool | `true` |  |
| postgresql.primary.podSecurityContext.fsGroup | int | `1001` |  |
| postgresql.primary.podSecurityContext.runAsUser | int | `1001` |  |
| postgresql.primary.podSecurityContext.runAsGroup | int | `1001` |  |
| postgresql.primary.containerSecurityContext.enabled | bool | `true` |  |
| postgresql.primary.containerSecurityContext.runAsUser | int | `1001` |  |
| postgresql.primary.containerSecurityContext.runAsGroup | int | `1001` |  |
| postgresql.primary.containerSecurityContext.capabilities.drop[0] | string | `"ALL"` |  |
| postgresql.primary.persistence.size | string | `"20Gi"` |  |
| postgresql.primary.persistence.resourcePolicy | string | `"keep"` |  |
| postgresql.primary.persistence.subPath | string | `"data/pgdata"` |  |
| postgresql.primary.persistence.mountPath | string | `"/var/lib/postgresql"` |  |
| postgresql.primary.postgresqlDataDir | string | `"/var/lib/postgresql/data"` |  |
| postgresql.primary.extraEnvVars | list | `[]` |  |
| postgresql.image.registry | string | `"registry1.dso.mil"` |  |
| postgresql.image.repository | string | `"ironbank/opensource/postgres/postgresql"` |  |
| postgresql.image.tag | string | `"16.2"` |  |
| postgresql.global.imagePullSecrets[0] | string | `"private-registry"` |  |
| postgresql.postgresqlConfiguration.listen_addresses | string | `"*"` |  |
| postgresql.pgHbaConfiguration | string | `"local all all scram-sha-256\nhost all all all scram-sha-256"` |  |
| postgresql.postgresUser | string | `"anchore"` |  |
| postgresql.postgresPassword | string | `"anchore-postgres,123"` |  |
| postgresql.postgresDatabase | string | `"anchore"` |  |
| postgresql.resources.limits.cpu | string | `"200m"` |  |
| postgresql.resources.limits.memory | string | `"2048Mi"` |  |
| postgresql.resources.requests.cpu | string | `"200m"` |  |
| postgresql.resources.requests.memory | string | `"2048Mi"` |  |
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
| osaaMigrationJob.enabled | bool | `false` |  |
| osaaMigrationJob.kubectlImage | string | `"registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.30.8"` |  |
| osaaMigrationJob.extraEnv | list | `[]` |  |
| osaaMigrationJob.extraVolumes | list | `[]` |  |
| osaaMigrationJob.extraVolumeMounts | list | `[]` |  |
| osaaMigrationJob.resources | object | `{}` |  |
| osaaMigrationJob.labels | object | `{}` |  |
| osaaMigrationJob.annotations | object | `{}` |  |
| osaaMigrationJob.nodeSelector | object | `{}` |  |
| osaaMigrationJob.tolerations | list | `[]` |  |
| osaaMigrationJob.affinity | object | `{}` |  |
| osaaMigrationJob.topologySpreadConstraints | list | `[]` |  |
| osaaMigrationJob.serviceAccountName | string | `""` |  |
| osaaMigrationJob.analysisArchiveMigration.run | bool | `false` |  |
| osaaMigrationJob.analysisArchiveMigration.bucket | string | `"analysis_archive"` |  |
| osaaMigrationJob.analysisArchiveMigration.mode | string | `"to_analysis_archive"` |  |
| osaaMigrationJob.analysisArchiveMigration.analysis_archive | object | `{}` |  |
| osaaMigrationJob.objectStoreMigration.run | bool | `false` |  |
| osaaMigrationJob.objectStoreMigration.object_store.verify_content_digests | bool | `true` |  |
| osaaMigrationJob.objectStoreMigration.object_store.compression.enabled | bool | `true` |  |
| osaaMigrationJob.objectStoreMigration.object_store.compression.min_size_kbytes | int | `100` |  |
| osaaMigrationJob.objectStoreMigration.object_store.storage_driver.name | string | `"db"` |  |
| osaaMigrationJob.objectStoreMigration.object_store.storage_driver.config | object | `{}` |  |
| bbtests.enabled | bool | `false` |  |
| bbtests.scripts.image | string | `"registry1.dso.mil/ironbank/anchore/cli/cli:0.9.4"` |  |
| bbtests.scripts.envs.ANCHORE_CLI_URL | string | `"http://{{ template \"enterprise.api.fullname\" . }}:{{ .Values.api.service.port }}/v1"` |  |
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

## Contributing

Please see the [contributing guide](./CONTRIBUTING.md) if you are interested in contributing.

---

_This file is programatically generated using `helm-docs` and some BigBang-specific templates. The `gluon` repository has [instructions for regenerating package READMEs](https://repo1.dso.mil/big-bang/product/packages/gluon/-/blob/master/docs/bb-package-readme.md)._

