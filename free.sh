#!/bin/bash

# Backup the original sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak

# Update /etc/apt/sources.list with the recommended repository
sudo tee /etc/apt/sources.list > /dev/null <<EOL
deb http://ftp.debian.org/debian bookworm main contrib
deb http://ftp.debian.org/debian bookworm-updates main contrib

# Proxmox VE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

# security updates
deb http://security.debian.org/debian-security bookworm-security main contrib
EOL

# Update the package lists
sudo apt update
