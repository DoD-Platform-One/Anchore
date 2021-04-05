# Anchore

This repo contains Big Bang's implementation of Anchore. This includes the upstream Helm chart with slight modifications to support Big Bang needs, Big Bang documentation, and the pipeline infrastructure (tests). This package should typically be installed via the Umbrella package as an add on.

## Other Docs

- [Metrics](./metrics.md)
- [Big Bang Modifications](./BBCHANGES.md)
- [Keycloak](./KEYCLOAK.md)
- [Chart](./CHART.md)
- [Affinity](./Affinity.md)

# Structure

This repo contains 3 main sections. The main chart is provided under the `chart` folder. Documentation is provided under the `docs` folder. Test and CI files are under the `tests` folder.

## Chart

The chart folder contains the main Anchore chart. This is pulled from [upstream](https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine). Added into the upstream chart are several Big Bang templates (under `chart/templates/bigbang`) as well as some additions to the values file (at the top separated as Big Bang Values).

For additional details on the Chart and how to use it, view the `CHART.md` file under this docs folder. If you plan to use this in production be sure to read the section pertaining to dependencies in production.

## Docs

The docs folder provides documentation from Big Bang about usage and features of Big Bang's Anchore package.

## Tests

The tests folder contains all tests and additional dependencies (test values, etc) needed for executing tests in the CI pipeline.
