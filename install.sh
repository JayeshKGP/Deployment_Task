#!/bin/bash

echo "Server setup initiated"

#Cheking root access
if (( $EUID != 0 )); then
    echo "Please run this script as root"
    echo "Usage: sudo bash install.sh"
    exit 1
fi

echo "Updating package list and installing NGINX..."
sudo apt update
sudo apt install nginx -y

# Start and enable NGINX service
echo "Starting and enabling NGINX service..."
sudo systemctl start nginx
sudo systemctl enable nginx

# Create 'Hello World' page
echo "Setting up the web page..."
cd /var/www/html
rm -rf *
echo "<h1>Hello World!</h1>" > index.html
echo "<p>OS: $(lsb_release -d | cut -f2)</p>" >> index.html

# Display the public IP address of the server
PUBLIC_IP=$(curl -4 icanhazip.com)
echo "Server setup completed. You can access your web page at http://$PUBLIC_IP"
