#!/bin/bash

# Minimal Setup
# Install your Debian setup of choice first - use a STABLE version not testing (no security updates)
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### CONFIGURE REPOS ###
# this file contains all the non-open repos and backports
cp /home/vibri/linux_setup/resources/apt/sources.list /etc/apt/
apt-get update
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SETUP SUDO ###
# Install sudo and add user to sudoers / allow shutdown without password
apt-get install -y sudo
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SETUP ENVIRONMENT ###
# add the path environment for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile
# setup bashrc
cp /home/vibri/linux_setup/resources/.bashrc /home/vibri/.bashrc
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### INSTALL & SETUP CLI APPS ###
apt-get install -y p7zip-full p7zip-rar # full 7zip package
apt-get install -y ranger # cli file manager
apt-get install -y tree # folder tree mapping
apt-get install -y ncdu # disk usage analyser

apt-get install -y ufw # simple firewall
apt-get install -y aria2 # wget alternative download manager
apt-get install -y curl # flexible download manager
apt-get install -y iftop # internet monitor
apt-get install -y nethogs # list apps using the most bandwidth
apt-get install -y ssh # remote terminal

apt-get install -y htop # system performance
apt-get install -y powertop # system energy usage
apt-get install -y rsync # backup and folder sync tool
apt-get install -y cups # printer server
apt-get install -y ncal # basic calendar
apt-get install -y slock # simple screen locker

apt-get install -y nano # cli text editor (often installed by default)
# Setup nanorc
 cp /home/vibri/linux_setup/resources/nano/nanorc /home/vibri/.nanorc

apt-get install -y vim # advanced cli text editor
# Setup vimrc
 cp /home/vibri/linux_setup/resources/.vimrc /home/vibri/.vimrc

apt-get install -y flatpak # flatpak package manager
# Add flathub repo to flatpak.
 flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

apt-get install -y git # code project management

# optional extras
# apt-get install -y bc # basic interactive calculator
# apt-get install -y mc # midnight commander file manager
# apt-get install -y nmap # port mapper for diagnostics
# apt-get install -y traceroute # internet traceroute for diagnostics
# apt-get install -y xfce4-terminal # alternative xfce terminal
# apt-get install -y moc # terminal music player
# apt-get install -y w3m # terminal web browser
# ----------------------------------------------------------------------


# ----------------------------------------------------------------------
### SCRIPTS ###
# setup local scripts folder and make executable (requires git)
git clone https://github.com/vibribbon/scripts
chown -R vibri /home/vibri/scripts/
chmod -R 744 /home/vibri/scripts/
# ----------------------------------------------------------------------




