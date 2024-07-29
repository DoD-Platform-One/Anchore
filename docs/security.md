# Security

Anchore Enterprise supports user login to the User Interface through identities from external identity providers that support Security Assertion Markup Language (SAML). Anchore
does not store any user credentials. However, usernames and anchore permissions are stored. The identity provider validates the user's access while an external provider validates the username and all first time user login information.

The Anchore Enterprise deployment must be configured to utilize the SAML SSO.

- It is required to Enable Oauth to ensure that Anchore can issue bearer tokens for subsequent API usage by the UI to the system APIs.

- Hashed passwords are recommended.

- From the user's browser, reach the Identity Provider's login URL.

- Access the metadata XML endpoint in the Identity Provider.

Configuration of SAML SSO is done using API/UI operations but requires configuration both in the user's Identity Provider and within Anchore.

The Identity Provider must:

- Support HTTP Redirect binding
- Support signed assertions and signed documents
- Allow unsigned client requests from Anchore
- Allow unencrypted requests and responses

Click the [link](https://docs.anchore.com/current/docs/overview/sso/) for more Anchore security information.

## Note on FIPS

With the current version of Anchore Enterprise (3.1.0), certain functions of Anchore may not work on FIPS enabled nodes. This is a [known issue](https://github.com/anchore/anchore-engine/issues/882) that is being worked on. Until a fix is released, please use node affinity to schedule Anchore pods on non-FIPS nodes:

```yaml
# Example Big Bang values
addons:
  anchore:
    values:
      anchoreAnalyzer:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreApi:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreCatalog:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchorePolicyEngine:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreSimpleQueue:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreEngineUpgradeJob:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreEnterpriseFeedsUpgradeJob:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreEnterpriseReports:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreEnterpriseNotifications:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreEnterpriseUi:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
      anchoreEnterpriseEngineUpgradeJob:
        affinity:
          nodeAffinity:
            requiredDuringSchedulingIgnoredDuringExecution:
              nodeSelectorTerms:
              - matchExpressions:
                - key: type
                  operator: In
                  values:
                  - <YOUR_NON_FIPS_NODE_LABEL_HERE>
```
