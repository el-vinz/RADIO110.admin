#!/bin/bash
radio="110"

log=$HOME/.logs/${radio}.log

echo "start $(date)">>$log

source="http://myos.fr:8000/"

yt_query='https://www.youtube.com/results?search_query='

. ./print_log.sh


gettrack () {
	curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d'
}

echo "$(gettrack) $(date +"%d_%m_%Y %H %M")">>$log
# What Radio110 is playing ? 

print_log

