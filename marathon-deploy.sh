#!/bin/bash
set -e
APP_DEFINITION=$(jq -Mcrs '.[0] * .[1]' $1 -)
APP_ID=$(echo $APP_DEFINITION | jq -Mcr '.id')
echo -e "marathon-deploy:\n$APP_DEFINITION"
echo $APP_DEFINITION | curl --fail http://master.mesos:8080/v2/apps/$APP_ID -H 'Content-Type: application/json' -X PUT -d @-
exit $?
