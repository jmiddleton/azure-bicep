targetScope = 'subscription'

@description('The name of the Location.')
param rgLocation string

@description('Resource group name')
param rgName string

@description('Username for the Virtual Machine.')
param adminUsername string

@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType string = 'password'

@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string

resource rg 'Microsoft.Resources/resourceGroups@2020-10-01' = {
  name: rgName
  location: rgLocation
}

module vnet 'vnet.bicep' = {
  name: 'vnet-module'
  scope: rg
  params: {    
  }
}

module jenkins 'jenkins.bicep' = {
  name: 'jenkins-module'
  scope: rg
  params: {
    vmName: 'jenkins'
    adminUsername: adminUsername
    adminPasswordOrKey: adminPasswordOrKey
    authenticationType: authenticationType
    subnetId: vnet.outputs.subnetId
  }
}

module gitlab 'gitlab.bicep' = {
  name: 'gitlab-module'
  scope: rg
  params: {
    vmName: 'gitlab'
    adminUsername: adminUsername
    adminPasswordOrKey: adminPasswordOrKey
    authenticationType: authenticationType
    subnetId: vnet.outputs.subnetId
    dnsLabelPrefix: 'gitlab-mhr01'
  }
}

module artifactory 'artifactory.bicep' = {
  name: 'artifactory-module'
  scope: rg
  params: {
    vmName: 'artifactory'
    adminUsername: adminUsername
    adminPasswordOrKey: adminPasswordOrKey
    authenticationType: authenticationType
    subnetId: vnet.outputs.subnetId
    dnsLabelPrefix: 'artifactory-mhr01'
  }
}
