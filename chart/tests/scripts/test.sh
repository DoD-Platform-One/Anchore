#!/bin/bash

# Wait for Anchore Engine API to go live
while [ $(curl -sw '%{http_code}' "${ANCHORE_CLI_URL}/swagger.json" -o /dev/null) -ne 200 ]; do
  echo "Waiting for Anchore API..."
  sleep 10;
done

# Confirm able to auth
interval=5
# 3 minute timeout
timeout=180
resourcename="anchore-api-login"
counter=0
# need to remove the default "set -e" to allow commands to return nonzero exit codes without the script failing
set +e
while true; do
   if [[ $(curl -s -u admin:$ANCHORE_CLI_PASS -X get ${ANCHORE_CLI_URL}/images) != "Unauthorized" ]]
   then
      echo "$resourcename is now available"
      echo "Total wait time was $(($counter * $interval))"
      break
   fi
   sleep $interval
   let counter++
   if [[ $(($counter * $interval)) -ge $timeout ]]; then
      echo "$resourcename timeout waiting $timeout seconds for resource creation" 1>&2
      exit 1
   fi
done
set -e

echo "Retrieving system health..."
status=$(anchore-cli --debug system status 2>&1)

# IF status code is 200 AND all services are up
if [[ ${status} =~ "httpcode from response: 200" && ${status} =~ "analyzer:8084): up" && ${status} =~ "simplequeue:8083): up" && ${status} =~ "policy:8087): up" && ${status} =~ "api:8228): up" && ${status} =~ "catalog:8082): up" ]]; then
  echo ${status}
  echo "***** 200 OK - all services up! *****"
else
  echo ${status}
  sleep 10
  exit 1
fi

echo "Initiating image analysis..."
add=$(anchore-cli --debug image add $ANCHORE_SCAN_IMAGE 2>&1)

# IF status code is 200
if [[ ${add} =~ "httpcode from response: 200" ]]; then
  echo ${add}
  echo "***** 200 OK - image analysis initiated! *****"
else
  echo ${add}
  sleep 10
  exit 1
fi

echo "Waiting for image analysis to complete..."
wait=$(anchore-cli --debug image wait $ANCHORE_SCAN_IMAGE 2>&1)

# IF status code is 200
if [[ ${wait} =~ "httpcode from response: 200" ]]; then
  echo ${wait}
  echo "***** 200 OK - image analysis completed! *****"
else
  echo ${wait}
  sleep 10
  exit 1
fi

# List analyzed images
echo "Listing analyzed images..."
list=$(anchore-cli --debug image list 2>&1)

# IF status code is 200
if [[ ${list} =~ "httpcode from response: 200" ]]; then
  echo ${list}
  echo "***** 200 OK - image analysis stored! *****"
else
  echo ${list}
  sleep 10
  exit 1
fi
