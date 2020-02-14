# * @coding = utf-8
# * @Decription: Material
# * @Author: Mengsen.Wang
# * @Date: 2020-02-14 14:10:31
# * @Last Modified time: 2020-02-14 14:10:31

# C40 concrete
nDMaterial PlaneStressUserMaterial 1 40 7 30.8E6 3.08E6 -6.16E6 -0.002 -0.005 0.001 0.05
nDMaterial PlateFromPlaneStress 2 1 1.83E10

# middleSFCB
uniaxialMaterial Hysteretic 3 245.6E6 0.1557E-2 641.2E6 1.345E-2 232.6E6 1.382E-2 -245.6E6 -0.1557E-2 -641.2E6 -1.345E-2 -232.6E6 -1.382E-2 0.8 0.2 0 0


# mainSFCB
uniaxialMaterial Hysteretic 4 365.5E6 0.2709E-2 578.6E6 1.164E-2 334.1E6 1.679E-2 -365.5E6 -0.2709E-2 -578.6E6 -1.164E-2 -334.1E6 -1.679E-2 0.8 0.2 0 0


# FRP
uniaxialMaterial Elastic 5 52000

# FRP 箍筋层
nDMaterial PlateRebar 6 5 0

# 边缘约束区分层壳
#confined region
# material    absolute thickness   angle(steel)    material tag
##cover                 25                              2
##FRP               0.3856               0              6
##FRP               0.3343               0              6
##core              37.140                              2
##core              37.140                              2
##core              37.140                              2
##core              37.140                              2
##FRP               0.3343               0              6
##FRP               0.3856               0              6
##cover                 25                              2
section LayeredShell 1 10 2 25 6 0.3856 6 0.3856 2 37.140 2 37.140 2 37.140 2 37.140 6 0.3343 6 0.3856 2 25

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
