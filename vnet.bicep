
@description('Location for all resources.')
param location string = resourceGroup().location

@description('Name of the VNET')
param virtualNetworkName string = 'vnet-devops'

@description('Name of the subnet in the virtual network')
param subnetName string = 'snet-devops'

@description('Vnet address prefix')
param addressPrefix string = '10.1.0.0/16'

@description('Subnet address prefix')
param subnetAddressPrefix string = '10.1.0.0/24'

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    enableDdosProtection: false
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
        }
      }
    ]
  }
}

output subnetId string = vnet.properties.subnets[0].id
