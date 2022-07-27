#!/bin/sh

# backup the insurgency sandstorm server

mkdir /home/vibri/downloads/bak_inssserver
mkdir /home/vibri/downloads/bak_inssserver/serverfiles
mkdir /home/vibri/downloads/bak_inssserver/serverfiles/Insurgency
mkdir /home/vibri/downloads/bak_inssserver/serverfiles/Insurgency/Config
mkdir /home/vibri/downloads/bak_inssserver/serverfiles/Insurgency/Saved
mkdir /home/vibri/downloads/bak_inssserver/lgsm

rsync -avP --delete -e ssh inssserver@192.168.1.21:/home/inssserver/serverfiles/Insurgency/Config/ /home/vibri/downloads/bak_inssserver/serverfiles/Insurgency/Config/
rsync -avP --delete -e ssh inssserver@192.168.1.21:/home/inssserver/serverfiles/Insurgency/Saved/ /home/vibri/downloads/bak_inssserver/serverfiles/Insurgency/Saved/
rsync -avP --delete -e ssh inssserver@192.168.1.21:/home/inssserver/lgsm/ /home/vibri/downloads/bak_inssserver/lgsm

7z a /home/vibri/downloads/bak_inssserver.7z /home/vibri/downloads/bak_inssserver/* -mx=9

rm -r /home/vibri/downloads/bak_inssserver
