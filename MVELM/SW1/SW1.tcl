wipe

puts "System"
model basic -ndm 2 -ndf 3
source Wilson_Proc.tcl

#建立节点并施加底部约束
source Node.tcl

#材料本构定义
source Material.tcl

#单元定义（含纤维截面）
source Element.tcl

#施加自重和竖向荷载
source Gravity.tcl

Gravity_Proc 10

recorder Node -file F-Disp.txt -time -node 116 -dof 1 disp

#recorder Element -file BeamF.txt -ele 102 globalForce
#recorder Element -file BeamC.txt -ele 102 section 1 deformation

puts "Pushover"
pattern Plain 2 Linear {
load 116 1E3 0 0
}

set DT {4 7 12 18 22 27 32 36 42 47 51 57 }
foreach dt $DT {
    Cyclic_Proc $dt 1 1 116 1 5E-4 1000
}

wipe