#!/bin/bash
#az login --use-device-code
# Source the variables from the bash-variables file
# source ./bash-variables # Uncomment this if you are using the GitBash or any bash based command line.
# If you are using wsl/ ubuntu use the variables in the same script
# bash-variables
prefix="tfbackend"
#storageaccountname="${prefix}storageaccount"
containername="tfstate"
#tfstkey="${prefix}tfstatekey"
location="EastUS"
# resourcegroup="rg-${prefix}-${random_number}"

# Generate a random 4-digit number
random_number=$(shuf -i 1000-9999 -n 1)

# Append the random number to the storage account name
storageaccountname="${prefix}stacc${random_number}"
resourcegroup="rg-${prefix}-${random_number}"

# Check if the resource group exists, if not, create it
if ! az group show --name $resourcegroup &>/dev/null; then
    echo "Resource group $resourcegroup not found. Creating resource group..."
    #az group create --name $resourcegroup --location $location
    az group create --resource-group $resourcegroup --location $location
else
    echo "Resource group $resourcegroup already exists."
fi

# Create the storage account
echo "Creating storage account: $storageaccountname..."
az storage account create \
    --name $storageaccountname \
    --resource-group $resourcegroup \
    --location $location \
    --sku Standard_LRS \
    --kind StorageV2

# Retrieve the storage account key
account_key=$(az storage account keys list \
    --resource-group $resourcegroup \
    --account-name $storageaccountname \
    --query '[0].value' --output tsv)

# Create the storage container
echo "Creating storage container: $containername..."
az storage container create \
    --name $containername \
    --account-name $storageaccountname \
    --account-key $account_key


echo "Storage account, container, setup completed."

# Define the target directory where terraform.tfvars should be generated
output_directory="../terraform"

# Create the directory if it doesn't exist
# mkdir -p "$output_directory"

:'

# Dynamically generate terraform.tfvars file
cat > "$output_directory/backend.tfvars" <<EOF
storage_account_name = "$storageaccountname"
resource_group_name  = "$resourcegroup"
container_name = "$containername"
key = "terraform.tfstate"
EOF

'
# Dynamically generate terraform.tfvars file
cat > "$output_directory/backend.tf" <<EOF
terraform {
backend "azurerm" {
storage_account_name = "$storageaccountname"
resource_group_name  = "$resourcegroup"
container_name = "$containername"
key = "terraform.tfstate"
}
}
EOF
