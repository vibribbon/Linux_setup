#!/bin/bash

clear

printf "\n"
printf "   %s\n" "DATE: $(date)"
printf "   %s\n" "IP ADDR: $(curl ifconfig.me)"
printf "   %s\n" "USER: $(echo $USER)"
printf "   %s\n" "HOSTNAME: $(hostname -f)"
printf "   %s\n" "UPTIME: $(uptime -p)"
printf "   %s\n" "CPU: $(lscpu | grep "Model name:" )"
printf "   %s\n" "KERNEL: $(uname -svm)"
printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
printf "   %s\n" "RESOLUTION: $(xrandr | grep "HDMI")"
printf "   %s\n" "MEMORY Total: $(free -mh | grep "Mem" | cut -c 17-25)"
printf "   %s\n" "MEMORY Used: $(free -mh | grep "Mem" | cut -c 28-35)"
printf "\n"
