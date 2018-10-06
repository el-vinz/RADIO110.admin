#!/bin/bash
log=$HOME/logs/Radio110.log
echo "start $(date)">$log
source="http://myos.fr:8000/"

gettrack=$(curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')

echo "$gettrack $(date +"%d_%m_%Y %H %M")">>$log
# What Radio110 is playing ? 

while true
do

track1=$(curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')

echo "$track1"

sleep 1

echo "$track2"
track2=$(curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')


if [ "$track2" != "$track1" ]
then 
	echo "$track2 $(date +"%m_%d_%Y %H_%M ")" >>$log
fi

done

