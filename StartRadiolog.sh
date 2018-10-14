#!/bin/bash

# chaque script d'acquisition est échappé dans un nouveau process afin de de pouvoir temporiser sur les trois radios en même temp. 

./In110.sh &
./InMEUH.sh &
./InDREAM.sh &