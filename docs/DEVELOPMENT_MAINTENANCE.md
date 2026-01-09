# To upgrade the Anchore Package

Check the [upstream release notes](https://docs.anchore.com/current/docs/releasenotes/) and the [helm chart upgrade notes](https://github.com/anchore/anchore-charts/tree/main/stable/enterprise#upgrading-the-chart).

### Upgrading

Find the latest enterprise chart version that corresponds with the Anchore Enterprise version identified by Renovate. If the subcharts have not been updated by renovate bot, then do the following:

Check the values of the dependencies in `chart.yaml` then update the chart with helm, by entering the `chart` directory:

```shell
helm dep update
```

### automountServiceAccountToken

The mutating Kyverno policy named `update-automountserviceaccounttokens` is leveraged to harden all ServiceAccounts in this package with `automountServiceAccountToken: false`. This policy is configured by namespace in the Big Bang umbrella chart repository at [chart/templates/kyverno-policies/values.yaml](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/chart/templates/kyverno-policies/values.yaml?ref_type=heads).

This policy revokes access to the K8s API for Pods utilizing said ServiceAccounts. If a Pod truly requires access to the K8s API (for app functionality), the Pod is added to the `pods:` array of the same mutating policy. This grants the Pod access to the API, and creates a Kyverno PolicyException to prevent an alert.

# Testing New Anchore Version

### Deploy Anchore as part of Big Bang

- Obtain the Big Bang dev Anchore enterprise license by following the below instructions:
  - Clone the dogfood repo if you have not already, from <https://repo1.dso.mil/big-bang/team/deployments/bigbang.git>
  - Run `sops -d bigbang/prod2/environment-bb-secret.enc.yaml | yq '.stringData."values.yaml"' | yq '.addons.anchore.enterprise.licenseYaml'` to get the full license contents.
  - Add the full output from that command under `license` in your override values as a yaml object (shown below), making sure that indentation is properly preserved.

`overrides/anchore.yaml`

```
addons:
  anchoreEnterprise:
    enabled: true
    git:
      tag: Null
      branch: "renovate/anchore"
    upstream:
      anchoreConfig:
        default_admin_password: "test"
      # -- License for Anchore Enterprise. Enterprise is the only option available for the chart starting with chart major version 2.X.
      # For formatting examples see https://repo1.dso.mil/big-bang/product/packages/CHART.md#enabling-enterprise-services
      license:
        $LICENSE_CONTENT        
    sso:
      enabled: true
      spEntityId: "platform1_a8604cc9-f5e9-4656-802d-d05624370245_bb8-anchore"
      acsUrl: "https://anchore.bigbang.dev/service/sso/auth/keycloak"
    values:
      anchoreAnalyzer:
        replicaCount: 2
```

- Deploy Big Bang and Anchore to dev environment

```
helm upgrade -i bigbang ./bigbang/chart --create-namespace -n bigbang -f ./bigbang/chart/ingress-certs.yaml -f ./overrides/registry-values.yaml -f ./overrides/anchore.yaml
```

NOTE: You may disable `kiali`, `kyverno`, `promtail`, `loki`, `neuvector`, `tempo`, and/or `monitoring` in the deployment, if desired, as they are not required for testing.

- [ ] Visit `https://anchore.bigbang.dev`
- [ ] Confirm ability to login with Keycloak (SSO)
- [ ] Provide your P1 SSO credentials and confirm successful login.
- [ ] Logout, then log in with the username and password. Login as 'admin' using the password specified in the overrides file
- [ ] Confirm the intended version and review the release notes by selecting the version number in the upper left. Ensure there are no important or breaking changes that need to be addressed
- [ ] Navigate to `Images` and select `Analyze Tag` to add a new tag for analysis.
- [ ] Populate the fields with a registry/image/tag of your choosing, or by using the example information.
- [ ] Allow several minutes for the analysis to complete.
- [ ] Select the repository name of your new tag, confirm `Status` is `Analyzed`
- [ ] Select the tag SHA and confirm `Metadata`, `Policy Compliance`, and `Action Workbench` have all been Analyzed. (`Vulnerabilities` will be marked unsuccessful, with a red 'X,' this is expected.)
- [ ] Ensure integration tests are passing by following the [test-package-against-bb](https://repo1.dso.mil/big-bang/bigbang/-/blob/master/docs/developer/test-package-against-bb.md?ref_type=heads) doc and modify test-values with the following settings:

  ```yaml
  addons:
    anchore:
      enabled: true
      git:
        tag: null
        branch: my-package-branch-that-needs-testing
      adminPassword: "foobar"
      enterprise:
        # -- License for Anchore Enterprise. Enterprise is the only option available for the chart starting with chart major version 2.X.
        # For formatting examples see https://repo1.dso.mil/big-bang/product/packages/CHART.md#enabling-enterprise-services
        licenseYaml: |
          $LICENSE_CONTENT
      sso:
        enabled: true
        client_id: "platform1_a8604cc9-f5e9-4656-802d-d05624370245_bb8-anchore"
      values:
        anchoreAnalyzer:
          replicaCount: 2
      istio:
        hardened:
          enabled: true
    ```
