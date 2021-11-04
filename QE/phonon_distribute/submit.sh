#!/bin/bash
set -e

PREFIX=NbP
N_Q=13

# SCF calculation should be finished, with outdir="./temp".

for iq in `seq 1 $N_Q`; do
  cp ph.in ph.iq$iq.in
  cp run.sh run.iq$iq.sh

  # Modify input file and job scripts
  sed -i "s/INDQ/$iq/g" ph.iq$iq.in
  sed -i "s/INDQ/$iq/g" run.iq$iq.sh

  # Create temp directory for each q point
  mkdir -p temp.$iq/"$PREFIX".save
  cd temp.$iq/
  cp ../temp/"$PREFIX".xml .
  cd "$PREFIX".save
  cp ../../temp/"$PREFIX".save/*.xml ../../temp/"$PREFIX".save/*.upf .
  ln -sf ../../temp/"$PREFIX".save/*.dat .
  cd ../../

  #qsub run.iq$iq.sh
done
