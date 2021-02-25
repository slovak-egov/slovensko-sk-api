#!/bin/bash

docker build -t ghcr.io/slovak-egov/slovensko-sk-api .
docker push ghcr.io/slovak-egov/slovensko-sk-api
$JELASTIC_HOME/environment/control/redeploycontainers --envName dev-einvoice-upvs-mfsr --nodeGroup cp --tag latest
