#!/bin/bash

# Minimal cli setup only
# Install your Debian setup of choice - use a STABLE version not testing (no security updates)


# CONFIGURE REPOS
cp /home/vibri/linux_setup/resources/apt/sources.list /etc/apt/
apt-get update


# INSTALL OS AND APPS
apt-get install -y sudo xorg openbox obconf

# Command line apps
apt-get install -y p7zip-full p7zip-rar ranger ncdu tree nano aria2 htop powertop iftop nethogs ufw rsync cups flatpak git ncal curl vim ssh slock
# Additional
apt-get install -y mc bc



# CONFIGURATION
# Add flathub to flatpak.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Copy all scripts
cp -r /home/vibri/linux_setup/scripts/ /home/vibri
cp -r /home/vibri/linux_setup/setup/ /home/vibri/scripts/setup
cp -r /home/vibri/linux_setup/cheatsheets/ /home/vibri/scripts/cheatsheets
# setup bashrc
cp /home/vibri/linux_setup/resources/bashrc /home/vibri/.bashrc
# Setup nanorc
cp /home/vibri/linux_setup/resources/nano/nanorc /home/vibri/.nanorc
# Setup vimrc
cp /home/vibri/linux_setup/resources/.vimrc /home/vibri/.vimrc


# Add user to sudoers, and allow shutdown without password
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers

# add the path for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile
