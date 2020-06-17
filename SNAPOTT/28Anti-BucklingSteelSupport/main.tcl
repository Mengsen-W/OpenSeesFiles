# @Author: Mengsen.Wang
# @Date: 2020-06-17 17:18:28
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-17 17:18:28
# @Description: Anti-buckling steel support with steel frame

reset
wipe

source Cyclic.tcl
ModelInfo_Proc model_log.log

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


puts "gravity"
source gravity.tcl

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10

loadConst -time 0.0

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 80 -dof 1 2 3 disp
recorder Node -file output/node25.out -time -node 25 -dof 1 2 3 disp

recorder Element -file output/ele85a.out -time -ele 85 localForce
recorder Element -file output/ele85b.out -time -ele 85 section 1 deformation


puts "pushover"
source pushover.tcl

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 25 1 4
analysis Static
analyze 50

integrator DisplacementControl 25 1 -8
analyze 50
integrator DisplacementControl 25 1 12
analyze 50
integrator DisplacementControl 25 1 -16
analyze 50

ModelInfo_Proc model_info.log

wipe
reset