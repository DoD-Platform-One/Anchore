# Anchore Keycloak Integration

This document summarizes helm values and manual steps that are required to integrate with Keycloak.

## Configuration Steps

These are the items you need to do to configure Keycloak and Anchore for SSO in your Big Bang installation. 

### Keycloak Configuration

#### Prerequisites

Keycloak is configured with a working Realm including Groups and Users.

#### Keycloak Client Setup

You will first need to set up the Keycloak client that can be used by Anchore.

[See here for an example.](https://docs.anchore.com/current/docs/overview/sso/examples/keycloak/)

### Anchore Configuration

First make sure that your values will properly enable the UI - this requires toggling enterprise global on as well as the UI. For additional help on this, walk through the `chart/README` file.

The config changes needed for SSO/Keycloak in Anchore are embedded in the helm chart and require values to be set.

Set the values for your Anchore helm chart following the guide and example below. These can be encrypted if desired (add them to your `secrets.enc.yaml` file) or just added to your `configmap.yaml`.

```yaml
addons:
  anchore:
    sso:
      enabled: true
      clientId: "platform1_a8604cc9-f5e9-4656-802d-d05624370245_bb8-anchore" # Specific client ID for Anchore
      samlDescriptorUrl: "https://login.dso.mil/auth/realms/baby-yoda/protocol/saml/descriptor" # SAML Descriptor URL for the keycloak instance
      roleAttribute: "" # Optional, set a Keycloak attribute for role mapping - must exist and contain Anchore roles, i.e. read-write, full-control, etc
```

For more details on the values being set here, view the "Anchore SSO Reference" below.

NOTE: Local development makes use of login.dsop.io and the necessary values are committed in the values.yaml files in the repo and visible above.

If you are installing the chart without the core Big Bang application chart you will need to review the `chart/values.yaml` file for additional configuration help. Big Bang provides simplified mapping of some values.

## Additional References

[Anchore SSO Reference](https://anchore.com/blog/feature-series-anchore-enterprise-2-1-sso/) - This includes the process to set up Keycloak integration manually. Our Helm chart automates this process through API calls.

[Anchore SSO Mapping](https://docs.anchore.com/current/docs/overview/sso/mapping/) - This doc discusses how users are mapped from an SSO into Anchore's users/priveleges.

[Anchore + Keycloak Example](https://docs.anchore.com/current/docs/overview/sso/examples/keycloak/) - An example from Anchore of how to set up the Keycloak client.
