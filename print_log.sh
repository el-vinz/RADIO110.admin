#!/bin/bash

print_log () {
    while true
	do

		track1=$(gettrack)

		echo "$track1"

		sleep 60

		echo "$track2"
		track2=$(gettrack)


		if [ "$track2" != "$track1" ]
            then 
                echo "$track2 $(date +"%m_%d_%Y %H_%M ")" >>$log
                track2=$(echo $track2 | sed 's/ /+/g')
                echo "${yt_query}${track2}" >>$log.yt
            fi

    done
}