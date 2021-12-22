# Date: 2021-04-21 12:26:25
# Author: Mengsen Wang
# LastEditors: Mengsen Wang
# LastEditTime: 2021-04-22 17:40:15

# mm kN Mpa
reset
wipe
source lib.tcl
ModelInfo_Proc model_log_1.txt

model BasicBuilder -ndm 3 -ndf 6

# node
puts "nodes begin"
node 1 0 0 0
node 2 100 0 0
node 3 200 0 0
node 4 400 0 0
node 5 600 0 0
node 6 800 0 0
node 7 900 0 0
node 8 1000 0 0

node 9 0 0 200
node 10 100 0 200
node 11 200 0 200
node 12 400 0 200
node 13 600 0 200
node 14 800 0 200
node 15 900 0 200
node 16 1000 0 200

node 17 0 0 400
node 18 100 0 400
node 19 200 0 400
node 20 400 0 400
node 21 600 0 400
node 22 800 0 400
node 23 900 0 400
node 24 1000 0 400

node 25 0 0 600
node 26 100 0 600
node 27 200 0 600
node 28 400 0 600
node 29 600 0 600
node 30 800 0 600
node 31 900 0 600
node 32 1000 0 600

node 33 0 0 800
node 34 100 0 800
node 35 200 0 800
node 36 400 0 800
node 37 600 0 800
node 38 800 0 800
node 39 900 0 800
node 40 1000 0 800

node 41 0 0 1000
node 42 100 0 1000
node 43 200 0 1000
node 44 400 0 1000
node 45 600 0 1000
node 46 800 0 1000
node 47 900 0 1000
node 48 1000 0 1000

node 49 0 0 1200
node 50 100 0 1200
node 51 200 0 1200
node 52 400 0 1200
node 53 600 0 1200
node 54 800 0 1200
node 55 900 0 1200
node 56 1000 0 1200

node 57 0 0 1400
node 58 100 0 1400
node 59 200 0 1400
node 60 400 0 1400
node 61 600 0 1400
node 62 800 0 1400
node 63 900 0 1400
node 64 1000 0 1400

node 65 0 0 1600
node 66 100 0 1600
node 67 200 0 1600
node 68 400 0 1600
node 69 600 0 1600
node 70 800 0 1600
node 71 900 0 1600
node 72 1000 0 1600

node 73 0 0 1800
node 74 100 0 1800
node 75 200 0 1800
node 76 400 0 1800
node 77 600 0 1800
node 78 800 0 1800
node 79 900 0 1800
node 80 1000 0 1800

node 81 0 0 2000
node 82 100 0 2000
node 83 200 0 2000
node 84 400 0 2000
node 85 600 0 2000
node 86 800 0 2000
node 87 900 0 2000
node 88 1000 0 2000

fix 1 1 1 1 1 1 1
fix 2 1 1 1 1 1 1
fix 3 1 1 1 1 1 1
fix 4 1 1 1 1 1 1
fix 5 1 1 1 1 1 1
fix 6 1 1 1 1 1 1
fix 7 1 1 1 1 1 1
fix 8 1 1 1 1 1 1
puts "nodes finished"

# define material
# 混凝土
puts "material begin"
nDMaterial PlaneStressUserMaterial 1 40 7 \
31.7 3.17 -6.34 -0.00234 -0.03 0.001 0.035
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
uniaxialMaterial Steel02 3 156.9375 7937500 1E-15 20 0.925 0.15
# 端部纵筋
# uniaxialMaterial Steel02 4 348.7 170.931e6 0.2210
uniaxialMaterial Steel02 4 43.5875 21366375 0.0027625 20 0.925 0.15
# 中部纵筋和箍筋
# uniaxialMaterial Steel02 5 257.5 131.378e6 0.320
uniaxialMaterial Steel02 5 32.1875 16422250 0.004 20 0.925 0.15

# 箍筋层
nDMaterial PlateRebar 6 5 0
# 纵筋层
nDMaterial PlateRebar 7 5 90
puts "material finished"

# define sectional
puts "section begin"
# 加强区壳
section LayeredShell 1 10 \
2 20 \
6 1.28177 \
2 26.2394 \
2 26.2394 \
2 26.2394 \
2 26.2394 \
2 26.2394 \
2 26.2394 \
6 1.28177 \
2 20

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

# 端部拉锁
section Fiber 3 -GJ 1 {
  fiber 0 0 628.31853 3
}

# 端部纵筋
section Fiber 4 -GJ 1 {
  fiber 0 0 628.31853 4
}
geomTransf Linear 1 0 1 0
puts "section end"

