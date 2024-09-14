# Execute the Powershell script directly form  the Web URL
Invoke-Expression (Invoke-WebRequest -URI "https://raw.githubusercontent.com/sathishphcl/Glearning/master/VMSS/vmss_app.ps1" -UseBasicParsing).Content

