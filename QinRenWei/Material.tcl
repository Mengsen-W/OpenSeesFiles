# * @coding = utf-8
# * @Decription: Material
# * @Author: Mengsen.Wang
# * @Date: 2020-02-14 14:10:31
# * @Last Modified time: 2020-03-05 8:10:31

# C40 concrete
nDMaterial PlaneStressUserMaterial 1 40 7 31.8 3.18 -6.36 -0.002 -0.005 0.001 0.05
nDMaterial PlateFromPlaneStress 2 1 1.23E4


# middle SFCB
uniaxialMaterial Steel02 3 276 130662 0.4 10 0.925 0.15 0 1 0 1 20

# mainSFCB
uniaxialMaterial Steel02 4 419.75 129433 0.4 10 0.925 0.15 0 1 0 1 20

# GFRP
uniaxialMaterial Steel02 5 1104 52000 0.4 10 0.925 0.15 0 1 0 1 20

# GFRP 箍筋层
nDMaterial PlateRebar 6 5 0

# GRFP拉索
uniaxialMaterial Steel02 7 1454.75 64900 0.2 10 0.925 0.15 0 1 0 1 20

nDMaterial PlateRebar 8 3 90

# 边缘约束区分层壳
#confined region
# material    absolute thickness   angle(steel)    material tag
##cover                 20                              2
##hooping          0.65312               0              6
##core              39.673                              2
##core              39.673                              2
##core              39.673                              2
##core              39.673                              2
##hooping          0.65312               0              6
##cover                 20                              2
section LayeredShell 1 8 2 25 6 0.65312 2 39.673 2 39.673 2 39.673 2 39.673 6 0.65312 2 20

# 中心区分层壳
#middle region
# material    absolute thickness   angle(steel)    material tag 2089984
##cover                 20                               2
##hooping          0.65312               0               6
##hooping           0.3768              90               8
##core              39.485                               2
##core              39.485                               2
##core              39.485                               2
##core              39.485                               2
##hooping           0.3768              90               8
##hooping          0.65312               0               6
##cover                 20                               2
section   LayeredShell 2 10 2 20 6 0.65312 8 0.3768 2 39.485 2 39.485 2 39.485 2 39.485 8 0.3768 6 0.65312 2 20
