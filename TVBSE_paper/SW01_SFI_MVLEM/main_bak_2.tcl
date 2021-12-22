# @Date: 2021-04-24 15:46:23
# @Author: Mengsen Wang

# mm kN Mpa
reset
wipe
source lib.tcl
# ModelInfo_Proc output/model_log_1.txt

model BasicBuilder -ndm 2 -ndf 3

for { set i 1 } { $i < 12 } { incr i } {
  node $i 0 [expr 200 * [expr $i - 1]]
}

fix 1 1 1 1

# 混凝土
uniaxialMaterial ConcreteCM 1 \
-22.19 -0.0237 22000 17 0.1645 \
2.22 0.001 1.2 12000
# -31.7 -0.00234 3.25e4 17 0.995 \
3.17 0.001 1.2 10000

# GFRP 拉筋
uniaxialMaterial Steel02 2 \
1255.5 64.9e3 1e-20

# SFCB 纵筋
uniaxialMaterial Steel02 3 \
244.1 119.65e3 0.1105
# 348.7 170.931e3 0.2210

# 箍筋和中部纵筋
uniaxialMaterial Steel02 4 \
180.25 91.97e3 0.16
# 257.5 131.378e3 0.320

# 约束区
nDMaterial FSAM 5 2360e-3 \
4 3 1 0.02179 0.047124 \
0.01 0.001

# 中部区
nDMaterial FSAM 6 2360e-3 \
4 4 1 0.008277 0.006544 \
0.01 0.001

for { set i 1 } { $i < 11 } { incr i } {
  element SFI_MVLEM $i $i [expr $i + 1] 5 0.4 \
  -thick 200 200 200 200 200 \
  -width 200 200 200 200 200 \
  -mat 5 6 6 6 5
}

# 竖向荷载
# recorder Node -file output/gravity_1.txt -time -node 11 -dof 2 disp
pattern Plain 1 Linear {
  load 11 0 -755720 0
}
Gravity_Proc 100


puts "cyclic begin"
recorder Node -file output/out.txt -time  -node 11 -dof 1 disp

recorder Element -file output/gfl.txt -time -eleRange 1 10 globalForce
recorder Element -file output/sdf.txt -time -eleRange 1 10 ShearDef
recorder Element -file output/cur.txt -time -eleRange 1 10 Curvature

recorder Element -file output/pan_strain_1.txt -time -eleRange 1 10 RCPanel 1 panel_strain
recorder Element -file output/pan_stress_1.txt -time -eleRange 1 10 RCPanel 1 panel_stress
recorder Element -file output/pan_strain_2.txt -time -eleRange 1 10 RCPanel 2 panel_strain
recorder Element -file output/pan_stress_2.txt -time -eleRange 1 10 RCPanel 2 panel_stress
recorder Element -file output/pan_strain_3.txt -time -eleRange 1 10 RCPanel 3 panel_strain
recorder Element -file output/pan_stress_3.txt -time -eleRange 1 10 RCPanel 3 panel_stress
recorder Element -file output/pan_strain_4.txt -time -eleRange 1 10 RCPanel 4 panel_strain
recorder Element -file output/pan_stress_4.txt -time -eleRange 1 10 RCPanel 4 panel_stress
recorder Element -file output/pan_strain_5.txt -time -eleRange 1 10 RCPanel 5 panel_strain
recorder Element -file output/pan_stress_5.txt -time -eleRange 1 10 RCPanel 5 panel_stress


recorder Element -file output/pan_str_con_1.txt -time -eleRange 1 10 RCPanel 1 panel_stress_concrete
recorder Element -file output/pan_str_con_2.txt -time -eleRange 1 10 RCPanel 2 panel_stress_concrete
recorder Element -file output/pan_str_con_3.txt -time -eleRange 1 10 RCPanel 3 panel_stress_concrete
recorder Element -file output/pan_str_con_4.txt -time -eleRange 1 10 RCPanel 4 panel_stress_concrete
recorder Element -file output/pan_str_con_5.txt -time -eleRange 1 10 RCPanel 5 panel_stress_concrete

recorder Element -file output/pan_str_steel_1.txt -time -eleRange 1 10 RCPanel 1 panel_stress_steel
recorder Element -file output/pan_str_steel_2.txt -time -eleRange 1 10 RCPanel 2 panel_stress_steel
recorder Element -file output/pan_str_steel_3.txt -time -eleRange 1 10 RCPanel 3 panel_stress_steel
recorder Element -file output/pan_str_steel_4.txt -time -eleRange 1 10 RCPanel 4 panel_stress_steel
recorder Element -file output/pan_str_steel_5.txt -time -eleRange 1 10 RCPanel 5 panel_stress_steel


