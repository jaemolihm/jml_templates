#!/bin/bash
set -e

PREFIX=NbP
N_Q=13

find -name "$PREFIX.wfc?*" -delete
find -size 0 -delete

cp -r temp.1/_ph0 temp/
rm -r temp.1

for iq in `seq 2 $N_Q`; do
  cp -r temp.$iq/_ph0/"$PREFIX".q_$iq temp/_ph0/
  rm -r temp.$iq
done
