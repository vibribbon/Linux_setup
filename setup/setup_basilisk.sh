#!/bin/bash

# basilisk Setup using debian only

# Note you need to add the non free repos first (add contrib non-free onto the end of each line)

# CONFIGURE REPOS
apt-get update
# Add the non free repos (add contrib non-free onto the end of each line)
apt-get install -y software-properties-common
add-apt-repository non-free
add-apt-repository contrib
apt-get update


# INSTALL OS COMPONENTS
# install window manager
apt-get install sudo ssh xorg openbox obconf
# if you want a login manager 
# apt-get install slim
# install drivers / firmware (AMD only)
apt-get install firmware-linux firmware-linux-nonfree # libdrm-amdgpu1 xserver-xorg-video-amdgpu


# INSTALL SOFTWARE APPS
# other software
apt-get install -y p7zip-full p7zip-rar ranger ncdu tree nano aria2 htop powertop iftop xsensors nethogs moc ufw rsync cups flatpak slock
#apt-get install -y pulseaudio pavucontrol
apt-get install -y feh mupdf youtube-dl firefox-esr pcmanfm gnome-disk-utility geany bleachbit wget
# sudo apt-get install chafa conky mirage


# gaming software (APT)
# install the i386 architecture (only used by steam)
#dpkg --add-architecture i386
#apt-get update
#apt-get install steam lutris

# LGSM Server
# Insurgency Sandstorm
dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 steamcmd
adduser inssserver
su
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh inssserver
./inssserver install

# Insurgency 2014
dpkg --add-architecture i386; sudo apt update; sudo apt install curl wget file tar bzip2 gzip unzip bsdmainutils python3 util-linux ca-certificates binutils bc jq tmux netcat lib32gcc-s1 lib32stdc++6 libsdl2-2.0-0:i386 steamcmd
adduser insserver
su
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh insserver
./insserver install


# CONFIGURATION
# copy the openbox default configs to the local user folder.
mkdir /home/vibri/.config
cp -r /etc/xdg/openbox /home/vibri/.config
# auto change the openbox resolution
# echo 'exec xrandr --output HDMI-A-0 --mode 2560x1440 &' >> /home/vibri/.config/openbox/autostart
chown vibri /home/vibri/.config /home/vibri/.config/openbox
chown vibri /home/vibri/.config/openbox/autostart /home/vibri/.config/openbox/environment /home/vibri/.config/openbox/menu.xml /home/vibri/.config/openbox/rc.xml 


# Add user to sudoers, and allow shutdown without password
echo 'vibri   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'vibri ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers
echo 'inssserver   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'inssserver ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers
echo 'insserver   ALL=(ALL:ALL) ALL' >> /etc/sudoers
echo 'insserver ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown' >> /etc/sudoers

# add the path for sbin to ease typing
echo 'export PATH="/sbin:$PATH"' >> /home/vibri/.profile
echo 'export PATH="/sbin:$PATH"' >> /home/inssserver/.profile
echo 'export PATH="/sbin:$PATH"' >> /home/insserver/.profile

# build essential if needed - particularly for virtualbox
# sudo apt install build-essential dkms linux-headers-$(uname -r)

