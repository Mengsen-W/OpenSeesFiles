wipe
model basic -ndm 2 -ndf 3
source Wilson_Proc.tcl

##Nmeber of Elements
set ElementNum 6
##Height
set H 3658.
##Width 
set B 1219.
##Thickness
set T 102.
##Boundary Horizontal Steel Ratio 
set rouX1 0.005
##Central Steel Ratio
set rouX2 0.0032
##Boundary Steel Ratio
set sro1 0.0293
##Central Steel Ratio
set sro2 0.0033
##Concrete Friction Coefficient
set nu 0.2
##Stiffness coefficient of reinf. dowel action
set alfadow 0.01
set u 0.07
##Compressive strength of Concrete
set fc 42.85

set A [expr $B * $T]
set deltaH [expr $H / $ElementNum]

puts "Node"
for { set i  0} { $i <= $ElementNum } { incr i} {
    set Nodeid [expr $i + 1]
    set Nodev [expr $deltaH * $i]
    node $Nodeid 0 $Nodev   
}

fix 1 1 1 1

puts "Material"
##Boundar Vertical Steel
uniaxialMaterial Steel02 1 414 2E5  0.02 20 0.925 0.15
##Central Vertical Steel and Horizontal Steel
uniaxialMaterial Steel02 2 449 2E5  0.02 20 0.925 0.15
##Confined Concrete
uniaxialMaterial ConcreteCM 3 -45.32 -0.0026 32730 7 3.3 4.06 0.00025 1.2 1E4
##UnConfined Concrete
uniaxialMaterial ConcreteCM 4 -42.85 -0.002 32730 7 2.3 4.06 0.00025 1.2 1E4

nDMaterial FSAM 6 0 2 1 3 $rouX1 $sro1 $nu $alfadow 
nDMaterial FSAM 7 0 2 2 4 $rouX2 $sro2 $nu $alfadow 

puts "Element"
for {set i 1 } { $i <= $ElementNum } { incr i } {
    set b1 191
    set b2 191
    set nodei [expr $i ]
    set nodej [expr $i + 1]
    element SFI_MVLEM $i $nodei $nodej 6 0.4 -thick $T $T $T $T $T $T -width $b1 $b2 $b1 $b1 $b2 $b1  -mat 6 7 7 7 7 6
}

puts "Gravity"
set LoadNode [expr $ElementNum + 1 ]
set GLoad [expr $u * $fc * $A ]
pattern Plain 1 Linear {
    load $LoadNode 0 -$GLoad 0
}

Gravity_Proc 10

pattern Plain 2 Linear {
    load $LoadNode 1E3 0 0
}

recorder Node -file F_Disp.txt -time -node $LoadNode -dof 1 disp
recorder Element -file Strain.txt -ele 1 RCPanel 1 panel_strain

puts "Cyclic"
set DT {10 22 24 40 55 70}
foreach dt $DT {
    Cyclic_Proc $dt 1 0.5  $LoadNode 1 1E-3 2000
}
wipe






