wipe

puts "System"
model basic -ndm 2 -ndf 3
source Wilson_Proc.tcl

#�����ڵ㲢ʩ�ӵײ�Լ��
source Node.tcl

#���ϱ�������
source Material.tcl

#��Ԫ���壨����ά���棩
source Element.tcl

#ʩ�����غ��������
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