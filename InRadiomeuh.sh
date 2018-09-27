#!/bin/bash

[ -d $HOME/.meuh ] || mkdir $HOME/.meuh

log=$HOME/.meuh/logmeuh2.0
temp1=$$

gettrack=$(curl -s http://www.radiomeuh.com/playlist/ | grep '</td></tr>' | sed 's/<[^>]*>//g' |  sed -n 3p | sed -r 's/^.{14}//')

source="http://myos.fr:8000/" 

# What Radiomeuh is playing ? 

while true
do

track1=$(echo $gettrack)
echo "$track1"

sleep 1

echo "$track2"

track2=$(echo $gettrack)


if [ "$track2" != "$track1" ]
then 
	echo $track2 >>$log
fi

done

