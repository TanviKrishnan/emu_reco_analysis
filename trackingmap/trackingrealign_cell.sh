#!/bin/bash

brickID=21

#finally doing cell by cell tracking with realign
#edit track.rootrc before launching

var1=$3
xbin=$((var1 / 19))
ybin=$((var1 % 19))

#starting from 1 to 19, not 0 to 18
xname=$((xbin + 1))
yname=$((ybin + 1))

echo "Starting tracking with realign"

makescanset -copyset -A=21.0.0.0 -suff=cp.root -set=21.0.$xname.$yname -from_plate=57 -to_plate=1 -v=2

#makescanset -set=$brickID.0.$xname.$yname -dzbase=195 -from_plate=$1 -to_plate=$2 -v=2

emtra -set=$brickID.0.$xname.$yname -new -v=2 -ix=$xbin -iy=$ybin

