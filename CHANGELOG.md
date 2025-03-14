# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.5.0-bb.1] - 2025-03-12

### Changed

- Added Dynamic Network Policy

## [3.5.0-bb.0] - 2025-03-07

### Changed

- Updated Anchore Enterprise chart to `3.5.0`
- Updated Anchore Enterprise tag to `5.15.0`
- Updated Anchore Enterprise UI tag to `5.15.0`

## [3.3.2-bb.0] - 2025-01-22

### Changed

- Updated Anchore Enterprise chart to `3.3.2`
- Updated Redis to `7.4.2`
- Updated Redis to `20.6.2-bb.0`
- Updated gluon to `0.5.14`

## [3.3.1-bb.1] - 2025-01-13

### Changed

- ability to disable `ensure-anchore-db` job

## [3.3.1-bb.0] - 2025-01-06

### Changed

- Updated Anchore Enterprise chart to `3.3.1`
- Updated Anchore Enterprise tag to `5.13.1`
- Updated Anchore Enterprise UI tag to `5.13.0`
- Updated Redis to `20.6.0-bb.0`
- Updated kubectl to `1.30.8`

## [3.2.0-bb.1] - 2024-12-12

### Changed

- Updated renovate.json for redis update check

## [3.2.0-bb.0] - 2024-12-02

### Changed

- Updated Anchore Enterprise chart to `3.2.0`
- Updated Anchore Enterprise tag to `5.12.0`
- Updated Anchore Enterprise UI tag to `5.12.0`
- Bumped resources for anchore-catalog

## [3.1.1-bb.3] - 2024-11-26

### Changed

- updated gluon to `0.5.12`
- updated kubectl to `1.30.7`
- Added the maintenance track

## [3.1.1-bb.2] - 2024-11-25

### Changed

- updated cypress to `13.16.0`

## [3.1.1-bb.1] - 2024-11-21

### Changed

- Reverted changes made from previous Kiali labelling strategy

## [3.1.1-bb.0] - 2024-11-13

### Changed

- Updated Anchore Enterprise chart to `3.1.1`
- Updated enterprise to `5.11.1`

## [3.1.0-bb.0] - 2024-11-12

### Changed

- Updated Anchore Enterprise chart to `3.1.0`

## [3.0.0-bb.3] - 2024-11-08

### Changed

- Updated gluon to `0.5.10`
- Updated enterprise to `5.11.0`
- Updated enterpriseui to `5.11.0`
- Updated kubectl to `1.30.6`

## [3.0.0-bb.2] - 2024-11-07

### Changed

- Updated startmigrationpod value to false

## [3.0.0-bb.1] - 2024-11-04

### Changed

- fix istio error

## [3.0.0-bb.0] - 2024-10-22

### Changed

- Updated Anchore Enterprise chart to `3.0.0`
- Updated gluon to `0.5.8`
- Updated enterprise to `5.10.0`
- Updated enterpriseui to `5.10.0`
- Updated redis to `20.2.1-bb.0`
- Updated redis patch to `7.4.1`
- Updated kubectl to `1.30.5`

## [2.10.0-bb.1] - 2024-09-27

### Changed

- Updated feeds-db chart

## [2.10.0-bb.0] - 2024-09-09

### Changed

- Updated Anchore Enterprise chart to `2.10.0`
- Updated Anchore Feeds chart to `2.9.0`

## [2.9.0-bb.11] - 2024-09-06

### Changed

- Fix common labels

## [2.9.0-bb.10] - 2024-09-06

### Changed

- Updated Anchore Enterprise tag to `5.9.0`
- Updated Anchore Enterprise UI tag to `5.9.0`
- Updated Gluon subchart dependency to `0.5.4`
- Updated Cypress dependency to `v13.14.2`

## [2.9.0-bb.9] - 2024-09-05

### Changed

- Re-numbered CHANGELOG to prevent duplicate entries

## [2.9.0-bb.8] - 2024-08-30

### Changed

