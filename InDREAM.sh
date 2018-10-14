#!/bin/bash
radio="DREAM"

log=$HOME/.logs/${radio}.log

echo "start $(date)">>$log

source="http://www.radio-ihaveadream.com/"

yt_query='https://www.youtube.com/results?search_query='

. ./print_log.sh


gettrack () {
	curl -s $source | grep "title:" | awk -F 'title: |&n' '{print $2}' | sed -n  2p | sed 's/^.//'
}

echo "$(gettrack) $(date +"%d_%m_%Y %H %M")">>$log

print_log

