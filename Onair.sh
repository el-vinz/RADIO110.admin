#!/bin/bash

[ -d $HOME/.logs ] || mkdir $HOME/.logs
log_dir=$HOME/.logs/

meuh_track () {      
    
    source="http://www.radiomeuh.com/playlist/"

    track=$(curl -s $source | grep '</td></tr>' | sed 's/<[^>]*>//g' |  sed -n 3p | sed -r 's/^.{14}//')

    echo "$track"

}

meuh_function () {
            radio="MEUH" 
            stamp=$(date +"%m_%d_%Y %H_%M ")
            track1=$(meuh_track)
            echo $track1
            sleep 1
            track2=$(meuh_track)
            echo $track2

            if [ "$track1" != "$track2" ]
                        then
                        echo "$track2 $stamp" >>$log_dir/$radio
            fi

}



110_track () {
    
    source="http://myos.fr:8000/"

    track=$(curl -s $source | sed 's/<[^>]*>//g' | awk -F 'playing:' {'print $2'} | sed '/^$/d')
    
    echo "$track"
}

110_function () {
            radio="R110"
            stamp=$(date +"%m_%d_%Y %H_%M ")
            track1=$(110_track)
            echo $track1 
            sleep 1
            track2=$(110_track)
            echo $track2

            if [ "$track1" != "$track2" ]
                        then
                        echo "$track2 $stamp" >>$log_dir/$radio
            fi

}

while true
do

    110_function

    meuh_function

done