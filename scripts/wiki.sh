#!/bin/bash

waddress="https://en.m.wikipedia.org/wiki/"
waddress+=$1

aria2c -D --dir=/home/vibri/scripts -o /resources/wiki.html --allow-overwrite=true "$waddress";
sleep 1

# Pattern matching to only pull lines with text, then remove html syntax and introduce spacing to make it more readable.
# Final section is to remove style and script code
grep -E '<p>|</p>|<h|<div|<li|<title>' /home/vibri/scripts/resources/wiki.html | grep -v '^	' | sed -e 's/<\/tr>/\
/g'  -e 's/<\/li>/<\/li>\
/g' -e 's/<\/td>/<\/td>\
/g' -e 's/<\/div>/<\/div>\
\
/g' -e 's/<\/p>/<\/p>\
\
/g' -e 's/<\/h>/<\/h>\
/g' -e 's/<title>/                    <title>/g' -e 's/>Edit<//g' -e 's/<\/th>/   /g' -e 's/^\(.*\)<style \(.*\)<\/style>\(.*\)/\1\3/g' -e 's/^\(.*\)<script>\(.*\)<\/script>\(.*\)/\1\3/g' | sed -e 's/^\(.*\)<style \(.*\)<\/style>\(.*\)/\1\3/g' -e 's/<[^>]*>//g' | uniq | fold -w 80 -s | less -s


