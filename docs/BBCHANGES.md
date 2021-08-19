# Changes needed for Big Bang and Ironbank Images

Due to how Big Bang is making use of Anchore (from within Umbrella) there were values and chart changes that needed to be made.
Additionally, the Ironbank images function in slightly different ways than upstream Dockerhub images, so additional
modifications were made to support their use.

This provides a log of these changes to make updates from upstream faster.

## Big Bang Modifications

Added at the top of the values file are changes to support Istio, optional network policies, automated license creation, monitoring, and SSO.

```yaml
# Big Bang Values
# ---------------
hostname: bigbang.dev

istio:
  # Toggle istio integration
  enabled: false
  ui:
    # Toggle vs creation
    enabled: true
    annotations: {}
    labels: {}
    gateways:
      - istio-system/main
    hosts:
      - "anchore.{{ .Values.hostname }}"
  api:
    # Toggle vs creation
    enabled: true
    annotations: {}
    labels: {}
    gateways:
      - istio-system/main
    hosts:
      - "anchore-api.{{ .Values.hostname }}"

networkPolicies:
  enabled: false
  ingressLabels:
    app: istio-ingressgateway
    istio: ingressgateway
    
# Enable Prometheus Monitoring
monitoring:
  enabled: false
  namespace: monitoring

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
```

All chart changes are located under the `chart/templates/bigbang` directory. In summary:

- Creation of virtual services for the UI and API
- Automated creation of the license secret
- Creation of an SSO secret with the above SSO values
- Automation of SSO configuration through a k8s job
- Automated creation of an OAuth cert secret if needed (and this secret name is referenced under `anchoreGlobal.saml`)
- Creation of secrets with database credentials from postgres and anchore-feeds-db values
- Automated creation and synchronization of the Postgres databases, database users, and passwords through k8s jobs

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
```

To support the Ironbank Postgres image, additional configuration has to be set in the values file:

```yaml
postgresql:
  persistence:
    resourcePolicy: nil
    size: 20Gi
    subPath: "pgdata"
    mountPath: /var/lib/postgresql
  # Set the configs to allow listening and connecting from other pods
  postgresConfig: {"listen_addresses": "*"}
  pgHbaConf: |-
    local all all md5
    host all all all md5

anchore-feeds-db:
  persistence:
    resourcePolicy: nil
    size: 20Gi
    subPath: "pgdata"
    mountPath: /var/lib/postgresql
  # Set the configs to allow listening and connecting from other pods
  postgresConfig: {"listen_addresses": "*"}
  pgHbaConf: |-
    local all all md5
    host all all all md5
```

To support SSO + Istio the RBAC container needs an additional env set:

```yaml
anchoreEnterpriseRbac:
  extraEnv:
  - name: AUTHLIB_INSECURE_TRANSPORT
    value: "true"
```

## Other Modifications

The following block needs to be added to the end of the _helpers.tpl file:

```yaml
{{/*
Expand the name of the chart.
*/}}
{{- define "anchore.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "anchore.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
```

In `chart/templates/engine_configmap.yaml`, modify the metrics lines as such:

```yaml
    metrics:
      enabled: {{ .Values.monitoring.enabled }}
      auth_disabled: {{ .Values.monitoring.enabled }}
```

Do the same in `chart/templates/enterprise_configmap.yaml`:

```yaml
    metrics:
      enabled: {{ .Values.monitoring.enabled }}
      auth_disabled: {{ .Values.monitoring.enabled }}
```

Do the same in `chart/templates/enterprise_feeds_configmap.yaml`:

```yaml
    metrics:
      enabled: {{ .Values.monitoring.enabled }}
      auth_disabled: {{ .Values.monitoring.enabled }}
```

And set required environment variables in `chart/templates/enterprise_feed_deployment.yaml`:

```yaml
    - name: ANCHORE_ENABLE_METRICS
      value: {{ .Values.monitoring.enabled | quote }}
    - name: ANCHORE_DISABLE_METRICS_AUTH
      value: {{ .Values.monitoring.enabled | quote }}
```

To resolve a race condition in Big Bang CI pipelines, an additional sleep argument was added in `chart/templates/engine_upgrade_job.yaml`, `enterprise_upgrade_job.yaml`, and `enterprise_feeds_upgrade_jobs.yaml`:

```yaml
- |
  sleep 60
  anchore-manager db --db-connect postgresql://${ANCHORE_DB_USER}:${ANCHORE_DB_PASSWORD}@${ANCHORE_DB_HOST}/${ANCHORE_DB_NAME} upgrade --dontask;
```

Additionally, a field was added to `chart/templates/engine_upgrade_job.yaml`, `enterprise_upgrade_job.yaml`, and `enterprise_feeds_upgrade_jobs.yaml` to allow users to specify container resource requests and limits for the jobs. This was done to resolve OPA Gatekeeper violations around container resources and ratios:

```yaml
resources:
  {{ toYaml .Values.anchoreEngineUpgradeJob.resources | nindent 10 }}
```