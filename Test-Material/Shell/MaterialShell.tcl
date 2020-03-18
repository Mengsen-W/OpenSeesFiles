# * @Author: Mengsen.Wang
#  * @Date: 2020-03-18 15:07:11
#  * @Last Modified by:   Mengsen.Wang
#  * @Last Modified time: 2020-03-18 15:07:11

#  * @Desciption: 测试Shell单元的滞回特性

nDMaterial PlaneStressUserMaterial 1 40 7 30.6 3.06 -6.16 -0.002 -0.005 0.001 0.1
nDMaterial PlateFromPlaneStress 2 1 1.23E4

# material    absolute thickness   angle(steel)    material tag
##cover                 200                              2
# 分层必须大于2
section LayeredShell 1 20 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10 2 10
