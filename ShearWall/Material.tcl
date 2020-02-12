# * @Coding: utf-8
# * @Descripition: Material of model
# * @Author: Mengsen.Wang
# * @Date: 2020-02-12 18:31:28
# * @Last Modified time: 2020-02-12 18:31:28

#6号钢筋本构
puts "No.6 steelbar constitutive relation"
uniaxialMaterial Steel02 1 263 1.88E+5 0.001 20 0.925 0.0015

#8号钢筋本构
puts "No.8 steelbar constitutive relation"
uniaxialMaterial Steel02 2 305 1.94E+5 0.001 20 0.925 0.0015

# 8 号钢筋网层本构
puts "No.8 plateRebar constitutive relation"
nDMaterial PlateRebar 9 2 90
nDMaterial PlateRebar 10 2 0

#剪力墙混凝土本构
#uniaxialMaterial Concrete02 3 -19.35 -0.0027 -3.87 -0.0297 0.1 2.37 1000
#uniaxialMaterial Concrete02 4 -14.58 -0.002 -3.16 -0.0515 0.1 2.37 1000

# 混凝土层本构
#nDMaterial PlaneStressUserMaterial 3 40 7 19.35 2.37 -3.87 -0.0027 -0.03 0.00025 0.05
puts "concrete constitutive relation"
nDMaterial PlaneStressUserMaterial 3 40 7 14.58 2.37 -3.16 -0.002 -0.0515 0.00025 0.05
nDMaterial PlateFromPlaneStress 6 3 1.2E4

nDMaterial PlaneStressUserMaterial 4 40 7 14.58 2.37 -3.16 -0.002 -0.0515 0.00025 0.05
nDMaterial PlateFromPlaneStress 7 4 1.2E4

set rouX 0.0098
set rouB 0.006
set sro1 0.014
set sro2 0.006

#Beam Shear Stiffness
uniaxialMaterial Elastic 101 32E6
#Wall Shear Stiffness
uniaxialMaterial Elastic 102 1.44E8

set VLayerT [expr $sro1 * 80 / 2]
set HLayerT [expr $rouX * 80 / 2]
set BLayerT [expr $rouB * 80 / 2]
set ConLayer [expr 16]

# Define the Section of the Multi-layer Shell element
#section LayeredShell 2 9 6 $ConLayer 10 $HLayerT 9 $VLayerT 6 $ConLayer 6 $ConLayer 6 $ConLayer 9 $VLayerT 10 $HLayerT 6 $ConLayer
puts "Define the Section of the Multi-layer Shell element"
section LayeredShell 2 7 6 $ConLayer 10 $HLayerT 6 $ConLayer 6 $ConLayer 6 $ConLayer 10 $HLayerT 6 $ConLayer
section LayeredShell 3 7 7 $ConLayer 9 $BLayerT 7 $ConLayer 7 $ConLayer 7 $ConLayer 9 $BLayerT 7 $ConLayer
#section LayeredShell 3 5 7 $ConLayer 7 $ConLayer 7 $ConLayer 7 $ConLayer 7 $ConLayer
