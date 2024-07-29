# Changes needed for Big Bang and Ironbank Images

The Big Bang team had to change some values from upstream because of how Big Bang makes use of Anchore from within Umbrella. We also made some additional modifications that were necessary because the Ironbank images our implementation of Anchore uses function slightly differently from the coresponding upstream Dockerhub images. This document outlines these changes so that you can verify that none of them have been overwritten by an update.

## Big Bang Modifications

1) To support Istio optional network policies, automated license creation, monitoring, and SSO, the following changes should be present at the top of chart/values.yaml:

```yaml
# Big Bang Values
# ---------------
domain: bigbang.dev

istio:
  # Toggle istio integration
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
nameOverride: "anchore-engine"
```

2) All chart changes are located under the `chart/templates/bigbang` directory. These are currently:

- Automated creation of the license secret
- Creation of an SSO secret with the above SSO values
- Automation of SSO configuration through a k8s job
- Creation of secrets with database credentials from postgres and anchore-feeds-db values
- Automated creation and synchronization of the Postgres databases, database users, and passwords through k8s jobs
- Added analyzerService.yaml to support metrics for analyzer
- Added service monitors for all exposed metrics

Verify that these are present. As additional Big Bang changes are made, add them to this directory and update this document to reflect that.

## Ironbank Modifications

3) Check chart/values.yaml and verify that all the following images are actually being pulled from registry1.dso.mil and not from the external upstream (note: the version numbers will be different from what is in this document):

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

4) An image pull secret should be specified so that Umbrella can pull the images above correctly. To check this, make sure you see this section in chart/values.yaml:

```
    imagePullSecrets:
      - private-registry
```

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
    local all all md5
    host all all all md5

anchore-feeds-db:
  persistence:
    resourcePolicy: keep
    size: 20Gi
    subPath: "pgdata"
    mountPath: /var/lib/postgresql
  # Set the configs to allow listening and connecting from other pods
  postgresConfiguration: {"listen_addresses": "*"}
  pgHbaConfiguration: |-
    local all all md5
    host all all all md5
```

6) To support SSO + Istio the RBAC container needs an additional environment variable set:

```yaml
anchoreEnterpriseRbac:
  extraEnv:
  - name: AUTHLIB_INSECURE_TRANSPORT
    value: "true"
```

## Other Modifications

7) For consistency in naming, the chart name in `Chart.yaml` should be `anchore`.

---

8) The following block needs to be present at the end of /chart/templates/_helpers.tpl (do not add this block to any other_helpers.tpl files elsewhere in the project):

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

---

9) In `chart/templates/engine_configmap.yaml`, the metrics lines should be modified to:

```yaml
    metrics:
      enabled: {{ .Values.monitoring.enabled }}
      auth_disabled: {{ .Values.monitoring.enabled }}
```

10) The same should be done in `chart/templates/enterprise_configmap.yaml`:

```yaml
    metrics:
      enabled: {{ .Values.monitoring.enabled }}
      auth_disabled: {{ .Values.monitoring.enabled }}
```

11) And in `chart/templates/enterprise_feeds_configmap.yaml`:

```yaml
    metrics:
      enabled: {{ .Values.monitoring.enabled }}
      auth_disabled: {{ .Values.monitoring.enabled }}
```

12) Required environment variables should be set in `chart/templates/enterprise_feed_deployment.yaml`:

```yaml
    - name: ANCHORE_ENABLE_METRICS
      value: {{ .Values.monitoring.enabled | quote }}
    - name: ANCHORE_DISABLE_METRICS_AUTH
      value: {{ .Values.monitoring.enabled | quote }}
```

---

13) To resolve a race condition in Big Bang CI pipelines, an additional sleep argument should be present in `chart/templates/engine_upgrade_job.yaml`, `enterprise_upgrade_job.yaml`, and `enterprise_feeds_upgrade_jobs.yaml`:

```yaml
- |
  sleep 60
  anchore-manager db --db-connect postgresql://${ANCHORE_DB_USER}:${ANCHORE_DB_PASSWORD}@${ANCHORE_DB_HOST}/${ANCHORE_DB_NAME} upgrade --dontask;
```

---

14) To resolve OPA Gatekeeper violations around container resources and ratios, a field should have been added to `chart/templates/engine_upgrade_job.yaml`, `enterprise_upgrade_job.yaml`, and `enterprise_feeds_upgrade_jobs.yaml` to allow users to specify container resource requests and limits for the jobs:

```yaml
resources:
  {{ toYaml .Values.anchoreEngineUpgradeJob.resources | nindent 10 }}
```

---

15) To resolve OPA Gatekeeper violations around istio sidecar injection, a curl should have been added to `chart/templates/engine_upgrade_job.yaml`, `enterprise_upgrade_job.yaml`, and `enterprise_feeds_upgrade_jobs.yaml` to allow the istio sidecar container to cleanly terminate after jobs complete.

```yaml
{{- if eq .Values.istio.injection "enabled" }}
  until curl -fsI http://localhost:15021/healthz/ready; do
    echo "Waiting for Istio sidecar proxy..."
    sleep 3
  done
  sleep 5
  echo "Stopping the istio proxy..."
  curl -X POST http://localhost:15020/quitquitquit
{{- end }}
```

---

16) To resolve an issue where Anchore would redeploy after every update, `./chart/templates/engine_secret.yaml` and `./chart/templates/enterprise_feeds_secret.yaml` should be modified to set `ANCHORE_SAML_SECRET` to a randomly generated value if not set and the previous secret does not exist:

```yaml
  {{- $anchorefullname := include "anchore-engine.fullname" . -}}
  {{- $old_secret := lookup "v1" "Secret" .Release.Namespace $anchorefullname }}
  {{- if .Values.anchoreGlobal.saml.secret }}
  {{- with .Values.anchoreGlobal.saml.secret }}
  ANCHORE_SAML_SECRET: {{ . }}
  {{- end }}
  {{- else if or (not $old_secret) (not $old_secret.data) }}
  ANCHORE_SAML_SECRET: {{ (randAlphaNum 12) | quote }}
  {{ else }}
  ANCHORE_SAML_SECRET: {{ b64dec (index $old_secret.data "ANCHORE_SAML_SECRET") }}
  {{- end }}
```

17) Additionally, `./chart/templates/engine_configmap.yaml`, `./chart/templates/enterprise_configmap.yaml`, and `./chart/templates/enterprise_feeds_confimap.yaml` should be modified to set appropriate saml secret credentials when the saml secret has been randomly generated but left `Null` by the user at `.Values.anchoreGlobal.saml.secret`:

```yaml
keys:
  {{- if or .Values.anchoreGlobal.saml.secret .Values.anchoreGlobal.saml.useExistingSecret .Values.anchoreGlobal.oauthEnabled }}
  secret: ${ANCHORE_SAML_SECRET}
  {{- end }}
```

18) To support metrics mTLS added `appPotocol: http` to the Service port spec found in `./chart/templates/*_deployment.yaml`

### Container Security Context Additions

19) To set all containers to run without additional capabilities, and instead to add explicit drops, several containerSecurityContext sections have been added to chart/values.yaml.  Each of these sections look like the following and are referenced in the template files:

```yaml
  containerSecurityContext:
    capabilities:
      drop:
        - ALL
```

Note that other sections with additional securityContext settings may have been modified to include explicit drops, but these were already part of the chart.
