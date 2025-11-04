#!/bin/sh

# Configuration for epw+qe on mac
# Enabled are MPI, openblas, fftw
# Need to switch all compiler toolchain to homebrew GNU
# Install to "PATH-EPW"/null

./configure LIBDIRS=/opt/homebrew/lib/

mkdir -p null
ed make.inc <<'!'
/^CPP.*/s,,CPP = cpp-15,
/^CC.*/s,,CC = gcc-15,
/^RANLIB.*/s,,RANLIB = gcc-ranlib-15,
/^LAPACK_LIBS.*/s,,LAPACK_LIBS = -L/opt/homebrew/Cellar/openblas/0.3.30/lib/ -lopenblas,
/^BLAS_LIBS.*/s,,BLAS_LIBS = -lopenblas,
/^FFT_LIBS.*/s,,FFT_LIBS = -L/opt/homebrew/lib/ -lfftw3 -I/opt/homebrew/include,
/^IFLAGS.*/s,$, -I/opt/homebrew/include,
/^PREFIX.*/s,,PREFIX = ./null/,
w
q
!
