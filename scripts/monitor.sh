#!/bin/bash

# This script required iostat from the sysstat package
# sudo apt-get install sysstat intel-gpu-tools radeontop nvidia-smi


echo '------------------------------------------------------------------'
printf "\n"
printf "RAM used,CPU idle,GPU (use [ctrl]+c to stop"
printf "\n"

for (( ; ; ))
do
  printf "  %b\n" "$(free -mh | grep "Mem" | cut -c 28-35 | sed -s 's/[A-Z].*//g'),$(iostat -c | grep '           ' | cut -c 51-54)"
  sleep 1
done



printf "\n"
echo '------------------------------------------------------------------'
