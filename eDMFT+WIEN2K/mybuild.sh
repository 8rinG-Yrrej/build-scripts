#!/bin/sh

echo Assuming under eDMFT path
# need to install meson
# pip install meson ninja
# python -m pip install -U pip setuptools wheel meson meson-python ninja
# python -m pip install -U meson meson-python ninja charset_normalizer

# I have openBLAS in $(pwd)/build/download/usr/lib64

export NINJAFLAGS=-j1
export MAKEFLAGS=-j1
export LIBRARY_PATH=${LIBRARY_PATH}:$(pwd)/src/impurity/fort/:$(pwd)/bin/gsl/lib/:$(pwd)/build/download/usr/lib64
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$(pwd)/src/impurity/fort/:$(pwd)/bin/gsl/lib/:$(pwd)/build/download/usr/lib64
export CPATH=${CPATH}:$(pwd)/bin/gsl/include/
export C_INCLUDE_PATH=${C_INCLUDE_PATH}:$(pwd)/bin/gsl/include/
export CPLUS_INCLUDE_PATH=${CPLUS_INCLUDE_PATH}:$(pwd)/bin/gsl/include/

export CC=gcc
export CXX=g++ 
export FC=gfortran
python setup.py --fc=gfortran --cc=gcc --cxx=g++ 

#MAKEFLAGS=-j1 CC=icx CXX=icpx FC=ifx  python setup.py --fc=ifx

# MAKEFLAGS=-j1 CC=icx CXX=icpx FC=ifx  python setup.py --fc=ifx --cc=icx --cxx=icpx  --cflags='-O2 -std=c++11 -I/scratch/user/u.yg122746/yjb/dft/eDMFT/eDMFT-master/bin/gsl/include/'

# -L


export WIEN_DMFT_ROOT=$(pwd)/bin/


# ml GCCcore/12.3.0 Python/3.11.3 on aces

ml purge
ml GCC gompi Python