- Resync with upstream commit [abca795cfb04c61d6242509bdd34634a2f405928](https://github.com/anchore/anchore-charts/tree/abca795cfb04c61d6242509bdd34634a2f405928)

## [2.9.0-bb.7] - 2024-08-23

### Changed

- Fix SSO configure job to work when TLS certificates are used

## [2.9.0-bb.6] - 2024-08-23

### Changed

- Updated templating in `chart/deps/feeds/deps/postgresql/templates/statefulset-replicas.yaml` to add `tpl` for label interpretation
- Updated templating in `chart/deps/feeds/deps/postgresql/templates/statefulset.yaml` to add `tpl` for label interpretation
- Updated templating in `chart/deps/feeds/templates/_common.tpl` to add `tpl` for label interpretation
- Updated templating in `chart/deps/postgresql/templates/statefulset-replicas.yaml` to add `tpl` for label interpretation
- Updated templating in `chart/deps/postgresql/templates/statefulset.yaml` to add `tpl` for label interpretation
- Updated templating in `chart/templates/_common.tpl` to add `tpl` for label interpretation

## [2.9.0-bb.5] - 2024-08-20

### Changed

- Updated Anchore Feeds chart to `2.8.1`

## [2.9.0-bb.4] - 2024-08-19

### Changed

- Updated Redis chart dependency to `20.0.1-bb.0`
- Updated Redis to 7.4.0
- Updated kubectl to 1.29.8
- Updated Cypress dependency to `v13.13.3`

## [2.9.0-bb.3] - 2024-08-14

### Changed

- Updated Anchore Enterprise tag to `5.8.1`
- Updated Gluon subchart dependency to `0.5.3`

## [2.9.0-bb.2] - 2024-08-08

### Changed

- Updated Postgres configuration to use `scram-sha-256` instead of `md5`

## [2.9.0-bb.1] - 2024-08-05

### Changed

- Added quoted strings

## [2.9.0-bb.0] - 2024-08-01

### Changed

- Updated Anchore Enterprise chart to `2.9.0`
- Updated Anchore Enterprise tag to `5.8.0`
- Updated Anchore Enterprise UI tag to `5.8.0`
- Updated Anchore Feeds chart to `2.8.0`
- Updated Cypress dependency to `v13.13.2`

## [2.7.0-bb.8] - 2024-07-31

### Changed

- Updated Gluon subchart dependency to `0.5.2`
- Updated Redis chart dependency to `19.6.2-bb.0`

## [2.7.0-bb.7] - 2024-07-30

### Changed

- Updated charts to be able to exclude imagePullSecrets

## [2.7.0-bb.6] - 2024-07-26

### Changed

- Fixed feeds subchart secret.yaml reference

## [2.7.0-bb.5] - 2024-07-25

### Added

- Added `egress-postgres.yaml` to allow for external Postgres DB

## [2.7.0-bb.4] - 2024-07-23

### Changed

- Updated Anchore Feeds chart to `2.7.0`

## [2.7.0-bb.3] - 2024-07-23

### Changed

- Fixed Mismatch between analyzer Service selector and Pod Labels

## [2.7.0-bb.2] - 2024-07-19

### Changed

- Updated Anchore Enterprise tag to `5.7.0`
- Updated Anchore Enterprise UI tag to `5.7.0`
- Updated Postgresql to `16.2`
- Updated kubectl to 1.29.7

## [2.7.0-bb.1] - 2024-07-17

### Changed

- Removed rbacAuth from serviceMonitor template

## [2.7.0-bb.0] - 2024-06-24

### Changed

- Updated Anchore Enterprise chart to `2.7.0`
- Updated Anchore Enterprise tag to `5.6.0`
- Updated Anchore Enterprise UI tag to `5.6.0`
- Updated Redis to 7.2.5
- Updated Redis chart dependency to `19.5.5-bb.0`

## [2.4.2-bb.18] - 2024-07-01

### Updated

- Removed the shared AuthorizationPolicies

## [2.4.2-bb.17] - 2024-06-27

### Updated

- Update upstream reference from github.com/anchore/anchore-charts/tree/master/stable/enterprise to github.com/anchore/anchore-charts/tree/main/stable/enterprise

## [2.4.2-bb.16] - 2024-05-23

### Updated

- Added Cypress tests for pipelines
- Update Gluon subchart dependency to 0.5.0

## [2.4.2-bb.15] - 2024-05-22

### Changed

- Added new label to upgrade job containers to allow access if network policies are enabled

## [2.4.2-bb.14] - 2024-05-03

### Changed

- Fixed db credential leaking in the ensure anchor db container

## [2.4.2-bb.13] - 2024-05-03

### Updated

- Add ingress network policy for database upgrade job
- Update Gluon subchart dependency to 0.4.10

## [2.4.2-bb.12] - 2024-05-02

### Updated

- Added Sidecars, ServiceEntries, istiohardened doc, values update

## [2.4.2-bb.11] - 2024-04-30

### Changed

- Update kubeVersion constraints, set minimum kubeVersion and remove max version

## [2.4.2-bb.10] - 2024-04-23

### Added

- Added additionalNetworkPolicy support via values file

## [2.4.2-bb.9] - 2024-04-22

### Changed

- Updated Redis to 7.2.4
- Updated Gluon to 0.4.9
- Updated kubectl to 1.29.3
- Updated Anchore Enterprise tag to `5.4.1`
- Updated Anchore Enterprise UI tag to `5.4.0`

## [2.4.2-bb.8] - 2024-04-12

### Added

- Added Openshift resources

## [2.4.2-bb.7] - 2024-04-11

### Changed

- Added istio authorization polic(y|ies)

## [2.4.2-bb.6] - 2024-04-05

### Changed

- Added VirtualService for Anchore Enterprise API

## [2.4.2-bb.5] - 2024-04-04

### Changed

- Shutdown istio proxy in upgrade job

## [2.4.2-bb.4] - 2024-04-03

### Changed

- Updated versions to consistent 1.29.x

## [2.4.2-bb.3] - 2024-04-02

### Changed

- Updated security context for pods

## [2.4.2-bb.2] - 2024-03-29

### Changed

- Updated migration pod template

## [2.4.2-bb.1] - 2024-03-26

### Changed

- Updated Swagger API endpoint for tests

## [2.4.2-bb.0] - 2024-03-22

### Changed

- Bumped Anchore Enterprise tag to `5.3.0`
- Bumped Anchore Enterprise UI tag to `5.3.2`
- Bumped Anchore Enterprise chart to `2.4.2`
- Bumped Anchore Feeds chart to `2.2.0`
- Bumped Postgres chart to `12.5.9`

## [2.0.2-bb.1] - 2024-03-20

### Changed

- BigBang provided NetworkPolicy labels

## [2.0.2-bb.0] - 2024-02-05

### Changed

- Deprecated Anchore Engine support
- Enabled Anchore Enterprise by default

## [1.27.4-bb.8] - 2024-02-23

### Updated

- Added allow-intranamespace policy
- Added allow-nothing-policy
- Added ingressgateway-authz-policy
- Added template for adding user defined policies

## [1.27.4-bb.7] - 2024-01-04

### Changed

- Bumped Redis chart dependency to `18.3.2-bb.2`

## [1.27.4-bb.6]

### Changed

- Fix readme

## [1.27.4-bb.5]

### Changed

- Update sso securityContext
- Bumped Redis to `7.2.3`

## [1.27.4-bb.4]

### Changed

- Bumped Anchore Enterprise tag to  `4.9.3`
- Bumped Redis chart dependency to `18.3.2-bb.0`
- Bumped Postgres to `13.12`
- Added missing image annotation for Redis

## [1.27.4-bb.3]

### Changed

- Bumped Anchore Enterprise image tag to `4.9.2`
- Bumped gluon to `0.4.4`

## [1.27.4-bb.2]

### Changed

- Added missing `containerSecurityContext` to `anchore-feeds-db`.
- Bumped postgresql's `common` dependency to `2.x.x`.

## [1.27.4-bb.1]

### Changed

- Updated contributing.md

## [1.26.1-bb.0]

### Changed

- Bumped chart version to `1.26.1`
- Bumped Anchore Enterprise image tag to `4.8.0`
- Bumped Anchore Enterprise UI image tag to `4.8.0`

## [1.24.1-bb.5]

### Changed

- Bumped postfresql version to `13.10`
- Bumped gluon version to `0.4.0`

## [1.24.1-bb.4]

### Changed

- Bumped Redis chart dependency to `17.10.2-bb.0`
- Bumped Gluon chart dependency to `0.3.2`

## [1.24.1-bb.3]

### Fixed

- Fixed DB job secrets FOR REAL

## [1.24.1-bb.2]

### Fixed

- Fixed DB job secrets with encoding

## [1.24.1-bb.1]

### Fixed

- Fixed DB job secrets for new syntax

## [1.24.1-bb.0]

### Changed

- Bumped chart version to `1.24.1`
- Bumped Anchore Enterprise image tag to `4.6.0`
- Bumped Anchore Enterprise UI image tag to `4.6.0`

## [1.23.0-bb.0]

### Changed

- Bumped chart version to `1.23.0`
- Bumped Anchore Enterprise image tag to `4.5.0`
- Bumped Anchore Enterprise UI image tag to `4.5.0`

## [1.22.3-bb.0]

### Changed

- Bumped chart version to `1.22.3`
- Bumped Anchore Enterprise image tag to `4.4.1`
- Bumped Anchore Enterprise UI image tag to `4.4.0`

## [1.21.1-bb.2]

### Changed

- Renamed chart to `anchore` for OCI consistency

## [1.21.1-bb.1]

### Fixed

- Re-add missing `sleep 60` to feeds upgrade job

## [1.21.1-bb.0]

### Changed

- Bumped chart version to `1.21.1`

## [1.20.1-bb.1]

### Changed

- Changed scanned image in Helm test to use upstream Alpine image

## [1.20.1-bb.0]

### Changed

- Bumped chart version to `1.20.1`
- Bumped Anchore Enterprise image tag to `4.3.0`
- Bumped Anchore Enterprise UI image tag to `4.3.0`

## [1.20.0-bb.2]

### Changed

- Change redis subchart to utilize oci

## [1.20.0-bb.1]

### Updated

- Updated test images tag

## [1.20.0-bb.0]

### Changed

- Bumped chart version to `1.20.0`
- Bumped Anchore Enterprise image tag to `4.2.0`
- Bumped Anchore Enterprise UI image tag to `4.2.0`

## [1.19.7-bb.3]

### Changed

- Added support for metrics mTLS

### Updated

- upgraded the Redis sub chart to get support for metrics mTLS

## [1.19.7-bb.2]

### Fixed

- Added removal of `enabled` from securitycontext on ensure-db jobs

## [1.19.7-bb.1]

### Fixed

- Fixed indentation issue with securitycontext on ensure-db jobs

## [1.19.7-bb.0]

### Changed

- Bumped chart version to `1.19.7`
- Bumped Anchore Enterprise image tag to `4.1.1`
- Bumped Anchore Enterprise UI image tag to `4.1.1`

## [1.19.4-bb.2]

### Changed

- Added drop capabilities for containers

## [1.19.4-bb.1]

### Changed

- Bumped gluon version to `0.3.1`
- Bumped postgresql12 image tag to `12.12`

## [1.19.4-bb.0]

### Changed

- Bumped chart version to `1.19.4`
- Bumped Anchore Enterprise image tag to `4.1.0`
- Bumped Anchore Enterprise UI image tag to `4.1.0`

## [1.19.2-bb.0]

### Changed

- Bumped chart version to `1.19.2`
- Bumped Anchore Enterprise image tag to `4.0.3`
- Bumped Anchore Enterprise UI image tag to `4.0.3`

## [1.18.6-bb.11]

### Fixed

- Fixed label on anchore dashboards

## [1.18.6-bb.10]

### Updated

- Bump redis chart to 16.12.3-bb.2

## [1.18.6-bb.9]

### Fixed

- Fixed image for ensure feeds DB job

## [1.18.6-bb.8]

### Fixed

- Fixed IPS for ensure DB jobs

## [1.18.6-bb.7]

### Changed

- Updating postgresql sub-chart and image to 12.X versions

## [1.18.6-bb.6]

### Added

- Grafana Dasboard JSON & ConfigMap template

## [1.18.6-bb.5]

### Changed

- Bumped Anchore Enterprise image tag to `4.0.2`
- Bumped gluon version to `0.2.10`

## [1.18.6-bb.4]

### Changed

- Update redis dependency

## [1.18.6-bb.3]

### Changed

- Update postgresql pod mount path

## [1.18.6-bb.2]

### Changed

- Updated Anchore redis dependency

## [1.18.6-bb.1]

### Fixed

- Fixed a bug with credential handling for feeds DB on jobs

## [1.18.6-bb.0]

### Changed

- Bumped chart version to `1.18.6`
- Bumped Anchore Enterprise image tag to `4.0.1`
- Bumped gluon version to `0.2.9`

## [1.18.0-bb.4]

### Added

- Added check in test to verify API login is available before proceeding

### Changed

- Modified postgresql resource limits/requests to prevent OOM and login errors

## [1.18.0-bb.3]

### Added

- Default `PeerAuthentication` enforcing mTLS STRICT
- Exceptions in place for all metrics ports (can be removed once monitoring scrape on HTTPS)

## [1.18.0-bb.2]

### Fixed

- Added missing networkpolicies to allow DB access for rbac, notifications, and reports
- Add svcmonitor configs for missing metrics on the same pods

## [1.18.0-bb.1]

### Changed

- Updated tests images file

## [1.18.0-bb.0]

### Changed

- Bumped chart version to `1.18.0`
- Bumped Anchore Enterprise image tag to `4.0.0`
- Bumped Anchore Enterprise UI image tag to `4.0.0`

## [1.17.1-bb.2]

### Added

- Added Tempo Zipkin Egress Policy

## [1.17.1-bb.1]

### Changed

- Added `existingSecret` value for `postgresqlSuperUser` and `anchore-feeds-db`
- Allows the `ensure-anchore-db` job to utilize `anchoreGlobal.existingSecret` if provided.

## [1.17.1-bb.0]

### Changed

- Bumped chart version to `1.17.1`
- Bumped Anchore cli image to `0.9.4`
- Bumped Anchore Engine image tag to `1.1.0`
- Bumped Anchore Enterprise image tag to `3.3.0`
- Bumped Anchore Enterprise UI image tag to `3.3.0`

## [1.15.0-bb.10]

### Fixed

- Change the `istio.injection` value to a string to be consistent with other implementations

## [1.15.0-bb.9]

### Changed

- Check for istio proxy connectivity before call `/quitquitquit` on job resources
- Addition of `istio.injection` value to delineate between istio injection vs other istio resources

## [1.15.0-bb.8]

### Changed

- Rename hostname to domain

## [1.15.0-bb.7]

### Changed

- Update Chart.yaml to follow new standardization for release automation
- Added renovate check to update new standardization

## [1.15.0-bb.6]

### Changed

- Add test images to be monitored with renovate

## [1.15.0-bb.5]

### Changed

- Relocated bbtests from `test-values.yaml` to `values.yaml`

## [1.15.0-bb.4]

### Changed

- Update redis ui sub-chart with maxmemory

## [1.15.0-bb.3]

### Changed

- Update redis sub-chart

## [1.15.0-bb.2]

### Changed

- Removed docker.io image pulling prevent future pipeline fails from pull rate limit.  Now pulling centos image from registry.dso.mil/platform-one/big-bang.

## [1.15.0-bb.1]

### Changed

- Creation of `allow-prometheus-ingress-redis` NetworkPolicy template for port 9121 redis metrics

## [1.15.0-bb.0]

### Changed

- Bumped chart version to `1.15.0`
- Bumped Anchore Engine image tag to `1.0.0`
- Bumped Anchore Enterprise image tag to `3.2.1`
- Bumped Anchore Enterprise UI image tag to `3.2.1`

## [1.14.7-bb.2]

### Added

- Update README with gluon template

## [1.14.7-bb.1]

### Changed

- Added readOnlyRootFileSystem securityContext to PostgreSQL deployment

## [1.14.7-bb.0]

### Changed

- bumped Anchore Engine image tag to `0.10.2`
- bumped Anchore Enterprise image tag to `3.1.2`
- bumped Anchore Enterprise UI image tag to `3.1.1`

## [1.13.0-bb.10]

### Added

- Networkpolicy for sidecar scraping

## [1.13.0-bb.9]

### Added

- Renovate support for Iron Bank image updates

## [1.13.0-bb.8]

### Changed

- updated Redis dependency to `14.1.0-bb.4`
- added `curl -X POST http://localhost:15020/quitquitquit` to cleanly terminate the istio sidecar container when jobs complete. This was done to resolve OPA Gatekeeper violations
- updated resource requests and limits to better-align with vendor's suggestions

## [1.13.0-bb.7]

### Fixed

- to resolve an issue where Anchore would redeploy after every update, `./chart/templates/engine_secret.yaml` and `./chart/templates/enterprise_feeds_secret.yaml` were modified to set `ANCHORE_SAML_SECRET` to a randomly generated value if not set and the previous secret does not exist

### Changed

- `./chart/templates/engine_configmap.yaml`, `./chart/templates/enterprise_configmap.yaml`, and `./chart/templates/enterprise_feeds_confimap.yaml` were modified to set appropriate saml secret credentials when a saml secret has been randomly generated but left `Null` by the user at `.Values.anchoreGlobal.saml.secret`

## [1.13.0-bb.6]

### Changed

- updated bb-test-lib dependency to gluon `0.2.3` to resolve OPA Gatekeeper violations
- updated Redis dependency to `14.1.0-bb.3` to resolve OPA Gatekeeper violations
- set resource requests and limits for all containers to resolve OPA Gatekeeper violations
- set resource requests and limits equal to eachother to resolve OPA Gatekeeper violations

## [1.13.0-bb.5]

### Added

- `.Values.postgresqlSuperUser.postgresUsername` and `.Values.postgresqlSuperUser.postgresPassword` for conditionally changing the commands in the ensure db jobs to allow for finer-grain postgres user permissions
- `chart/templates/bigbang/db/superuser-db-secret.yaml` secret to populate fields in the ensure db jobs

## [1.13.0-bb.4]

### Fixed

- update allow-kube-dns NP to conditionally add port 5353 egress when `.Values.anchoreGlobal.openShiftDeployment` is `true`

## [1.13.0-bb.3]

### Fixed

- incorrect label on `allow-egress-enterprise-engine-upgrade-job` network policy

## [1.13.0-bb.2]

### Changed

- updated Redis dependency to `14.1.0-bb.2` to utilize `big-bang/base` image for upgrade jobs

## [1.13.0-bb.1]

### Changed

- updated Service Monitor and added Pod Monitor for scraping metrics from Anchore components
- updated chart templates to automatically enable metrics for the Anchore Enterprise feeds service (until patched upstream)

## [1.13.0-bb.0]

### Changed

- Bumped appVersion and Anchore Engine image tag to 0.10.0
- Bumped Anchore Enterprise & Anchore Enterprise UI image tags to 3.1.0

### Fixed

- conditional in network policy for enterprise-ui component
- intermittent issue with upgrade jobs for in-cluster anchore dbs

## [1.12.16-bb.2]

### Changed

- Separated network policies for required egress
- Updated Redis dependency to 14.1.0-bb.1

## [1.12.16-bb.1]

### Fixed

- allow-istio network policy fixed to remove duplicate ports

## [1.12.16-bb.0]

### Changed

- Bumped upstream chart version to 1.12.16
- Fixed insecure SAML configuration issue

## [1.12.15-bb.1]

### Changed

- Updated Redis dependency to 14.1.0-bb.0

### UPGRADE NOTICE

- A clean upgrade job will run which requires complete deletion of the previous redis instance, which means downtime can be expected for Anchore Enterprise UI users. Multiple values were changed and shifted around - most importantly `anchore-ui-redis.password` is now `anchore-ui-redis.auth.password`. By default your old password (whatever is in the secret) will be used and will override any values specified

## [1.12.15-bb.0]

### Changed

- Updated docs for BB documentation standards
- Added optional network policies
- Bumped upstream chart version to 1.12.15
- Bumped Anchore Engine image version to 0.9.4 from Registry1
- Bumped Anchore Enterprise image version to 3.0.3 from Registry1
- Bumped Anchore Enterprise UI image version to 3.0.3 from Registry1

## [1.12.13-bb.0]

### Changed

- Added Helm bash testing for API using approved Iron Bank image
- Bumped upstream chart version to 1.12.13
- Bumped Anchore Enterprise UI image version to 3.0.2 from Registry1

## [1.12.7-bb.3]

### Fixed

- Updated delete policies to db secrets to handle helm errors

## [1.12.7-bb.2]

### Changed

- Added secrets and jobs for automated external Postgres database creation and user/password synchronization
- Updated virtual services and values.yaml to allow for customizable gateways and hosts
- Updated docs around dependencies
- Added docs/Affinity.md

## [1.12.7-bb.1]

### Fixed

- Dependency Chart Syntax Fixes

## [1.12.7-bb.0]

### Changed

- Bumped upstream chart version to 1.12.7
- Bumped Anchore Engine image version to 0.9.3 from Registry1
- Bumped Anchore Enterprise image version to 3.0.2 from Registry1 (Anchore Enterprise UI is remaining at 3.0.1)

## [1.12.4-bb.1]

### Changed

- Replaced Bitnami redis chart with Big Bang redis chart
- Removed Redis values in chart/values.yaml so HA Redis defaults are used for internal Redis deployments

## [1.12.4-bb.0]

### Changed

- Bumped upstream chart version to 1.12.4
- Bumped Anchore Engine image version to 0.9.2 from Registry1
- Bumped Anchore Enterprise image versions to 3.0.1 from Registry1

## [1.12.2-bb.0]

### Changed

- Bumped upstream chart version to 1.12.2
- Bumped Anchore Enterprise image versions to 3.0.0 from Registry1
- BREAKING UPDATE (SSO): When upgrading from 1.11.0-bb.3 and using SSO, manual config is required. See the note in the [Keycloak Docs](./docs/KEYCLOAK.md#anchore-1122-bb0-upgrade).

### Fixed

- Fixed an upgrade bug caused by sso job not being removed

## [1.11.0-bb.3]

### Fixed

- Fixed an SSO bug caused by hashed passwords not being set consistently - BB Issue #135

## [1.11.0-bb.2]

### Changed

- Modified chart to handle monitoring more cleanly

## [1.11.0-bb.1]

### Added

- Prometheus monitoring capability (ServiceMonitor, RoleBinding, Role)

## [1.11.0-bb.0]

### Changed

- Bumped upstream chart version to 1.11.0.
- Bumped anchore engine version to v0.9.0 from registry1.

## [1.9.5-bb.2]

### Fixed

- Fixed a bug that appeared in RKE2 with the postgres deployment not having access to the data directory

## [1.9.5-bb.1]

### Added

- Pointing to upstream helm chart v1.9.5
- Added Ironbank images, VirtualServices, automated license secret creation and SSO integration with Keycloak
