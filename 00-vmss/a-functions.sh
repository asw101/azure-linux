# helper snippets which can be sourced to use the functions below

RESOURCE_GROUP='200800-azure-linux'
LOCATION='eastus'

function a-deploy {
	az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json
}

function a-deploy-key {
	! [[ -z "${1:-}" ]] && local PASSWORD_OR_KEY="$1"
	[[ -z "${PASSWORD_OR_KEY:-}" ]] && local PASSWORD_OR_KEY="$(cat ~/.ssh/id_rsa_tmp.pub)"

	az deployment group create --resource-group $RESOURCE_GROUP --template-file azuredeploy.json \
	    --parameters adminPasswordOrKey="$PASSWORD_OR_KEY"
}

function a-deploy-empty {
	! [[ -z "${1:-}" ]] && local RESOURCE_GROUP="$1"
	! [[ -z "${2:-}" ]] && local LOCATION="$2"

	az deployment group create --resource-group $RESOURCE_GROUP --template-file empty.json \
		--mode Complete
}

function a-ssh {
	[[ -z "${ID_RSA:-}" ]] && local ID_RSA="~/.ssh/id_rsa.pub"
	
	ssh $1 \
	    -i $ID_RSA \
	    -o UserKnownHostsFile=/dev/null \
	    -o StrictHostKeyChecking=no
}

function a-ssh-port {
	[[ -z "${ID_RSA:-}" ]] && local ID_RSA="~/.ssh/id_rsa.pub"
	
	ssh $1 \
	    -i $ID_RSA \
	    -o UserKnownHostsFile=/dev/null \
	    -o StrictHostKeyChecking=no \
	    -p $2
}

