# Simple Azure Bicep project to provision Jenkins, Gitlab and Artifactory

[![Board Status](https://dev.azure.com/jorgemiddleton0656/eefe86dc-8dd6-4edf-8cd2-694ba57284df/f878639b-5d0d-4b5c-bd4f-d84469c0b516/_apis/work/boardbadge/27a7e2f2-fbd5-410b-bf6a-c97c0344aa64)](https://dev.azure.com/jorgemiddleton0656/eefe86dc-8dd6-4edf-8cd2-694ba57284df/_boards/board/t/f878639b-5d0d-4b5c-bd4f-d84469c0b516/Microsoft.RequirementCategory/)

This project provisions a simple vnet with one subnet where all the tools are provisioned.
All the tools are provisiones on Ubuntu VMs with same username and password. To access each product a public IP is provisioned for each of them.

![Devops Platform](devops.png)

## Deployment 

```
az deployment sub create --name deployment001 --location australiaeast --template-file main.bicep --parameters rgName=rg-devops-nonprod rgLocation=australiaeast adminUsername=<your_admin_username> adminPasswordOrKey=<your_password>
```
