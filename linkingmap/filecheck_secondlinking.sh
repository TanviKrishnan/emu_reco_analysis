#!/bin/bash

brickID=41
iplate=51
minimumsize=10000000
counter=0
for var in $(seq 0 360)
 do
  xbin=$((var / 19))
  ybin=$((var % 19))
  #starting from 1 to 19, not 0 to 18
  xname=$((xbin + 1))
  yname=$((ybin + 1))
  platefolder="$(printf "p%0*d" 3 $iplate)"
  file=$platefolder/$brickID.$iplate.$xname.$yname.cp.root
  #file=p00$iplate/$brickID.$iplate.$xbin.$ybin.cp.root
  if [ -f "$file" ]
   then
   actualsize=$(wc -c <"$file")
   let counter++
   if [ $actualsize -lt $minimumsize ]; then
      echo $file is under $minimumsize bytes $var with bytes $actualsize
   fi
  else
   echo $file does not exists $var
  fi
 done
echo $counter

