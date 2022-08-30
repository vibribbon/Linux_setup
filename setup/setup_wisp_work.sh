#!/bin/bash

# wisp Setup using debian only - lightweight setup

# CONFIGURE REPOS
apt-get update
# Add the non free repos (add contrib non-free onto the end of each line)
apt-get install -y software-properties-common
add-apt-repository non-free
add-apt-repository contrib
apt-get update


# INSTALL OS AND APPS
apt-get install -y sudo ssh xorg openbox obconf
# if you want a lightweight login manager 
apt-get install -y slim
# install drivers / firmware (AMD only)
apt-get install -y firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu
# Command line apps
apt-get install -y p7zip-full p7zip-rar ranger ncdu tree nano aria2 htop powertop iftop nethogs ufw rsync cups flatpak git
# Utilities
apt-get install -y pulseaudio pavucontrol xsensors slock gnome-disk-utility bleachbit youtube-dl xarchiver arandr
# GUI Apps
apt-get install -y pcmanfm firefox-esr feh mupdf geany libreoffice-writer libreoffice-impress libreoffice-calc scribus gimp inkscape shotcut handbrake audacity
# Optional
# apt-get install -y  mirage r-base moc vlc stacer transmission blender virtualbox
# Novelties
# apt-get install -y chafa conky buici-clock tickr
# build essential - needed for virtualbox
# apt install build-essential dkms linux-headers-$(uname -r)


# CONFIGURATION
# Add flathub to flatpak.
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# copy the openbox default configs to the local user folder.
mkdir /home/vibri/.config
cp -r /etc/xdg/openbox /home/vibri/.config
cp -r /home/vibri/Linux_setup/resources/openbox /home/vibri/.config
# auto change the openbox resolution 1440p
echo 'exec xrandr --output HDMI-A-0 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
echo 'exec xrandr --output HDMI-1 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
# copy geany configs
cp /home/vibri/Linux_setup/resources/geany/geany.conf /home/vibri/.config/geany
cp /home/vibri/Linux_setup/resources/geany/spyder-dark.conf /home/vibri/.config/geany/colorschemes
# copy slim configs
cp /home/vibri/Linux_setup/resources/slim/slim.conf /etc
cp /home/vibri/Linux_setup/resources/slim/background.jpg /usr/share/slim/themes/default
# Change file ownership
chown -R vibri /home/vibri/.config
# Copy all scripts
cp -r /home/vibri/Linux_setup/scripts/ /home/vibri
cp -r /home/vibri/Linux_setup/setup/ /home/vibri/scripts/setup
cp -r /home/vibri/Linux_setup/cheatsheets/ /home/vibri/scripts/cheatsheets
# admin
mkdir /home/vibri/files
rmdir /home/vibri/Documents
rmdir /home/vibri/Videos
rmdir /home/vibri/Public
rmdir /home/vibri/Pictures
rmdir /home/vibri/Templates
rmdir /home/vibri/Music
rmdir /home/vibri/Desktop
rn /home/vibri/Downloads /home/vibri/downloads


# Add user to sudoers, and allow shutdown without password
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers

# add the path for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile





