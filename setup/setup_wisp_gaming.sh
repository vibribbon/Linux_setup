#!/bin/bash

# wisp Setup using debian only - lightweight setup

# CONFIGURE REPOS
apt-get update
# Add the non free repos (add contrib non-free onto the end of each line)
apt-get install -y software-properties-common
add-apt-repository non-free
add-apt-repository contrib
apt-get update


# INSTALL OS COMPONENTS
# install window manager
apt-get install -y sudo ssh xorg openbox obconf
# if you want a login manager 
apt-get install -y slim
# install drivers / firmware (AMD only)
apt-get install -y firmware-linux firmware-linux-nonfree libdrm-amdgpu1 xserver-xorg-video-amdgpu


# INSTALL SOFTWARE APPS
# other software
apt-get install -y p7zip-full p7zip-rar ranger ncdu tree nano aria2 htop powertop iftop xsensors nethogs moc ufw rsync cups flatpak slock
apt-get install -y pulseaudio pavucontrol
apt-get install -y feh mupdf youtube-dl firefox-esr pcmanfm gnome-disk-utility geany libreoffice-writer bleachbit
# sudo apt-get install chafa conky mirage
# galculate is broken?


# gaming software (APT)
# install the i386 architecture (only used by steam)
dpkg --add-architecture i386
apt-get update
apt-get install -y steam

# Install Lutris
apt-get install -y flatpak git
git clone https://github.com/vibribbon/linux_setup
cp -r /home/vibri/Linux_setup/script /home/vibri/
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install lutris


# CONFIGURATION
# copy the openbox default configs to the local user folder.
mkdir /home/vibri/.config
cp -r /etc/xdg/openbox /home/vibri/.config
# auto change the openbox resolution
echo 'exec xrandr --output HDMI-A-0 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
echo 'exec xrandr --output HDMI-1 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
chown vibri /home/vibri/.config /home/vibri/.config/openbox
chown vibri /home/vibri/.config/openbox/autostart /home/vibri/.config/openbox/environment /home/vibri/.config/openbox/menu.xml /home/vibri/.config/openbox/rc.xml 


# Add user to sudoers, and allow shutdown without password
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers

# add the path for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile

# build essential if needed - particularly for virtualbox
# apt install build-essential dkms linux-headers-$(uname -r)



