#!/bin/bash

sed -i 's/\MYOS\///g' ${1}
sed -i 's/\/Musique\//\/MUSIQUE\//g' ${1}

