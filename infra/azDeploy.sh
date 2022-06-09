#!/bin/bash
# This script will run an ARM template deployment to deploy all the
# required resources into Azure.
# Azure CLI (log in)

# PreReqs:
az extension add --name containerapp --upgrade
az provider register --namespace Microsoft.App
az provider register --namespace Microsoft.OperationalInsights


# Variables:
RESOURCE_GROUP="get-pong"
LOCATION="westeurope"
APPLICATION_NAME="getpong-api-dev"
IMAGE="getpong.azurecr.io/getpong-api-dev/getpong-dev:latest"
PORT=5000
EXTERNAL="external"
TRANSPORT="http2"

REGISTRY="getpong.azurecr.io"
REGISTRY_USERNAME="getpong"
REGISTRY_PASSWORD="H+ZbZr2C7YuBHNvHvkEq0sIhPc+Pq7cq"


# Create Resource Group:
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION

# Create an environment:
az containerapp env create \
  --name "$APPLICATION_NAME-env" \
  --resource-group $RESOURCE_GROUP \
  --location $LOCATION

# Create a container app:
az containerapp create \
  --name $APPLICATION_NAME \
  --container-name "$APPLICATION_NAME-container" \
  --resource-group $RESOURCE_GROUP \
  --environment "$APPLICATION_NAME-env" \
  --image $IMAGE \
  --registry-server $REGISTRY \
  --registry-username $REGISTRY_USERNAME \
  --registry-password $REGISTRY_PASSWORD \
  --target-port $PORT \
  --ingress $EXTERNAL \
  --transport $TRANSPORT \
  --query properties.configuration.ingress.fqdn


