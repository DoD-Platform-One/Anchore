# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

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
