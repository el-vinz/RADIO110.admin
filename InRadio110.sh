#!/bin/bash
log=$HOME/logs/Radio110.log
echo "start $(date)">$log
source="http://myos.fr:8000/"

gettrack=$(curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')

echo $gettrack>>$log
# What Radio110 is playing ? 

while true
do

track1=$(echo $gettrack)

echo "$track1"

sleep 1

track2=$(echo $gettrack)
echo "$track2"


if [ "$track2" != "$track1" ]
then 
	echo "$track2 $(date +"%m_%d_%Y")" >>$log
fi

done

