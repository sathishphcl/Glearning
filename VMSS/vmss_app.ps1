# Step 1: Install IIS feature
Write-Host "Installing IIS feature..."
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Step 2: Retrieve the hostname
$hostname = (Get-WmiObject Win32_ComputerSystem).Name
Write-Host "Hostname: $hostname"

# Step 3: Define the path for the IIS default website folder
$webRoot = "C:\inetpub\wwwroot"

# Step 4: Define the HTML content with a light blue background and an image from GitHub
# Replace the URL below with the actual URL of your image from GitHub
$githubImageUrl = "https://github.com/sathishphcl/Glearning/blob/master/VMSS/GLearning.jpg?raw=true"  # Update this with the correct GitHub image URL

$htmlContent = @"
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IIS Server</title>
    <style>
        body {
            background-color: lightblue;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 50px;
        }
        h1 {
            color: #333;
        }
    </style>
</head>
<body>
    <h1>Welcome to GreatLearning.. !!</h1>
    <h1>I am from {{  $hostname  }}</h1>
    <h1>This is a demonstration of the VM Scalset.</h1>
    <img src=$githubImageUrl>
</body>
</html>
"@

# Step 5: Write the HTML content to the index.html file in the IIS root folder
$indexFilePath = Join-Path -Path $webRoot -ChildPath "index.html"
Set-Content -Path $indexFilePath -Value $htmlContent -Encoding UTF8

# Step 6: Start the IIS service
Write-Host "Starting IIS service..."
Start-Service -Name W3SVC

# Step 7: Confirm the installation and display the URL
Write-Host "IIS has been installed and configured with a custom HTML page."
$hostpip = (Invoke-WebRequest ifconfig.me/ip).Content.Trim()
Write-Host "You can view the page at http://$hostpip"