recorder Element -file output/pan_strain_x_1.txt -time -eleRange 1 10 RCPanel 1 strain_stress_steelX
recorder Element -file output/pan_stress_y_1.txt -time -eleRange 1 10 RCPanel 1 strain_stress_steelY
recorder Element -file output/pan_strain_x_2.txt -time -eleRange 1 10 RCPanel 2 strain_stress_steelX
recorder Element -file output/pan_stress_y_2.txt -time -eleRange 1 10 RCPanel 2 strain_stress_steelY
recorder Element -file output/pan_strain_x_3.txt -time -eleRange 1 10 RCPanel 3 strain_stress_steelX
recorder Element -file output/pan_stress_y_3.txt -time -eleRange 1 10 RCPanel 3 strain_stress_steelY
recorder Element -file output/pan_strain_x_4.txt -time -eleRange 1 10 RCPanel 4 strain_stress_steelX
recorder Element -file output/pan_stress_y_4.txt -time -eleRange 1 10 RCPanel 4 strain_stress_steelY
recorder Element -file output/pan_strain_x_5.txt -time -eleRange 1 10 RCPanel 5 strain_stress_steelX
recorder Element -file output/pan_stress_y_5.txt -time -eleRange 1 10 RCPanel 5 strain_stress_steelY

recorder Element -file output/pan_con_x_1.txt -time -eleRange 1 10 RCPanel 1 strain_stress_concrete1
recorder Element -file output/pan_con_y_1.txt -time -eleRange 1 10 RCPanel 1 strain_stress_concrete2
recorder Element -file output/pan_con_x_2.txt -time -eleRange 1 10 RCPanel 2 strain_stress_concrete1
recorder Element -file output/pan_con_y_2.txt -time -eleRange 1 10 RCPanel 2 strain_stress_concrete2
recorder Element -file output/pan_con_x_3.txt -time -eleRange 1 10 RCPanel 3 strain_stress_concrete1
recorder Element -file output/pan_con_y_3.txt -time -eleRange 1 10 RCPanel 3 strain_stress_concrete2
recorder Element -file output/pan_con_x_4.txt -time -eleRange 1 10 RCPanel 4 strain_stress_concrete1
recorder Element -file output/pan_con_y_4.txt -time -eleRange 1 10 RCPanel 4 strain_stress_concrete2
recorder Element -file output/pan_con_x_5.txt -time -eleRange 1 10 RCPanel 5 strain_stress_concrete1
recorder Element -file output/pan_con_y_5.txt -time -eleRange 1 10 RCPanel 5 strain_stress_concrete2

recorder Element -file output/interlock_x_1.txt -time -eleRange 1 10 RCPanel 1 strain_stress_interlock1
recorder Element -file output/interlock_y_1.txt -time -eleRange 1 10 RCPanel 1 strain_stress_interlock2
recorder Element -file output/interlock_x_2.txt -time -eleRange 1 10 RCPanel 2 strain_stress_interlock1
recorder Element -file output/interlock_y_2.txt -time -eleRange 1 10 RCPanel 2 strain_stress_interlock2
recorder Element -file output/interlock_x_3.txt -time -eleRange 1 10 RCPanel 3 strain_stress_interlock1
recorder Element -file output/interlock_y_3.txt -time -eleRange 1 10 RCPanel 3 strain_stress_interlock2
recorder Element -file output/interlock_x_4.txt -time -eleRange 1 10 RCPanel 4 strain_stress_interlock1
recorder Element -file output/interlock_y_4.txt -time -eleRange 1 10 RCPanel 4 strain_stress_interlock2
recorder Element -file output/interlock_x_5.txt -time -eleRange 1 10 RCPanel 5 strain_stress_interlock1
recorder Element -file output/interlock_y_5.txt -time -eleRange 1 10 RCPanel 5 strain_stress_interlock2

recorder Element -file output/crack_1.txt -time -eleRange 1 10 RCPanel 1 cracking_angles
recorder Element -file output/crack_2.txt -time -eleRange 1 10 RCPanel 2 cracking_angles
recorder Element -file output/crack_3.txt -time -eleRange 1 10 RCPanel 3 cracking_angles
recorder Element -file output/crack_4.txt -time -eleRange 1 10 RCPanel 4 cracking_angles
recorder Element -file output/crack_5.txt -time -eleRange 1 10 RCPanel 5 cracking_angles

pattern Plain 2 Linear {
  load 11 1E3 0 0
}
Cyclic_Function 4 20 2 11 1 1e-6 10000
puts "cyclic end"
# ModelInfo_Proc model_info.txt
wipe
reset