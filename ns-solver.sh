#!/bin/bash


# Path to runme.sh
pathrunme="/Applications/Gmsh.app/Contents/MacOS/gmsh"
# Path to dir where geo files will be stored
GEODIR="geo"
# Path to dir where msh files will be stored
MSHDIR="msh"

angle="$1"

cd /home/fenics/shared/murtazo/cloudnaca
./runme.sh ${angle} ${angle} 1 200 3

cd /home/fenics/shared/murtazo/cloudnaca/msh
ls
# rm -r *
cd /home/fenics/shared/murtazo/cloudnaca/geo
ls
# rm -r *

cd /home/fenics/shared/murtazo/cloudnaca/msh
dolfin-convert r2a${angle}n200.msh r2a${angle}n200.xml

cd /home/fenics/shared/murtazo/navier_stokes_solver
./airfoil  10 0.0001 10. 0.01 ../cloudnaca/msh/r2a${angle}n200.xml

cd /home/fenics/shared/murtazo/navier_stokes_solver/results
ls

tar czvf angle30.tar.gz *


