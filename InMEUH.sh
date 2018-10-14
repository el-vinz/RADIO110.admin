#!/bin/bash
radio="MEUH"

log=$HOME/.logs/${radio}.log

echo "start $(date)">>$log

source="http://www.radiomeuh.com/playlist/"

yt_query='https://www.youtube.com/results?search_query='

. ./print_log.sh


gettrack () {
	curl -s $source | grep '</td></tr>' | sed 's/<[^>]*>//g' | sed '1,2d' | sed '2,9d' | sed -r 's/^.{14}//'
 
}
echo $gettrack
echo "$(gettrack) $(date +"%d_%m_%Y %H %M")">>$log
# What Radiomeuh is playing ? 

print_log

