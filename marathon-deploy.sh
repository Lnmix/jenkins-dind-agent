#!/bin/bash
set -e
APP_DEFINITION=$(jq -Mcrs 'add' $1 -)
APP_ID=$(echo $APP_DEFINITION | jq -Mcr '.id')
echo $APP_DEFINITION | curl --silent --fail http://master.mesos:8080/v2/apps/$APP_ID -H 'Content-Type: application/json' -X PUT -d @-
exit $?
