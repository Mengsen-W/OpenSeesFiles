# * @coding = utf-8
# * @Decription: Material
# * @Author: Mengsen.Wang
# * @Date: 2020-02-14 14:10:31
# * @Last Modified time: 2020-02-20 13:10:31

# C40 concrete
nDMaterial PlaneStressUserMaterial 1 40 7 30.8 3.08 -6.16 -0.002 -0.005 0.001 0.05
nDMaterial PlateFromPlaneStress 2 1 1.83E4

# middleSFCB
uniaxialMaterial Steel02 3 240 130662 0.4 15 0.925 0.15


# mainSFCB
uniaxialMaterial Steel02 4 365 129433 0.4 15 0.925 0.15


# FRP
uniaxialMaterial Steel02 5 953 52000 0.001 15 0.925 0.15

# FRP 箍筋层
nDMaterial PlateRebar 6 5 0

# 边缘约束区分层壳
#confined region
# material    absolute thickness   angle(steel)    material tag
##cover                 25                              2
##FRP               0.3856               0              6
##FRP               0.3343               0              6
##core              37.141                              2
##core              37.141                              2
##core              37.141                              2
##core              37.141                              2
##FRP               0.3343               0              6
##FRP               0.3856               0              6
##cover                 25                              2
section LayeredShell 1 10 2 25 6 0.3856 6 0.3343 2 37.141 2 37.141 2 37.141 2 37.141 6 0.3343 6 0.3856 2 25

# 中心区分层壳
#middle region
# material    absolute thickness   angle(steel)    material tag
##cover                 25                               2
##FRP                 0.39               0               6
##core              37.305                               2
##core              37.305                               2
##core              37.305                               2
##core              37.305                               2
##FRP                 0.39               0               6
##cover                 25                               2
section   LayeredShell 2 8 2 25 6 0.39 2 37.305 2 37.305 2 37.305 2 37.305 6 0.39 2 25
