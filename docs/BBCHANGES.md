# Changes needed for Big Bang and Ironbank Images

- [Changes needed for Big Bang and Ironbank Images](#changes-needed-for-big-bang-and-ironbank-images)
  - [Big Bang Modifications](#big-bang-modifications)
  - [Ironbank Modifications](#ironbank-modifications)
  - [Other Modifications](#other-modifications)
    - [Container Security Context Additions](#container-security-context-additions)
  - [List of files that are frequently modified from upstream](#list-of-files-that-are-frequently-modified-from-upstream)

The Big Bang team had to change some values from upstream because of how Big Bang makes use of Anchore from within Umbrella. We also made some additional modifications that were necessary because the Ironbank images our implementation of Anchore uses function slightly differently from the coresponding upstream Dockerhub images. This document outlines these changes so that you can verify that none of them have been overwritten by an update.

## Big Bang Modifications

1) To support Istio optional network policies, automated license creation, monitoring, and SSO, the following changes should be present at the top of chart/values.yaml:

```yaml
# Big Bang Values
# ---------------
domain: dev.bigbang.mil

istio:
  # Toggle istio integration
  enabled: false
  hardened:
    enabled: false
  injection: "disabled"

  ui:
    # Toggle vs creation
    enabled: true
    annotations: {}
    labels: {}
    gateways:
      - istio-system/main
    hosts:
      - "anchore.{{ .Values.domain }}"
  api:
    # Toggle vs creation
    enabled: true
    annotations: {}
    labels: {}
    gateways:
      - istio-system/main
    hosts:
      - "anchore-api.{{ .Values.domain }}"

   mtls:
    # -- STRICT = Allow only mutual TLS traffic,
    # PERMISSIVE = Allow both plain text and mutual TLS traffic
    mode: STRICT

networkPolicies:
  enabled: false
  ingressLabels:
    app: istio-ingressgateway
    istio: ingressgateway
    
# Enable Prometheus Monitoring
monitoring:
  enabled: false
  namespace: monitoring
  serviceMonitor:
    scheme: ""
    tlsConfig: {}

# Enterprise license: Specify your multiline license
# enterpriseLicenseYaml: |
#   License YAML
enterpriseLicenseYaml: "" # Full multiline license yaml

# Enable/disable Keycloak SSO integration
# If enabled, also enable OAuth - anchoreGlobal.oauthEnabled
sso:
  enabled: false
  name: "keycloak"
  acsHttpsPort: -1
  spEntityId: "platform1_a8604cc9-f5e9-4656-802d-d05624370245_bb8-anchore"
  acsUrl: "https://anchore.bigbang.dev/service/sso/auth/keycloak"
  defaultAccount: "user"
  defaultRole: "read-write" # If roleAttribute is passed, defaultRole will be ignored
  roleAttribute: "" # Optional, defines the Keycloak attribute to use to map roles/permissions
  requireSignedAssertions: false
  requireSignedResponse: true
  idpMetadataUrl: "https://login.dso.mil/auth/realms/baby-yoda/protocol/saml/descriptor"

# Default name override to upstream chart name
global:
  nameOverride: "anchore-enterprise"
```

2) All chart changes are located under the `chart/templates/bigbang` directory. These are currently:

- Automated creation of the license secret
- Creation of an SSO secret with the above SSO values
- Automation of SSO configuration through a k8s job
- Creation of secrets with database credentials from postgres and feeds.feeds-db values
- Automated creation and synchronization of the Postgres databases, database users, and passwords through k8s jobs
- Added analyzer-service.yaml to support metrics for analyzer
- Added service monitors for all exposed metrics

Verify that these are present. As additional Big Bang changes are made, add them to this directory and update this document to reflect that.

## Ironbank Modifications

3) Check chart/values.yaml and verify that all the following images are actually being pulled from registry1.dso.mil and not from the external upstream (note: the version numbers will be different from what is in this document):

```yaml
image: registry1.dso.mil/ironbank/anchore/enterprise/enterprise:5.8.0
imagePullSecretName: private-registry

postgresql:
  image: registry1.dso.mil/ironbank/opensource/postgres/postgresql:16.2
  imagePullSecrets: private-registry

feeds:
  feeds-db:
    image: registry1.dso.mil/ironbank/opensource/postgres/postgresql:16.2
    imagePullSecrets: private-registry

gem-db:
  image: registry1.dso.mil/ironbank/opensource/postgres/postgresql:16.2
  imagePullSecrets: private-registry

ui:
  image: registry1.dso.mil/ironbank/anchore/enterprise/enterpriseui:5.8.0
  imagePullSecretName: private-registry

osaaMigrationJob:
  kubectlImage: registry1.dso.mil/ironbank/opensource/kubernetes/kubectl:v1.29.7
```

4) An image pull secret name should be specified so that Umbrella can pull the images above correctly. To check this, make sure you see this section in chart/values.yaml:

```
imagePullSecretName: private-registry
```

If you are pulling from public registry that don't require credentials, you can set `imagePullSecretName: ""`

5) To support the Ironbank Postgres image, additional configuration has to be set in chart/values.yaml:

```yaml
postgresql:
  persistence:
    resourcePolicy: keep
    size: 20Gi
    subPath: "data/pgdata"
    mountPath: /var/lib/postgresql
  # Set the configs to allow listening and connecting from other pods
  postgresConfiguration: {"listen_addresses": "*"}
  pgHbaConfiguration: |-
    local all all scram-sha-256
    host all all all scram-sha-256
  postgresqlDataDir: /var/lib/postgresql/data

feeds:
  feeds-db:
    primary:
      persistence:
        resourcePolicy: keep
        size: 20Gi
        subPath: "pgdata"
        mountPath: /var/lib/postgresql
    # Set the configs to allow listening and connecting from other pods
    postgresConfiguration: {"listen_addresses": "*"}
    pgHbaConfiguration: |-
      local all all scram-sha-256
      host all all all scram-sha-256
```

6) To support SSO:

