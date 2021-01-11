# Anchore Enterprise v1.9.5-bb.1

This repo contains Big Bang's implementation of Anchore. This includes the upstream Helm chart with slight modifications to support Big Bang needs, Big Bang documentation, and the pipeline infrastructure (tests). This package should typically be installed via the Umbrella package as an add on.

## Other Docs

- [Metrics](./metrics.md)

# Structure

## Chart

The chart folder contains the main Anchore chart. This is pulled from [upstream](https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine). Added into the upstream chart are several Big Bang templates (under `chart/templates/bigbang`) as well as some additions to the values file (at the top separated as Big Bang Values).

For additional details on the Chart and how to use it, view the README file under the chart folder.

## Docs

The docs folder provides documentation from Big Bang about usage and features of Big Bang's Anchore package.

## Tests

The tests folder contains all tests and additional dependencies (test values, etc) needed for executing tests in the CI pipeline.

# TODOs

1. The Postgres and Redis images being used are not from IronBank. There appears to be an issue using the IronBank Postgres image for Anchore - this needs more investigation. In addition, the Redis image being pulled from the upstream Helm chart is several versions beyond what IronBank contains.
