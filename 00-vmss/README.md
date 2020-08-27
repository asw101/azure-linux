# README

## group 

```bash
RESOURCE_GROUP='200800-azure-linux'
LOCATION='eastus'
az group create -n $RESOURCE_GROUP -l $LOCATION
```

## vmss 

```bash
RESOURCE_GROUP='200800-azure-linux'
PASSWORD_OR_KEY="$(cat ~/.ssh/id_rsa.pub)"

az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY"

az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json \
    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY" \
        vmName=vm2 \
        customDataUrl='https://raw.githubusercontent.com/asw101/azure-linux/dev-cloud-snips/00-vmss/cloud-init/cloud-init.sh'
```

## portal 

[Deploy to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fasw101%2Fazure-linux%2Fdev-cloud-snips%2F00-vmss%2Fazuredeploy.json)

```bash
TEMPLATE_URL='https://raw.githubusercontent.com/asw101/azure-linux/dev-cloud-snips/00-vmss/azuredeploy.json'
OUTPUT_URL='https://portal.azure.com/#create/Microsoft.Template/uri/'$(printf "$TEMPLATE_URL" | jq -s -R -r @uri )
echo $OUTPUT_URL

# https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fasw101%2Fazure-linux%2Fdev-cloud-snips%2F00-vmss%2Fazuredeploy.json
```

