# @Author: Mengsen.Wang
# @Date: 2020-09-15 15:35:44
# @Last Modified by:  Mengsen.Wang
# @Last Modified time: 2020-09-15 15:35:44

# Nodal recorders
recorder Node -file $data_dir/MVLEM_Dtop.out -time -node $IDctrlNode -dof 1 disp
recorder Node -file $data_dir/MVLEM_DOFs.out -time -node 1 2 3 4 5 6 -dof 1 2 3 disp

# Element recorders
recorder Element -file $data_dir/MVLEM_Fgl.out -time -ele 1 2 3 4 5 globalForce
recorder Element -file $data_dir/MVLEM_Dsh.out -time -ele 1 2 3 4 5 ShearDef
recorder Element -file $data_dir/MVLEM_Curvature.out -time -ele 1 2 3 4 5 Curvature

# Single RC panel (macro-fiber) responses
recorder Element -file $data_dir/MVLEM_panel_strain.out -time -ele 1 RCPanel 1 panel_strain
recorder Element -file $data_dir/MVLEM_panel_stress.out -time -ele 1 RCPanel 1 panel_stress
recorder Element -file $data_dir/MVLEM_panel_stress_concrete.out -time -ele 1 RCPanel 1 panel_stress_concrete
recorder Element -file $data_dir/MVLEM_panel_stress_steel.out -time -ele 1 RCPanel 1 panel_stress_steel

# Unaxial Steel Recorders for all panels
recorder Element -file $data_dir/MVLEM_strain_stress_steel1_1.out -time -ele 1 RCPanel 1 strain_stress_steelX
recorder Element -file $data_dir/MVLEM_strain_stress_steel2_1.out -time -ele 1 RCPanel 1 strain_stress_steelY
recorder Element -file $data_dir/MVLEM_strain_stress_steel1_2.out -time -ele 1 RCPanel 2 strain_stress_steelX
recorder Element -file $data_dir/MVLEM_strain_stress_steel2_2.out -time -ele 1 RCPanel 2 strain_stress_steelY
recorder Element -file $data_dir/MVLEM_strain_stress_steel1_3.out -time -ele 1 RCPanel 3 strain_stress_steelX
recorder Element -file $data_dir/MVLEM_strain_stress_steel2_3.out -time -ele 1 RCPanel 3 strain_stress_steelY
recorder Element -file $data_dir/MVLEM_strain_stress_steel1_4.out -time -ele 1 RCPanel 4 strain_stress_steelX
recorder Element -file $data_dir/MVLEM_strain_stress_steel2_4.out -time -ele 1 RCPanel 4 strain_stress_steelY
recorder Element -file $data_dir/MVLEM_strain_stress_steel1_5.out -time -ele 1 RCPanel 5 strain_stress_steelX
recorder Element -file $data_dir/MVLEM_strain_stress_steel2_5.out -time -ele 1 RCPanel 5 strain_stress_steelY

recorder Element -file $data_dir/MVLEM_strain_stress_concrete1.out -time -ele 1 RCPanel 1 strain_stress_concrete1
recorder Element -file $data_dir/MVLEM_strain_stress_concrete2.out -time -ele 1 RCPanel 1 strain_stress_concrete2
recorder Element -file $data_dir/MVLEM_strain_stress_interlock1.out -time -ele 1 RCPanel 1 strain_stress_interlock1
recorder Element -file $data_dir/MVLEM_strain_stress_interlock2.out -time -ele 1 RCPanel 1 strain_stress_interlock2

# Cracking angles for all panels
recorder Element -file $data_dir/MVLEM_cracking_angles1.out -time -ele 1 2 3 4 5 RCPanel 1 cracking_angles
recorder Element -file $data_dir/MVLEM_cracking_angles2.out -time -ele 1 2 3 4 5 RCPanel 2 cracking_angles
recorder Element -file $data_dir/MVLEM_cracking_angles3.out -time -ele 1 2 3 4 5 RCPanel 3 cracking_angles
recorder Element -file $data_dir/MVLEM_cracking_angles4.out -time -ele 1 2 3 4 5 RCPanel 4 cracking_angles
recorder Element -file $data_dir/MVLEM_cracking_angles5.out -time -ele 1 2 3 4 5 RCPanel 5 cracking_angles