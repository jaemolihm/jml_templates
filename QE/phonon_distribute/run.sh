#!/bin/sh
#PBS -V
#PBS -N NP.qINDQ
#PBS -q normal
#PBS -l select=20:ncpus=68:mpiprocs=68:ompthreads=1
#PBS -l walltime=48:00:00
#PBS -e error.phINDQ
#PBS -o output.phINDQ
#PBS -A qe
cd $PBS_O_WORKDIR
QE=/home01/x2122a02/program/qe-dev/bin

# SCF, phonon
mpirun -np 1280 $QE/ph.x -nk 320 -nb 1 -ndiag 1 -in ph.iqINDQ.in > ph.iqINDQ.out
