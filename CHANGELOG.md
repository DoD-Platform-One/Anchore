# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

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
