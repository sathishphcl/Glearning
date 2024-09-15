#!/bin/bash

# Step 1: Update package list and install Nginx
echo "Installing Nginx..."
sudo apt update
sudo apt install -y nginx

# Step 2: Retrieve the hostname
hostname=$(hostname)
echo "Hostname: $hostname"

# Step 3: Define the path for the Nginx default website folder
webRoot="/var/www/html"

# Step 4: Define the HTML content with a light blue background and an image from GitHub
# Replace the URL below with the actual URL of your image from GitHub
githubImageUrl="https://github.com/sathishphcl/Glearning/blob/master/VMSS/GLearning.jpg?raw=true"  # Update this with the correct GitHub image URL

htmlContent=$(cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nginx Server</title>
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
    <h1>I am from "$hostname"</h1>
    <h1>This is a demonstration of the VM & Scalset.</h1>
    <img src="$githubImageUrl" alt="Image from GitHub">
</body>
</html>
EOF
)

# Step 5: Write the HTML content to the index.html file in the Nginx root folder
echo "Configuring Nginx web page..."
echo "$htmlContent" | sudo tee "$webRoot/index.html" > /dev/null

# Step 6: Start the Nginx service
echo "Starting Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Step 7: Confirm the installation and display the URL
hostip=$(curl -s ifconfig.me)
echo "Nginx has been installed and configured with a custom HTML page."
echo "You can view the page at http://$hostip"

# Use http://$hostip/index.html for the Webpage view