```yaml
sso:
  enabled: true
```

7) To support Istio:
```yaml
istio:
  enabled: true
  hardened:
    enabled: true
```

## Other Modifications

8) For consistency in naming, the chart name in `Chart.yaml` should be `anchore`.

---

9) The following block needs to be present at the end of /chart/templates/_names.tpl (do not add this block to any other_helpers.tpl files elsewhere in the project):

```yaml
{{- define "enterprise.fullname" -}}
{{- if .Values.global.fullnameOverride }}
  {{- .Values.global.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
  {{- $name := default .Chart.Name .Values.global.nameOverride }}
  {{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end -}}
```

---

10) Required environment variables should be set in `chart/templates/envvars_configmap.yaml`:

```yaml
data:
  ANCHORE_ENABLE_METRICS: "{{ .Values.anchoreConfig.metrics.enabled }}"
  ANCHORE_DISABLE_METRICS_AUTH: "{{ .Values.anchoreConfig.metrics.auth_disabled }}"
```

---

11) To resolve OPA Gatekeeper violations around istio sidecar injection, a curl should be added to `chart/templates/hooks/pre-upgrade/upgrade_job.yaml`, `chart/templates/hooks/post-upgrade/upgrade_job.yaml`, `chart/deps/feeds/templates/hooks/pre-upgrade/upgrade_job.yaml`, `chart/deps/feeds/templates/hooks/post-upgrade/upgrade_job.yaml`, `chart/templates/bigbang/sso/configure-sso.yaml`, `chart/templates/bigbang/db/ensure-anchore-db.yaml`, `chart/templates/bigbang/db/ensure-feeds-db.yaml`:

