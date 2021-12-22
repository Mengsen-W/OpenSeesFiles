# Date: 2021-09-10 11:27:27
# Author: Mengsen Wang

reset
wipe
source lib.tcl
source smlib.tcl

ModelInfo_Proc output/model_log.txt

model BasicBuilder -ndm 3 -ndf 6
node 1 0 0 0
node 2 0 0 2000
# node 3 0 0 1
# node 4 0 0 2
fix 1 1 1 1 1 1 1

# define material
# 混凝土
puts "material begin"
nDMaterial PlaneStressUserMaterial 1 40 7 \
31.7 3.17 -6.34 -0.003 -0.005 0.001 0.035
# 前3个最好不动
# 变小会使屈服段不明显，变大会使屈服段明显
# 调整没有影响
# 增大会增大前期刚度
# 能显著增加强度
nDMaterial PlateFromPlaneStress 2 1 1.23e9
# 调整可以增加强度

# b越小越饱满
# R0 小会向远点靠近
# cR1 小会没有非线性段，变为全直线

# 端部拉锁
uniaxialMaterial Steel02 3 1255.5 64.9e3 1e-20

# 端部纵筋
uniaxialMaterial Steel02 4 244.1 119.65e3 0.1105
# uniaxialMaterial Steel02 4 348.7 170.931e2 0.2210

# 中部纵筋和箍筋
uniaxialMaterial Steel02 5 180.25 91.97e3 0.16
# uniaxialMaterial Steel02 5 257.5 131.378e5 0.320

uniaxialMaterial Concrete02 6 -31.7 -0.003 -6.34 -0.005 1e-16 3.17 400

# 中部箍筋层
nDMaterial PlateRebar 6 5 0
# 中部纵筋层
nDMaterial PlateRebar 7 5 90
# 端部纵筋层
# nDMaterial PlateRebar 8 4 90
puts "material finished"

section Fiber 1 -GJ 1e15 {
  fiber 96 28 200.96 4
  fiber -96 28 200.96 4
  fiber 96 118 200.96 4
  fiber -96 118 200.96 4
  fiber 96 196 200.96 4
  fiber -96 196 200.96 4
  fiber 74 28 314 3
  fiber -74 28 314 3
  fiber 100 10 2000 6
  fiber -100 10 2000 6
}

geomTransf Linear 1 0 -1 0
geomTransf Linear 2 0 1 0

# 中部壳
section LayeredShell 2 12 \
2 20 \
6 0.65345127 \
7 0.6544985 \
2 26.2274 \
2 26.2274 \
2 26.2274 \
2 26.2274 \
2 26.2274 \
2 26.2274 \
7 0.6544985 \
6 0.65345127 \
2 20

element TVBSE 1 1 2 -hight 2000 -width 600 2 -thick 200 -vertical_number 5 -left_beam 1 2 -right_beam 1 1 -middle_shell 2 2 -use_ridge 0
# element ShellMITC4 1 1 2 3 4 2

puts "gravity begin"
pattern Plain 1 Linear {
  load 2 0 0 -755720 0 0 0
}
Gravity_Proc 100
puts "gravity end"

puts "cyclic begin"
recorder Node -file output/out.txt -time -node 2 -dof 2 disp
pattern Plain 2 Linear {
  load 2 0 1e3 0 0 0 0
}

constraints Plain
numberer RCM
system BandGeneral
set protocol [Build_Protocol 1 80 1]
# puts "protocol = $protocol"

# node dof step
SmartAnalyzeStatic 2 2 1 $protocol
# Cyclic_Function 2 40 1 2 2 1e-5 100000

ModelInfo_Proc output/model_info.txt

# cd C:\\Users\\mengsen\\Project\\mengsen_code\\OPS_Paper\\TVBSE\\main.tcl