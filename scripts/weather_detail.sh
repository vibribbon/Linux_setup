#!/bin/bash


aria2c -D --dir=/home/vibri/scripts -o /resources/weather.xml --allow-overwrite=true 'https://weather-broker-cdn.api.bbci.co.uk/en/forecast/rss/3day/2636769'
sleep 1

echo '--------------------------------------------------------------------' 
echo '-- BBC WEATHER -----------------------------------------------------' 
grep -E '^      <title>|^    <pubDate>|^      <description>' /home/vibri/scripts/resources/weather.xml | sed -e 's/      <title>/\- /g' -e 's/<\/title>/\
/g' -e 's/    <pubDate>//g' -e 's/<\/pubDate>//g' -e 's/      <description>/- /g' -e 's/<\/description>/\
/g'   | fold -s -w 80
echo '--------------------------------------------------------------------' 
