# Execute the Powershell script directly form  the Web URL, Run this in the Azure VM "Run Command"
# https://learn.microsoft.com/en-us/azure/virtual-machines/extensions/custom-script-windows#examples --- Reference for -UseBasicParsing
Invoke-Expression (Invoke-WebRequest -URI "https://raw.githubusercontent.com/sathishphcl/Glearning/master/VMSS/vmss_app.ps1" -UseBasicParsing).Content

# jason input can be provided as below :
# {"fileUris":["https://raw.githubusercontent.com/sathishphcl/Glearning/master/VMSS/vmss_app.ps1>"], "commandToExecute":"./vmss_app.ps1"}
https://github.com/Azure/azure-cli -- Referece For Az CLI
#– Custom Script Extension using Azure CLI:
# https://www.learnthecontent.com/exam/azure/az-104-microsoft-azure-administrator/s/deploy-virtual-machine-vm-extensions
# https://webmagicinformatica.com/working-with-vm-extension-from-azure-portal/
# Run this in the Azure Cloud Shell 
az vm extension set --name CustomScriptExtension --publisher Microsoft.Compute --vm-name webvm1 --resource-group GreateLearning-USNC-RG --settings '{"fileUris":["https://raw.githubusercontent.com/sathishphcl/Glearning/master/VMSS/vmss_app.ps1"], "commandToExecute":"powershell -ExecutionPolicy Unrestricted -File ./vmss_app.ps1"}'

# https://mortenknudsen.net/?p=344 - How to run custom scripts on thousands of servers within a few minutes using Azure Custom Scripts extension and multithreaded jobs – and have them re-run daily?

######## CHECK THE VM COST COMARISION BETWEEN THE REGIONS ##########
# https://cloudprice.net/?_numberOfCores_min=2&_memoryInMB_min=4

# Azure Availability Zone Supported Regions by List
# https://learn.microsoft.com/en-us/azure/reliability/availability-zones-service-support#azure-regions-with-availability-zone-support
az vm show --resource-group <resource-group-name> --name <vm-name> --query "zones" --output tsv
https://www.trendmicro.com/cloudoneconformity-staging/knowledge-base/azure/VirtualMachines/zone-redundant-vm-scale-sets.html

# https://bluexp.netapp.com/blog/azure-availability-zones-an-in-depth-look