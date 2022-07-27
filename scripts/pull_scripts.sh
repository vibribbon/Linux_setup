#!/bin/bash

# pull the scripts file to the local machine
echo "syncing the scripts folder"
rsync -avP -e ssh vibri@192.168.1.5:/mnt/our_data/d_public/computing/scripts/ /home/vibri/scripts 
echo "syncing openbox settings"
rsync -avP -e ssh vibri@192.168.1.5:/mnt/our_data/d_public/computing/config_files/.config/openbox/ /home/vibri/.config/openbox 

read -p "Press a key to exit"


