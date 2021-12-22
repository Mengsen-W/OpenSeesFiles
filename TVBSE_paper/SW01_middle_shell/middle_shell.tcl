# Date: 2021-04-21
# Author: Mengsen Wang
# LastEditors: Mengsen Wang
# LastEditTime: 2021-04-29

# mm kN Mpa
reset
wipe
source lib.tcl
ModelInfo_Proc model_log_2.txt

model BasicBuilder -ndm 3 -ndf 6

# node
puts "nodes begin"
node 1 0 0 0
node 2 200 0 0
node 3 400 0 0
node 4 600 0 0
node 5 800 0 0
node 6 1000 0 0

node 7 0 0 200
node 8 200 0 200
node 9 400 0 200
node 10 600 0 200
node 11 800 0 200
node 12 1000 0 200

node 13 0 0 400
node 14 200 0 400
node 15 400 0 400
node 16 600 0 400
node 17 800 0 400
node 18 1000 0 400

node 19 0 0 600
node 20 200 0 600
node 21 400 0 600
node 22 600 0 600
node 23 800 0 600
node 24 1000 0 600

node 25 0 0 800
node 26 200 0 800
node 27 400 0 800
node 28 600 0 800
node 29 800 0 800
node 30 1000 0 800

node 31 0 0 1000
node 32 200 0 1000
node 33 400 0 1000
node 34 600 0 1000
node 35 800 0 1000
node 36 1000 0 1000

node 37 0 0 1200
node 38 200 0 1200
node 39 400 0 1200
node 40 600 0 1200
node 41 800 0 1200
node 42 1000 0 1200

node 43 0 0 1400
node 44 200 0 1400
node 45 400 0 1400
node 46 600 0 1400
node 47 800 0 1400
node 48 1000 0 1400

node 49 0 0 1600
node 50 200 0 1600
node 51 400 0 1600
node 52 600 0 1600
node 53 800 0 1600
node 54 1000 0 1600

node 55 0 0 1800
node 56 200 0 1800
node 57 400 0 1800
node 58 600 0 1800
node 59 800 0 1800
node 60 1000 0 1800

node 61 0 0 2000
node 62 200 0 2000
node 63 400 0 2000
node 64 600 0 2000
node 65 800 0 2000
node 66 1000 0 2000

fix 1 1 1 1 1 1 1
fix 2 1 1 1 1 1 1
fix 3 1 1 1 1 1 1
fix 4 1 1 1 1 1 1
fix 5 1 1 1 1 1 1
fix 6 1 1 1 1 1 1
puts "nodes finished"

# define material
# 混凝土
puts "material begin"
nDMaterial PlaneStressUserMaterial 1 40 7 \
31.7 3.17 -6.34 -0.00234 -0.03 0.001 0.05
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
uniaxialMaterial Steel02 3 156.9375 7937500 1E-15
#0.73 0.75 1/100
# 端部纵筋
uniaxialMaterial Steel02 4 348.7 170.931e6 0.2210
# 中部纵筋和箍筋
# uniaxialMaterial Steel02 5 257.5 131.378e6 0.320
uniaxialMaterial Steel02 5 257.5 131.378e6 0.320

# 中部箍筋层
nDMaterial PlateRebar 6 5 0
# 中部纵筋层
nDMaterial PlateRebar 7 5 90
# 端部纵筋层
# nDMaterial PlateRebar 8 4 90
puts "material finished"

# define sectional
puts "section begin"

# 中部壳
section LayeredShell 1 12 \
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

puts "section end"

# define element
puts "element begin"
# 中部壳
element ShellNLDKGQ 1 1 2 8 7 1
element ShellNLDKGQ 2 7 8 14 13 1
element ShellNLDKGQ 3 13 14 20 19 1
element ShellNLDKGQ 4 19 20 26 25 1
element ShellNLDKGQ 5 25 26 32 31 1
element ShellNLDKGQ 6 31 32 38 37 1
element ShellNLDKGQ 7 37 38 44 43 1
element ShellNLDKGQ 8 43 44 50 49 1
element ShellNLDKGQ 9 49 50 56 55 1
element ShellNLDKGQ 10 55 56 62 61 1

element ShellNLDKGQ 11 2 3 9 8 1
element ShellNLDKGQ 12 8 9 15 14 1
element ShellNLDKGQ 13 14 15 21 20 1
element ShellNLDKGQ 14 20 21 27 26 1
element ShellNLDKGQ 15 25 26 33 32 1
element ShellNLDKGQ 16 32 33 39 38 1
element ShellNLDKGQ 17 38 39 45 44 1
element ShellNLDKGQ 18 44 45 51 50 1
element ShellNLDKGQ 19 50 51 57 56 1
element ShellNLDKGQ 20 56 57 63 62 1

element ShellNLDKGQ 21 3 4 10 9 1
element ShellNLDKGQ 22 9 10 16 15 1
element ShellNLDKGQ 23 15 16 22 21 1
element ShellNLDKGQ 24 21 22 28 27 1
element ShellNLDKGQ 25 27 28 34 33 1
element ShellNLDKGQ 26 33 34 40 39 1
element ShellNLDKGQ 27 39 40 46 45 1
element ShellNLDKGQ 28 45 46 52 51 1
element ShellNLDKGQ 29 51 52 58 57 1
element ShellNLDKGQ 30 57 58 64 63 1

element ShellNLDKGQ 31 4 5 11 10 1
element ShellNLDKGQ 32 10 11 17 16 1
element ShellNLDKGQ 33 16 17 23 22 1
element ShellNLDKGQ 34 22 23 29 28 1
element ShellNLDKGQ 35 28 29 35 34 1
element ShellNLDKGQ 36 34 35 41 40 1
element ShellNLDKGQ 37 40 41 47 46 1
element ShellNLDKGQ 38 46 47 53 52 1
element ShellNLDKGQ 39 52 53 59 58 1
element ShellNLDKGQ 40 58 59 65 64 1

element ShellNLDKGQ 41 5 6 12 11 1
element ShellNLDKGQ 42 11 12 18 17 1
element ShellNLDKGQ 43 17 18 24 23 1
element ShellNLDKGQ 44 23 24 30 29 1
element ShellNLDKGQ 45 29 30 36 35 1
element ShellNLDKGQ 46 35 36 42 41 1
element ShellNLDKGQ 47 41 42 48 47 1
element ShellNLDKGQ 48 47 48 54 53 1
element ShellNLDKGQ 49 53 54 60 59 1
element ShellNLDKGQ 50 59 60 66 65 1
puts "element end"

# define gravity
puts "gravity begin"
pattern Plain 1 Linear {
  load 61 0 0 -125854 0 0 0
  load 62 0 0 -125854 0 0 0
  load 63 0 0 -125854 0 0 0
  load 64 0 0 -125854 0 0 0
  load 65 0 0 -125854 0 0 0
  load 66 0 0 -125854 0 0 0
}
Gravity_Proc 100
puts "gravity end"

# define cyclic
puts "cyclic begin"
recorder Node -file out.txt -time -closeOnWrite -node 61 -dof 1 disp
pattern Plain 2 Linear {
  load 61 1E3 0 0 0 0 0
}
Cyclic_Function 4 20 0.1 61 1 1e-5 10000
puts "cyclic end"

# ModelInfo_Proc model_info.txt
wipe
reset