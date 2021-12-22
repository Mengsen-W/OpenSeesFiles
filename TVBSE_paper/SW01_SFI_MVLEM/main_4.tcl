# @Date: 2021-04-24 15:46:23
# @Author: Mengsen Wang

# mm kN Mpa
reset
wipe
source lib.tcl
# ModelInfo_Proc output/model_log_4.txt

model BasicBuilder -ndm 2 -ndf 3

for { set i 1 } { $i < 12 } { incr i } {
  node $i 0 [expr 200 * [expr $i - 1]]
}

fix 1 1 1 1

# 混凝土
uniaxialMaterial ConcreteCM 1 \
-31.7 -0.00234 3.25e4 10 1.03 \
3.17 0.001 1.2 10000

# GFRP 拉筋
uniaxialMaterial Steel02 2 \
1255.5 64.9e3 1e-20

# SFCB 纵筋
uniaxialMaterial Steel02 3 \
348.7 170.931e3 0.2210

# 箍筋和中部纵筋
uniaxialMaterial Steel02 4 \
257.5 131.378e3 0.320

# 约束区
nDMaterial FSAM 5 2360e-3 \
4 3 1 0.02179 0.047124 \
0.1 0.01

# 中部区
nDMaterial FSAM 6 2360e-3 \
4 4 1 0.008277 0.006544 \
0.1 0.01

for { set i 1 } { $i < 11 } { incr i } {
  element SFI_MVLEM $i $i [expr $i + 1] 5 0.4 \
  -thick 200 200 200 200 200 \
  -width 200 200 200 200 200 \
  -mat 5 6 6 6 5
}

# 竖向荷载
# recorder Node -file output/gravity_4.txt -time -node 11 -dof 2 disp
pattern Plain 1 Linear {
  load 11 0 -755720 0
}
Gravity_Proc 100


puts "cyclic begin"
recorder Node -file output/out_4.txt -time -closeOnWrite -node 11 -dof 1 disp
pattern Plain 2 Linear {
  load 11 1E3 0 0
}
Cyclic_Function 4 80 1 11 1 1e-5 10000
puts "cyclic end"
# ModelInfo_Proc model_info.txt
wipe
reset