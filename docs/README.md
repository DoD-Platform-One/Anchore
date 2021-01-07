# Anchore Enterprise v2.4.1-bb.1

This repo contains Big Bang's implementation of Anchore. This includes the upstream Helm chart with slight modifications to support Big Bang needs, 
Big Bang documentation, and the pipeline infrastructure (tests). This package should typically be installed via the Umbrella package as an add on.

## Other Docs

- [Metrics](./metrics.md)

# Structure

## Chart

The chart folder contains the main Anchore chart. This is pulled from [upstream](https://github.com/anchore/anchore-charts/tree/master/stable/anchore-engine). 
Added into the upstream chart are several Big Bang templates (under `chart/templates/bigbang`) as well as some additions to the values file (at the top separated 
as Big Bang Values).

## Docs

The docs folder provides documentation from Big Bang about usage and features.

## Tests

The tests folder contains all tests and additional dependencies (test values, etc) needed for executing tests in the CI pipeline.

# TODOs

1. Anchore is pulling the Redis chart directly from upstream via Helm dependency. This should be updated to a package maintained by Big Bang in the future.

2. The Postgres and Redis images being used are not from IronBank. There appears to be an issue using the IronBank Postgres image for Anchore - this needs 
more investigation. In addition, the Redis image being pulled from the upstream Helm chart is several versions beyond what IronBank contains.
