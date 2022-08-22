#!/bin/sh
# This is entrypoint script for 3scale-tests `tools` make target

cd `dirname $0`

oc apply -k overlays/testsuite/ --namespace "${SHARED_NAMESPACE:=tools}"

NAMESPACE=$SHARED_NAMESPACE ./base/rhsso/deploy-rhsso.sh

oc apply -k overlays/exclusive/ --namespace "${THREESCALE_NAMESPACE:=3scale}"
