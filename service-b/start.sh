#!/bin/bash

#service nginx start
# Here Goes your code to download logs and analyze them.

azcopy copy "https://k8sinterview.blob.core.windows.net/zohar/YOUR_SAS_TOKEN" ./ --include-after `date +%F"T"%T --date='5 minute ago'` --recursive > /dev/null
cat ./zohar/* > ./mergedfile.txt
rm -rf ./zohar

firefox=0
chrome=0
safari=0
while IFS="" read -r p || [ -n "$p" ]
do
STR=$p
if grep -q "Firefox" <<< "$STR"; then
        firefox=$(($firefox+1))
elif grep -q "Chrome" <<< "$STR"; then
        chrome=$(($chrome+1))
elif grep -q "Safari" <<< "$STR"; then
        safari=$(($safari+1))
fi
done < mergedfile.txt
echo "Firefox: $firefox, Chrome: $chrome, Safari: $safari" > text.txt

sed -e '/^Firefox/{r text.txt' -e 'd}' -i /usr/share/nginx/html/index.html
