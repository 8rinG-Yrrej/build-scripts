#!/bin/bash

# Diagham version: DiagHam-2024-03-16
# https://www.nick-ux.org/diagham/index.php/Main_Page

module load openblas/0.3.x openmpi/gcc/4.1.2

../configure --enable-fqhe --enable-gmp --enable-lapack --enable-spin --enable-fti --enable-mpi --with-blas-libs="-lopenblas" --with-lapack-libs="-lopenblas"

make -j40 clean
make -j8

# Need "module load openblas/0.3.x openmpi/gcc/4.1.2" for running jobs
