targetScope = 'subscription'

// Resource Group Name
@description('Resource Group Name')
@minLength(4)
@maxLength(64)
param rgName string

// Location
@description('Location of Azure Resources')
@allowed([
  'westeurope'
  'northeurope'
])
param location string

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

module logAnalytics 'modules/createLogAnalytics.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'gp-logAnalyticsWorkspace'
  params: {
    name: 'getpong-logs'
    location: location
  }
}

module containerAppEnv 'modules/createContainerAppEnv.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'containerApiAppEnv'
  params: {
    location: location
    name: 'getpong-api-env'
    workspaceClientId: logAnalytics.outputs.clientId
    workspaceClientSecret: logAnalytics.outputs.clientSecret
  }
}

module grpcBackend 'modules/createContainerApp.bicep' = {
  scope: resourceGroup(rg.name)
  name: 'getpong-grpc-api'
  params: {
    name: 'getpong-grpc-api'
    location: location
    containerImage: 'getpong.azurecr.io/getpong-api-dev/getpong-dev:latest'
    containerAppEnvironmentId: containerAppEnv.outputs.id
    containerPort: 5000
    useExternalIngress: true
    transportMethod: 'http2'
    environmentVariables: []
    registry: 'getpong.azurecr.io'
    registryUsername: 'getpong'
    registryPassword: 'H+ZbZr2C7YuBHNvHvkEq0sIhPc+Pq7cq'
  }
}
