# Anchore Enterprise

Anchore Enterprise provides container inspection and compliance solutions. It protects against internal and external threats, enforces
security best practices, and speed up DevSecOps workflows. Anchore Enterprise integrates seamlessly to enforce defined polices.

Anchore Enterprises can be installed using the [Helm Chart](https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine), integrated into container based CI/CD
pipeline with a [Jenkins Plugin](https://plugins.jenkins.io/anchore-container-scanner/), and used with the GitLab CI pipelines with the [GitLab integration guide](https://docs.anchore.com/current/docs/using/integration/ci_cd/gitlab/).

## Anchore Software Components

- On-premises Anchore Enterprise
  - Web UI
  - API
  - Notifications
  - RBAC
  - Reporting
  - Worker
  - Queue
  - Catalog
  - CLI

- On-premises Feed Service
  - Enterprise UI
  - Anchore CLI
  - Jenkins Plugin
  - CI Integration
  - Enterprise RBAC
  - Anchore Engine

## Quick Start

- [Docker Compose File](https://docs.anchore.com/current/docs/quickstart/docker-compose.yaml)
- [Prometheus Configuration for Monitoring](https://docs.anchore.com/current/docs/quickstart/anchore-prometheus.yml)
  - [Enabling Prometheus](https://docs.anchore.com/current/docs/quickstart/#optional-enabling-prometheus-monitoring)
- [Swagger UI Nginx Proxy](https://docs.anchore.com/current/docs/quickstart/anchore-swaggerui-nginx.conf)
  - [Enabling Swagger](https://docs.anchore.com/current/docs/quickstart/#optional-enabling-swagger-ui)
  
## More Topics

- [Security](https://repo1.dso.mil/platform-one/big-bang/apps/security-tools/anchore-enterprise/-/blob/documentation-standard/docs/security.md)
- [Troubleshooting](https://repo1.dso.mil/platform-one/big-bang/apps/security-tools/anchore-enterprise/-/blob/documentation-standard/docs/troubleshooting.md)

Find more information on Anchore Enterprise [here](https://docs.anchore.com/current/docs/overview/).
