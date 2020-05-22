```
helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm repo update
helm template anchore stable/anchore-engine -f values.yaml > template.yml
```