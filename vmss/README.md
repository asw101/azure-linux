# README

## vmss
```bash
RESOURCE_GROUP='190800-vmss'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## vmss - linux
```bash
RESOURCE_GROUP='190800-vmss'
PASSWORD_OR_KEY="$(cat ~/.ssh/id_rsa.pub)"

az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY"

az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY" \
        vmName=vm2 \
        customDataUrl='https://gist.githubusercontent.com/asw101/40102c0abce14351b2c0d4efd3e342c9/raw/190800-docker.sh'
```
