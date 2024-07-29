# Big Bang Anchore 4.1 Release Notes

## 4.1 Vulnerability Scan Behavior

The 4.1 upgrade requires a new vulnerability database to be built by the feed service using a new schema. In the time between the new deployment startup and the completion of the first post-upgrade feed service data sync, the policy engine API will return errors for vulnerability scans. Only once it receives the newly built vulnerability database from the upgraded feed service will it resume normal operation. Note that depending on the deployment, the data update and new db build may take several hours. The system will resolve this condition on its own but your maintenance window should take this into account.

One workaround to reduce downtime is to upgrade to 4.1.0 with the enterprise feed service disabled. Then you can run an anchorectl feed sync --flush to manually sync vulnerability data from upstream (Caution! This will be missing Windows data and in the future, the Anchore proprietary feed which was released in 4.1.0). Once the system has a working upstream database, re-enable the enterprise feed service so it can operate as normal in the background.

# 4.1.0 FIPs Upgrade Issue

When running on FIPs enabled nodes the 4.1 upgrade requires a additional steps to ensure expected behavior.

Run the fixer script to generate a job manifest with a specific namespace and release

```sh
python3 fix.py --namespace anchore --release anchore | kubectl apply -f -
```

The other ways to apply this fix

*Note: This needs to be applied to both the enterprise database and the feeds database*

1. Run the upgrade on a machine without FIPs enabled and point it at the database

```sh
# Run on enterprise database
export ANCHORE_DB_PASSWORD=<your database password>
export ANCHORE_DB_USER=<your database user>
export ANCHORE_DB_DATABASE=<your anchore database>
export ANCHORE_DB_HOST=<your database endpoint>
docker run docker.io/anchore/enterprise:v4.1.0 anchore-enterprise-manager db --db-connect postgresql://"${ANCHORE_DB_USER}":"${ANCHORE_DB_PASSWORD}"@"${ANCHORE_DB_HOST}"/"${ANCHORE_DB_NAME}" upgrade --dontask;

# Run on enterprise feeds database
export ANCHORE_DB_PASSWORD=<your feeds database password>
export ANCHORE_DB_USER=<your feeds database user>
export ANCHORE_DB_DATABASE=<your anchore feeds database>
export ANCHORE_DB_HOST=<your feeds database endpoint>
docker run docker.io/anchore/enterprise:v4.1.0 anchore-enterprise-manager db --db-connect postgresql://"${ANCHORE_DB_USER}":"${ANCHORE_DB_PASSWORD}"@"${ANCHORE_DB_HOST}"/"${ANCHORE_DB_NAME}" upgrade --dontask;
```

If you want to `kubectl port-forward ...` the database pod then you can connect the container to the host machine. Likely something like this

```sh
export ANCHORE_DB_HOST=host.docker.internal
```

2. Copy the SQL script to one of the running pods and execute it with `psql -f fix.sql` making sure it's pointed at the correct database.

## If running on docker-compose, use the following

```
docker compose down (assuming running 4.0.3)
docker compose create anchore-db
docker compose start anchore-db
psql -U postgres -p 5432 < 4.1.0_do_upgrade.sql
# Update the images to 4.1.0
docker compose up -d
```

*Note:* For additional support and to receive the script contact <support@anchore.com>
