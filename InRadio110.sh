#!/bin/bash
log=$HOME/logs/
while true
do

track1=$(curl -s http://myos.fr:8000/ | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')

echo $track1

sleep 1

track2=$(curl -s http://myos.fr:8000/ | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')

echo $track2

if [ "$track2" != "$track1" ]
then 
	echo $track2 >>$log
fi
done

