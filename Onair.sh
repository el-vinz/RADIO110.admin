#!/bin/bash

[ -d $HOME/.logs ] || mkdir $HOME/.logs
log_dir=$HOME/.logs/

meuh_track () {
    radio="MEUH"
    
    
    source="http://www.radiomeuh.com/playlist/"

    track=$(curl -s $source | grep '</td></tr>' | sed 's/<[^>]*>//g' |  sed -n 3p | sed -r 's/^.{14}//')

    track="$radio $track $(date +"%m_%d_%Y %H_%M ")"
    echo "$track"

}

110_track () {
 
    source="http://myos.fr:8000/"

    track=$(curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')
    track="R110 $track "
    echo "$track"
}

110_function () {
            stamp=$(date +"%m_%d_%Y %H_%M ")
            track1=$(110_track)
            
            radio=$(echo $track1 | cut -d " " -f1 )
            
            sleep 1
            track2=$(110_track)

            if [ "$track1" != "$track2" ]
                        then
                        echo "$track2 $stamp" >>$log_dir/$radio
            fi

}

meuh_function () {
            stamp=$(date +"%m_%d_%Y %H_%M ")
            track1=$(meuh_track)
            
            radio=$(echo $track1 | cut -d " " -f1 )
            
            sleep 1
            track2=$(meuh_track)

            if [ "$track1" != "$track2" ]
                        then
                        echo "$track2 $stamp" >>$log_dir/$radio
            fi

}

while true
do

    110_function

    sleep 1

    meuh_function

done