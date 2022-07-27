#!/bin/bash
#

echo "-- CONVERT CAMEL CASE TO SNAKE CASE --"
find . -print0 | while read -d $'\0' file; do
	if [ "$file" != `echo "$file" | sed 's/\([[:lower:]]\)\([[:upper:]]\)/\L\1_\L\2/g'` ]
	then
		echo "$file" " => " `echo "$file" | sed 's/\([[:lower:]]\)\([[:upper:]]\)/\L\1_\L\2/g'`
		mv "$file" `echo "$file" | sed 's/\([[:lower:]]\)\([[:upper:]]\)/\L\1_\L\2/g'`
	fi;
done
echo ""
# format of sed is sed 's/match_string/replace_string/g'
# s is substitute and g = run on all occurances in string
# \ is escape character [[:upper:]] is an upper case character
# \L is make lower case, \1 is the first match component in brackets \(\), \2 is the second.
# so find all instances of lowercaseUPPERCASE eg eB and replace with lower case and an _ between the characters


echo "-- REPLACE HYPHEN OR SPACE WITH UNDERSCORE --"
find . -print0 | while read -d $'\0' file; do
	if [ "$file" != `echo "$file" | tr -s ' -' '__'` ]
	then
		echo "$file" " => " `echo "$file" | tr -s ' -' '__'`
		mv "$file" `echo "$file" | tr -s ' -' '__'`
	fi;
done
echo ""

echo "-- REPLACE UPPER CASE WITH LOWER CASE --"
find . -print0 | while read -d $'\0' file; do
	if [ "$file" != `echo "$file" | tr [:upper:] [:lower:]` ]
	then
		echo "$file" " => " `echo "$file" | tr [:upper:] [:lower:]`
		mv "$file" `echo "$file" | tr [:upper:] [:lower:]`
	fi;
done
echo ""

echo "-- REMOVE BRACKETS FROM FILENAMES --"
find . -print0 | while read -d $'\0' file; do
	if [ "$file" != `echo "$file" | tr -d '()'` ]
	then
		echo "$file" " => " `echo "$file" | tr -d '()'`
		mv "$file" `echo "$file" | tr -d '()'`
	fi;
done
echo ""

# in tr -s is to squeeze repeated characters into a single character
# format is tr match_string replace_string
