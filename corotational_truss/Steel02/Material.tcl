# * @Author: Mengsen.Wang
#  * @Date: 2020-03-18 15:07:11
#  * @Last Modified by:   Mengsen.Wang
#  * @Last Modified time: 2020-03-18 15:07:11

#  * @Desciption: 测试Shell单元的滞回特性

nDMaterial PlaneStressUserMaterial 1 40 7 30.6 3.06 -6.16 -0.002 -0.005 0.001 0.1
nDMaterial PlateFromPlaneStress 2 1 1.23E4

# material    absolute thickness   angle(steel)    material tag
##cover                 25                              2
##core                  25                              2
##core                  25                              2
##cover                 25                              2
section LayeredShell 1 4 2 25 2 25 2 25 2 25

uniaxialMaterial Steel02 3 250 157035 0.23 15 0.925 0.15
