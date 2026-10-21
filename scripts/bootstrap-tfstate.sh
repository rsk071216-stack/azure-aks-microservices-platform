#!/usr/bin/env bash
# One-time setup: storage account that holds the Terraform remote state.
# Usage: ./scripts/bootstrap-tfstate.sh [location]
set -euo pipefail

LOCATION="${1:-centralindia}"
RG="rg-tfstate"
SA="sttfstate$(tr -dc 'a-z0-9' </dev/urandom | head -c 6)"
CONTAINER="tfstate"

az group create --name "$RG" --location "$LOCATION" --output none
az storage account create \
  --name "$SA" \
  --resource-group "$RG" \
  --location "$LOCATION" \
  --sku Standard_LRS \
  --min-tls-version TLS1_2 \
  --allow-blob-public-access false \
  --output none
az storage container create \
  --name "$CONTAINER" \
  --account-name "$SA" \
  --auth-mode login \
  --output none

echo "Done. Put these values in terraform/backend.hcl and GitHub repo variables:"
echo "  resource_group_name  = \"$RG\""
echo "  storage_account_name = \"$SA\""
echo "  container_name       = \"$CONTAINER\""