# define element
puts "element begin"
# 加强区壳
element ShellNLDKGQ 1 1 2 10 9 1
element ShellNLDKGQ 2 9 10 18 17 1
element ShellNLDKGQ 3 17 18 26 25 1
element ShellNLDKGQ 4 25 26 34 33 1
element ShellNLDKGQ 5 33 34 42 41 1
element ShellNLDKGQ 6 41 42 50 49 1
element ShellNLDKGQ 7 49 50 58 57 1
element ShellNLDKGQ 8 57 58 66 65 1
element ShellNLDKGQ 9 65 66 74 73 1
element ShellNLDKGQ 10 73 74 82 81 1

element ShellNLDKGQ 11 2 3 11 10 1
element ShellNLDKGQ 12 10 11 19 18 1
element ShellNLDKGQ 13 18 19 27 26 1
element ShellNLDKGQ 14 26 27 35 34 1
element ShellNLDKGQ 15 34 35 43 42 1
element ShellNLDKGQ 16 42 43 51 50 1
element ShellNLDKGQ 17 50 51 59 58 1
element ShellNLDKGQ 18 58 59 67 66 1
element ShellNLDKGQ 19 66 67 75 74 1
element ShellNLDKGQ 20 74 75 83 82 1

element ShellNLDKGQ 21 6 7 15 14 1
element ShellNLDKGQ 22 14 15 23 22 1
element ShellNLDKGQ 23 22 23 31 30 1
element ShellNLDKGQ 24 30 31 39 38 1
element ShellNLDKGQ 25 38 39 47 46 1
element ShellNLDKGQ 26 46 47 55 54 1
element ShellNLDKGQ 27 54 55 63 62 1
element ShellNLDKGQ 28 62 63 71 70 1
element ShellNLDKGQ 29 70 71 79 78 1
element ShellNLDKGQ 30 78 79 87 86 1

element ShellNLDKGQ 31 7 8 16 15 1
element ShellNLDKGQ 32 15 16 24 23 1
element ShellNLDKGQ 33 23 24 32 31 1
element ShellNLDKGQ 34 31 32 40 39 1
element ShellNLDKGQ 35 39 40 48 47 1
element ShellNLDKGQ 36 47 48 56 55 1
element ShellNLDKGQ 37 55 56 64 63 1
element ShellNLDKGQ 38 63 64 72 71 1
element ShellNLDKGQ 39 71 72 80 79 1
element ShellNLDKGQ 40 79 80 88 87 1

# 中部壳
element ShellNLDKGQ 41 3 4 12 11 2
element ShellNLDKGQ 42 11 12 20 19 2
element ShellNLDKGQ 43 19 20 28 27 2
element ShellNLDKGQ 44 27 28 36 35 2
element ShellNLDKGQ 45 35 36 44 43 2
element ShellNLDKGQ 46 43 44 52 51 2
element ShellNLDKGQ 47 51 52 60 59 2
element ShellNLDKGQ 48 59 60 68 67 2
element ShellNLDKGQ 49 67 68 76 75 2
element ShellNLDKGQ 50 75 76 84 83 2

element ShellNLDKGQ 51 4 5 13 12 2
element ShellNLDKGQ 52 12 13 21 20 2
element ShellNLDKGQ 53 20 21 29 28 2
element ShellNLDKGQ 54 28 29 37 36 2
element ShellNLDKGQ 55 36 37 45 44 2
element ShellNLDKGQ 56 44 45 53 52 2
element ShellNLDKGQ 57 52 53 61 60 2
element ShellNLDKGQ 58 60 61 69 68 2
element ShellNLDKGQ 59 68 69 77 76 2
element ShellNLDKGQ 60 76 77 85 84 2

element ShellNLDKGQ 61 5 6 14 13 2
element ShellNLDKGQ 62 13 14 22 21 2
element ShellNLDKGQ 63 21 22 30 29 2
element ShellNLDKGQ 64 29 30 38 37 2
element ShellNLDKGQ 65 37 38 46 45 2
element ShellNLDKGQ 66 45 46 54 53 2
element ShellNLDKGQ 67 53 54 62 61 2
element ShellNLDKGQ 68 61 62 70 69 2
element ShellNLDKGQ 69 69 70 78 77 2
element ShellNLDKGQ 70 77 78 86 85 2

# 杆单元
element dispBeamColumn 71 1 9 9 3 1
element dispBeamColumn 72 9 17 9 3 1
element dispBeamColumn 73 17 25 9 3 1
element dispBeamColumn 74 25 33 9 3 1
element dispBeamColumn 75 33 41 9 3 1
element dispBeamColumn 76 41 49 9 3 1
element dispBeamColumn 77 49 57 9 3 1
element dispBeamColumn 78 57 65 9 3 1
element dispBeamColumn 79 65 73 9 3 1
element dispBeamColumn 80 73 81 9 3 1

