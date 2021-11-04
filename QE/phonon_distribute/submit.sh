#!/bin/bash
set -e

for iq in `seq 1 13`; do
  cp ph.in ph.iq$iq.in
  cp run.sh run.iq$iq.sh

  sed -i "s/INDQ/$iq/g" ph.iq$iq.in
  sed -i "s/INDQ/$iq/g" run.iq$iq.sh

  mkdir -p temp.$iq/NbP.save
  cd temp.$iq/
  cp ../temp/NbP.xml .
  cd NbP.save
  cp ../../temp/NbP.save/*.xml ../../temp/NbP.save/*.upf .
  ln -sf ../../temp/NbP.save/*.dat .
  cd ../../

  #qsub run.iq$iq.sh
done
