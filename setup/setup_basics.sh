#!/bin/bash

# ----------------------------------------------------------------------
### NOTES ###
# Debian setup
# Modular file - comment/uncomment as required for your setup.
# Install your Debian setup of choice first - use a STABLE version not testing (no security updates)
# recommended to run as su from main user account
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### CONFIGURE REPOS ###
# Setuop Apt repos to include non-free and contrib
# Add ' non-free contrib' to the lines starting 'deb http'
sed -i '/^deb http/ s/$/ non-free contrib/' /etc/apt/sources.list
# comment out the source lines.
sed -i 's/\(^deb-src http\)/# \1/g' /etc/apt/sources.list
apt-get update
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SETUP SUDO ###
# Install sudo and add user to sudoers / allow shutdown without password
# change 'vibri' to your username
apt-get install -y sudo
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers
# ----------------------------------------------------------------------