```yaml
          {{- if not .Values.anchoreConfig.database.ssl }}
            - |
              # istio quit logic added by BigBang
              {{ print (include "enterprise.doSourceFile" .) }} anchore-enterprise-manager db --db-connect postgresql://"${ANCHORE_DB_USER}":"${ANCHORE_DB_PASSWORD}"@"${ANCHORE_DB_HOST}":"${ANCHORE_DB_PORT}"/"${ANCHORE_DB_NAME}" upgrade --dontask;
              {{ if and .Values.istio.enabled (eq .Values.istio.injection "enabled") }}
              sleep 5
              echo "Stopping the istio proxy..."
              curl -X POST http://localhost:15020/quitquitquit
              {{ end }}
          {{- else if eq .Values.anchoreConfig.database.sslMode "require" }}
            - |
              # istio quit logic added by BigBang
              {{ print (include "enterprise.doSourceFile" .) }} anchore-enterprise-manager db --db-use-ssl --db-connect postgresql://"${ANCHORE_DB_USER}":"${ANCHORE_DB_PASSWORD}"@"${ANCHORE_DB_HOST}":"${ANCHORE_DB_PORT}"/"${ANCHORE_DB_NAME}"?sslmode={{- .Values.anchoreConfig.database.sslMode }} upgrade --dontask;
              {{ if and .Values.istio.enabled (eq .Values.istio.injection "enabled") }}
              sleep 5
              echo "Stopping the istio proxy..."
              curl -X POST http://localhost:15020/quitquitquit
              {{ end }}
          {{- else }}
            - |
              # istio quit logic added by BigBang
              {{ print (include "enterprise.doSourceFile" .) }} anchore-enterprise-manager db --db-use-ssl --db-connect postgresql://"${ANCHORE_DB_USER}":"${ANCHORE_DB_PASSWORD}"@"${ANCHORE_DB_HOST}":"${ANCHORE_DB_PORT}"/"${ANCHORE_DB_NAME}"?sslmode={{- .Values.anchoreConfig.database.sslMode -}}\&sslrootcert=/home/anchore/certs/{{- .Values.anchoreConfig.datab>
              {{ if and .Values.istio.enabled (eq .Values.istio.injection "enabled") }}
              sleep 5
              echo "Stopping the istio proxy..."
              curl -X POST http://localhost:15020/quitquitquit
              {{ end }}
          {{- end }}
```

---

12) To resolve OPA Gatekeeper violations around container resources and ratios, a field should have been added to `chart/templates/bigbang/db/ensure-feeds-db.yaml`, and `chart/templates/bigbang/db/ensure-anchore-db.yaml` to allow users to specify container resource requests and limits for the jobs:

```yaml
resources: {{ toYaml .Values.ensureDbJobs.resources | nindent 12 }}
```

---

13) To resolve an issue where Anchore would redeploy after every update, `chart/templates/anchore_secret.yaml` and `chart/deps/feeds/templates/secret.yaml` should be modified to set `ANCHORE_SAML_SECRET` to a randomly generated value if not set and the previous secret does not exist:

```yaml
{{- if not .Values.useExistingSecrets -}}
{{- /*
  If release is being upgraded, don't recreate the defaultAdminPassword or samlSecret, instead get it from the corresponding existing
  secret.
*/ -}}
{{- $anchoreSamlSecret := (include "enterprise.samlSecret" . | quote) -}}
{{- if .Release.IsUpgrade -}}
  {{- $anchoreSecret := (lookup "v1" "Secret" .Release.Namespace (include "enterprise.fullname" .)) -}}
  {{- if $anchoreSecret -}}
    {{- $anchoreSamlSecret = (index $anchoreSecret.data "ANCHORE_SAML_SECRET" | b64dec) | quote -}}
  {{- end -}}
{{- end -}}
 
  ANCHORE_SAML_SECRET: {{ $anchoreSamlSecret }}
```

14) To support metrics mTLS added `appPotocol: http` to the Service port spec found in `chart/templates/bigbang/analyzer-service.yaml`

### Container Security Context Additions

15) To set all containers to run without additional capabilities, and instead to add explicit drops, several containerSecurityContext sections have been added to chart/values.yaml.  Each of these sections look like the following and are referenced in the template files:

```yaml
  containerSecurityContext:
    capabilities:
      drop:
        - ALL
```

Note that other sections with additional securityContext settings may have been modified to include explicit drops, but these were already part of the chart.

## List of files that are frequently modified from upstream

  **warning**: *these are non exhaustive and should always be manually checked*

  - chart/templates/ui_secret.yaml
  - chart/templates/migrate_pod.yaml