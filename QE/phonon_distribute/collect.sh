#!/bin/bash
set -e

find -name "*.wfc?*" -delete
find -size 0 -delete

cp -r temp.1/_ph0 temp/
rm -r temp.1

for iq in `seq 2 13`; do
  cp -r temp.$iq/_ph0/NbP.q_$iq temp/_ph0/
  rm -r temp.$iq
done
