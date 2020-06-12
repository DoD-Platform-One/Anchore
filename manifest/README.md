```
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
helm template anchore stable/anchore-engine -f values.yaml > template.yml
```
ANCHORE_ADMIN_PASSWORD: "foobar"
ANCHORE_DB_PASSWORD: "anchore,supersecretpass"