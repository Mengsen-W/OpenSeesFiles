# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-22 17:41:12
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-05-22 17:52:56
# @Description: buckling analysis of steel structure reticulated shell

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "node"
source nodes.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 67 -dof 1 2 3 disp
recorder Node -file output/node7.out -time -node 7 -dof 1 2 3 disp

puts "loading"
## Load Case = DEAD
pattern Plain 1 Linear {
load 7 0.000E+000 0.000E+000 -1.000E+003 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Lagrange
numberer RCM
system UmfPack
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 7 3 -5
analysis Static
analyze 200

ModelInfo_Proc modelInfo.log

wipe
reset
