# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---
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
