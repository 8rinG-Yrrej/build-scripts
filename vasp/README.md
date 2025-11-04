# Build script and procedure for vasp-6.5.0 on mac apple sillicon with homebrew gcc, etc

Apply the patch applesilicon-homebrew-gcc.patch, using e.g. patch < applesilicon-homebrew-gcc.patch in vasp root directory.

Follow the instruction on [https://www.vasp.at/wiki/index.php/Personal_computer_installation#Building_VASP_6.5.1_on_Mac_OS_X_(Apple_Silicon_M1/2/3/4)](https://www.vasp.at/wiki/index.php/Personal_computer_installation#Building_VASP_6.5.1_on_Mac_OS_X_(Apple_Silicon_M1/2/3/4))

Changes:
1. openblas path should be something like `/opt/homebrew/Cellar/openblas/0.3.30`.
2. Using gcc-15 from homebrew instead of macOS gcc.
3. Don't have wannier90 since mpi or openmp seems not to compile compatibly on mac.

An example makefile.include following those steps is included.