element dispBeamColumn 81 2 10 5 4 1
element dispBeamColumn 82 10 18 5 4 1
element dispBeamColumn 83 18 26 5 4 1
element dispBeamColumn 84 26 34 5 4 1
element dispBeamColumn 85 34 42 5 4 1
element dispBeamColumn 86 42 50 5 4 1
element dispBeamColumn 87 50 58 5 4 1
element dispBeamColumn 88 58 66 5 4 1
element dispBeamColumn 89 66 74 5 4 1
element dispBeamColumn 90 74 82 5 4 1

# element truss 81 2 10 4
# element truss 82 10 18 4
# element truss 83 18 26 4
# element truss 84 26 34 4
# element truss 85 34 42 4
# element truss 86 42 50 4
# element truss 87 50 58 4
# element truss 88 58 66 4
# element truss 89 66 74 4
# element truss 90 74 82 4

element dispBeamColumn 91 3 11 9 4 1
element dispBeamColumn 92 11 19 9 4 1
element dispBeamColumn 93 19 27 9 4 1
element dispBeamColumn 94 27 35 9 4 1
element dispBeamColumn 95 35 43 9 4 1
element dispBeamColumn 96 43 51 9 4 1
element dispBeamColumn 97 51 59 9 4 1
element dispBeamColumn 98 59 67 9 4 1
element dispBeamColumn 99 67 75 9 4 1
element dispBeamColumn 100 75 83 9 4 1

element dispBeamColumn 101 6 14 9 4 1
element dispBeamColumn 102 14 22 9 4 1
element dispBeamColumn 103 22 30 9 4 1
element dispBeamColumn 104 30 38 9 4 1
element dispBeamColumn 105 38 46 9 4 1
element dispBeamColumn 106 46 54 9 4 1
element dispBeamColumn 107 54 62 9 4 1
element dispBeamColumn 108 62 70 9 4 1
element dispBeamColumn 109 70 78 9 4 1
element dispBeamColumn 110 78 86 9 4 1

element dispBeamColumn 111 7 15 5 4 1
element dispBeamColumn 112 15 23 5 4 1
element dispBeamColumn 113 23 31 5 4 1
element dispBeamColumn 114 31 39 5 4 1
element dispBeamColumn 115 39 47 5 4 1
element dispBeamColumn 116 47 55 5 4 1
element dispBeamColumn 117 55 63 5 4 1
element dispBeamColumn 118 63 71 5 4 1
element dispBeamColumn 119 71 79 5 4 1
element dispBeamColumn 120 79 87 5 4 1

# element truss 111 7 15 4
# element truss 112 15 23 4
# element truss 113 23 31 4
# element truss 114 31 39 4
# element truss 115 39 47 4
# element truss 116 47 55 4
# element truss 117 55 63 4
# element truss 118 63 71 4
# element truss 119 71 79 4
# element truss 120 79 87 4

element dispBeamColumn 121 8 16 9 3 1
element dispBeamColumn 122 16 24 9 3 1
element dispBeamColumn 123 24 32 9 3 1
element dispBeamColumn 124 32 40 9 3 1
element dispBeamColumn 125 40 48 9 3 1
element dispBeamColumn 126 48 56 9 3 1
element dispBeamColumn 127 56 64 9 3 1
element dispBeamColumn 128 64 72 9 3 1
element dispBeamColumn 129 72 80 9 3 1
element dispBeamColumn 130 80 88 9 3 1
puts "element end"

# define gravity
puts "gravity begin"
pattern Plain 1 Linear {
  load 81 0 0 -94465 0 0 0
  load 82 0 0 -94465 0 0 0
  load 83 0 0 -94465 0 0 0
  load 84 0 0 -94465 0 0 0
  load 85 0 0 -94465 0 0 0
  load 86 0 0 -94465 0 0 0
  load 87 0 0 -94465 0 0 0
  load 88 0 0 -94465 0 0 0
}
Gravity_Proc 100
puts "gravity end"

# define cyclic
puts "cyclic begin"
recorder Node -file out_1.txt -time -closeOnWrite -node 81 -dof 1 disp
pattern Plain 2 Linear {
  load 81 1E3 0 0 0 0 0
}
Cyclic_Function 1 80 0.5 81 1 1e-4 1000
puts "cyclic end"

# ModelInfo_Proc model_info.txt
wipe
reset