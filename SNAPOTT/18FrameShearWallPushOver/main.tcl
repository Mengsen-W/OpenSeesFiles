# @Author: Mengsen.Wang
# @Date: 2020-06-15 15:33:39
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-15 15:53:17
# @Description: Frame shear wall push over

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6
puts "nodes"
source nodes.tcl

puts "mass"
source mass.tcl

puts "fixed"
source fixed.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node40.out -time -node 40 -dof 1 2 3 disp
recorder Node -file output/eigen1_node.out -time -nodeRange 1 956 -dof 1 "eigen 1"

puts "Modal analysis..."
source Modal.tcl

puts "gravity"
source gravity.tcl

puts "analysis"
wipeAnalysis
constraints Plain
numberer RCM
system SparseSPD
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1.000E-001
analysis Static
analyze 10

puts "pushover"
source pushover.tcl

puts "analysis"
constraints Plain
numberer RCM
system SparseSPD
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 40 1 1
analysis Static
analyze 900

ModelInfo_Proc modelInfo.log

wipe
reset

