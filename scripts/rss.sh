#!/bin/bash


aria2c -D --dir=/home/vibri/scripts -o /resources/bbc.xml --allow-overwrite=true https://feeds.bbci.co.uk/news/video_and_audio/news_front_page/rss.xml?edition=uk
aria2c -D --dir=/home/vibri/scripts -o /resources/verge.xml --allow-overwrite=true https://www.theverge.com/rss/index.xml
aria2c -D --dir=/home/vibri/scripts -o /resources/gol.xml --allow-overwrite=true https://www.gamingonlinux.com/article_rss.php
aria2c -D --dir=/home/vibri/scripts -o /resources/ns.xml --allow-overwrite=true https://www.newscientist.com/section/news/feed/
aria2c -D --dir=/home/vibri/scripts -o /resources/polygon.php --allow-overwrite=true https://www.polygon.com/rss/index.xml

truncate -s 0 /home/vibri/scripts/resources/rss_all.txt
echo '-- COMMANDS q(quit) arrow keys(scroll) PGUP/PGDN /(search)  ------' >> /home/vibri/scripts/resources/rss_all.txt
echo '------------------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
echo '-- BBC NEWS ------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
grep -v 'BBC News - News front page' /home/vibri/scripts/resources/bbc.xml | grep "<title>"  | sed 's/            <title><!\[CDATA\[/\|- /g' | sed 's/\]\]><\/title>//g' | head -n 20 >> /home/vibri/scripts/resources/rss_all.txt

echo '------------------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
echo '-- VERGE ---------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
grep -v '  <title>The Verge -  All Posts' /home/vibri/scripts/resources/verge.xml | grep "<title>" | sed 's/    <title>/\|- /g' | sed 's/<\/title>//g' | head -n 20 >> /home/vibri/scripts/resources/rss_all.txt

echo '------------------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
echo '-- NEW SCIENTIST -------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
grep -v 'New Scientist - News' /home/vibri/scripts/resources/ns.xml | grep "<title>"  | sed 's/            <title>/\|- /g' | sed 's/<\/title>//g' | head -n 20 >> /home/vibri/scripts/resources/rss_all.txt

echo '------------------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
echo '-- POLYGON GAMING ------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
grep -v '  <title>Polygon -  All' /home/vibri/scripts/resources/polygon.php | grep "<title>" | sed 's/    <title>/\|- /g' | sed 's/<\/title>//g' | head -n 20 >> /home/vibri/scripts/resources/rss_all.txt

echo '------------------------------------------------------------------' >> /home/vibri/scripts/resources/rss_all.txt
#echo '-- GAMING ON LINUX -----------------------------------------------'
#grep "<title>" /home/vibri/scripts/rss/gol.xml | sed 's/            <title><!\[CDATA\[/\|-/g' | sed 's/\]\]><\/title>//g' | head -n 27 | tail -n 25 | fold -s -w 80

fold -s -w80 /home/vibri/scripts/resources/rss_all.txt | less
