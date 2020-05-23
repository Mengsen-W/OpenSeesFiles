# @Author: Mengsen.Wang
# @Date: 2020-05-23 16:03:22
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-23 18:09:22
# @Description: rods hinged

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
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
recorder Node -file output/node0.out -time -nodeRange 1 40 -dof 1 2 3 disp
recorder Element -file output/ele0.out -time -eleRange 1 56 localForce
recorder Node -file output/node8.out -time -node 8 -dof 1 2 3 disp

puts "loading"
source load.tcl

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1.000E+000
analysis Static
analyze 1

ModelInfo_Proc modelInfo.log

wipe
reset