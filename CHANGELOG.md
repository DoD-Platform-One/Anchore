# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

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
