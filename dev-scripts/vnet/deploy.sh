#!/bin/bash

docker build -t samo98/einvoice-slovenskosk .
docker push samo98/einvoice-slovenskosk
$JELASTIC_HOME/environment/control/redeploycontainers --envName einvoice-slovenskosk --nodeGroup cp --tag latest
