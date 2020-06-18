nDMaterial PlaneStressUserMaterial   2       40         7       30.6549  3.06549  -6.13 -0.002 -0.05 0.001 0.05
nDMaterial   PlateFromPlaneStress    4                  2                12.77e9
uniaxialMaterial Steel02 5 582 205000 0.0033 14 0.925 0.15
uniaxialMaterial Steel02 6 441 205000 0.00127 14 0.925 0.15


nDMaterial   PlateRebar       7                    5    90
nDMaterial   PlateRebar       8                    6    0


section   LayeredShell 701 6 8 0.8 7 0.80 4 100 4 100 7 0.80   8 0.8